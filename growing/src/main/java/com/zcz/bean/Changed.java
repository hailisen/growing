package com.zcz.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@ApiModel(value = "Changed     --变更表")
public class Changed {

    private Integer id;
    @ApiModelProperty(value = "教师ID")
    private Integer empId;
    @ApiModelProperty(value = "变更时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date changeTime;
    @ApiModelProperty(value = "工作状态")
    private Integer status;
    @ApiModelProperty(value = "工作性质")
    private Integer nature;
    @ApiModelProperty(value = "部门ID")
    private Integer deptId;
    @ApiModelProperty(value = "岗位ID")
    private Integer postId;
    @ApiModelProperty(value = "变更方式  0/还未执行变更的信息（未来变更）   1/已经变更过的员工信息")
    private Integer method;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Date getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(Date changeTime) {
        this.changeTime = changeTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getNature() {
        return nature;
    }

    public void setNature(Integer nature) {
        this.nature = nature;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getMethod() {
        return method;
    }

    public void setMethod(Integer method) {
        this.method = method;
    }
}