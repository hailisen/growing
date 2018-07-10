package com.zcz.bean.vo;

import io.swagger.annotations.ApiModel;

import java.util.Date;

@ApiModel(value = "CommendVO  --教师表彰详情表彰")
public class CommendVO {

    private Integer id;

    private String level;

    private String commendName;

    private String note;

    private String commendUrl;

    private String fileName;

    private Date getTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public String getCommendName() {
        return commendName;
    }

    public void setCommendName(String commendName) {
        this.commendName = commendName == null ? null : commendName.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getCommendUrl() {
        return commendUrl;
    }

    public void setCommendUrl(String commendUrl) {
        this.commendUrl = commendUrl;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Date getGetTime() {
        return getTime;
    }

    public void setGetTime(Date getTime) {
        this.getTime = getTime;
    }
}