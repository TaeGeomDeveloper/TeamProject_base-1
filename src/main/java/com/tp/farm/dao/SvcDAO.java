package com.tp.farm.dao;

import com.tp.farm.vo.BoardVO;
import com.tp.farm.vo.CropDataVO;
import com.tp.farm.vo.CropSelectVO;
import com.tp.farm.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("SvcDAO")
public class SvcDAO {

    @Autowired
    private SqlSession sqlSession;

    //작물 선택 등록!
    public boolean insertFarmInfo(CropSelectVO selectVO) {
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.svc.insertFarmInfo", selectVO);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    //작물 정보 받기!
    public List<CropDataVO> selectAll() {
        List<CropDataVO> list = sqlSession.selectList("mapper.cropData.selectAllCropData");
        return list;
    }

}
