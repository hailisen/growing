package com.zcz.bean;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@ApiModel(value = "Employee")
public class Employee {
    private Integer id;
    @ApiModelProperty(value = "姓名")
    private String name;
    @ApiModelProperty(value = "编号")
    private String empNo;
    @ApiModelProperty(value = "手机号")
    private String phone;
    @ApiModelProperty(value = "密码")
    private String password;
    @ApiModelProperty(value = "性别")
    private String sex;
    @ApiModelProperty(value = "出生日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date brithday;
    @ApiModelProperty(value = "身份证号")
    private String persionId;
    @ApiModelProperty(value = "籍贯")
    private String navitePlace;
    @ApiModelProperty(value = "学历")
    private String eduBackground;
    @ApiModelProperty(value = "工作状态 0/离职  1/在职  2/退休  3/返聘/")
    private Integer status;
    @ApiModelProperty(value = "工作性质 0在编/ 1人事代理/ 2非人事代理/ 3退休返聘")
    private Integer nature;
    @ApiModelProperty(value = "入职日期")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date entryDay;
    @ApiModelProperty(value = "部门D")
    private Integer deptId;
    @ApiModelProperty(value = "岗位ID")
    private Integer postId;
    @ApiModelProperty(value = "所属幼儿园")
    private Integer kindergartenId;
    public Employee() {
    }
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
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Date getBrithday() {
        return brithday;
    }

    public void setBrithday(Date brithday) {
        this.brithday = brithday;
    }

    public String getPersionId() {
        return persionId;
    }

    public void setPersionId(String persionId) {
        this.persionId = persionId == null ? null : persionId.trim();
    }

    public String getNavitePlace() {
        return navitePlace;
    }

    public void setNavitePlace(String navitePlace) {
        this.navitePlace = navitePlace == null ? null : navitePlace.trim();
    }

    public String getEduBackground() {
        return eduBackground;
    }

    public void setEduBackground(String eduBackground) {
        this.eduBackground = eduBackground == null ? null : eduBackground.trim();
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

    public Date getEntryDay() {
        return entryDay;
    }

    public void setEntryDay(Date entryDay) {
        this.entryDay = entryDay;
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

    public Integer getKindergartenId() {
        return kindergartenId;
    }

    public void setKindergartenId(Integer kindergartenId) {
        this.kindergartenId = kindergartenId;
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", brithday=" + brithday +
                ", persionId='" + persionId + '\'' +
                ", navitePlace='" + navitePlace + '\'' +
                ", eduBackground='" + eduBackground + '\'' +
                ", status=" + status +
                ", nature=" + nature +
                ", entryDay=" + entryDay +
                ", postId=" + postId +
                ", kindergartenId=" + kindergartenId +
                '}';
    }
}