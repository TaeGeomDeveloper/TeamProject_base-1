package com.tp.farm.service;

import com.tp.farm.dao.CropRecommendDAO;
import com.tp.farm.dao.SurveyInputDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CropRecService {

    @Autowired
    private SurveyInputDAO surveyInputDAO;

    public boolean cropRecIdCheck(String msi_id){
        boolean flag = false;
        //flag = surveyInputDAO.checkId(msi_id);
        return flag;
    };
}
