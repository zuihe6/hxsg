package com.hxsg.core.Dao;

import com.hxsg.core.po.RoleZb;

import java.util.List;

public interface RoleZbMapper {
    List<RoleZb> selectRoleId(Integer roleid);
    int deleteByPrimaryKey(Integer id);

    int insert(RoleZb record);

    int insertSelective(RoleZb record);
List<RoleZb>selectAll(RoleZb record);
    RoleZb selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleZb record);

    int updateByPrimaryKey(RoleZb record);
}