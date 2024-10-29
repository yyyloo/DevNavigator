package org.example.devnavigator.controller;

import org.example.devnavigator.service.DeveloperProfileService;
import org.example.devnavigator.service.DomainService;
import org.example.devnavigator.utils.R;
import org.example.devnavigator.vo.GithubUserInfo;
import org.example.devnavigator.vo.QuerryRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/developer")
public class DeveloperController {

    @Autowired
    DeveloperProfileService developerProfileService;
    @Autowired
    DomainService domainService;


    @GetMapping("/countrys/all")
    public R allCountrys() {
         List<String> countrys= developerProfileService.allCountrys();

         return R.ok().setData(countrys);
    }

    @GetMapping("/domain/all")
    public R allDomain() {
        List<String> languages= domainService.allLanguages();
        return R.ok().setData(languages);
    }

    @PostMapping("/search")
    public R search(@RequestBody QuerryRequest querryRequest) {
        List<GithubUserInfo> languages= developerProfileService.search(querryRequest.getCountry(),querryRequest.getLanguages(),querryRequest.getGithubUsername());
        return R.ok().setData(languages);
    }

    @GetMapping("/test")
    public String test() {

        return "111";
    }

}
