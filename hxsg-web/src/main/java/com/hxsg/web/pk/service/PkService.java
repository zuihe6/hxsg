package com.hxsg.web.pk.service;

/**
 * Created by dlf on 2016/12/28.
 */
public interface PkService {
    //推送战斗倒计时
    void pushTime(Integer roleId,Integer pkId) throws Exception;
}
