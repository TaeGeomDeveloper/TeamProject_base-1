package com.tp.farm.dao;

import com.tp.farm.vo.SurveyOutputVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("surveyOutputDAO")
public class SurveyOutputDAO {

    @Autowired
    private SqlSession sqlSession;

    public boolean insertOutputSurvey(SurveyOutputVO surveyOutput) {
        System.out.println("작물 선택 DAO 실행");
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.surveyInput.insertSurveyOutput", surveyOutput);
        if(affectedCount>0) {
            flag = true;
        }
        else {
            System.out.println("안들어감");
        }
        return flag;
    }

    public boolean deleteSurveyOutput(String mso_id){
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.surveyOutput.deleteSurveyOutput", mso_id);
        if(affectedCount>0){
            flag = true;
        }
        return flag;
    }

}
