package com.hxsg.core.Dao;

import com.hxsg.core.po.WuqiDescribe;

public interface WuqiDescribeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WuqiDescribe record);

    int insertSelective(WuqiDescribe record);

    WuqiDescribe selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WuqiDescribe record);

    int updateByPrimaryKey(WuqiDescribe record);
}