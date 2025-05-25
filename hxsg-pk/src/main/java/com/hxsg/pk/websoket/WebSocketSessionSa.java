package com.hxsg.pk.websoket;

import org.springframework.web.socket.WebSocketSession;

import java.io.Serializable;

/**
 * Created by dlf on 2018/1/15 0015.
 * Email 1429264916@qq.com
 */
public class WebSocketSessionSa implements  Serializable{
    private WebSocketSession websocketsession;

    public WebSocketSessionSa(WebSocketSession sw){
        this.websocketsession=sw;
    }

    public WebSocketSession getWebsocketsession() {
        return websocketsession;
    }

    public void setWebsocketsession(WebSocketSession websocketsession) {
        this.websocketsession = websocketsession;
    }
}
