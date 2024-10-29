package org.example.devnavigator.job;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import io.netty.util.internal.StringUtil;
import org.example.devnavigator.entity.DeveloperProfileEntity;
import org.example.devnavigator.entity.DomainEntity;
import org.example.devnavigator.entity.ProjectContributionsEntity;
import org.example.devnavigator.entity.ProjectsEntity;
import org.example.devnavigator.mapper.DeveloperProfileMapper;
import org.example.devnavigator.mapper.DomainMapper;
import org.example.devnavigator.mapper.ProjectContributionsMapper;
import org.example.devnavigator.service.DomainService;
import org.example.devnavigator.service.ProjectsService;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.http.ResponseEntity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

import static org.example.devnavigator.constant.RedisConstant.DEVELOPER_PREFIX;

@Component
public class GitHubApi {

    @Autowired
    ProjectsService projectsService;

    @Autowired
    DeveloperProfileMapper developerProfileMapper;

    @Autowired
    DomainService domainService;

    @Autowired
    RabbitTemplate rabbitTemplate;

    @Autowired
    StringRedisTemplate stringRedisTemplate;


    public void generatebyUser(String username) throws ExecutionException, InterruptedException {
        ExecutorService executorService = Executors.newVirtualThreadPerTaskExecutor();
        CompletableFuture<Integer> f1 = CompletableFuture.supplyAsync(() -> getTotalCommit(username), executorService);

        CompletableFuture<List<ProjectsEntity>> f2 = CompletableFuture.supplyAsync(() -> writeProj(username));

        CompletableFuture<Void> f3 = CompletableFuture.runAsync(() -> {
            writeDomain(username);
        });


        RestTemplate restTemplate = new RestTemplate();
        String token="";
        // 设置请求头并添加 token
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);  // 使用 Bearer 令牌
        // 创建带有请求头的 HttpEntity
        HttpEntity<String> entity = new HttpEntity<>(headers);

        DeveloperProfileEntity developerProfileEntity = new DeveloperProfileEntity();
        developerProfileEntity.setGithubUsername(username);
        String userUrl ="https://api.github.com/users/"+username;
        // 发出带有 token 的 GET 请求
        ResponseEntity<String> response = restTemplate.exchange(userUrl, HttpMethod.GET, entity, String.class);

        String jsonResponse = response.getBody();
        JSONObject jsonObject = JSON.parseObject(jsonResponse);
        // 获取 items 数组
        developerProfileEntity.setBlogUrl(jsonObject.getString("blog"));
        developerProfileEntity.setGithubUrl(jsonObject.getString("html_url"));
        developerProfileEntity.setAvatarUrl(jsonObject.getString("avatar_url"));
        developerProfileEntity.setFollowers(jsonObject.getInteger("followers"));
        developerProfileEntity.setRepoCount(jsonObject.getInteger("public_repos"));

        String location = jsonObject.getString("location");
        if(!StringUtil.isNullOrEmpty(location)){
                        String countryUrl ="http://localhost:8000/get_country?location="+location;
                        try {
                            location = restTemplate.getForObject(countryUrl, String.class);
                            JSONObject countryObj = JSON.parseObject(location);
                            location=countryObj.getString("country");
                            developerProfileEntity.setCountry(location);
                            stringRedisTemplate.opsForSet().add(DEVELOPER_PREFIX + "country",location);
                        }catch (Exception e){
                            developerProfileEntity.setCountry(location);
                            stringRedisTemplate.opsForSet().add(DEVELOPER_PREFIX + "country",location);
                        }

        }else {
            //TODO 社交网络推测
        }

        CompletableFuture.allOf(f1, f2,f3).join();
        developerProfileEntity.setCommitCount(f1.get());
        List<ProjectsEntity> projects = f2.get();
        developerProfileEntity.setStarsCount(projects.get(0).getStarsCount());
        double score=0;
        for(ProjectsEntity projectsEntity : projects){
            score+=projectsEntity.getCommitCount()*1.0/projectsEntity.getTotalCommit()*projectsEntity.getStarsCount();      }
        score+=score*0.4+developerProfileEntity.getFollowers()*0.4+developerProfileEntity.getCommitCount()*0.1+developerProfileEntity.getRepoCount()*0.1;
        developerProfileEntity.setTalentRank(BigDecimal.valueOf(score));
        developerProfileMapper.insert(developerProfileEntity);
        rabbitTemplate.convertAndSend("dev_navigator-exchange","es.key",developerProfileEntity);

        //还差 最大stars  总提交次数 country  rank



    }

     Integer  getTotalCommit(String username){
        //任务1
        try {
            // 1. 构建 GraphQL 查询请求 JSON
            String query = """
                query ($username: String!) {
                  user(login: $username) {
                    contributionsCollection {
                      contributionCalendar {
                        totalContributions
                      }
                    }
                  }
                }
                """;

            ObjectMapper mapper = new ObjectMapper();
            ObjectNode requestBody = mapper.createObjectNode();
            requestBody.put("query", query);

            ObjectNode variables = mapper.createObjectNode();
            variables.put("username", username);
            requestBody.set("variables", variables);

            RestTemplate restTemplate = new RestTemplate();
            String token="";
            // 设置请求头并添加 token
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);
            // 3. 构建请求并发送
            HttpEntity<String> entity = new HttpEntity<>(requestBody.toString(), headers);

            ResponseEntity<String> response = restTemplate.exchange("https://api.github.com/graphql", HttpMethod.POST, entity, String.class);

            // 4. 解析响应 JSON
            JsonNode jsonResponse = mapper.readTree(response.getBody());
            int totalContributions = jsonResponse
                    .path("data")
                    .path("user")
                    .path("contributionsCollection")
                    .path("contributionCalendar")
                    .path("totalContributions")
                    .asInt();
           return totalContributions;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    List<ProjectsEntity> writeProj(String username){
        //任务2
        try {
            // 1. 构建 GraphQL 查询请求 JSON
            String query2 = """
                query ($username: String!) {
                  user(login: $username) {
                    repositories(first: 3, orderBy: {field: STARGAZERS, direction: DESC}) {
                      nodes {
                        name
                        stargazers {
                          totalCount
                        }
                      }
                    }
                  }
                }
                """;

            RestTemplate restTemplate = new RestTemplate();
            String token="";

            // 设置请求头并添加 token
            HttpHeaders headers = new HttpHeaders();
            headers.set("Authorization", "Bearer " + token);  // 使用 Bearer 令牌

            ObjectMapper mapper = new ObjectMapper();
            ObjectNode requestBody = mapper.createObjectNode();
            requestBody.put("query", query2);

            ObjectNode variables = mapper.createObjectNode();
            variables.put("username", username);
            requestBody.set("variables", variables);


            // 3. 构建请求并发送
            HttpEntity<String> entity = new HttpEntity<>(requestBody.toString(), headers);

            ResponseEntity<String> response = restTemplate.exchange("https://api.github.com/graphql", HttpMethod.POST, entity, String.class);

            // 4. 解析响应 JSON
            JsonNode jsonResponse2 = mapper.readTree(response.getBody());
            JsonNode repositories = jsonResponse2
                    .path("data")
                    .path("user")
                    .path("repositories")
                    .path("nodes");


            List<ProjectsEntity> projects = new ArrayList<>();

            // 输出仓库名和 stars 数量
            for (JsonNode repo : repositories) {
                String name = repo.path("name").asText();
                int stars = repo.path("stargazers").path("totalCount").asInt();
                ProjectsEntity projectsEntity = new ProjectsEntity();
                projectsEntity.setProjectName(name);
                projectsEntity.setStarsCount(stars);
                projectsEntity.setOwnerName(username);
                //TODO 分为三个子任务  请求三个仓库的提交信息

                String contributionsUrl ="https://api.github.com/repos/"+ projectsEntity.getOwnerName()+"/"+ projectsEntity.getProjectName()+"/contributors";
                HttpEntity<String> entity1 = new HttpEntity<>( headers);
                // 发出带有 token 的 GET 请求
                ResponseEntity<String> resp = restTemplate.exchange(contributionsUrl, HttpMethod.GET, entity1, String.class);

                String jsonResp = resp.getBody();
                JSONArray jsonArray = JSON.parseArray(jsonResp);

                int totalContributions = jsonArray.stream()
                        .mapToInt(obj -> ((JSONObject) obj).getIntValue("contributions"))
                        .sum();
                projectsEntity.setTotalCommit(totalContributions);

                int contribution = jsonArray.stream().filter(obj -> ((JSONObject) obj).getString("login").equals(username))
                        .mapToInt(obj -> ((JSONObject) obj).getIntValue("contributions")).sum();

                projectsEntity.setCommitCount(contribution);
                projects.add(projectsEntity);
            }
            projectsService.saveBatch(projects);
            return projects;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    void writeDomain(String username){
        //任务3 获取语言使用
        String query3 = """
                query($username: String!) {
                  user(login: $username) {
                    repositories(first: 10, orderBy: {field: UPDATED_AT, direction: DESC}) {
                      edges {
                        node {
                          name
                          languages(first: 5) {
                            edges {
                              node {
                                name
                              }
                              size
                            }
                          }
                        }
                      }
                    }
                  }
                }
                """;

        RestTemplate restTemplate = new RestTemplate();

        String token="";

        // 设置请求头并添加 token
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);  // 使用 Bearer 令牌


        JSONObject variables = new JSONObject();
        variables.put("username", username);

        JSONObject requestBody = new JSONObject();
        requestBody.put("query", query3);
        requestBody.put("variables", variables);


        HttpEntity<String> entity = new HttpEntity<>(requestBody.toString(), headers);
        ResponseEntity<String> response = restTemplate.exchange("https://api.github.com/graphql", HttpMethod.POST, entity, String.class);

        JSONObject jsonResponse = JSON.parseObject(response.getBody());
        JSONArray repositories = jsonResponse.getJSONObject("data")
                .getJSONObject("user")
                .getJSONObject("repositories")
                .getJSONArray("edges");

        Map<String, Integer> languageSizeMap = new HashMap<>();

        for (int i = 0; i < repositories.size(); i++) {
            JSONArray languages = repositories.getJSONObject(i)
                    .getJSONObject("node")
                    .getJSONObject("languages")
                    .getJSONArray("edges");

            for (int j = 0; j < languages.size(); j++) {
                String language = languages.getJSONObject(j).getJSONObject("node").getString("name");
                int size = languages.getJSONObject(j).getIntValue("size");

                languageSizeMap.put(language, languageSizeMap.getOrDefault(language, 0) + size);
            }
        }

        List<String> collect = languageSizeMap.entrySet().stream()
                .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .limit(4)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());

        List<DomainEntity> collect1 = collect.stream().map(language -> {
            DomainEntity domainEntity = new DomainEntity();
            domainEntity.setLanguage(language);
            domainEntity.setGithubUsername(username);
            return domainEntity;
        }).collect(Collectors.toList());
        domainService.saveBatch(collect1);
        collect1.forEach(domainEntity -> {stringRedisTemplate.opsForSet().add(DEVELOPER_PREFIX + "languages",domainEntity.getLanguage());});

        System.out.println(111);

    }


}
