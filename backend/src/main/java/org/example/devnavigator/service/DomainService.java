package org.example.devnavigator.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.example.devnavigator.entity.DomainEntity;

import java.util.List;


public interface DomainService extends IService<DomainEntity> {
    List<String> allLanguages();
}
