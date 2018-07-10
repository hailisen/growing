package com.zcz.service;

import com.zcz.bean.Agreement;

public interface IAgreementService {

    /**
     * 修改协议
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Agreement record);

    Agreement selectByPrimaryKey(Integer id);
    /**
     * 删除协议
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 添加员工协议
     * @param record
     * @return
     */
    int insertSelective(Agreement record);
}
