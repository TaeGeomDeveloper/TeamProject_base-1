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

    //작물 정보 받기!
    public List<SurveyInputVO> selectAll() {
        List<SurveyInputVO> list = sqlSession.selectList("mapper.cropData.selectAllCropData");
        return list;
    }

}
