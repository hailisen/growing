package com.zcz.service;

import com.zcz.bean.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ICategoryService {


    /**
     * 查询职称类别下的职称级别
     * @param cateId
     * @return
     */
    List<Map<String,Object>> findCateLevelByCateId(@Param("cateId") Integer cateId);

    Category selectByPrimaryKey(Integer id);

    /**
     * 根据职称级别ID查询一条级别信息
     * @param id
     * @return id levelName timeLimit categoryId
     */
    Map<String,Object> findCateLevelById(@Param("id") Integer id);

    /**
     * 根据主键删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 添加职称类别的级别信息
     * @param levelName  级别名称
     * @param timeLimit  晋升年限
     * @param level      级别
     * @param categoryId 所属类别
     * @return
     */
    int insertLevel(String levelName,Integer timeLimit,String level,Integer categoryId);

    /**
     * 添加职称类别
     * @param record
     * @return
     */
    int insertSelective(Category record);


    /**
     * 删除原有的职称分类的级别
     * @param categoryId
     * @return
     */
    int deleteLecelByCateId(Integer categoryId);
}
