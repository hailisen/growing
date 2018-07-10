package com.zcz.dao;

import com.zcz.bean.Agreement;
import org.springframework.stereotype.Component;

@Component
public interface AgreementMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Agreement record);

    /**
     * 添加员工协议
     * @param record
     * @return
     */
    int insertSelective(Agreement record);

    Agreement selectByPrimaryKey(Integer id);

    /**
     * 修改协议
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Agreement record);

    int updateByPrimaryKey(Agreement record);
}