package com.zcz.dao;

import com.zcz.bean.Commend;
import com.zcz.bean.vo.CommendList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface CommendMapper {

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
    int deleteById(@Param("id") Integer id);

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
    List<CommendList> findCommendList(@Param("getYear") Integer getYear,@Param("level") String level,
                                      @Param("start") Integer start,@Param("pageSize") Integer pageSize);

    /**
     * 查询总条数
     * @param getYear
     * @param level
     * @return
     */
    Integer findCommendCount(@Param("getYear") Integer getYear,@Param("level") String level);

    /**
     * 给员工添加表彰信息
     * @param record
     * @return
     */
    int insertSelective(Commend record);

    int deleteByPrimaryKey(Integer id);

    int insert(Commend record);

    int updateByPrimaryKeySelective(Commend record);

    int updateByPrimaryKey(Commend record);
}