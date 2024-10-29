package org.example.devnavigator;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.SortOrder;
import co.elastic.clients.elasticsearch._types.query_dsl.BoolQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.MatchQuery;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch._types.query_dsl.TermQuery;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.core.SearchResponse;
import co.elastic.clients.elasticsearch.core.search.Hit;
import org.example.devnavigator.esdao.PostEsDao;
import org.example.devnavigator.to.DeveloperEsTo;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@SpringBootTest
    class DevNavigatorApplicationTests {
    @Autowired
    PostEsDao postEsDao;

    @Autowired
    ElasticsearchClient elasticsearchClient;

    @Autowired
    RabbitTemplate rabbitTemplate;
        @Test
        void contextLoads() {
            DeveloperEsTo developerEsTo = new DeveloperEsTo();
            developerEsTo.setId(2L);
            developerEsTo.setFollowers(79323);
            developerEsTo.setCountry("中国");
            developerEsTo.setTalentRank(new BigDecimal(137655));
            developerEsTo.setLanguages(List.of("CSS", "JavaScript"));
//            rabbitTemplate.convertAndSend("post-es", developerEsTo);
            rabbitTemplate.convertAndSend("dev_navigator-exchange","es.key",developerEsTo);

        }

        @Test
        void testAdd() {
            DeveloperEsTo developerEsTo = new DeveloperEsTo();
            developerEsTo.setId(1L);
            developerEsTo.setFollowers(79322);
            developerEsTo.setCountry("中国");
            developerEsTo.setTalentRank(new BigDecimal(137655));
            developerEsTo.setLanguages(List.of("CSS", "JavaScript"));

            postEsDao.save(developerEsTo);
            System.out.println(developerEsTo);
        }
    @Test
    void testSearch() throws IOException {
        List<Query> queries = new ArrayList<>();
        String country = "United States"; // 更新为实际存在的国家
        String domain = "HTML"; // 根据需要更新
        String queryContent = "liyupi";

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
        SearchResponse<DeveloperEsTo> searchResponse = elasticsearchClient.search(searchRequest, DeveloperEsTo.class);

        List<DeveloperEsTo> results = new ArrayList<>();
        for (Hit<DeveloperEsTo> hit : searchResponse.hits().hits()) {
            results.add(hit.source());
        }

        System.out.println("Search results: " + results);
    }

    }
