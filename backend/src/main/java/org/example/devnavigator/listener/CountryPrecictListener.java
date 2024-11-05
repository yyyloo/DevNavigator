package org.example.devnavigator.listener;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.rabbitmq.client.Channel;
import org.example.devnavigator.entity.DeveloperProfileEntity;
import org.example.devnavigator.entity.DomainEntity;
import org.example.devnavigator.entity.ProjectsEntity;
import org.example.devnavigator.esdao.PostEsDao;
import org.example.devnavigator.mapper.DomainMapper;
import org.example.devnavigator.service.DeveloperProfileService;
import org.example.devnavigator.to.DeveloperEsTo;
import org.example.devnavigator.utils.HttpUtils;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

@RabbitListener(queues = "country.predict.queue")
@Service
public class CountryPrecictListener {

    @Autowired
    RabbitTemplate rabbitTemplate;
    @Autowired
    DomainMapper domainMapper;
    @Autowired
    DeveloperProfileService developerProfileService;
    @Autowired
    HttpUtils httpUtils;


    @RabbitHandler
    public void listener(Long developerId, Channel channel, Message message) throws IOException {


        DeveloperProfileEntity user = developerProfileService.getById(developerId);
        ExecutorService executorService = Executors.newVirtualThreadPerTaskExecutor();

        try {
            // 获取followers和following数据
            String followers = httpUtils.httpGet("https://api.github.com/users/" + developerId + "/followers");
            String following = httpUtils.httpGet("https://api.github.com/users/" + developerId + "/following");

            JSONArray followersArray = JSON.parseArray(followers);
            JSONArray followingArray = JSON.parseArray(following);

            // 使用CompletableFuture并行获取位置数据
            List<CompletableFuture<String>> futures = new ArrayList<>();

            for (int i = 0; i < followersArray.size(); i++) {
                String username = followersArray.getJSONObject(i).getString("login");
                CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> {
                    String userInfo = httpUtils.httpGet(String.format("https://api.github.com/users/%s", username));
                    return JSON.parseObject(userInfo).getString("location");
                }, executorService);
                futures.add(future);
            }

            for (int i = 0; i < followingArray.size(); i++) {
                String username = followingArray.getJSONObject(i).getString("login");
                CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> {
                    String userInfo = httpUtils.httpGet(String.format("https://api.github.com/users/%s", username));
                    return JSON.parseObject(userInfo).getString("location");
                }, executorService);
                futures.add(future);
            }

            // 等待所有虚拟线程完成并收集结果
            CompletableFuture<Void> allFutures = CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]));

            List<String> results = allFutures.thenApply(v ->
                    futures.stream()
                            .map(CompletableFuture::join) // 获取每个结果
                            .filter(Objects::nonNull)      // 过滤空位置
                            .collect(Collectors.toList())
            ).join();

            // 统计位置出现次数
            Map<String, Integer> locationCounts = new HashMap<>();
            for (String result : results) {
                locationCounts.put(result, locationCounts.getOrDefault(result, 0) + 1);
            }

            // 找到计数最多的国家及其比例
            String mostLikelyCountry = Collections.max(locationCounts.entrySet(), Map.Entry.comparingByValue()).getKey();
            int maxCount = locationCounts.get(mostLikelyCountry);
            // 计算包含位置信息的总用户数
            int totalCountWithLocation = locationCounts.values().stream().mapToInt(Integer::intValue).sum();
// 计算最可能国家的比例
            double probability = (double) maxCount / totalCountWithLocation;

            System.out.printf("Most likely country: %s, Probability: %.2f%%\n", mostLikelyCountry, probability * 100);

            double confidenceThreshold = 0.5; // 置信度的阈值，比如 50%
            if (probability < confidenceThreshold) {
                user.setCountry("N/A");
            } else {
                String countryWithProbability = String.format("%s (%.1f%%)", mostLikelyCountry, probability * 100);
                user.setCountry(countryWithProbability);
            }
            developerProfileService.updateById(user);


            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);

        } finally {
            executorService.shutdown();
        }



//        DeveloperEsTo developerEsTo = new DeveloperEsTo();
//        BeanUtils.copyProperties(developerProfileEntity, developerEsTo);
//        List<DomainEntity> languages = domainMapper.selectList(new QueryWrapper<DomainEntity>().eq("github_username", developerEsTo.getGithubUsername()));
//        List<String> collect = languages.stream().map(DomainEntity::getLanguage).collect(Collectors.toList());
//        developerEsTo.setLanguages(collect);
//        DeveloperEsTo save = postEsDao.save(developerEsTo);
//        System.out.println(2222);
//        if (save.getId() != null) {
//            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
//        }

    }






}