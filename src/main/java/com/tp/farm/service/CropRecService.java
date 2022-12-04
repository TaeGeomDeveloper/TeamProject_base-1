package com.tp.farm.service;

import com.tp.farm.dao.CropRecDAO;
import com.tp.farm.dao.SurveyInputDAO;
import com.tp.farm.dao.SurveyOutputDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CropRecService {

    @Autowired
    private CropRecDAO cropRecDAO;

    @Autowired
    private SurveyInputDAO surveyInputDAO;

    @Autowired
    private SurveyOutputDAO surveyOutputDAO;

    public boolean cropRecIdCheck(String msi_id){
        boolean flag = false;
        flag = cropRecDAO.checkId(msi_id);
        System.out.println("cropRecIdCheck flag "+ flag);
        return flag;
    };

    public boolean deleteSurvey(String msi_id) {
        boolean flag = false;
//        System.out.println("service msi_id " + msi_id);
        surveyInputDAO.deleteSurveyInput(msi_id);
        surveyOutputDAO.deleteSurveyOutput(msi_id);
//        System.out.println("service flag " + flag);
        return flag;
    }
}
