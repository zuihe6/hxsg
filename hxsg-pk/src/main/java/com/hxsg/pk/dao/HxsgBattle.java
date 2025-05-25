package com.hxsg.pk.dao;


import com.hxsg.pk.vo.AttackA;
import com.hxsg.pk.vo.PkRoleVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2017/4/25 0025.
 */
public interface HxsgBattle {
    AttackA skillAttack(PkRoleVo p1, List<PkRoleVo> p2Li, String skillName) throws Exception;
}
