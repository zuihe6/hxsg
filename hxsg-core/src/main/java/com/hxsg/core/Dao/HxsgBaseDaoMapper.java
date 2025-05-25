/*
* ChisFileSystemMapper.java
* Copyright(C) 2017-2020 贯众健康公司
* @date 2017-10-25
*/
package com.hxsg.core.Dao;


import com.hxsg.core.CommonUtil.CommonException;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HxsgBaseDaoMapper {
    /**
     * 执行任意select
     * @param p
     * @return
     * @throws CommonException
     */
    List<Map<String,Object>> QuerySql(Map<String, Object> p)throws CommonException;

    /**
     * 执行任意update
     * @param p
     * @return
     * @throws CommonException
     */
    int UpdateSql(Map<String, Object> p)throws CommonException;

    /**
     * 执行任意insert
     * @param p
     * @return
     * @throws CommonException
     */
    int InsertSql(Map<String, Object> p)throws CommonException;
}