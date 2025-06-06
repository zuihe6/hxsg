package com.hxsg.core.systemdao.impl;

import com.google.gson.Gson;
import com.hxsg.core.CommonUtil.FinalMap;
import com.hxsg.core.redisService.RedisDaoService;
import com.hxsg.core.systemdao.SystemNotification;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    RedisDaoService redisdaoservice;
    @Override
    public String sendChatToWorld(String msg) throws Exception{
        return null;
    }
    @Override
    public void sendSystemMsg(Object msg) throws Exception {
            Map<String, Object> mp = (Map<String, Object>) redisdaoservice.get("hxsg:webscoket:session");
            Gson gn = new Gson();
            //广播---向所有在线聊天用户推送最新消息
            for (String key : mp.keySet()) {
                try {
                    WebSocketSession sn = (WebSocketSession) mp.get(key);
                    sn.sendMessage(new TextMessage(gn.toJson(msg)));
                } catch (Exception e) {
                    logger.error("推送消息异常:"+e.getMessage());
                }
            }
    }

    @Override
    public void sendSystemMsg(Object msg,String roleId){
        try{
           // Map<String, Object> mp = (Map<String, Object>) redisdaoservice.get("hxsg:webscoket:session");
            Map<String, Object> mp = FinalMap.PKROLESESSION;

            Gson gn = new Gson();
            //广播---向指定在线聊天用户推送最新消息
            if(mp.containsKey(roleId)){
                WebSocketSession sn = (WebSocketSession) mp.get(roleId);
                sn.sendMessage(new TextMessage(gn.toJson(msg)));
            }
        }catch (Exception e){
            logger.error("广播---向指定在线聊天用户推送最新消息异常:"+e.getMessage());
        }



    }


}
