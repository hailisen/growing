package com.zcz.bean;

//类别表
public class Category {

    private Integer id;

    private String cateName;

    private Integer levelNum;

    private String note;

    public Category() {
    }

    public Category(Integer id, String cateName, Integer levelNum, String note) {

        this.id = id;
        this.cateName = cateName;
        this.levelNum = levelNum;
        this.note = note;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName == null ? null : cateName.trim();
    }

    public Integer getLevelNum() {
        return levelNum;
    }

    public void setLevelNum(Integer levelNum) {
        this.levelNum = levelNum;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}