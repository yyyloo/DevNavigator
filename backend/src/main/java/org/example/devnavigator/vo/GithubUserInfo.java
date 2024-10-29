package org.example.devnavigator.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class GithubUserInfo {
    private Long id;
    private String githubUsername;
    private BigDecimal talentRank;
    private String country;
    private List<String> languages;
    private Integer followers;
    private String blogUrl;
    private String githubUrl;
    private String avatarUrl;
    private Integer commitCount;
    private Integer repoCount;
    private Integer starsCount;

}
