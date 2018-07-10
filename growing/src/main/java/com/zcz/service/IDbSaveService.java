package com.zcz.service;

import com.zcz.bean.DbSave;

import java.util.List;

/**
 * 数据库备份服务层
 */
public interface IDbSaveService {

    int insertSelective(DbSave record);

    /**
     * 查询备份信息
     * @return
     */
    List<DbSave> selectDbSaceList();

    int deleteByPrimaryKey(Integer id);
}
