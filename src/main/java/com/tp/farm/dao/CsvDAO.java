package com.tp.farm.dao;

import com.tp.farm.vo.CropDataVO;
import com.tp.farm.vo.FarmlandPriceVO;
import com.tp.farm.vo.TraditionalMarketVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CsvDAO {

    @Autowired
    private SqlSession sqlSession;

  public boolean insertDataTraditionalMarket(List<TraditionalMarketVO> list) throws SQLException{
      boolean flag = false;
      int affectedCount = sqlSession.insert("mapper.traditionalMarket.insertTraditionalMarket", list);
      if(affectedCount>0){
          System.out.println("traditionalMarket data insert success");
          flag = true;
      }else {
          System.out.println("traditionalMarket data insert failed");
      }

      return  flag;
  }

  public boolean insertDataFarmlandPrice(ArrayList<FarmlandPriceVO> list) throws SQLException{
      boolean flag = false;
      int affectedCount = sqlSession.insert("mapper.farmland.insertFarmlandPrice", list);
      if (affectedCount>0){
          System.out.println("FarmlandPrice data insert success");
          flag = true;
      }else{
          System.out.println("FarmlandPrice data insert failed");
      }
      return flag;
  }

    public boolean insertDataCropData(List<CropDataVO> list) throws SQLException{
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.cropData.insertCropData", list);
        if(affectedCount>0){
            System.out.println("crop data insert success");
            flag = true;
        }else {
            System.out.println("crop data insert failed");
        }

        return  flag;
    }

    public boolean deleteTraditionalMarketData() throws SQLException {
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.traditionalMarket.deleteTraditionalMarket");
        if(affectedCount>0) {
            flag = true;
            System.out.println("traditionalMarket data delete success");
        }
        return flag;
    }

    public boolean deleteFarmlandPriceData() throws  SQLException{
      boolean flag = false;
      int affectedCount = sqlSession.delete("mapper.farmland.deleteFarmlandPrice");
      if(affectedCount>0) {
          flag = true;
          System.out.println("farmlandPrice data delete success");
      }
      return flag;
    }

    public boolean deleteCropData() throws  SQLException{
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.cropData.deleteCropData");
        if(affectedCount>0){
            flag = true;
            System.out.println("crop data delete success");
        }
        return flag;
    }

}
