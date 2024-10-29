package org.example.devnavigator.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.example.devnavigator.entity.DeveloperProfileEntity;

@Mapper
public interface DeveloperProfileMapper extends BaseMapper<DeveloperProfileEntity> {
}
