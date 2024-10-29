package org.example.devnavigator.esdao;

import org.example.devnavigator.to.DeveloperEsTo;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;

/**
 * 帖子 ES 操作
 *
 * @author <a href="https://github.com/liyupi">程序员鱼皮</a>
 * @from <a href="https://yupi.icu">编程导航知识星球</a>
 */
public interface PostEsDao extends ElasticsearchRepository<DeveloperEsTo, Long> {

//    List<PostEsDTO> findByUserId(Long userId);
//
//    List<PostEsDTO> findByTitle(String title);
}