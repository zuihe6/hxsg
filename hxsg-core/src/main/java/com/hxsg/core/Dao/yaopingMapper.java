package com.hxsg.core.Dao;

import com.hxsg.core.po.yaoping;

import java.util.List;

public interface yaopingMapper {
    int deleteByPrimaryKey(Integer yaoid);

    int insert(yaoping record);

    int insertSelective(yaoping record);

    yaoping selectByPrimaryKey(Integer yaoid);
    List<yaoping> selectBySx(Integer sx);

    int updateByPrimaryKeySelective(yaoping record);

    int updateByPrimaryKey(yaoping record);
}