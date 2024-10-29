package org.example.devnavigator.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;

@Data
@TableName("developer_profile")
public class DeveloperProfileEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String githubUsername;

    private BigDecimal talentRank = BigDecimal.ZERO;
    private String country;
    private BigDecimal countryConfidence;


    private String blogUrl;
    private String githubUrl;
    private String avatarUrl;
    private Integer followers=0;
    private Integer commitCount=0;
    private Integer repoCount=0;
    private Integer starsCount=0;

}