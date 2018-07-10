package com.zcz.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@ApiModel(value = "教育背景")
public class EducationBackground {

    private Integer id;
    @ApiModelProperty(value = "教育背景")
    private String school;
    @ApiModelProperty(value = "专业")
    private String major;
    @ApiModelProperty(value = "入学时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date entryDate;
    @ApiModelProperty(value = "毕业时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date graduationDate;
    @ApiModelProperty(value = "员工ID")
    private Integer empId;
    @ApiModelProperty(value = "备注")
    private String remark;
    @ApiModelProperty(value = "排序类型")
    private Integer orderNum;
    @ApiModelProperty(value = "学历")
    private Integer eduLevel;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public Date getGraduationDate() {
        return graduationDate;
    }

    public void setGraduationDate(Date graduationDate) {
        this.graduationDate = graduationDate;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getEduLevel() {
        return eduLevel;
    }

    public void setEduLevel(Integer eduLevel) {
        this.eduLevel = eduLevel;
    }
}