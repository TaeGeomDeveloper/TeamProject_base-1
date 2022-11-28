package com.tp.farm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SurveyInputVO {
    private String msi_id;
    private String msi_memberName;
    private int msi_memberAge;
    private String msi_memberGender;
    private String msi_desiredArea;
    private String msi_desiredAreaDetail;
    private int msi_desiredTimeSowing;
    private String msi_desiredTimeSowingPart;
    private int msi_desiredHarvestTime;
    private String  msi_desiredHarvestTimePart;
    private String msi_cropClassification;
    private String msi_cultivationMethod;
    private String msi_farmingExperience;
    private String msi_hadMachinery;
    private int msi_capital;
    private int msi_holdingLand;

}
