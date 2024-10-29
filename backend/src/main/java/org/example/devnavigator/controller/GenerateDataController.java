package org.example.devnavigator.controller;

import org.example.devnavigator.job.GitHubApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.concurrent.ExecutionException;

@Controller
@RequestMapping("/generate")
public class GenerateDataController {
    @Autowired
    GitHubApi gitHubApi;

//    @GetMapping("/repo")
//    void generate() {
//        gitHubApi.generate();
//    }

    @GetMapping("/byUser/{user}")
    void generatebyUser(@PathVariable("user") String username) throws ExecutionException, InterruptedException {
        gitHubApi.generatebyUser(username);
    }


}
