package org.example.devnavigator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.devnavigator.entity.DomainEntity;
import org.example.devnavigator.entity.ProjectsEntity;
import org.example.devnavigator.mapper.DomainMapper;
import org.example.devnavigator.mapper.ProjectsMapper;
import org.example.devnavigator.service.DomainService;
import org.example.devnavigator.service.ProjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import static org.example.devnavigator.constant.RedisConstant.DEVELOPER_PREFIX;

@Service
public class DomainServiceImpl extends ServiceImpl<DomainMapper, DomainEntity> implements DomainService {

    @Autowired
    StringRedisTemplate stringRedisTemplate;
    @Override
    public List<String> allLanguages() {
        Set<String> members = stringRedisTemplate.opsForSet().members(DEVELOPER_PREFIX + "languages");
        List<String> collect = new ArrayList<>(members);
        return collect;
    }
}
