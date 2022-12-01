package com.tp.farm.vo;

import lombok.*;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CropDataVO {
    private int cd_idx;
    private String cd_cropClassification;
    private String cd_cropName;
    private int cd_operatingCost;
    private int cd_income;
    private String cd_labor;
    private int cd_sowingStart;
    private String cd_sowingSemiannual;
    private int cd_harvestStart;
    private String cd_harvestSemiannual;
    private String cd_harvestEnd;
    private int cd_marketValue;
    private String cd_basicInformation;
    private String cd_insuranceStatus;
    private String cd_methodCultivation;
    private String cd_pest;
    private String cd_farmMaterials;
    private String cd_nutritionEfficacy;


    public CropDataVO(String data){
        String[] temp = data.split(",");
        cd_cropClassification = temp[0].strip();
        cd_cropName = temp[1].strip();
        cd_operatingCost = Integer.parseInt(temp[2].strip());
        cd_income = Integer.parseInt(temp[3].strip());
        cd_labor = temp[4].strip();
        cd_sowingStart = Integer.parseInt(temp[5].strip());
        cd_sowingSemiannual = temp[6].strip();
        cd_harvestStart = Integer.parseInt(temp[7].strip());
        cd_harvestSemiannual = temp[8].strip();
        cd_harvestEnd = temp[9].strip();
        cd_marketValue = Integer.parseInt(temp[10].strip());
        cd_basicInformation = temp[11].strip();
        cd_insuranceStatus = temp[12].strip();
        cd_methodCultivation = temp[13].strip();
        cd_pest = temp[14].strip();
        cd_farmMaterials = temp[15].strip();
        cd_nutritionEfficacy = temp[16].strip();
    }

}