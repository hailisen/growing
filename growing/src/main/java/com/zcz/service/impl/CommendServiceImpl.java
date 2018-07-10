package com.zcz.service.impl;

import com.zcz.bean.Commend;
import com.zcz.bean.vo.CommendList;
import com.zcz.dao.CommendMapper;
import com.zcz.service.ICommendService;
import com.zcz.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commendService")
public class CommendServiceImpl implements ICommendService{

    @Autowired
    private CommendMapper commendMapper;

    public CommendMapper getCommendMapper() {
        return commendMapper;
    }

    public void setCommendMapper(CommendMapper commendMapper) {
        this.commendMapper = commendMapper;
    }

    /**
     * 查询表彰表里的年份，用于条件查询
     * @return
     */
    @Override
    public List<Integer> findCommendYear() {
        return commendMapper.findCommendYear();
    }

    /**
     * 删除表彰
     * @param id
     * @return
     */
    @Override
    public int deleteById(Integer id) {
        return commendMapper.deleteById(id);
    }

    /**
     * 修改
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(Commend record) {
        return commendMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 查询一条数据
     * @param id
     * @return
     */
    @Override
    public Commend selectByPrimaryKey(Integer id) {
        return commendMapper.selectByPrimaryKey(id);
    }

    /**
     * 分页查询表彰统计列表
     * @param getYear
     * @param level
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    public Page<CommendList> findCommendList(Integer getYear, String level, Integer pageNum, Integer pageSize) {
        List<CommendList> commendLists = commendMapper.findCommendList(getYear,level,(pageNum-1)*pageSize,pageSize);
        Page<CommendList> page = new Page<>();
        page.setResult(commendLists);
        page.setPageNumber(pageNum.longValue());
        page.setPageSize(pageSize.longValue());
        Integer total = commendMapper.findCommendCount(getYear,level);
        page.setTotalRows(total.longValue());
        return page;
    }

    /**
     * 给员工添加表彰信息
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Commend record) {
        return commendMapper.insertSelective(record);
    }

    @Override
    public int insert(Commend record) {
        return commendMapper.insert(record);
    }

}
