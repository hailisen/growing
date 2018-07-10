package com.zcz.service.impl;

import com.zcz.bean.DbSave;
import com.zcz.dao.DbSaveMapper;
import com.zcz.service.IDbSaveService;
import com.zcz.util.AddressUtil;
import com.zcz.util.Operate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("dbSaveService")
public class DbSaveServiceImpl implements IDbSaveService {

    @Autowired
    private DbSaveMapper dbSaveMapper;

    public DbSaveMapper getDbSaveMapper() {
        return dbSaveMapper;
    }

    public void setDbSaveMapper(DbSaveMapper dbSaveMapper) {
        this.dbSaveMapper = dbSaveMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return dbSaveMapper.deleteByPrimaryKey(id);
    }

    /**
     * 查询备份信息
     * @return
     */
    @Override
    public List<DbSave> selectDbSaceList() {
        return dbSaveMapper.selectDbSaceList();
    }

    /**
     * 备份数据记录
     * @param record
     * @return
     */
    @Override
    public int insertSelective(DbSave record) {
        Operate operate = new Operate("","");
        boolean b = AddressUtil.save(operate,"root","root","kinder_crm","");
        if(b){
            record.setFilename(AddressUtil.time+".sql");
            record.setFilepath(AddressUtil.address);
            record.setSaveTime(new Date());
            return dbSaveMapper.insertSelective(record);
        }
        return 0;
    }
}
