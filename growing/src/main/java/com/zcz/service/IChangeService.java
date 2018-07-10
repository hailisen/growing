package com.zcz.service;

import com.zcz.bean.Changed;

import java.util.List;

/**
 * 员工变更表服务层接口
 */
public interface IChangeService {

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    Changed selectByPrimaryKey(Integer id);

    /**
     * 删除员工变更信息
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 根据主键修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Changed record);

    /**
     * 查询所有变更信息
     * @return
     */
    List<Changed> findAll();

    /**
     * 新增员工变更
     * @param record
     * @return
     */
    int insertSelective(Changed record);
}
