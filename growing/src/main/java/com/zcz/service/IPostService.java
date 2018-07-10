package com.zcz.service;

import com.zcz.bean.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 岗位服务层接口
 */
public interface IPostService {

    /**
     * 根据ID查询岗位
     * @param id
     * @return
     */
    Post selectByPrimaryKey(Integer id);

    /**
     * 根据ID修改排序数
     * @param newOrder
     * @param postId
     * @return
     */
    Integer updateOrderById(Integer newOrder,Integer postId);
    /**
     * 根据排序数修改排序数
     * @param newOrder
     * @param oldOrder
     * @return
     */
    Integer updateOrderByOrder(@Param("newOrder") Integer newOrder,@Param("oldOrder") Integer oldOrder);

    /**
     * 根据主键删除岗位
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 查询比当前排序数大的岗位记录集合
     * @param orderNum
     * @return
     */
    List<Post> findByOrder(Integer orderNum);

    /**
     * 修改岗位列表
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Post record);

    /**
     * 新增岗位
     * @param record
     * @return
     */
    int insertSelective(Post record);

    /**
     * 当前岗位排序数
     * @return
     */
    Integer findOrderNum();

    /**
     * 查询岗位列表
     * id,postName,deptName,empNum,note,orderNum
     * @return
     */
    List<Map<String,Object>> findPostList(Integer deptId);

    /**
     * 根据部门名称和岗位名查询该岗位的ID
     * @param deptName
     * @param postName
     * @return
     */
    Integer findIdByName(String deptName,String postName);

    /**
     * 根据部门查询岗位下拉框
     * @return
     */
    List<Map<String,Object>> getPostByDept();
}
