package com.tp.farm.service;

import com.tp.farm.dao.CsvDAO;
import com.tp.farm.vo.CropDataVO;
import com.tp.farm.vo.FarmlandPriceVO;
import com.tp.farm.vo.TraditionalMarketVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@Service
public class CsvService {

    @Autowired
    CsvDAO csvDAO;

    // DB에 insert 실행하는 코드
    public void insertDataTraditionalMarket() throws SQLException, IOException {
        csvDAO.insertDataTraditionalMarket(this.getTraditionalMarketData());
    }
    public void insertDataFarmlandPrice() throws SQLException, IOException{
        csvDAO.insertDataFarmlandPrice(this.getFarmlandPriceData());
    }
    public void insertCropData() throws SQLException, IOException{
        csvDAO.insertDataCropData(this.getCropData());
    }
    // DB에 Delete 실행하는 코드
    public void deleteDataTraditionalMarket() throws SQLException, IOException {
        csvDAO.deleteTraditionalMarketData();
    }
    public void deleteDataFarmlandPrice() throws SQLException, IOException {
        csvDAO.deleteFarmlandPriceData();
    }
    public void deleteCropData() throws SQLException, IOException {
        csvDAO.deleteCropData();
    }

    //지정된 경로에 csv 파일 읽는 코드
    public ArrayList<TraditionalMarketVO> getTraditionalMarketData() throws IOException{
        ArrayList<TraditionalMarketVO> list = new ArrayList<>();
        File file = new File("C:/dev/install/Project_base/전국전통시장표준데이터_수정본.csv");
        FileReader fr =  new FileReader(file);
        BufferedReader br = new BufferedReader(fr);
        String line = null;
        TraditionalMarketVO traditionalMarket = null;
        while((line=br.readLine())!=null){
            traditionalMarket = new TraditionalMarketVO(line);
            list.add(traditionalMarket);
        }
        br.close();
        fr.close();
        return list;
    }

    public ArrayList<FarmlandPriceVO> getFarmlandPriceData() throws IOException{
        ArrayList<FarmlandPriceVO> list = new ArrayList<>();
        File file = new File("C:/dev/install/Project_base/농지_시세_테이블.csv");
        FileReader fr =  new FileReader(file);
        BufferedReader br = new BufferedReader(fr);
        String line = null;
        FarmlandPriceVO farmlandPrice = null;
        while((line=br.readLine())!=null){
            farmlandPrice = new FarmlandPriceVO(line);
            list.add(farmlandPrice);
        }
        br.close();
        fr.close();
        return list;
    }

    public ArrayList<CropDataVO> getCropData() throws IOException{
        ArrayList<CropDataVO> list = new ArrayList<>();
        File file = new File("C:/dev/install/Project_base/농작물_자료조사표.csv");
        FileReader fr =  new FileReader(file);
        BufferedReader br = new BufferedReader(fr);
        String line = null;
        CropDataVO cropData = null;
        while((line=br.readLine())!=null){
            cropData = new CropDataVO(line);
            list.add(cropData);
        }
        br.close();
        fr.close();
        return list;
    }


}
