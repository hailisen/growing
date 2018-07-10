package com.zcz.service.impl;

import com.zcz.bean.Position;
import com.zcz.dao.PositionMapper;
import com.zcz.service.IPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service("positionService")
public class PositionServiceImpl implements IPositionService {

    @Autowired
    private PositionMapper positionMapper;

    public PositionMapper getPositionMapper() {
        return positionMapper;
    }

    public void setPositionMapper(PositionMapper positionMapper) {
        this.positionMapper = positionMapper;
    }

    /**
     * 修改员工职称
     * @param id
     * @param positionId
     * @param empId
     * @param getTime
     * @param url
     * @param fileName
     * @return
     */
    @Override
    public Integer updatePositionForEmp(Integer id, Integer positionId, Integer empId, String getTime, String url, String fileName) {
        return positionMapper.updatePositionForEmp(id,positionId,empId,getTime,url,fileName);
    }

    /**
     * 删除员工的职称
     * @param peId
     * @return
     */
    @Override
    public Integer deletePositionEmp(Integer peId) {
        return positionMapper.deletePositionEmp(peId);
    }

    /**
     * 修改职称类别
     * @return
     */
    @Override
    public int updateCategory(Integer id, String cateName, Integer levelNum, String note) {
        return positionMapper.updateCategory(id,cateName,levelNum,note);
    }

    /**
     * 查询职称类别列表 职称类别id,职称类别姓名：cateName,说明：tc.note,人数：empNum
     * @return
     */
    @Override
    public List<Map<String, Object>> categoryList() {
        return positionMapper.categoryList();
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return positionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Position record) {
        return positionMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 添加职称
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Position record) {
        return positionMapper.insertSelective(record);
    }

    /**
     * 根据职称类别ID获取职称级别下拉框列表 Map里的属性名有：id level
     * @param cateId
     * @return
     */
    @Override
    public List<Map<String, Object>> findCateLevleByCateId(Integer cateId) {
        return positionMapper.findCateLevleByCateId(cateId);
    }

    /**
     * 查询职称列表 Map里的属性：id,positionName：职称名,cateName：所属类别,timeLimit：年限 ,empNum：人数
     * @return
     */
    @Override
    public List<Map<String, Object>> getPositionList() {
        return positionMapper.getPositionList();
    }

    /**
     * 查询职称类别
     * map --id ,cateName
     * @return
     */
    @Override
    public List<Map<String, Object>> findCategory() {
        return positionMapper.findCategory();
    }

    /**
     * 根据类别查询职称列表
     * map --id ,positionName
     * @return
     */
    @Override
    public List<Map<String, Object>> findPositionByCate(Integer categoryId) {
        return positionMapper.findPositionByCate(categoryId);
    }

    /**
     * 给员工添加职称
     * #{positionId},#{empId},#{getTime},#{url},#{fileName}
     * @return
     */
    @Override
    public int addPositionFroEmp(Map<String, Object> map) {
        return positionMapper.addPositionFroEmp(map);
    }

    /**
     * 根据职称名称查询职称ID
     * @param positionName
     * @return
     */
    @Override
    public Integer findIdByName(String positionName) {
        return positionMapper.findIdByName(positionName);
    }

    /**
     * 职称下拉列表
     * @return
     */
    @Override
    public List<Map<String, Object>> findPosition() {
        return positionMapper.findPosition();
    }

    /**
     * 根据主键查询职称信息
     * @param id
     * @return
     */
    @Override
    public Position selectByPrimaryKey(Integer id) {
        return positionMapper.selectByPrimaryKey(id);
    }
}
