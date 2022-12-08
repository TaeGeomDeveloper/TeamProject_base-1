package com.tp.farm.dao;

import com.tp.farm.vo.BoardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/*
        작성자 : 이영록
        내용 : BoardDAO

        일시 : 2022.11.01 ~
 */

@Repository
public class BoardDAO {

    @Autowired
    private SqlSession sqlSession;

    public boolean insertBoard(BoardVO board) {
        boolean flag = false;
        int affectedCount = sqlSession.insert("mapper.board.insertBoard", board);
        if(affectedCount>0) {
            System.out.println("DAO에서 insert완료");
            flag = true;
        }
        return flag;
    }

    public List<BoardVO> selectAll() {
        List<BoardVO> list = sqlSession.selectList("mapper.board.selectAllBoard");
        return list;
    }

    public List<BoardVO> selectCategory(String cb_category) {
        List<BoardVO> list = sqlSession.selectList("mapper.board.selectCategoryBoard", cb_category);
        return list;
    }

    public boolean updateDownloadCount(String cb_seq, String token) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.board.updateDownloadCount", cb_seq);
        if (affectedCount > 0) {
            System.out.println("다운로드 완료");
            flag = true;
        } else {
            System.out.println("다운로드 실패");
        }
        return flag;
    }

    public BoardVO selectOneBoard(String cb_seq) {
        BoardVO board = (BoardVO) sqlSession.selectOne("mapper.board.selectOneBoardBySeq", cb_seq);
        return board;
    }

    public boolean update(BoardVO board) {
        boolean flag = false;
        System.out.println(board.getCb_title());
        int affectedCount = sqlSession.update("mapper.board.updateBoard", board);
        if(affectedCount>0) {
            System.out.println("DAO update성공");
        } else {
            System.out.println("DAO update실패");
        }
        return flag;
    }

    public boolean deleteOne(String cb_seq) {
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.board.deleteOne", cb_seq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    public boolean updateViewCount(String cb_seq) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.board.updateViewCount", cb_seq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

}
