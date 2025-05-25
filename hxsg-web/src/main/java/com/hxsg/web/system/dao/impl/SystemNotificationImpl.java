package com.hxsg.web.system.dao.impl;

import com.google.gson.Gson;
import com.hxsg.web.CommonUtil.login.Constants;
import com.hxsg.web.system.dao.SystemNotification;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.util.Map;

/**
 * Created by dlf on 2016/10/14.
 */
@Service
public class SystemNotificationImpl implements SystemNotification {
    private Logger logger = Logger.getLogger(SystemNotificationImpl.class);

    @Override
    public String sendChatToWorld(String msg) throws Exception {
        return null;
    }

    @Override
    public void sendSystemMsg(Object msg) {
        Map<String, Object> mp = Constants.SESSION_NAME;
        Gson gn = new Gson();
        //广播---向所有在线聊天用户推送最新消息
        for (String key : mp.keySet()) {
            try {
                WebSocketSession sn = (WebSocketSession) mp.get(key);
                sn.sendMessage(new TextMessage(gn.toJson(msg)));
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("推送消息异常:" + e.getMessage());
            }
        }
    }

    @Override
    public void sendSystemMsg(Object msg, String roleId) {
        try {
            Map<String, Object> mp = Constants.SESSION_NAME;
            Gson gn = new Gson();
            //广播---向指定在线聊天用户推送最新消息
            if (mp.containsKey(roleId)) {
                WebSocketSession sn = (WebSocketSession) mp.get(roleId);
                sn.sendMessage(new TextMessage(gn.toJson(msg)));
            }
        } catch (Exception e) {
            logger.error("广播---向指定在线聊天用户推送最新消息异常:" + e.getMessage());
            e.printStackTrace();
        }


    }


}
