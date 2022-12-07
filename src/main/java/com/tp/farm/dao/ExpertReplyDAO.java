package com.tp.farm.dao;

import com.tp.farm.vo.ExpertReplyVO;
import com.tp.farm.vo.ReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ExpertReplyDAO {

    @Autowired
    private SqlSession sqlSession;

    public boolean insertReply(ExpertReplyVO reply) {
        boolean flag = false;
        System.out.println(reply.getEcbr_replyId());
        System.out.println(reply.getEcb_seq());
        int affectedCount1 = sqlSession.insert("mapper.expertReply.insertExpertReply", reply);
        if(affectedCount1>0) {
            System.out.println("insert 첫번째 통과");
            flag = true;
        } else {
            System.out.println("insert 첫번째 실패");
            flag = false;
        }
        ExpertReplyVO tempReply = (ExpertReplyVO) sqlSession.selectOne("mapper.expertReply.selectMaxExpertReplySeq", reply.getEcb_seq());
        int affectedCount2 = sqlSession.update("mapper.expertReply.updateInitTopExpertReply", tempReply);
        if(affectedCount2>0) {
            System.out.println("insert 두번째 통과");
            flag = true;
        } else {
            System.out.println("insert 두번째 실패");
            flag = false;
        }
        return flag;
    }
    public boolean insertReReply(ExpertReplyVO reply) {
        boolean flag = false;
        int maxCurrentSeq = (int) sqlSession.selectOne("mapper.expertReply.selectMaxExpertReplyCurrentSeq", reply);
        reply.setEcbr_currentSeq(maxCurrentSeq);
        int affectedCount = sqlSession.insert("mapper.expertReply.insertExpertReReply", reply);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    public List<ExpertReplyVO> selectAllReply(String ecb_seq) {
        List<ExpertReplyVO> list = sqlSession.selectList("mapper.expertReply.selectAllExpertReply", ecb_seq);
        return list;
    }

    public boolean deleteReply(int ecbrSeq) {
        boolean flag = false;
        int affectedCount = sqlSession.delete("mapper.expertReply.deleteOneExpertReply", ecbrSeq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    public boolean updateReplyDelText(int ecbrSeq) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.expertReply.updateExpertReplyDeleteText", ecbrSeq);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }

    public int selectCount(ExpertReplyVO reply) {
        int bundleSeqCount = sqlSession.selectOne("mapper.expertReply.selectCountByExpertReplyBundleSeq", reply);
        return bundleSeqCount;
    }

    public boolean updateReplyContent(ExpertReplyVO reply) {
        boolean flag = false;
        int affectedCount = sqlSession.update("mapper.expertReply.updateExpertReply", reply);
        if(affectedCount>0) {
            flag = true;
        }
        return flag;
    }
}
