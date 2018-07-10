package com.zcz.service.impl;

import com.zcz.bean.Changed;
import com.zcz.dao.ChangedMapper;
import com.zcz.service.IChangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("changeService")
public class ChangeServiceImpl implements IChangeService{

    @Autowired
    private ChangedMapper changedMapper;

    public ChangedMapper getChangedMapper() {
        return changedMapper;
    }

    public void setChangedMapper(ChangedMapper changedMapper) {
        this.changedMapper = changedMapper;
    }

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    @Override
    public Changed selectByPrimaryKey(Integer id) {
        return changedMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据主键修改
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(Changed record) {
        return changedMapper.updateByPrimaryKey(record);
    }

    /**
     * 查询所有变更信息
     * @return
     */
    @Override
    public List<Changed> findAll() {
        return changedMapper.findAll();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return changedMapper.deleteByPrimaryKey(id);
    }

    /**
     * 新增员工变更
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Changed record) {
        return changedMapper.insertSelective(record);
    }
}
