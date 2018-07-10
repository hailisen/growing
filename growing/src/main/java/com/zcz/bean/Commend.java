package com.zcz.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@ApiModel(value = "Commend  --新增表彰")
public class Commend {

    private Integer id;
    @ApiModelProperty(value = "级别")
    private String level;
    @ApiModelProperty(value = "表彰名称")
    private String commendName;
    @ApiModelProperty(value = "员工ID")
    private Integer empId;
    @ApiModelProperty(value = "说明")
    private String note;
    @ApiModelProperty(value = "获取时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date getTime;
    @ApiModelProperty(value = "文件保存url")
    private String url;
    @ApiModelProperty(value = "文件名称")
    private String fileName;

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

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Date getGetTime() {
        return getTime;
    }

    public void setGetTime(Date getTime) {
        this.getTime = getTime;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }
}