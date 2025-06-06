package hxsg.yiguan.impl;

import com.hxsg.Dao.yaopingMapper;
import com.hxsg.po.yaoping;
import com.hxsg.yiguan.YaoPinService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
