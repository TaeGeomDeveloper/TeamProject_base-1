package com.tp.farm.controller;

import com.tp.farm.dao.SurveyInputDAO;
import com.tp.farm.vo.SurveyInputVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestController {

    @Autowired
    private SurveyInputDAO svcDao;
    private SurveyInputVO selectVO;

    // 작물 선택 절차
    @RequestMapping(value = "/FarmProcess.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
    public SurveyInputVO FarmProcess(@RequestBody SurveyInputVO selectVO) throws  Exception{
        if(selectVO == null){
            System.out.println("theres no VO found");
        } else {
            System.out.println("VO ON");
            System.out.println("id: "+selectVO.getMsi_id());
        }
        System.out.println("작물 선택 절차");
//        System.out.println(selectVO.getCs_location());
        svcDao.insertFarmInfo(selectVO);

        return selectVO;
    }

}
