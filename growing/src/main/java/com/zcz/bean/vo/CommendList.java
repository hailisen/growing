package com.zcz.bean.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "CommendList   --表彰统计列表")
public class CommendList {

    @ApiModelProperty(value = "表彰ID")
    private Integer id;
    @ApiModelProperty(value = "员工姓名")
    private String name;
    @ApiModelProperty(value = "手机号")
    private String phone;
    @ApiModelProperty(value = "部门名称")
    private String deptName;
    @ApiModelProperty(value = "岗位名称")
    private String postName;
    @ApiModelProperty(value = "奖章名称")
    private String commendName;
    @ApiModelProperty(value = "表彰说明")
    private String note;
    @ApiModelProperty(value = "表彰级别")
    private String level;
    @ApiModelProperty(value = "获取时间")
    private String getTime;
    @ApiModelProperty(value = "文件名称")
    private String fileName;
    @ApiModelProperty(value = "文件保存路径")
    private String url;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public String getCommendName() {
        return commendName;
    }

    public void setCommendName(String commendName) {
        this.commendName = commendName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getGetTime() {
        return getTime;
    }

    public void setGetTime(String getTime) {
        this.getTime = getTime;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
