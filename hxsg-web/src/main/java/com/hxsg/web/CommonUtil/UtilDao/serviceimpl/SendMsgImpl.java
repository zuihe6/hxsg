package com.hxsg.web.CommonUtil.UtilDao.serviceimpl;

import com.hxsg.core.Dao.RoleFriendsMsgMapper;
import com.hxsg.core.Dao.RoleMapper;
import com.hxsg.core.Dao.RoleMessageMapper;
import com.hxsg.core.po.RoleFriendsMsg;
import com.hxsg.core.po.roleMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by dlf on 2016/3/15.
 */
@Service("SendMsg")
public class SendMsgImpl{
    @Autowired
    RoleMessageMapper rmm;
    @Autowired
    RoleFriendsMsgMapper rfmm;
    @Autowired
    RoleMapper rm;


    public void sendMsgAll(Integer Roleid, Integer Friendid, String msg,String type) {
        RoleFriendsMsg rg = new RoleFriendsMsg();
        rg.setRoleid(Roleid);
        rg.setFriendid(Friendid);
        rg.setMessage(msg);
        rg.setData(new Date());
        rg.setType(type);
        rfmm.insertSelective(rg);


    }


    public void sendMsg( Integer roleid,String rolename,String type,String mseeage)  {


        roleMessage  rme=new roleMessage();
        rme.setData(new Date());
        rme.setRoleid(roleid);
        rme.setRolename(rolename);
        rme.setType(type);
        rme.setMessage(mseeage);
        rmm.insertSelective(rme);
    }
}
