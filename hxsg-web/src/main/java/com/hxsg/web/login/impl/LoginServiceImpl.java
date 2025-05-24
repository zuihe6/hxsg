package com.hxsg.web.login.impl;

import com.hxsg.core.Dao.RoleMapper;
import com.hxsg.web.login.LoginService;
import com.hxsg.core.po.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dlf on 2016/1/1.
 */
@Service("LoginService")
public class LoginServiceImpl implements LoginService{

    @Autowired
    RoleMapper rm;
    @Override
    public List<Role> YzLogin(Role record) {
        return rm.login(record);
    }
}
