package com.hxsg.web.notis.service;

import com.hxsg.core.po.SystemNotis;

import java.util.List;

/**系统公告推送
 * Created by dlf on 2016/10/14.
 */

public interface Cocos2dNotisService {
    /**
     * 系统公告推送
     */
    public String pushSystemNotis(SystemNotis sn) throws Exception;
    /**
     * 查看系统
     */
    public List<SystemNotis> querySystemNotis() throws Exception;

}
