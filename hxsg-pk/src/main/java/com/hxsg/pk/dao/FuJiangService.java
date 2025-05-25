package com.hxsg.pk.dao;



import com.hxsg.core.CommonUtil.CommonException;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * Created by dlf on 2017/11/14 0014.
 * Email 1429264916@qq.com
 */
public interface FuJiangService {
    /**
     * 获取角色副将
     * @param roleid
     * @param state
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> queryStateFujiang(String roleid,String state) throws CommonException;


}
