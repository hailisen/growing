package com.zcz.dao;

import com.zcz.bean.Dept;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface DeptMapper {

    /**
     * 根据查询排序号查询部门
     * @param orderNum
     * @return
     */
    List<Dept> findDeptByOrder(@Param("orderNum") Integer orderNum);

    /**
     * 根据ID修改排序数
     * @param newOrder
     * @param deptId
     * @return
     */
    Integer updateOrderById(@Param("newOrder") Integer newOrder,@Param("deptId") Integer deptId);

    /**
     * 根据排序数修改排序数
     * @param newOrder
     * @param oldOrder
     * @return
     */
    Integer updateOrderByOrder(@Param("newOrder") Integer newOrder,@Param("oldOrder") Integer oldOrder);

    /**
     * 查询所有部门的信息
     * @return
     */
    Integer findOrderNum();

    /**
     * 查询所有部门的信息
     * Map里的键有 id,deptName,empNum,note
     * @return
     */
    List<Map<String,Object>> findDeptList();

    /**
     * 查询下拉框部门列表
     * Map的键包括：id,deptName
     * @return
     */
    List<Map<String,Object>> findDept();

    /**
     * 根据主键删除部门
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    int insert(Dept record);

    /**
     * 添加部门
     * @param record
     * @return
     */
    int insertSelective(Dept record);

    /**
     * 修改部门信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Dept record);

    /**
     * 根据ID查询部门
     * @param id
     * @return
     */
    Dept selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Dept record);
}