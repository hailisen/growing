package com.zcz.dao;

import com.zcz.bean.Position;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 职称Dao层接口
 */
@Component
public interface PositionMapper {

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
    Integer updatePositionForEmp(@Param("id") Integer id,@Param("positionId") Integer positionId,@Param("empId") Integer empId,
                                 @Param("getTime") String getTime,@Param("url") String url,@Param("fileName") String fileName);
    /**
     * 删除员工的职称
     * @param peId
     * @return
     */
    Integer deletePositionEmp(@Param("peId") Integer peId);

    /**
     * 查询职称类别列表
     * 职称类别id,职称类别姓名：cateName,说明：tc.note,人数：empNum
     * @return
     */
    List<Map<String,Object>> categoryList();

    /**
     * 添加职称
     * @param record
     * @return
     */
    int insertSelective(Position record);

    /**
     * 根据职称类别ID获取职称级别列表 Map里的属性名有：id  level
     * @param cateId
     * @return
     */
    List<Map<String,Object>> findCateLevleByCateId(@Param("cateId") Integer cateId);

    /**
     * 查询职称列表
     * Map里的属性：id,positionName：职称名,cateName：所属类别,timeLimit：年限 ,empNum：人数
     * @return
     */
    List<Map<String,Object>> getPositionList();

    /**
     * 根据类别查询职称列表
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
     * 根据职称名称查询职称ID
     * @param positionName
     * @return
     */
    Integer findIdByName(@Param("positionName") String positionName);

    /**
     * 职称下拉列表
     * @return
     */
    List<Map<String,Object>> findPosition();

    /**
     * 给员工添加职称
     * #{positionId},#{empId},#{getTime},#{url},#{fileName}
     * @return
     */
    int addPositionFroEmp(Map<String,Object> map);

    /**
     * 修改职称类别
     * @return
     */
    int updateCategory(@Param("id") Integer id,@Param("cateName") String cateName,@Param("levelNum") Integer levelNum,@Param("note") String note);

    int deleteByPrimaryKey(Integer id);

    int insert(Position record);

    Position selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKey(Position record);
}