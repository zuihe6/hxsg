package com.hxsg.core.Dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hxsg.core.po.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    int deleteByPrimaryKey(Integer id);

    List<Role> login(@Param("role") Role role);

    int insert(Role record);

    List<Role> selectAll(@Param("role") Role role);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}