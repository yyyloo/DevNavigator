package org.example.devnavigator.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.example.devnavigator.entity.DomainEntity;
import org.example.devnavigator.entity.ProjectsEntity;


@Mapper
public interface DomainMapper extends BaseMapper<DomainEntity> {
}
