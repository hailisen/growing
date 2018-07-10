package com.zcz.service;

import com.zcz.bean.Position;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IPositionService {

    /**
     * 根据主键查询职称信息
     * @param id
     * @return
     */
    Position selectByPrimaryKey(Integer id);

    /**
     * 修改员工职称
     * @param id
     * @param positionId
     * @param empId
     * @param getTime
     * @param url
     * @param fileName
     * @return
     */
    Integer updatePositionForEmp(Integer id,Integer positionId,Integer empId,String getTime,String url,String fileName);

    /**
     * 删除员工的职称
     * @param peId
     * @return
     */
    Integer deletePositionEmp(@Param("paId") Integer peId);

    /**
     * 修改职称类别
     * @return
     */
    int updateCategory(Integer id,String cateName,Integer levelNum,String note);

    /**
     * 查询职称类别列表
     * 职称类别id,职称类别姓名：cateName,说明：tc.note,人数：empNum
     * @return
     */
    List<Map<String,Object>> categoryList();

    /**
     * 删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 修改职称
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Position record);

    /**
     * 添加职称
     * @param record
     * @return
     */
    int insertSelective(Position record);

    /**
     * 根据职称类别ID获取职称级别下拉框列表 Map里的属性名有：id  level
     * @param cateId
     * @return
     */
    List<Map<String,Object>> findCateLevleByCateId(Integer cateId);

    /**
     * 查询职称表格列表
     * Map里的属性：id,positionName：职称名,cateName：所属类别,timeLimit：年限 ,empNum：人数
     * @return
     */
    List<Map<String,Object>> getPositionList();

    /**
     * 根据类别查询职称下拉框列表
     * @param categoryId
     * @return
     */
    List<Map<String,Object>> findPositionByCate(@Param("categoryId") Integer categoryId);

    /**
     * 查询职称类别
     * @return
     */
    List<Map<String,Object>> findCategory();

    /**
     * 职称下拉列表
     * @return
     */
    List<Map<String,Object>> findPosition();

    /**
     * 根据职称名称查询职称ID
     * @param positionName
     * @return
     */
    Integer findIdByName(@Param("positionName") String positionName);

    /**
     * 给员工添加职称
     * #{positionId},#{empId},#{getTime},#{url},#{fileName}
     * @return
     */
    int addPositionFroEmp(Map<String,Object> map);
}
