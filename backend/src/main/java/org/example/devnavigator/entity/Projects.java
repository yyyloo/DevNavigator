package org.example.devnavigator.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;

@Data
@TableName("projects")
public class Projects {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String projectName;

    private BigDecimal importanceScore = BigDecimal.ZERO;

    private String githubRepoUrl;
}