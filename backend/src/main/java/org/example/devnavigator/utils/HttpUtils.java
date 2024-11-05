package org.example.devnavigator.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class HttpUtils {

    // 从 application.properties 中读取 github.token 值
    @Value("${github.token}")
    private  String token;

    public  String httpGet(String url) {
        RestTemplate restTemplate = new RestTemplate();

        // 设置请求头并添加 token
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);  // 使用 Bearer 令牌
        // 创建带有请求头的 HttpEntity
        HttpEntity<String> entity = new HttpEntity<>(headers);
      return   restTemplate.exchange(url, HttpMethod.GET, entity, String.class).getBody();
    }

    public  String httpPost(String url,String body) {
        RestTemplate restTemplate = new RestTemplate();
        // 设置请求头并添加 token
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + token);  // 使用 Bearer 令牌
        // 创建带有请求头的 HttpEntity
        // 3. 构建请求并发送
        HttpEntity<String> entity = new HttpEntity<>(body, headers);

        return restTemplate.exchange(url, HttpMethod.POST, entity, String.class).getBody();

    }



}
