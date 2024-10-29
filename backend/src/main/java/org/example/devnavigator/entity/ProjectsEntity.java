package org.example.devnavigator.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;

@Data
@TableName("projects")
public class ProjectsEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String projectName;

    private Integer starsCount=0; //star数

    private Integer totalCommit=0;
    private Integer commitCount=0;

    private String githubRepoUrl;
    private String ownerName;

}