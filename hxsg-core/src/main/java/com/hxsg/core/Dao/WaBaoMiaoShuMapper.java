package com.hxsg.core.Dao;

import com.hxsg.core.po.WaBaoMiaoShu;

import java.util.List;

public interface WaBaoMiaoShuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WaBaoMiaoShu record);

    int insertSelective(WaBaoMiaoShu record);
    List<WaBaoMiaoShu> getWbByTime();
    WaBaoMiaoShu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WaBaoMiaoShu record);

    int updateByPrimaryKey(WaBaoMiaoShu record);
}