package com.zcz.bean.vo;

import com.zcz.bean.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;
import java.util.List;

/**
 * 教师详情页
 */
@ApiModel(value = "EmployeeVO ---教师详情页")
public class EmployeeVO {

    private Integer id;
    @ApiModelProperty(value = "教师姓名")
    private String name;
    @ApiModelProperty(value = "性别")
    private String sex;
    @ApiModelProperty(value = "员工编号")
    private String empNo;
    @ApiModelProperty(value = "生日")
    private String brithday;
    @ApiModelProperty(value = "手机号")
    private String phone;
    @ApiModelProperty(value = "身份证号")
    private String persionId;
    @ApiModelProperty(value = "籍贯")
    private String navitePlace;
    @ApiModelProperty(value = "学历")
    private String eduBackground;
    @ApiModelProperty(value = "入职日期")
    private String entryDay;
    @ApiModelProperty(value = "部门")
    private String deptName;
    @ApiModelProperty(value = "岗位")
    private String postName;
    @ApiModelProperty(value = "状态")
    private Integer status;
    @ApiModelProperty(value = "性质")
    private Integer nature;
    @ApiModelProperty(value = "教育背景")
    private List<EducationBackground> educationBackgrounds;//教育背景
    @ApiModelProperty(value = "职称")
    private List<PositionVO> positions;
    @ApiModelProperty(value = "表彰信息")
    private List<Commend> commends;
    @ApiModelProperty(value = "员工协议")
    private List<Agreement> agreements;
    @ApiModelProperty(value = "工作变更")
    private List<ChangedVO> changeds;
    @ApiModelProperty(value = "年度考核")
    private List<ExamineVO> examines;

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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public String getBrithday() {
        return brithday;
    }

    public void setBrithday(String brithday) {
        this.brithday = brithday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPersionId() {
        return persionId;
    }

    public void setPersionId(String persionId) {
        this.persionId = persionId;
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

    public String getEntryDay() {
        return entryDay;
    }

    public void setEntryDay(String entryDay) {
        this.entryDay = entryDay;
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

    public Integer getStatus() {
        return status;
    }

    public Integer getNature() {
        return nature;
    }

    public void setNature(Integer nature) {
        this.nature = nature;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<EducationBackground> getEducationBackgrounds() {
        return educationBackgrounds;
    }

    public void setEducationBackgrounds(List<EducationBackground> educationBackgrounds) {
        this.educationBackgrounds = educationBackgrounds;
    }

    public List<PositionVO> getPositions() {
        return positions;
    }

    public void setPositions(List<PositionVO> positions) {
        this.positions = positions;
    }

    public List<Commend> getCommends() {
        return commends;
    }

    public void setCommends(List<Commend> commends) {
        this.commends = commends;
    }

    public List<Agreement> getAgreements() {
        return agreements;
    }

    public void setAgreements(List<Agreement> agreements) {
        this.agreements = agreements;
    }

    public List<ChangedVO> getChangeds() {
        return changeds;
    }

    public void setChangeds(List<ChangedVO> changeds) {
        this.changeds = changeds;
    }

    public List<ExamineVO> getExamines() {
        return examines;
    }

    public void setExamines(List<ExamineVO> examines) {
        this.examines = examines;
    }

    @Override
    public String toString() {
        return "EmployeeVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", empNo='" + empNo + '\'' +
                ", brithday='" + brithday + '\'' +
                ", phone='" + phone + '\'' +
                ", persionId='" + persionId + '\'' +
                ", navitePlace='" + navitePlace + '\'' +
                ", eduBackground=" + eduBackground +
                ", entryDay='" + entryDay + '\'' +
                ", deptName='" + deptName + '\'' +
                ", postName='" + postName + '\'' +
                ", status=" + status +
                ", educationBackgrounds=" + educationBackgrounds +
                ", positions=" + positions +
                ", commends=" + commends +
                ", agreements=" + agreements +
                ", changeds=" + changeds +
                ", examines=" + examines +
                '}';
    }
}
