package com.hxsg.web.yiguan.impl;

import com.hxsg.core.Dao.yaopingMapper;
import com.hxsg.web.yiguan.YaoPinService;
import com.hxsg.core.po.yaoping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dlf on 2016/1/4.
 */
@Service("YaoPinService")
public class YaoPinServiceImpl implements YaoPinService {
    @Autowired
    yaopingMapper ypm;
    @Override
    public List<yaoping> selectBySx(Integer sx) {
        return ypm.selectBySx(sx);
    }
}
