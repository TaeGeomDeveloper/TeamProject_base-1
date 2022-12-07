package com.tp.farm.dao;

import com.tp.farm.vo.ExpertConsultVO;
import com.tp.farm.vo.NoticeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
        작성자 : 이영록, 윤태검
        내용 : NoticeDAO 추가

        일시 : 2022.11.01 ~
 */

@Repository
public class ExpertConsultDAO {

    @Autowired
    private SqlSession sqlSession;

    public boolean insertBoard(ExpertConsultVO consultation) {
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.consult.insertConsultation", consultation);
        if(affectedCount>0) {
            System.out.println("DAO에서 insert완료");
            flag = true;
        }
        return flag;
    }

    public List<ExpertConsultVO> selectAll() {
        List<ExpertConsultVO> list = sqlSession.selectList("mapper.consult.selectAllConsultation");
        return list;
    }

    public boolean updateDownloadCount(String ecb_seq, String token) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.consult.updateConsultationDownloadCount", ecb_seq);
        if (affectedCount > 0) {
            System.out.println("다운로드 완료");
            flag = true;
        } else {
            System.out.println("다운로드 실패");
        }
        return flag;
    }

    public ExpertConsultVO selectOneBoard(String ecb_seq) {
        ExpertConsultVO consultation = (ExpertConsultVO) sqlSession.selectOne("mapper.consult.selectOneConsultationBySeq", ecb_seq);
        return consultation;
    }

    public boolean update(ExpertConsultVO consultation) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.consult.updateConsultation", consultation);
        if(affectedCount>0) {
            System.out.println("DAO update성공");
        } else {
            System.out.println("DAO update실패");
        }
        return flag;
    }

    public boolean deleteOne(String ecb_seq) {
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.consult.deleteOneConsultation", ecb_seq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    public boolean updateViewCount(String ecb_seq) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.consult.updateConsultationViewCount", ecb_seq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }
}
