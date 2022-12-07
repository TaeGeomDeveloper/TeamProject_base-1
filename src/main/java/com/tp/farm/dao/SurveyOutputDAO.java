package com.tp.farm.dao;

import com.tp.farm.vo.MemberVO;
import com.tp.farm.vo.SurveyOutputVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("surveyOutputDAO")
public class SurveyOutputDAO {

    @Autowired
    private SqlSession sqlSession;

    //@Autowired
    //private SurveyOutputVO surveyOutput;

    public void insertOutputSurvey(SurveyOutputVO surveyOutput) {
        System.out.println("작물 선택 결과 DAO 실행");
        sqlSession.insert("mapper.surveyOutput.insertSurveyOutput", surveyOutput);

    }

    public SurveyOutputVO selectSurveyOutput(String mso_id) {
        SurveyOutputVO surveyOutput = sqlSession.selectOne("mapper.surveyOutput.selectSurveyOutput", mso_id);

        return surveyOutput;
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
