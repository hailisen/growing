package com.zcz.service.impl;

import com.zcz.bean.Category;
import com.zcz.dao.CategoryMapper;
import com.zcz.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public CategoryMapper getCategoryMapper() {
        return categoryMapper;
    }

    public void setCategoryMapper(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }

    @Override
    public Category selectByPrimaryKey(Integer id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询职称类别下的职称级别
     * @param cateId
     * @return
     */
    @Override
    public List<Map<String, Object>> findCateLevelByCateId(Integer cateId) {
        return categoryMapper.findCateLevelByCateId(cateId);
    }

    /**
     * 根据主键删除
     * @param id
     * @return
     */
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return categoryMapper.deleteByPrimaryKey(id);
    }

    /**
     * 添加职称类别
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Category record) {
        return categoryMapper.insertSelective(record);
    }

    /**
     * 添加职称类别的级别信息
     * @param levelName  级别名称
     * @param timeLimit  晋升年限
     * @param level      级别
     * @param categoryId 所属类别
     * @return
     */
    @Override
    public int insertLevel(String levelName, Integer timeLimit, String level, Integer categoryId) {
        return categoryMapper.insertLevel(levelName,timeLimit,level,categoryId);
    }

    /**
     * 删除原有的职称分类的级别
     * @param categoryId
     * @return
     */
    @Override
    public int deleteLecelByCateId(Integer categoryId) {
        return categoryMapper.deleteLecelByCateId(categoryId);
    }

    /**
     * 根据职称级别ID查询一条级别信息
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> findCateLevelById(Integer id) {
        return categoryMapper.findCateLevelById(id);
    }
}
