package com.hxsg.core.Dao;

import com.hxsg.core.po.FjLevelJy;

public interface FjLevelJyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FjLevelJy record);

    int insertSelective(FjLevelJy record);

    FjLevelJy selectByPrimaryKey(Integer id);
    int sumyingcai(Integer level);
    int sumjiangcai(Integer level);
    int sumyuanshuai(Integer level);
    int updateByPrimaryKeySelective(FjLevelJy record);

    int updateByPrimaryKey(FjLevelJy record);
}