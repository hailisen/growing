package com.zcz.service;

import com.zcz.bean.EducationBackground;

public interface IEducationBackgroundService {

    /**
     * 根据教育背景ID获取该条信息
     * @param id
     * @return
     */
    EducationBackground selectByPrimaryKey(Integer id);

    /**
     * 删除员工教育背景
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 修改员工教育背景
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(EducationBackground record);

    /**
     * 添给员工加教育背景
     * @param record
     * @return
     */
    int insertSelective(EducationBackground record);
}
