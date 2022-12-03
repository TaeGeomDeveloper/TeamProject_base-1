package com.tp.farm.service;

import com.tp.farm.dao.ReplyDAO;
import com.tp.farm.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReplyService {

    @Autowired
    private ReplyDAO replyDAO;

    public boolean writeReply(ReplyVO reply) {
        boolean flag = false;
        flag = replyDAO.insertReply(reply);
        if(flag) {
            System.out.println("service reply 성공");
        } else {
            System.out.println("service reply 실패");
        }
        return flag;
    }

    public boolean writeReReply(ReplyVO reply) {
        boolean flag = false;
        flag = replyDAO.insertReReply(reply);
        if(flag) {
            System.out.println("service Rereply 성공");
        } else {
            System.out.println("service Rereply 실패");
        }
        return flag;
    }

    public List<ReplyVO> readAllReply(String cb_seq) {
        List<ReplyVO> list = replyDAO.selectAllReply(cb_seq);
        return  list;
    }

    public boolean deleteReply(int cbrSeq) {
        boolean flag = false;
        flag = replyDAO.deleteReply(cbrSeq);
        return flag;
    }

    public int countBundle(String bundleSeq, String cbSeq) {
        ReplyVO reply = new ReplyVO();
        reply.setCbr_bundleSeq(Integer.parseInt(bundleSeq));
        reply.setCb_seq(Integer.parseInt(cbSeq));
        int bundleSeqCount = replyDAO.selectCount(reply);
        return bundleSeqCount;
    }

    public boolean updateReplyDelText(int cbrSeq) {
        boolean flag = false;
        flag = replyDAO.updateReplyDelText(cbrSeq);
        return flag;
    }

    public boolean updateReplyContent(ReplyVO reply) {
        boolean flag = false;
        flag = replyDAO.updateReplyContent(reply);
        return flag;
    }
}
