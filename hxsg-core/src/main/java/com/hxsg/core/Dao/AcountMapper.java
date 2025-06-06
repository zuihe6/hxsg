package com.hxsg.core.Dao;

import com.hxsg.core.po.Acount;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AcountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Acount record);

    int insertSelective(Acount record);

    Acount selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Acount record);

    int updateByPrimaryKey(Acount record);

    /**
     * 验证账号登录
     * @param record 账号密码
     * @return
     */
    Acount login(Acount record);
    /**
     * 检查账号是否重复
     * @param record 账号
     * @return
     */
    Acount checkdAcount(Acount record);
}