package com.zcz.service.impl;

import com.zcz.bean.Agreement;
import com.zcz.dao.AgreementMapper;
import com.zcz.service.IAgreementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("agreementService")
public class AgreementServiceImpl implements IAgreementService {

    @Autowired
    private AgreementMapper agreementMapper;

    public AgreementMapper getAgreementMapper() {
        return agreementMapper;
    }

    public void setAgreementMapper(AgreementMapper agreementMapper) {
        this.agreementMapper = agreementMapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return agreementMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Agreement selectByPrimaryKey(Integer id) {
        return agreementMapper.selectByPrimaryKey(id);
    }

    /**
     * 修改协议
     * @param record
     * @return
     */
    @Override
    public int updateByPrimaryKeySelective(Agreement record) {
        return agreementMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * 添加员工协议
     * @param record
     * @return
     */
    @Override
    public int insertSelective(Agreement record) {
        return agreementMapper.insertSelective(record);
    }

}
