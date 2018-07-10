package com.zcz.service;

import com.zcz.bean.Examine;
import com.zcz.bean.vo.ExamineList;
import com.zcz.bean.vo.ExamineYear;
import com.zcz.bean.vo.ExamineYearVO;
import com.zcz.util.Page;
import io.swagger.models.auth.In;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 年度考核服务层接口
 */
public interface IExaminService {

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
    Page<ExamineYearVO> examineByYear(Integer startYear, Integer endYear,Integer pageNum,Integer pageSize);

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
    Integer updateResult(Integer result,Integer empId,Integer year);

    /**
     * 获取员工年度考核列表
     * @param year
     * @param result
     * @return
     */
    Page<ExamineList> getExamineList(Integer year, Integer result,
                                     Integer pageNum, Integer pageSize);

    /**
     * 考核结果的人数
     * @return
     */
    Map<String,Integer> examineCount();
}
