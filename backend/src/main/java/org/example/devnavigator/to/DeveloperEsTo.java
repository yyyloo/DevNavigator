package org.example.devnavigator.to;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Document(indexName = "developer")
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class DeveloperEsTo implements Serializable {

    private static final String DATE_TIME_PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

    /**
     * id
     */
    @Id
    private Long id;
    @Field(type = FieldType.Text, analyzer = "ik_smart")
    private String githubUsername;


    @Field(type = FieldType.Double) // 进行排序时用 Double 类型
    private BigDecimal talentRank;

    @Field(type = FieldType.Keyword) // 精确匹配 country
    private String country;

    @Field(type = FieldType.Keyword) // 精确匹配 languages
    private List<String> languages;

    @Field(type = FieldType.Integer) // followers 数量
    private Integer followers;



}
