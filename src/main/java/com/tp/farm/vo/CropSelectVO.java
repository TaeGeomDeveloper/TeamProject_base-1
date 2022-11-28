package com.tp.farm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CropSelectVO {
    //private int cs_idx; //  교유번호
    private String cs_id;   // 회원 아이디
    private String cs_name; // 회원 이름
    private int cs_age;     // 회원 나이
    private String cs_sex;  // 회원 성별
    private String cs_location; // 회원 귀농 희망지역
    private String cs_cropClassification;   // 작물 분류
    private String cs_howFarm;         // 재배 방법
    private String cs_harvestSeason;    // 수확 시기
    private String cs_needMachinery;    // 설비 유무
    private String cs_needFarmland;     //농작지 유무
    private String cs_experience;    // 농사 경험


}
