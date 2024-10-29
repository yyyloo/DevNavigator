package org.example.devnavigator.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;

@Data
@TableName("developer_network")
public class DeveloperNetworkEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField("developer_id")
    private Long developerId;

    @TableField("connected_developer_id")
    private Long connectedDeveloperId;

    private BigDecimal interactionScore = BigDecimal.ZERO;
}