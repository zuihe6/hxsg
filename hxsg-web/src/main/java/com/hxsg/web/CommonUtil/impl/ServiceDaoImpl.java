package com.hxsg.web.CommonUtil.impl;

import com.hxsg.web.CommonUtil.ServiceDao;
import com.hxsg.core.Dao.RoleFriendsMsgMapper;
import com.hxsg.core.po.RoleFriendsMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by dlf on 2016/1/27.
 */
@Service("ServiceDao")
public class ServiceDaoImpl implements ServiceDao {

    @Autowired
    RoleFriendsMsgMapper roleFriendsMsgMapper;
    @Override
    public int getRoleFriendsMsg(RoleFriendsMsg rg) {

        return roleFriendsMsgMapper.insertSelective(rg);
    }
}
