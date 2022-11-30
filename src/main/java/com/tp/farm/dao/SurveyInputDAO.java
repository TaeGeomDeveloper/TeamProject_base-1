package com.tp.farm.dao;

import com.tp.farm.vo.SurveyInputVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("surveyInputDAO")
public class SurveyInputDAO {

    @Autowired
    private SqlSession sqlSession;

    //작물 선택 설문조사에서 회원이 선택한 값 DB에 insert
    public boolean insertFarmInfo(SurveyInputVO surveyInput) {
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.surveyInput.insertSurveyInput", surveyInput);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    public boolean checkId(String msi_id) {
        boolean flag = false;
        int affectedCount = sqlSession.selectOne("mapper.surveyInput.checkId", msi_id);
        if(affectedCount>0){
            flag = true;
        }
        return flag;
    }

    public boolean deleteSurvey(String msi_id){
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.surveyInput.deleteSurvey", msi_id);
        if(affectedCount>0){
            flag = true;
        }
        return flag;
    }
}
