package com.zcz.util;

/**
 * 数据库备份操作
 */
public class Operate {

    /**
     * 文件名
     */
    private String addressname;

    /**
     * 路径
     */
    private String address;

    public Operate(String addressname, String address) {
        this.addressname = addressname;
        this.address = address;
    }

    public String getAddressname() {
        return addressname;
    }

    public void setAddressname(String addressname) {
        this.addressname = addressname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
