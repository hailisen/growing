package com.zcz.service.impl;

import com.zcz.bean.Dept;
import com.zcz.dao.DeptMapper;
import com.zcz.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

/**
 * 部门服务层接口
 */
@Service("deptService")
public class DeptServiceImpl implements IDeptService {

    @Autowired
    private DeptMapper deptMapper;

    public DeptMapper getDeptMapper() {
        return deptMapper;
    }

    public void setDeptMapper(DeptMapper deptMapper) {
        this.deptMapper = deptMapper;
    }

    @Override
    public List<Dept> findDeptByOrder(Integer orderNum) {
        return deptMapper.findDeptByOrder(orderNum);
    }

    /**
     * 根据ID查询部门
     * @param id
     * @return
     */
    @Override
    public Dept selectByPrimaryKey(Integer id) {
        return deptMapper.selectByPrimaryKey(id);
    }

    /**
     * 根据ID修改排序数
     * @param newOrder
     * @param deptId
     * @return
     */
    @Override
    public Integer updateOrderById(Integer newOrder, Integer deptId) {
        return deptMapper.updateOrderById(newOrder, deptId);
    }

    /**
     * 根据排序数修改排序数
     * @param newOrder
     * @param oldOrder
     * @return
     */
    @Override
    public Integer updateOrderByOrder(Integer newOrder, Integer oldOrder) {
        return deptMapper.updateOrderByOrder(newOrder, oldOrder);
    }

    /**
     * 查询所有部门的信息
     * @return
     */
    @Override
    public Integer findOrderNum() {
        return deptMapper.findOrderNum();
    }

    /**
     * 删除部门
     * @param id
     * @return
     */
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return deptMapper.deleteByPrimaryKey(id);
    }

    /**
     * 修改部门
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(Dept record) {
        return deptMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 添加部门
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Dept record) {
        return deptMapper.insertSelective(record);
    }

    /**
     * Map里的键有 id,deptName,empNum,note
     * @return
     */
    @Override
    public List<Map<String, Object>> findDeptList() {
        return deptMapper.findDeptList();
    }

    /**
     * 查询下拉框部门列表
     * Map的键包括：id,deptName
     * @return
     */
    @Override
    public List<Map<String, Object>> findDept() {
        return deptMapper.findDept();
    }
}
