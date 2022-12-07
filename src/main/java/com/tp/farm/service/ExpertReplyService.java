package com.tp.farm.service;

import com.tp.farm.dao.ExpertReplyDAO;
import com.tp.farm.dao.ReplyDAO;
import com.tp.farm.vo.ExpertReplyVO;
import com.tp.farm.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpertReplyService {

    @Autowired
    private ExpertReplyDAO expertReplyDAO;

    public boolean writeReply(ExpertReplyVO reply) {
        boolean flag = false;
        flag = expertReplyDAO.insertReply(reply);
        if(flag) {
            System.out.println("service reply 성공");
        } else {
            System.out.println("service reply 실패");
        }
        return flag;
    }

    public boolean writeReReply(ExpertReplyVO reply) {
        boolean flag = false;
        flag = expertReplyDAO.insertReReply(reply);
        if(flag) {
            System.out.println("service Rereply 성공");
        } else {
            System.out.println("service Rereply 실패");
        }
        return flag;
    }

    public List<ExpertReplyVO> readAllReply(String ecb_seq) {
        List<ExpertReplyVO> list = expertReplyDAO.selectAllReply(ecb_seq);
        return list;
    }

    public boolean deleteReply(int ecbrSeq) {
        boolean flag = false;
        flag = expertReplyDAO.deleteReply(ecbrSeq);
        return flag;
    }

    public int countBundle(String bundleSeq, String ecbSeq) {
        ExpertReplyVO reply = new ExpertReplyVO();
        reply.setEcbr_bundleSeq(Integer.parseInt(bundleSeq));
        reply.setEcb_seq(Integer.parseInt(ecbSeq));
        int bundleSeqCount = expertReplyDAO.selectCount(reply);
        return bundleSeqCount;
    }

    public boolean updateReplyDelText(int ecbrSeq) {
        boolean flag = false;
        flag = expertReplyDAO.updateReplyDelText(ecbrSeq);
        return flag;
    }

    public boolean updateReplyContent(ExpertReplyVO reply) {
        boolean flag = false;
        flag = expertReplyDAO.updateReplyContent(reply);
        return flag;
    }
}
