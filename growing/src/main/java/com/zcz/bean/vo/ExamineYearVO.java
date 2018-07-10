package com.zcz.bean.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "ExamineYearVO --年度考核")
public class ExamineYearVO {
    @ApiModelProperty(value = "姓名")
    private String name;
    @ApiModelProperty(value = "手机号")
    private String phone;
    @ApiModelProperty(value = "部门名称")
    private String deptName;
    @ApiModelProperty(value = "岗位名称")
    private String postName;
    @ApiModelProperty(value = "优秀次数")
    private Integer excellent;
    @ApiModelProperty(value = "合格次数")
    private Integer qualified;
    @ApiModelProperty(value = "基本合格次数")
    private Integer passMuster;
    @ApiModelProperty(value = "不合格次数")
    private Integer unqualified;

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

    public Integer getExcellent() {
        return excellent;
    }

    public void setExcellent(Integer excellent) {
        this.excellent = excellent;
    }

    public Integer getQualified() {
        return qualified;
    }

    public void setQualified(Integer qualified) {
        this.qualified = qualified;
    }

    public Integer getPassMuster() {
        return passMuster;
    }

    public void setPassMuster(Integer passMuster) {
        this.passMuster = passMuster;
    }

    public Integer getUnqualified() {
        return unqualified;
    }

    public void setUnqualified(Integer unqualified) {
        this.unqualified = unqualified;
    }
}
