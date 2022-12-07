package com.tp.farm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TraditionalMarketVO {

    private String tmi_name;
    private String tmi_marketType;
    private String tmi_roadNameAddress;
    private String tmi_numberAddress;
    private int tmi_storesNumber;
    private String tmi_hasVoucher;
    private String tmi_hasParkingLot;
    private String tmi_phoneNumber;
    private String tmi_renewalDate;


    public TraditionalMarketVO(String data){
        String[] temp = data.split(",");
        tmi_name = temp[0].strip();
        tmi_marketType = temp[1].strip();
        tmi_roadNameAddress = temp[2].strip();
        tmi_numberAddress = temp[3].strip();
        tmi_storesNumber = Integer.parseInt(temp[4].strip());
        tmi_hasVoucher = temp[5].strip();
        tmi_hasParkingLot = temp[6].strip();
        tmi_phoneNumber = temp[7].strip();
        tmi_renewalDate = temp[8].strip();
    }

}

