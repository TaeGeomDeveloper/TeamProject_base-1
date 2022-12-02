package com.tp.farm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SurveyOutputVO {
    private String mso_id;
    private String mso_cropName;
    private String mso_capital;
    private String mso_holdingLand;
    private String mso_managementExpenses;
    private String mso_incomeCrops;
    private String mso_landCost;
    private String mso_finalIncome;
}
