package com.zcz.dao;

import com.zcz.bean.Changed;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ChangedMapper {

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

    /**
     * 删除员工变更信息
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    int insert(Changed record);

    Changed selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Changed record);

    int updateByPrimaryKey(Changed record);
}