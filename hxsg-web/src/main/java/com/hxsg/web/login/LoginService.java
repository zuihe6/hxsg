package com.hxsg.web.login;

import com.hxsg.core.po.Role;

import java.util.List;

/**
 * Created by dlf on 2016/1/1.
 */
public interface LoginService {
    List<Role> YzLogin(Role record);

}
