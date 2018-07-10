package com.zcz.service.impl;

import com.zcz.bean.Examine;
import com.zcz.bean.vo.ExamineList;
import com.zcz.bean.vo.ExamineYear;
import com.zcz.bean.vo.ExamineYearVO;
import com.zcz.dao.ExamineMapper;
import com.zcz.service.IExaminService;
import com.zcz.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 考核服务层
 */
@Service
public class ExaminServiceImpl implements IExaminService {

    @Autowired
    private ExamineMapper examineMapper;

    public ExamineMapper getExamineMapper() {
        return examineMapper;
    }

    public void setExamineMapper(ExamineMapper examineMapper) {
        this.examineMapper = examineMapper;
    }

    /**
     * 查询年度下拉框
     * @return
     */
    @Override
    public List<Integer> findYean() {
        return examineMapper.findYean();
    }

    /**
     * 修改一条考核结果
     * @param result
     * @param id
     * @return
     */
    @Override
    public int updateById(Integer result, Integer id) {
        return examineMapper.updateById(result,id);
    }

    /**
     * 年度考核统计
     * @param startYear
     * @param endYear
     * @return
     */
    @Override
    public Page<ExamineYearVO> examineByYear(Integer startYear, Integer endYear,Integer pageNum,Integer pageSize) {
        List<ExamineYear> list = examineMapper.examineByYear(startYear,endYear,(pageNum-1)*pageSize,pageSize);
        List<ExamineYearVO> voList = new ArrayList<>();
        for (ExamineYear year: list) {
            ExamineYearVO vo = new ExamineYearVO();
            vo.setName(year.getName());
            vo.setPhone(year.getPhone());
            vo.setDeptName(year.getDeptName());
            vo.setPostName(year.getPostName());
            List<Map<String,Integer>> maps = year.getMaps();
            for (Map<String,Integer> map: maps) {
                if(map.get("result")==0){
                    vo.setExcellent(Integer.valueOf(String.valueOf(map.get("count"))));
                }else if (map.get("result")==1){
                    vo.setQualified(Integer.valueOf(String.valueOf(map.get("count"))));
                }else if (map.get("result")==2){
                    vo.setPassMuster(Integer.valueOf(String.valueOf(map.get("count"))));
                }else if (map.get("result")==3){
                    vo.setUnqualified(Integer.valueOf(String.valueOf(map.get("count"))));
                }
            }
            voList.add(vo);
        }
        Page<ExamineYearVO> page = new Page<>();
        page.setPageSize(pageSize.longValue());
        page.setPageNumber(pageNum.longValue());
        page.setTotalRows(Long.valueOf(examineMapper.examineCountYear(startYear,endYear).size()));
        page.setResult(voList);
        return page;
    }

    /**
     * 初始化默认所有人员一致
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Examine record) {
        return examineMapper.insertSelective(record);
    }

    /**
     * 修改员工考核结果
     * @param result
     * @param empId
     * @return
     */
    @Override
    public Integer updateResult(Integer result, Integer empId,Integer year) {
        return examineMapper.updateResult(result,empId,year);
    }

    /**
     * 考核结果的人数
     * @return
     */
    @Override
    public Map<String, Integer> examineCount() {
        Map<String,Integer> map = new HashMap<>();
        // 0优秀/1合格/2基本合格/3不合格
        Integer excellent = examineMapper.examineCount(0);//优秀人数
        Integer qualified = examineMapper.examineCount(1);//合格人数
        Integer passMuster = examineMapper.examineCount(2);//基本合格人数
        Integer unqualified = examineMapper.examineCount(3);//不合格人数
        map.put("excellent",excellent);
        map.put("qualified",qualified);
        map.put("passMuster",passMuster);
        map.put("unqualified",unqualified);
        map.put("count",excellent+qualified+passMuster+unqualified);//总人数
        return map;
    }

    /**
     * 获取员工年度考核列表
     * @param year
     * @param result
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    public Page<ExamineList> getExamineList(Integer year, Integer result, Integer pageNum, Integer pageSize) {
        Page<ExamineList> page = new Page<>();
        List<ExamineList> list = examineMapper.getExamineList(year,result,(pageNum-1)*pageSize,pageSize);
        page.setResult(list);
        page.setPageNumber(pageNum.longValue());
        page.setPageSize(pageSize.longValue());
        page.setTotalRows(examineMapper.examineListCount(year,result).longValue());
        return page;
    }
}
