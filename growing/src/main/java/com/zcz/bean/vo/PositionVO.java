package com.zcz.bean.vo;

import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

public class PositionVO {

    private Integer id;
    @ApiModelProperty(value = "职称员工关联表ID")
    private Integer peId;
    @ApiModelProperty(value = "职称名")
    private String positionName;
    @ApiModelProperty(value = "类别名")
    private String cateName;
    @ApiModelProperty(value = "职称文件URL")
    private String positionUrl;
    private String fileName;
    private Date positionGetTime;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getPositionUrl() {
        return positionUrl;
    }

    public void setPositionUrl(String positionUrl) {
        this.positionUrl = positionUrl;
    }

    public Integer getPeId() {
        return peId;
    }

    public void setPeId(Integer peId) {
        this.peId = peId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Date getPositionGetTime() {
        return positionGetTime;
    }

    public void setPositionGetTime(Date positionGetTime) {
        this.positionGetTime = positionGetTime;
    }
}
