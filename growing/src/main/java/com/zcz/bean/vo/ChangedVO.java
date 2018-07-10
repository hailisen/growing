package com.zcz.bean.vo;

import io.swagger.annotations.ApiModelProperty;

import java.util.Date;
import java.util.Map;

/**
 * 教师详情显示的变更
 */
public class ChangedVO {
    private Integer id;
    @ApiModelProperty("变更时间")
    private Date changeTime;
    @ApiModelProperty("工作状态")
    private Integer status;
    @ApiModelProperty("工作性质")
    private Integer nature;
    @ApiModelProperty("岗位ID")
    private Integer postId;
    @ApiModelProperty("部门ID")
    private Integer deptId;
    private Map<String,Object> map;
    private String deptName;
    private String postName;
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

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

}
