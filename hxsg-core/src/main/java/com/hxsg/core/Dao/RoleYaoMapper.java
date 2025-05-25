package com.hxsg.core.Dao;

import com.hxsg.core.po.RoleYao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface RoleYaoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleYao record);

    int insertSelective(RoleYao record);

    RoleYao selectByPrimaryKey(Integer id);

    List<RoleYao> selectByYaoIdRoleId(Integer roleid, Integer yaoid);

    Map<String, Object> selectByYaoNameRoleId(String roleid, String yaoname) throws Exception;

    List<RoleYao> selectRoleId(Integer roleid);

    int updateByPrimaryKeySelective(RoleYao record);

    int updateByPrimaryKey(RoleYao record);
}