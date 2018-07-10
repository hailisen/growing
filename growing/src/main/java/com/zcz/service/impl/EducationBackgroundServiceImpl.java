package com.zcz.service.impl;

import com.zcz.bean.EducationBackground;
import com.zcz.dao.EducationBackgroundMapper;
import com.zcz.service.IEducationBackgroundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("educationBackgroundService")
public class EducationBackgroundServiceImpl implements IEducationBackgroundService{

    @Autowired
    private EducationBackgroundMapper educationBackgroundMapper;

    public EducationBackgroundMapper getEducationBackgroundMapper() {
        return educationBackgroundMapper;
    }

    public void setEducationBackgroundMapper(EducationBackgroundMapper educationBackgroundMapper) {
        this.educationBackgroundMapper = educationBackgroundMapper;
    }

    /**
     * 根据教育背景ID查询
     * @param id
     * @return
     */
    @Override
    public EducationBackground selectByPrimaryKey(Integer id) {
        return educationBackgroundMapper.selectByPrimaryKey(id);
    }

    /**
     * 删除员工教育背景
     * @param id
     * @return
     */
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return educationBackgroundMapper.deleteByPrimaryKey(id);
    }

    /**
     * 修改员工教育背景
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(EducationBackground record) {
        return educationBackgroundMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 添给员工加教育背景
     * @param record
     * @return
     */
    @Override
    public int insertSelective(EducationBackground record) {
        return educationBackgroundMapper.insertSelective(record);
    }
}
