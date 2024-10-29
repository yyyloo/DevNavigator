package org.example.devnavigator.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("domain")
public class DomainEntity {
    @TableId(type = IdType.AUTO)
    private Long id;

//    private Long developerId;
   private String githubUsername;
    private String language;

}
