package com.hxsg.core.Dao;

import com.hxsg.core.po.Tax;

public interface TaxMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tax record);

    int insertSelective(Tax record);

    Tax selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tax record);

    int updateByPrimaryKey(Tax record);
}