package com.zcz.service.impl;

import com.zcz.bean.Post;
import com.zcz.dao.PostMapper;
import com.zcz.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service("postService")
public class PostServiceImpl implements IPostService {

    @Autowired
    private PostMapper postMapper;

    public PostMapper getPostMapper() {
        return postMapper;
    }

    public void setPostMapper(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    @Override
    public Post selectByPrimaryKey(Integer id) {
        return postMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据ID修改排序数
     * @param newOrder
     * @param deptId
     * @return
     */
    @Override
    public Integer updateOrderById(Integer newOrder, Integer deptId) {
        return postMapper.updateOrderById(newOrder, deptId);
    }

    /**
     * 根据排序数修改排序数
     * @param newOrder
     * @param oldOrder
     * @return
     */
    @Override
    public Integer updateOrderByOrder(Integer newOrder, Integer oldOrder) {
        return postMapper.updateOrderByOrder(newOrder, oldOrder);
    }

    /**
     * 根据主键删除岗位
     * @param id
     * @return
     */
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return postMapper.deleteByPrimaryKey(id);
    }

    /**
     * 查询比当前排序数大的岗位记录集合
     * @param orderNum
     * @return
     */
    @Override
    public List<Post> findByOrder(Integer orderNum) {
        return postMapper.findByOrder(orderNum);
    }

    /**
     * 修改岗位列表
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(Post record) {
        return postMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 新增岗位
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Post record) {
        return postMapper.insertSelective(record);
    }

    /**
     * 根据部门名称和岗位名查询该岗位的ID
     * @param deptName
     * @param postName
     * @return
     */
    @Override
    public Integer findIdByName(String deptName, String postName) {
        return postMapper.findIdByName(deptName,postName);
    }

    /**
     * 当前岗位排序数
     * @return
     */
    @Override
    public Integer findOrderNum() {
        return postMapper.findOrderNum();
    }

    /**
     * 查询岗位列表
     * Map中的字段：id,postName,deptName,empNum,note,orderNum
     * @return
     */
    @Override
    public List<Map<String, Object>> findPostList(Integer deptId) {
        return postMapper.findPostList(deptId);
    }

    /**
     * 根据部门查询岗位下拉框
     * @return
     */
    @Override
    public List<Map<String, Object>> getPostByDept() {
        return postMapper.getPostByDept();
    }
}
