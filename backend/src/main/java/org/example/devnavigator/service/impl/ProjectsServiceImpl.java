package org.example.devnavigator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.example.devnavigator.entity.ProjectsEntity;
import org.example.devnavigator.mapper.ProjectsMapper;
import org.example.devnavigator.service.ProjectsService;
import org.springframework.stereotype.Service;

@Service
public class ProjectsServiceImpl extends ServiceImpl<ProjectsMapper, ProjectsEntity> implements ProjectsService {

}
