package org.example.devnavigator.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;


@Data
public class QuerryRequest implements Serializable {
    private String githubUsername;
//    private BigDecimal talentRank;
    private String country;
    private String languages;
//    private Integer followers;


}
