package com.tp.farm.vo;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReplyVO {

    private int cbr_seq;
    private int cb_seq;
    private String cbr_replyId;
    private String cbr_content;
    private Timestamp cbr_regDate;
    private int cbr_bundleSeq;
    private int cbr_currentSeq;

//    public ReplyVO() { }
//    public ReplyVO(int cbr_seq, int cb_seq, String cbr_replyId, String cbr_content, Timestamp cbr_regDate, int cbr_bundleSeq, int cbr_currentSeq) {
//        this.cbr_seq = cbr_seq;
//        this.cb_seq = cb_seq;
//        this.cbr_replyId = cbr_replyId;
//        this.cbr_content = cbr_content;
//        this.cbr_regDate = cbr_regDate;
//        this.cbr_bundleSeq = cbr_bundleSeq;
//        this.cbr_currentSeq = cbr_currentSeq;
//    }
//
//    public int getCbr_seq() {
//        return cbr_seq;
//    }
//
//    public void setCbr_seq(int cbr_seq) {
//        this.cbr_seq = cbr_seq;
//    }
//
//    public int getCb_seq() {
//        return cb_seq;
//    }
//
//    public void setCb_seq(int cb_seq) {
//        this.cb_seq = cb_seq;
//    }
//
//    public String getCbr_replyId() {
//        return cbr_replyId;
//    }
//
//    public void setCbr_replyId(String cbr_replyId) {
//        this.cbr_replyId = cbr_replyId;
//    }
//
//    public String getCbr_content() {
//        return cbr_content;
//    }
//
//    public void setCbr_content(String cbr_content) {
//        this.cbr_content = cbr_content;
//    }
//
//    public Timestamp getCbr_regDate() {
//        return cbr_regDate;
//    }
//
//    public void setCbr_regDate(Timestamp cbr_regDate) {
//        this.cbr_regDate = cbr_regDate;
//    }
//
//    public int getCbr_bundleSeq() {
//        return cbr_bundleSeq;
//    }
//
//    public void setCbr_bundleSeq(int cbr_bundleSeq) {
//        this.cbr_bundleSeq = cbr_bundleSeq;
//    }
//
//    public int getCbr_currentSeq() {
//        return cbr_currentSeq;
//    }
//
//    public void setCbr_currentSeq(int cbr_currentSeq) {
//        this.cbr_currentSeq = cbr_currentSeq;
//    }
}
