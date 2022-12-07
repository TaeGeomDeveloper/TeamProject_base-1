package com.tp.farm.dao;

import com.tp.farm.vo.CropDataVO;
import com.tp.farm.vo.FarmlandPriceVO;
import com.tp.farm.vo.SurveyInputVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CropRecDAO {
    @Autowired
    private SqlSession sqlSession;

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

    public CropDataVO selectOneCrop(String cd_cropName) {
        CropDataVO CropData = sqlSession.selectOne("mapper.cropRecommend.selectOneCrop", cd_cropName);

        return CropData;
    }

    public List<FarmlandPriceVO> selectFarmlandPrice(SurveyInputVO vo) {
        System.out.println("농지 시세 리스트 DAO 실행");
        List<FarmlandPriceVO> list = sqlSession.selectList("mapper.cropRecommend.selectFarmlandPrice", vo);
        return list;
    }

    public boolean checkId(String msi_id) {
        boolean flag = false;
        SurveyInputVO vo = sqlSession.selectOne("mapper.cropRecommend.checkId", msi_id);
        if(vo != null){
            flag = true;
        }
        return flag;
    }

}
