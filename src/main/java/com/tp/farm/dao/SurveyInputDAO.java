package com.tp.farm.dao;

import com.tp.farm.vo.CropDataVO;
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
    public boolean insertFarmInfo(SurveyInputVO surveyInput) {
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

    // 작물 정보 받기!
    public List<CropDataVO> selectAll() {
        System.out.println("작물 리스트 DAO 실행");
        List<CropDataVO> list = sqlSession.selectList("mapper.cropRecommend.selectAllCrop");
        return list;
    }

    public List<CropDataVO> select(SurveyInputVO vo) {
        System.out.println("작물 리스트 DAO 실행");
        List<CropDataVO> list = sqlSession.selectList("mapper.cropRecommend.selectCrop", vo);
        return list;
    }

}
