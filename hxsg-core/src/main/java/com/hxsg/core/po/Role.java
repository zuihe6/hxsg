package com.hxsg.core.po;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.persistence.Table;
import java.io.Serializable;
import java.util.List;

@TableName("role")
@Data
public class Role implements Serializable {
    private Integer id;

    private String name;

    private String password;

    private String supperpass;

    private String zhiye;

    private String chenghao;

    private Integer jingyan;

    private Integer sjxiaolv;

    private Integer tilizhi;

    private Integer jin;

    private Integer yin;

    private String tanwei;

    private String juzhudi;

    private String house;

    private String jiaopai;

    private Integer killsum;

    private String peiou;

    private Integer shuxing;

    private String fujiang;

    private String zuoji;

    private Integer qixue1;

    private Integer qixue2;

    private Integer jingli1;

    private Integer jingli2;

    private Integer gongji;

    private Integer sudu;

    private Integer fangyu;

    private Integer fuzhong1;

    private String touxiang;

    private Integer dengji;

    private Integer huilizhi;

    private String juesename;

    private String sex;

    private Integer status;
    private List<rolePass> rp;

}