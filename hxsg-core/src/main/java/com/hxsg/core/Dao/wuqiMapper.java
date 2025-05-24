package com.hxsg.core.Dao;

import com.hxsg.core.po.wuqi;

import java.util.List;

public interface wuqiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(wuqi record);

    int insertSelective(wuqi record);
      List<wuqi> selectAll();
    List<wuqi> selectByAll(wuqi record);
    wuqi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(wuqi record);

    int updateByPrimaryKey(wuqi record);
}