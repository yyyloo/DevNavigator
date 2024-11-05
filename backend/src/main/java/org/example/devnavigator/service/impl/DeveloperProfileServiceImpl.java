package org.example.devnavigator.service.impl;


import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.SortOrder;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.MatchQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch._types.query_dsl.TermQuery;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.search.Hit;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;


import org.example.devnavigator.entity.DeveloperProfileEntity;

import org.example.devnavigator.entity.DomainEntity;
import org.example.devnavigator.mapper.DeveloperProfileMapper;

import org.example.devnavigator.service.DeveloperProfileService;

import org.example.devnavigator.service.DomainService;
import org.example.devnavigator.to.DeveloperEsTo;
import org.example.devnavigator.vo.GithubUserInfo;
import org.example.devnavigator.vo.QuerryRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import static org.example.devnavigator.constant.RedisConstant.DEVELOPER_PREFIX;

@Service
public class DeveloperProfileServiceImpl extends ServiceImpl<DeveloperProfileMapper, DeveloperProfileEntity> implements DeveloperProfileService {

    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Autowired
    ElasticsearchClient elasticsearchClient;
    @Autowired
    DomainService domainService;

    @Override
    public List<DeveloperEsTo> searchFromES(QuerryRequest querryRequest) {
        return List.of();
    }

    @Override
    public List<String> allCountrys() {
        Set<String> members = stringRedisTemplate.opsForSet().members(DEVELOPER_PREFIX + "country");
        List<String> collect = new ArrayList<>(members);
        return collect;
    }

    @Override
    public List<GithubUserInfo> search(String country, String domain, String queryContent) {

        List<Query> queries = new ArrayList<>();

        if (!StringUtils.isEmpty(country)) {
            queries.add(Query.of(q -> q.term(TermQuery.of(t -> t.field("country").value(country)))));
        }
        if (!StringUtils.isEmpty(domain)) {
            queries.add(Query.of(q -> q.term(TermQuery.of(t -> t.field("languages").value(domain)))));
        }
        if (!StringUtils.isEmpty(queryContent)) {
            queries.add(Query.of(q -> q.match(MatchQuery.of(m -> m.field("githubUsername").query(queryContent)))));
        }

        // 创建布尔查询
        BoolQuery boolQuery = BoolQuery.of(b -> b.must(queries));

        // 构建搜索请求
        SearchRequest searchRequest = SearchRequest.of(s -> s
                .index("developer")
                .query(q -> q.bool(boolQuery))
                .sort(sort -> sort.field(f -> f.field("talentRank").order(SortOrder.Desc)))
        );

        // 执行搜索并解析结果
        SearchResponse<DeveloperEsTo> searchResponse = null;
        try {
            searchResponse = elasticsearchClient.search(searchRequest, DeveloperEsTo.class);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        List<DeveloperEsTo> results = new ArrayList<>();
        for (Hit<DeveloperEsTo> hit : searchResponse.hits().hits()) {
            results.add(hit.source());
        }
        List<GithubUserInfo> githubUserInfos = new ArrayList<>();
        results.forEach((developerEsTo) -> {
            GithubUserInfo githubUserInfo = new GithubUserInfo();
            BeanUtils.copyProperties(developerEsTo, githubUserInfo);
            DeveloperProfileEntity developerProfileEntity = this.baseMapper.selectById(developerEsTo.getId());
            githubUserInfo.setGithubUrl(developerProfileEntity.getGithubUrl());
            githubUserInfo.setAvatarUrl(developerProfileEntity.getAvatarUrl());
            githubUserInfo.setBlogUrl(developerProfileEntity.getBlogUrl());
            githubUserInfo.setCommitCount(developerProfileEntity.getCommitCount());
            githubUserInfo.setRepoCount(developerProfileEntity.getRepoCount());
            githubUserInfo.setStarsCount(developerProfileEntity.getStarsCount());
            githubUserInfos.add(githubUserInfo);
        });

        return githubUserInfos;

    }

    @Override
    public List<GithubUserInfo> topRank() {


        List<GithubUserInfo> githubUserInfos = new ArrayList<>();
        //获取前20的数据库主键Id reverseRangeWithScores
        Set<ZSetOperations.TypedTuple<String>> typedTuples = stringRedisTemplate.opsForZSet().reverseRangeWithScores(DEVELOPER_PREFIX + "rank", 0, 20);
        List<Long> collect = typedTuples.stream().map(item-> Long.parseLong(item.getValue())).collect(Collectors.toList());
//        List<Long> collect = range.stream().mapToLong(id->Long.parseLong(id)).boxed().collect(Collectors.toList());
        List<DeveloperProfileEntity> developerProfileEntities = this.getBaseMapper().selectBatchIds(collect);
        developerProfileEntities.forEach(developerProfileEntity -> {
            GithubUserInfo githubUserInfo = new GithubUserInfo();
            BeanUtils.copyProperties(developerProfileEntity, githubUserInfo);
            List<DomainEntity> list = domainService.list(new LambdaQueryWrapper<DomainEntity>().eq(DomainEntity::getGithubUsername, developerProfileEntity.getGithubUsername()));
            List<String> languages = list.stream().map(DomainEntity::getLanguage).collect(Collectors.toList());
            githubUserInfo.setLanguages(languages);
            githubUserInfos.add(githubUserInfo);
        });
        return githubUserInfos;
    }
}
