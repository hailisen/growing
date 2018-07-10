package com.zcz.service;

import com.zcz.bean.Commend;
import com.zcz.bean.vo.CommendList;
import com.zcz.util.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICommendService {

    /**
     * 查询表彰表里的年份，用于条件查询
     * @return
     */
    List<Integer> findCommendYear();

    /**
     * 删除表彰
     * @param id
     * @return
     */
    int deleteById(Integer id);

    /**
     * 修改
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Commend record);

    /**
     * 查询一条数据
     * @param id
     * @return
     */
    Commend selectByPrimaryKey(Integer id);

    /**
     * 分页查询表彰统计列表
     * @return
     */
    Page<CommendList> findCommendList(Integer getYear, String level,
                                      Integer pageNum, Integer pageSize);
    /**
     * 给员工添加表彰信息
     * @param record
     * @return
     */
    int insertSelective(Commend record);

    int insert(Commend record);
}
