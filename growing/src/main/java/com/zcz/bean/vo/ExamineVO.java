package com.zcz.bean.vo;

import java.util.Date;

public class ExamineVO {

    private Integer id;

    private String name;//员工姓名

    private Integer year;
    //考核结果  优秀/合格/基本合格/不合格
    private Integer result;

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

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }
}
