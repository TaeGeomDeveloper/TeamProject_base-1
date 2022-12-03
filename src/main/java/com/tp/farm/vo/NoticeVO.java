package com.tp.farm.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
    private int nb_seq;
    private String nb_category;
    private String nb_id;
    private String nb_title;
    private String nb_content;
    private int nb_viewCount;
    private Timestamp nb_regDate;
    private String nb_originFileName;
    private String nb_serverFileName;
    private String nb_downloadCount;

//    public BoardVO() {}
//    public BoardVO(int cb_seq, String mi_id, String cb_title, String cb_content, int cb_viewCount, Timestamp cb_regDate, String cb_originFileName, String cb_serverFileName, String cb_downloadCount) {
//        this.cb_seq = cb_seq;
//        this.mi_id = mi_id;
//        this.cb_title = cb_title;
//        this.cb_content = cb_content;
//        this.cb_viewCount = cb_viewCount;
//        this.cb_regDate = cb_regDate;
//        this.cb_originFileName = cb_originFileName;
//        this.cb_serverFileName = cb_serverFileName;
//        this.cb_downloadCount = cb_downloadCount;
//    }

//    public String getMi_id() {
//        return mi_id;
//    }
//
//    public void setMi_id(String mi_id) {
//        this.mi_id = mi_id;
//    }
//
//    public int getCb_viewCount() {
//        return cb_viewCount;
//    }
//
//    public void setCb_viewCount(int cb_viewCount) {
//        this.cb_viewCount = cb_viewCount;
//    }
//
//    public Timestamp getCb_regDate() {
//        return cb_regDate;
//    }
//
//    public void setCb_regDate(Timestamp cb_regDate) {
//        this.cb_regDate = cb_regDate;
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
//    public String getCb_title() {
//        return cb_title;
//    }
//
//    public void setCb_title(String cb_title) {
//        this.cb_title = cb_title;
//    }
//
//    public String getCb_content() {
//        return cb_content;
//    }
//
//    public void setCb_content(String cb_content) {
//        this.cb_content = cb_content;
//    }
//
//    public String getCb_originFileName() {
//        return cb_originFileName;
//    }
//
//    public void setCb_originFileName(String cb_originFileName) {
//        this.cb_originFileName = cb_originFileName;
//    }
//
//    public String getCb_serverFileName() {
//        return cb_serverFileName;
//    }
//
//    public void setCb_serverFileName(String cb_serverFileName) {
//        this.cb_serverFileName = cb_serverFileName;
//    }
//
//    public String getCb_downloadCount() {
//        return cb_downloadCount;
//    }
//
//    public void setCb_downloadCount(String cb_downloadCount) {
//        this.cb_downloadCount = cb_downloadCount;
//    }
}
