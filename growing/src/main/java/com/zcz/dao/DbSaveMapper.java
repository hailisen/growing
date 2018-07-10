package com.zcz.dao;

import com.zcz.bean.DbSave;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface DbSaveMapper {

    /**
     * 查询备份信息
     * @return
     */
    List<DbSave> selectDbSaceList();

    int deleteByPrimaryKey(Integer id);

    int insert(DbSave record);

    int insertSelective(DbSave record);

    DbSave selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DbSave record);

    int updateByPrimaryKey(DbSave record);
}