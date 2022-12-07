package com.tp.farm.dao;

import com.tp.farm.vo.NoticeVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/*
        작성자 : 이영록, 윤태검
        내용 : NoticeDAO 추가

        일시 : 2022.11.01 ~
 */

@Repository
public class NoticeDAO {

    @Autowired
    private SqlSession sqlSession;

    public boolean insertBoard(NoticeVO notice) {
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.notice.insertNotice", notice);
        if(affectedCount>0) {
            System.out.println("DAO에서 insert완료");
            flag = true;
        }
        return flag;
    }

    public List<NoticeVO> selectAll() {
        List<NoticeVO> list = sqlSession.selectList("mapper.notice.selectAllNotice");
        return list;
    }

    public boolean updateDownloadCount(String nb_seq, String token) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.notice.updateNoticeDownloadCount", nb_seq);
        if (affectedCount > 0) {
            System.out.println("다운로드 완료");
            flag = true;
        } else {
            System.out.println("다운로드 실패");
        }
        return flag;
    }

    public NoticeVO selectOneBoard(String nb_seq) {
        NoticeVO notice = (NoticeVO) sqlSession.selectOne("mapper.notice.selectOneNoticeBySeq", nb_seq);
        return notice;
    }

    public boolean update(NoticeVO notice) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.notice.updateNotice", notice);
        if(affectedCount>0) {
            System.out.println("DAO update성공");
        } else {
            System.out.println("DAO update실패");
        }
        return flag;
    }

    public boolean deleteOne(String nb_seq) {
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.notice.deleteOneNotice", nb_seq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    public boolean updateViewCount(String nb_seq) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.notice.updateNoticeViewCount", nb_seq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }
}
