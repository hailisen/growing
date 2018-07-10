package com.zcz.dao;

import com.zcz.bean.Examine;
import com.zcz.bean.vo.ExamineList;
import com.zcz.bean.vo.ExamineYear;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 考核表Dao层接口
 */
@Component
public interface ExamineMapper {

    /**
     * 查询年度下拉框
     * @return
     */
    List<Integer> findYean();

    /**
     * 修改一条考核结果
     * @param result
     * @param id
     * @return
     */
    int updateById(@Param(value = "result") Integer result,@Param(value="id") Integer id);

    /**
     * 年度考核统计
     * @param startYear
     * @param endYear
     * @return
     */
    List<ExamineYear> examineByYear(@Param("startYear") Integer startYear,@Param("endYear") Integer endYear,
                                    @Param("start") Integer start,@Param("pageSize") Integer pageSize);

    /**
     * 年度考核统计条数
     * @param startYear
     * @param endYear
     * @return
     */
    List<ExamineYear> examineCountYear(@Param("startYear") Integer startYear,@Param("endYear") Integer endYear);

    /**
     * 初始化默认所有人员一致
     * @param record
     * @return
     */
    int insertSelective(Examine record);

    /**
     * 修改员工考核结果
     * @param result
     * @param empId
     * @return
     */
    Integer updateResult(@Param("result") Integer result,@Param("empId") Integer empId,@Param("year") Integer year);

    /**
     * 考核结果的人数
     * @param result
     * @return
     */
    Integer examineCount(@Param("result") Integer result);

    /**
     * 查询总条数
     * @param year
     * @param result
     * @return
     */
    Integer examineListCount(@Param("year") Integer year,@Param("result") Integer result);
    /**
     * 获取员工年度考核列表
     * @param year
     * @param result
     * @return
     */
    List<ExamineList> getExamineList(@Param("year") Integer year,@Param("result") Integer result,
                                     @Param("start") Integer start,@Param("pageSize") Integer pageSize);

    int deleteByPrimaryKey(Integer id);

    int insert(Examine record);

    Examine selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Examine record);

    int updateByPrimaryKey(Examine record);
}