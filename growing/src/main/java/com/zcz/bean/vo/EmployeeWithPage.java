package com.zcz.bean.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 分页员工表
 */
@ApiModel(value = "EmployeeWithPage")
public class EmployeeWithPage {

    private Integer id;
    @ApiModelProperty(value = "姓名")
    private String name;
    @ApiModelProperty(value = "手机号")
    private String phone;
    @ApiModelProperty(value = "性别")
    private String sex;
    @ApiModelProperty(value = "籍贯")
    private String navitePlace;
    @ApiModelProperty(value = "学历")
    private String eduBackground;
    @ApiModelProperty(value = "工作状态 0/离职  1/在职  2/退休  3/返聘/")
    private Integer status;
    @ApiModelProperty(value = "工作性质 0在编/ 1人事代理/ 2非人事代理/ 3退休返聘")
    private Integer nature;
    @ApiModelProperty(value = "岗位名称")
    private String postName;
    @ApiModelProperty(value = "部门名称")
    private String deptName;
    @ApiModelProperty(value = "职称名称")
    private String positionName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNavitePlace() {
        return navitePlace;
    }

    public void setNavitePlace(String navitePlace) {
        this.navitePlace = navitePlace;
    }

    public String getEduBackground() {
        return eduBackground;
    }

    public void setEduBackground(String eduBackground) {
        this.eduBackground = eduBackground;
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

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
