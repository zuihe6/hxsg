package com.hxsg.core.Dao;

import com.hxsg.core.po.ZaWuMiaoShu;

public interface ZaWuMiaoShuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ZaWuMiaoShu record);

    int insertSelective(ZaWuMiaoShu record);

    ZaWuMiaoShu selectByName(String name);

    ZaWuMiaoShu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ZaWuMiaoShu record);

    int updateByPrimaryKey(ZaWuMiaoShu record);
}
