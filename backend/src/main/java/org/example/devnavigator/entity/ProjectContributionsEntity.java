package org.example.devnavigator.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;

@Data
@TableName("project_contributions")
public class ProjectContributionsEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("project_id")
    private Long projectId;

    @TableField("developer_id")
    private Long developerId;

    private BigDecimal contributionScore = BigDecimal.ZERO;


    private Integer commitCount = 0;
}