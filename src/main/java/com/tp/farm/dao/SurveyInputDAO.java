package com.tp.farm.dao;

import com.tp.farm.vo.CropDataVO;
import com.tp.farm.vo.MemberVO;
import com.tp.farm.vo.SurveyInputVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("surveyInputDAO")
public class SurveyInputDAO {

    @Autowired
    private SqlSession sqlSession;

    //작물 선택 설문조사에서 회원이 선택한 값 DB에 insert
    public boolean insertSurveyInput(SurveyInputVO surveyInput) {
        System.out.println("작물 선택 DAO 실행");
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.surveyInput.insertSurveyInput", surveyInput);
        if(affectedCount>0) {
            flag = true;
        }
        else {
            System.out.println("안들어감");
        }
        return flag;
    }

    public boolean deleteSurveyInput(String msi_id){
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.surveyInput.deleteSurveyInput", msi_id);
        if(affectedCount>0){
            flag = true;
        }
        return flag;
    }

    public SurveyInputVO selectOne(String msi_id) {
        SurveyInputVO surveyInput = sqlSession.selectOne("mapper.surveyInput.selectOne", msi_id);

        return surveyInput;
    }

}
