package com.tp.farm.service;


import com.tp.farm.dao.ExpertConsultDAO;
import com.tp.farm.vo.ExpertConsultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/*
        작성자 : 이영록, 윤태검
        내용 : NoticeBoardService

        일시 : 2022.11.03(목) ~
*/

@Service
public class ExpertConsultService {

    @Autowired
    private ExpertConsultDAO consultDAO;

    public boolean createBoard(ExpertConsultVO consultation, MultipartFile attachFile) throws Exception {
        boolean flag = false;
        if(attachFile.isEmpty()) {
            flag = consultDAO.insertBoard(consultation);
        } else {
            HashMap<String, String> fileNameMap = upload(attachFile);
            consultation.setEcb_originFileName(fileNameMap.get("originFileName"));
            consultation.setEcb_serverFileName(fileNameMap.get("serverFileName"));
            flag = consultDAO.insertBoard(consultation);
        }
        return flag;
    }

    public HashMap<String, String> upload(MultipartFile attachFile) {
        HashMap<String, String> fileNameMap = new HashMap<>();
        //원래파일명과 서버파일명
        String originFileName = "";
        String serverFileName = "";
        //디렉토리 생성
//        String baseDir = "C:\\Upload\\BoardFile";
        String baseDir = "/home/ubuntu/dev/Upload";
        //날짜관련
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today = formatter.format(new java.util.Date());
        String year = today.substring(0,4);
        String month = today.substring(4,6);
        String rootUploadDir = baseDir + File.separator + year + File.separator + month;
        File dir = new File(rootUploadDir);
        if(!dir.exists()) {
            dir.mkdirs();
        }
        //원래파일명 넣기
        originFileName = attachFile.getOriginalFilename();
        //업로드된 파일명 = 업로드시간 + 랜덤파일명 + 확장자
        serverFileName = today + "-" + UUID.randomUUID().toString().substring(0,13) + originFileName.substring(originFileName.lastIndexOf("."));
        //업로드
        File saveFile = new File(rootUploadDir + File.separator + serverFileName);
        try {
            attachFile.transferTo(saveFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        fileNameMap.put("originFileName", originFileName);
        fileNameMap.put("serverFileName", serverFileName);
        return fileNameMap;
    }

    public List<ExpertConsultVO> selectAllBoard() {
        List<ExpertConsultVO> list = consultDAO.selectAll();
        return list;
    }

    public boolean boardDownload(HttpServletResponse response, String ecb_seq, String token) throws IOException {
        boolean flag = false;
        //게시판 정보 레코드 얻기
        ExpertConsultVO consultation = consultDAO.selectOneBoard(ecb_seq);
        String originFileName = consultation.getEcb_originFileName();
        String serverFileName = consultation.getEcb_serverFileName();
        //본래파일명 한글처리
        originFileName = new String(originFileName.getBytes("UTF-8"), "ISO-8859-1");
        //게시판 첨부파일 경로지정
//        String baseDir = "C:\\Upload\\BoardFile";
        String baseDir = "/home/ubuntu/dev/Upload";
        String year = serverFileName.substring(0,4);
        String month = serverFileName.substring(4,6);
        String rootDownloadDir = baseDir + File.separator + year + File.separator + month + File.separator;
        File download = new File(rootDownloadDir+serverFileName);
        //다운로드 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache;");
        response.addHeader("Content-Disposition", "attachment;filename="+originFileName);
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Expires", "-1;");
        //다운로드
        FileInputStream fis = new FileInputStream(download);
        OutputStream os = response.getOutputStream();
        byte[] buffer = new byte[256];
        int len = 0;
        while((len=fis.read(buffer))!=-1) {
            os.write(buffer, 0, len);
        }
        System.out.println("hi");
        flag = consultDAO.updateDownloadCount(ecb_seq, token);
        os.close();
        fis.close();
        return flag;
    }

    public ExpertConsultVO readBoard(String ecb_seq) {
        ExpertConsultVO consultation = new ExpertConsultVO();
        consultation = consultDAO.selectOneBoard(ecb_seq);
        return consultation;
    }

    public boolean updateBoard(ExpertConsultVO consultation, MultipartFile attachFile) throws Exception {
        boolean flag = false;
        if(attachFile.isEmpty()) {
            flag = consultDAO.update(consultation);
        } else {
            HashMap<String, String> fileNameMap = upload(attachFile);
            consultation.setEcb_originFileName(fileNameMap.get("originFileName"));
            consultation.setEcb_serverFileName(fileNameMap.get("serverFileName"));
            flag = consultDAO.update(consultation);
        }
        return flag;
    }

    public boolean deleteBoard(String ecb_seq) {
        boolean flag = false;
        flag = consultDAO.deleteOne(ecb_seq);
        return flag;
    }

    public boolean readCount(String ecb_seq) {
        boolean flag = false;
        flag = consultDAO.updateViewCount(ecb_seq);
        return flag;
    }
}
