package com.zcz.dao;

import com.zcz.bean.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * 职称类别接口
 */
@Component
public interface CategoryMapper {

    /**
     * 查询职称类别下的职称级别
     * @param cateId
     * @return
     */
    List<Map<String,Object>> findCateLevelByCateId(@Param("cateId") Integer cateId);

    /**
     * 根据职称级别ID查询一条级别信息
     * @param id
     * @return id levelName timeLimit categoryId
     */
    Map<String,Object> findCateLevelById(@Param("id") Integer id);

    /**
     * 添加职称类别
     * @param record
     * @return
     */
    int insertSelective(Category record);

    /**
     * 添加职称类别的级别信息
     * @param levelName  级别名称
     * @param timeLimit  晋升年限
     * @param level      级别
     * @param categoryId 所属类别
     * @return
     */
    int insertLevel(@Param("levelName") String levelName,@Param("timeLimit") Integer timeLimit,@Param("level") String level,@Param("categoryId") Integer categoryId);

    /**
     * 删除原有的职称分类的级别
     * @param categoryId
     * @return
     */
    int deleteLecelByCateId(@Param("categoryId") Integer categoryId);

    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}