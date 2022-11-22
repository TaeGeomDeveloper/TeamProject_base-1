package com.tp.farm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CropDataVO {
    private int cd_idx;
    private String cd_cropClassification;
    private String cd_cropName;
    private int cd_operatingCost;
    private String cd_growthPeriodStart;
    private String cd_growthPeriodEnd;
    private String cd_harvestSeasonStart;
    private String cd_harvestSeasonEnd;
    private int cd_income;
    private int cd_marketValue;
    private String cd_insuranceStatus;

    public CropDataVO(String data){
        String[] temp = data.split(",");
        cd_cropClassification = temp[0].strip();
        cd_cropName = temp[1].strip();
        cd_operatingCost = Integer.parseInt(temp[2].strip());
        cd_growthPeriodStart = temp[3].strip();
        cd_growthPeriodEnd = temp[4].strip();
        cd_harvestSeasonStart = temp[5].strip();
        cd_harvestSeasonEnd = temp[6].strip();
        cd_income = Integer.parseInt(temp[7].strip());
        cd_marketValue = Integer.parseInt(temp[8].strip());
        cd_insuranceStatus = temp[9].strip();
    }

}
