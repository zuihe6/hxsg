package com.hxsg.pk.websoket;



import com.hxsg.core.po.FuJiang;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2017/5/16 0016.
 */
public interface LoadGuaiService {
    List<FuJiang> queryGuaiData(String name) throws Exception;
    void pkTest() throws Exception;
}
