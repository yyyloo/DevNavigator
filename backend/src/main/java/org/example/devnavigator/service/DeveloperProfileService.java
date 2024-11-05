package org.example.devnavigator.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.example.devnavigator.entity.DeveloperProfileEntity;
import org.example.devnavigator.entity.DomainEntity;
import org.example.devnavigator.to.DeveloperEsTo;
import org.example.devnavigator.vo.GithubUserInfo;
import org.example.devnavigator.vo.QuerryRequest;

import java.util.List;


public interface DeveloperProfileService extends IService<DeveloperProfileEntity> {
    List<DeveloperEsTo> searchFromES(QuerryRequest querryRequest);

    List<String> allCountrys();

    List<GithubUserInfo> search(String country, String domain, String queryContent);

    List<GithubUserInfo> topRank();
}
