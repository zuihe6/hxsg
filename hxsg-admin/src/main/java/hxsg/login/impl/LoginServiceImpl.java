package hxsg.login.impl;

import com.hxsg.login.LoginService;
import com.hxsg.po.Role;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by dlf on 2016/1/1.
 */
@Service("LoginService")
public class LoginServiceImpl implements LoginService{

    @Autowired
    com.hxsg.Dao.RoleMapper rm;
    @Override
    public List<Role> YzLogin(Role record) {
        return rm.login(record);
    }
}
