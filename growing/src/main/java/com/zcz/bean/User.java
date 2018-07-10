package com.zcz.bean;
/**
 *aj
 **/
public class User {
    private Integer id;

    private String name;

    private String sex;

    private Integer age;

    private Double balance;

    public User() {
    }

    public User(Integer id, String name, String sex, Integer age, Double balance) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.balance = balance;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", balance=" + balance +
                '}';
    }
}