package com.hxsg.core.Dao;

import com.hxsg.core.po.YeGuaiQun;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface YeGuaiQunMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YeGuaiQun record);

    int insertSelective(YeGuaiQun record);

    YeGuaiQun selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YeGuaiQun record);

    int updateByPrimaryKey(YeGuaiQun record);

    /**
     * 查询野怪群详细分布
     * @param name
     * @return
     */
    YeGuaiQun selectByName(String name);
}