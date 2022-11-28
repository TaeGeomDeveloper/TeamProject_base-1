package com.tp.farm.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

public class CropRecommendDAO {
    @Autowired
    private SqlSession sqlSession;

    public String cropRecommend(String msi_cropClassification, int msi_desiredTimeSowing,
                                 String msi_desiredTimeSowingPart, int msi_desiredHarvestTime, String msi_desiredHarvestTimePart){
        Map<String, String> map = new HashMap<String, String>();
        String result = sqlSession.selectOne("mapper.cropRecommend.selectCrop", map);

        return result;
    }
}
