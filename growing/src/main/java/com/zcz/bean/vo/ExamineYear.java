package com.zcz.bean.vo;

import java.util.List;
import java.util.Map;

public class ExamineYear {
    private String name;
    private String phone;
    private String deptName;
    private String postName;
    private List<Map<String,Integer>> maps;

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

    public List<Map<String, Integer>> getMaps() {
        return maps;
    }

    public void setMaps(List<Map<String, Integer>> maps) {
        this.maps = maps;
    }
}
