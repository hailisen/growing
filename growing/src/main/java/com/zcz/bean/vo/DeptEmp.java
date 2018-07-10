package com.zcz.bean.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;
@ApiModel(value = "deptEmp   --部门员工联动选择")
public class DeptEmp {
    private Integer id;
    @ApiModelProperty(value = "部门名称")
    private String deptName;
    private List<EmpListVO> emps;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public List<EmpListVO> getEmps() {
        return emps;
    }

    public void setEmps(List<EmpListVO> emps) {
        this.emps = emps;
    }
}
