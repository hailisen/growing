package com.zcz.dao;

import com.zcz.bean.EducationBackground;
import org.springframework.stereotype.Component;

/**
 * 教育背景
 */
@Component
public interface EducationBackgroundMapper {

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

    int insert(EducationBackground record);

    /**
     * 添给员工加教育背景
     * @param record
     * @return
     */
    int insertSelective(EducationBackground record);

    int updateByPrimaryKey(EducationBackground record);
}