package com.hxsg.pk.websoket.impl;


import com.hxsg.core.Dao.FuJiangMapper;
import com.hxsg.core.Dao.YeGuaiQunMapper;
import com.hxsg.core.po.FuJiang;
import com.hxsg.core.po.YeGuaiQun;
import com.hxsg.pk.websoket.LoadGuaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/16 0016.
 */
@Service("LoadGuaiService")
public class LoadGuaiServiceImpl implements LoadGuaiService {

    @Autowired
    YeGuaiQunMapper yeguaiqunmapper;
    @Autowired
    FuJiangMapper fujiangmapper;

    @Override
    public List<FuJiang> queryGuaiData(String name) throws Exception {
        YeGuaiQun ygq = yeguaiqunmapper.selectByName(name);
        List<FuJiang> li = fujiangmapper.queryFuJiangByName(ygq.getGuai1(), ygq.getGuai2(), ygq.getGuai3(), ygq.getGuai4(), ygq.getGuai5(), ygq.getGuai6());
        return li;
    }

    @Override
    public void pkTest() throws Exception {

    }
}
