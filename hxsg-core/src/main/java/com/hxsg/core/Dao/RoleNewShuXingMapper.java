package com.hxsg.core.Dao;

import com.hxsg.core.po.RoleNewShuXing;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleNewShuXingMapper {
    int deleteByPrimaryKey(Integer id)throws Exception;

    int insert(RoleNewShuXing record)throws Exception;

    int insertSelective(RoleNewShuXing record)throws Exception;

    RoleNewShuXing selectByPrimaryKey(Integer id)throws Exception;

    int updateByPrimaryKeySelective(RoleNewShuXing record)throws Exception;

    int updateByPrimaryKey(RoleNewShuXing record)throws Exception;

    /**
     * 查询角色总抗性
     * @param id
     * @return
     * @throws Exception
     */
    List<RoleNewShuXing> queryRoleShuXing(Integer id, Integer status) throws Exception;
}