package com.hxsg.core.Dao;

import com.hxsg.core.po.RoleVip;

import java.util.List;

public interface RoleVipMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleVip record);
    List<RoleVip> selectAll(RoleVip record);
    int insertSelective(RoleVip record);

    RoleVip selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleVip record);

    int updateByPrimaryKey(RoleVip record);
}