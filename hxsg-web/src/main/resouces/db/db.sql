CREATE TABLE `acount`
(
    `id`         INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`       VARCHAR(50)  NOT NULL COMMENT '用户名',
    `password`   VARCHAR(100) NOT NULL COMMENT '密码',
    `supperpass` VARCHAR(100) DEFAULT NULL COMMENT '超级密码',
    `telPhone`   VARCHAR(20)  DEFAULT NULL COMMENT '电话号码',
    `status`     VARCHAR(20)  DEFAULT 'active' COMMENT '账户状态',
    `email`      VARCHAR(100) DEFAULT NULL COMMENT '电子邮箱',
    `lock`       VARCHAR(10)  DEFAULT '0' COMMENT '锁定状态（0未锁定/1锁定）',
    `LoginTime`  TIMESTAMP NULL DEFAULT NULL COMMENT '最后登录时间',
    `custom1`    VARCHAR(255) DEFAULT NULL COMMENT '自定义字段1',
    `custom2`    VARCHAR(255) DEFAULT NULL COMMENT '自定义字段2',
    `custom3`    VARCHAR(255) DEFAULT NULL COMMENT '自定义字段3',
    `custom4`    VARCHAR(255) DEFAULT NULL COMMENT '自定义字段4',
    `custom5`    VARCHAR(255) DEFAULT NULL COMMENT '自定义字段5',
    `roleId`     INT(11) DEFAULT NULL COMMENT '角色ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `idx_name` (`name`),
    KEY          `idx_role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户账户表';

CREATE TABLE `baoshi`
(
    `id`        INT(11) NOT NULL AUTO_INCREMENT COMMENT '宝石ID',
    `name`      VARCHAR(50) NOT NULL COMMENT '宝石名称',
    `xiaoGuo`   INT(11) DEFAULT 0 COMMENT '效果数值',
    `kangXing`  VARCHAR(50)  DEFAULT NULL COMMENT '抗性类型',
    `data`      TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建/更新时间',
    `status`    VARCHAR(20)  DEFAULT 'active' COMMENT '状态（active/inactive）',
    `miaoShuId` VARCHAR(100) DEFAULT NULL COMMENT '描述ID（关联描述表）',
    `zbType`    VARCHAR(30)  DEFAULT NULL COMMENT '装备类型（武器/防具等）',
    `img`       VARCHAR(255) DEFAULT NULL COMMENT '图片资源路径',
    `roleId`    INT(11) DEFAULT NULL COMMENT '所属角色ID',
    `wqId`      INT(11) DEFAULT NULL COMMENT '关联武器ID',
    `sell`      INT(11) DEFAULT 0 COMMENT '出售价格（铜钱）',
    PRIMARY KEY (`id`),
    KEY         `idx_role` (`roleId`),
    KEY         `idx_weapon` (`wqId`),
    KEY         `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宝石属性表';

CREATE TABLE `chi_bi`
(
    `id`     INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `num`    INT          DEFAULT NULL COMMENT '数字字段',
    `resut`  VARCHAR(255) DEFAULT NULL COMMENT '结果字段(注意字段名拼写与resultMap一致)',
    `status` VARCHAR(50)  DEFAULT NULL COMMENT '状态字段',
    `time`   TIMESTAMP NULL DEFAULT NULL COMMENT '时间字段',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='赤壁表';


CREATE TABLE `chibi_yazhu_detail`
(
    `id`       INT         NOT NULL AUTO_INCREMENT COMMENT '押注记录ID',
    `roleid`   INT         NOT NULL COMMENT '玩家ID',
    `rolename` VARCHAR(30) NOT NULL COMMENT '玩家名称',
    `jin`      INT         DEFAULT 0 COMMENT '金币下注额(高级货币)',
    `yin`      INT         DEFAULT 0 COMMENT '银币下注额(普通货币)',
    `result`   VARCHAR(20) NOT NULL COMMENT '押注方(wei/wu/shu/ping)',
    `num`      INT         DEFAULT 1 COMMENT '下注倍数(1-50)',
    `status`   VARCHAR(20) DEFAULT 'pending' COMMENT '状态(pending/win/lose/refund)',
    `jieguo`   VARCHAR(20) COMMENT '实际战果',
    `data`     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '下注时间',
    PRIMARY KEY (`id`),
    INDEX      `idx_player_bet` (`roleid`, `status`),
    INDEX      `idx_bet_result` (`result`, `jieguo`),
    INDEX      `idx_time_audit` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='赤壁之战活动押注记录表(2025年5月22日建表)';

CREATE TABLE `fj_level_jy`
(
    `id`        INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `level`     INT         DEFAULT NULL COMMENT '等级',
    `yingcai`   INT         DEFAULT NULL COMMENT '英才',
    `jiangcai`  INT         DEFAULT NULL COMMENT '将才',
    `yuanshuai` INT         DEFAULT NULL COMMENT '元帅',
    `status`    INT         DEFAULT NULL COMMENT '状态',
    `type`      VARCHAR(50) DEFAULT NULL COMMENT '类型',
    `data`      TIMESTAMP NULL DEFAULT NULL COMMENT '时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='武将等级经验表';


CREATE TABLE `gjsg_map`
(
    `id`          INT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `center_city` VARCHAR(100) DEFAULT NULL COMMENT '中心城市',
    `n_city`      VARCHAR(100) DEFAULT NULL COMMENT '北部城市',
    `s_city`      VARCHAR(100) DEFAULT NULL COMMENT '南部城市',
    `w_city`      VARCHAR(100) DEFAULT NULL COMMENT '西部城市',
    `e_city`      VARCHAR(100) DEFAULT NULL COMMENT '东部城市',
    `quYu`        VARCHAR(100) DEFAULT NULL COMMENT '区域',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='国战地图表';

CREATE TABLE `gold_business`
(
    `id`       INT         NOT NULL AUTO_INCREMENT COMMENT '交易记录ID',
    `roleId`   INT         NOT NULL COMMENT '角色ID',
    `roleName` VARCHAR(50) NOT NULL COMMENT '角色名称',
    `num`      INT         NOT NULL COMMENT '交易数量',
    `price`    INT         NOT NULL COMMENT '交易单价',
    `date`     TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
    `status`   VARCHAR(20) NOT NULL COMMENT '交易状态(如:已完成/待处理/已取消)',
    `type`     VARCHAR(20) NOT NULL COMMENT '交易类型(如:买入/卖出)',
    PRIMARY KEY (`id`),
    INDEX      `idx_roleId` (`roleId`),
    INDEX      `idx_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='金币交易记录表';


CREATE TABLE `gold_record`
(
    `id`           INT         NOT NULL AUTO_INCREMENT COMMENT '交易记录ID',
    `sellRoleId`   INT         NOT NULL COMMENT '卖方角色ID',
    `sellRoleName` VARCHAR(50) NOT NULL COMMENT '卖方角色名称',
    `sellNum`      INT         NOT NULL COMMENT '出售数量',
    `buyRoleId`    INT         NOT NULL COMMENT '买方角色ID',
    `buyRoleName`  VARCHAR(50) NOT NULL COMMENT '买方角色名称',
    `date`         TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间(默认当前时间)',
    `status`       VARCHAR(20) NOT NULL COMMENT '交易状态(如:已完成/待支付/已取消)',
    `type`         VARCHAR(20) NOT NULL COMMENT '交易类型(如:金币/银币/道具)',
    PRIMARY KEY (`id`),
    INDEX          `idx_sellRoleId` (`sellRoleId`),
    INDEX          `idx_buyRoleId` (`buyRoleId`),
    INDEX          `idx_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='金币交易记录表(2025年5月22日建表)';


CREATE TABLE `jiangjun`
(
    `id`     INT         NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `roleid` INT         NOT NULL COMMENT '关联角色ID',
    `jjname` VARCHAR(50) NOT NULL COMMENT '将军名称',
    `num`    INT         DEFAULT 0 COMMENT '数量/等级',
    `type`   VARCHAR(20) NOT NULL COMMENT '类型(如:兵种/品质)',
    `status` VARCHAR(20) DEFAULT 'active' COMMENT '状态(active/inactive)',
    `data`   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
    PRIMARY KEY (`id`),
    INDEX    `idx_role` (`roleid`),
    INDEX    `idx_type_status` (`type`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='玩家将领系统数据表(2025年5月22日建表)';


CREATE TABLE `map_guai`
(
    `id`      INT         NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `city`    VARCHAR(50) NOT NULL COMMENT '关联城市名称',
    `guaiId1` VARCHAR(50) DEFAULT NULL COMMENT '怪物1的ID或标识',
    `guaiId2` VARCHAR(50) DEFAULT NULL COMMENT '怪物2的ID或标识',
    `guaiId3` VARCHAR(50) DEFAULT NULL COMMENT '怪物3的ID或标识',
    `guaiId4` VARCHAR(50) DEFAULT NULL COMMENT '怪物4的ID或标识',
    `status`  VARCHAR(20) DEFAULT 'active' COMMENT '状态(active/inactive/maintenance)',
    `level`   VARCHAR(20) DEFAULT 'normal' COMMENT '难度等级(normal/hard/hell)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_city` (`city`),
    INDEX     `idx_status_level` (`status`, `level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图怪物分布表(2025年5月22日建表)';

CREATE TABLE `money_record`
(
    `id`     INT          NOT NULL AUTO_INCREMENT COMMENT '记录ID',
    `date`   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间(默认当前时间)',
    `msg`    VARCHAR(255) NOT NULL COMMENT '交易描述',
    `status` VARCHAR(20)  NOT NULL DEFAULT 'pending' COMMENT '状态(pending/completed/failed)',
    `roleId` INT          NOT NULL COMMENT '关联角色ID',
    `type`   VARCHAR(30)  NOT NULL COMMENT '交易类型(deposit/withdraw/transfer)',
    PRIMARY KEY (`id`),
    INDEX    `idx_role_date` (`roleId`, `date`),
    INDEX    `idx_type_status` (`type`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='货币交易流水表(2025年5月22日建表)';

CREATE TABLE `new_role`
(
    `id`             INT         NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `account`        VARCHAR(50) NOT NULL COMMENT '关联账号',
    `roleName`       VARCHAR(30) NOT NULL COMMENT '角色名称',
    `status`         VARCHAR(20) DEFAULT 'normal' COMMENT '状态(normal/frozen/deleted)',
    `level`          INT         DEFAULT 1 COMMENT '当前等级',
    `jingYan`        INT         DEFAULT 0 COMMENT '当前经验值',
    `shengJiJingYan` INT         DEFAULT 0 COMMENT '升级所需经验',
    `sumds`          INT         DEFAULT 0 COMMENT '总属性点数',
    `keYongDs`       INT         DEFAULT 0 COMMENT '可用属性点',
    `totalJy`        INT         DEFAULT 0 COMMENT '累计获得经验',
    `qiXueDs`        INT         DEFAULT 0 COMMENT '气血加点',
    `jingLiDs`       INT         DEFAULT 0 COMMENT '精力加点',
    `gongJiDs`       INT         DEFAULT 0 COMMENT '攻击加点',
    `suDuDs`         INT         DEFAULT 0 COMMENT '速度加点',
    `totalXue1`      INT         DEFAULT 100 COMMENT '基础气血值',
    `totalXue2`      INT         DEFAULT 100 COMMENT '当前气血值',
    `totalJing1`     INT         DEFAULT 50 COMMENT '基础精力值',
    `totalJing2`     INT         DEFAULT 50 COMMENT '当前精力值',
    `totalGong`      INT         DEFAULT 10 COMMENT '总攻击力',
    `totalSuDu`      INT         DEFAULT 10 COMMENT '总速度值',
    `CreateData`     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `zhiye`          VARCHAR(20) COMMENT '职业(如:战士/法师)',
    `chengHao`       VARCHAR(30) COMMENT '称号',
    `shengJiXiaoLv`  INT         DEFAULT 100 COMMENT '升级效率百分比',
    `tiLiZhi`        INT         DEFAULT 100 COMMENT '体力值',
    `jin`            INT         DEFAULT 0 COMMENT '金币数量',
    `yin`            INT         DEFAULT 0 COMMENT '银币数量',
    `sex`            VARCHAR(10) DEFAULT 'male' COMMENT '性别(male/female)',
    `img`            VARCHAR(255) COMMENT '角色头像路径',
    `zuoBiao`        VARCHAR(20) COMMENT '地图坐标(x,y)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_account_role` (`account`, `roleName`),
    INDEX            `idx_level` (`level`),
    INDEX            `idx_status` (`status`),
    INDEX            `idx_zhiye` (`zhiye`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游戏角色基础数据表(2025年5月22日建表)';

CREATE TABLE `role_friends`
(
    `id`         INT         NOT NULL AUTO_INCREMENT COMMENT '关系记录ID',
    `roleid`     INT         NOT NULL COMMENT '角色ID',
    `friendid`   INT         NOT NULL COMMENT '好友角色ID',
    `data`       TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立时间',
    `lahei`      VARCHAR(5)           DEFAULT 'no' COMMENT '是否拉黑(yes/no)',
    `status`     VARCHAR(20)          DEFAULT 'active' COMMENT '状态(active/delete)',
    `type`       VARCHAR(20) NOT NULL COMMENT '关系类型(friend/blacklist/teammate)',
    `rolename`   VARCHAR(30) NOT NULL COMMENT '角色名称',
    `friendname` VARCHAR(30) NOT NULL COMMENT '好友名称',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_friend` (`roleid`, `friendid`),
    INDEX        `idx_role_status` (`roleid`, `status`),
    INDEX        `idx_friend` (`friendid`),
    INDEX        `idx_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色好友关系表(2025年5月22日建表)';

CREATE TABLE `role_friends_msg`
(
    `id`         INT           NOT NULL AUTO_INCREMENT COMMENT '消息ID',
    `roleid`     INT           NOT NULL COMMENT '发送者角色ID',
    `friendid`   INT           NOT NULL COMMENT '接收者角色ID',
    `message`    VARCHAR(1000) NOT NULL COMMENT '消息内容(支持富文本)',
    `data`       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
    `type`       VARCHAR(20)   NOT NULL COMMENT '消息类型(text/image/system/gift)',
    `status`     VARCHAR(20)            DEFAULT 'unread' COMMENT '状态(unread/read/deleted)',
    `rolename`   VARCHAR(30)   NOT NULL COMMENT '发送者名称',
    `friendname` VARCHAR(30)   NOT NULL COMMENT '接收者名称',
    PRIMARY KEY (`id`),
    INDEX        `idx_communication` (`roleid`, `friendid`, `data`),
    INDEX        `idx_receiver_status` (`friendid`, `status`),
    INDEX        `idx_type_data` (`type`, `data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色好友消息记录表(2025年5月22日建表)';

CREATE TABLE `role_fujiang`
(
    `id`           INT         NOT NULL AUTO_INCREMENT COMMENT '副将唯一ID',
    `roleid`       INT         NOT NULL COMMENT '所属角色ID',
    `fuid`         INT         NOT NULL COMMENT '副将模板ID',
    `chengzhang`   FLOAT       DEFAULT 1.0 COMMENT '成长系数(影响属性成长)',
    `chuxue`       INT         DEFAULT 100 COMMENT '初始气血',
    `chusu`        INT         DEFAULT 10 COMMENT '初始速度',
    `chufang`      INT         DEFAULT 5 COMMENT '初始防御',
    `chugong`      INT         DEFAULT 15 COMMENT '初始攻击',
    `touxiang`     VARCHAR(255) COMMENT '头像资源路径',
    `touxian`      VARCHAR(50) COMMENT '头衔称号',
    `fujiangname`  VARCHAR(30) NOT NULL COMMENT '副将名称',
    `sex`          VARCHAR(10) DEFAULT 'male' COMMENT '性别(male/female)',
    `status`       VARCHAR(20) DEFAULT 'normal' COMMENT '状态(normal/fighting/resting)',
    `chujing`      INT         DEFAULT 0 COMMENT '出战场景ID',
    `shuxing`      INT         DEFAULT 0 COMMENT '属性品质(1-5星)',
    `leve`         INT         DEFAULT 1 COMMENT '当前等级',
    `jingyan`      INT         DEFAULT 0 COMMENT '当前经验值',
    `sjJinYan`     INT         DEFAULT 100 COMMENT '升级所需经验',
    `sumds`        INT         DEFAULT 0 COMMENT '总属性点',
    `keyongds`     INT         DEFAULT 0 COMMENT '可用属性点',
    `totajy`       INT         DEFAULT 0 COMMENT '累计获得经验',
    `jyid`         INT COMMENT '经验池ID',
    `qixueds`      INT         DEFAULT 0 COMMENT '气血加点',
    `jinglids`     INT         DEFAULT 0 COMMENT '精力加点',
    `gongjids`     INT         DEFAULT 0 COMMENT '攻击加点',
    `sududs`       INT         DEFAULT 0 COMMENT '速度加点',
    `totalxue1`    INT         DEFAULT 100 COMMENT '最大气血值',
    `totalxue2`    INT         DEFAULT 100 COMMENT '当前气血值',
    `totaljing1`   INT         DEFAULT 50 COMMENT '最大精力值',
    `totaljing2`   INT         DEFAULT 50 COMMENT '当前精力值',
    `totalgong`    INT         DEFAULT 15 COMMENT '总攻击力',
    `totalsudu`    INT         DEFAULT 10 COMMENT '总速度值',
    `zbid1`        INT COMMENT '装备位1ID',
    `zbid2`        INT COMMENT '装备位2ID',
    `zbid3`        INT COMMENT '装备位3ID',
    `kangxingid`   INT COMMENT '抗性模板ID',
    `jinengid1`    INT COMMENT '技能位1ID',
    `jinengid2`    INT COMMENT '技能位2ID',
    `jinengid3`    INT COMMENT '技能位3ID',
    `moqiduid`     INT COMMENT '默契度ID',
    `zhongchengdu` INT         DEFAULT 60 COMMENT '忠诚度(0-100)',
    `zhen`         VARCHAR(20) COMMENT '所属阵型位置',
    `zhuansheng`   INT         DEFAULT 0 COMMENT '转生次数',
    `sell`         VARCHAR(5)  DEFAULT 'no' COMMENT '是否可交易(yes/no)',
    `date`         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
    `zhiye`        VARCHAR(20) COMMENT '副将职业',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_fujiang` (`roleid`, `fuid`),
    INDEX          `idx_role_status` (`roleid`, `status`),
    INDEX          `idx_level` (`leve`),
    INDEX          `idx_shuxing` (`shuxing`),
    INDEX          `idx_zhen` (`zhen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色副将系统数据表(2025年5月22日建表)';


CREATE TABLE `role`
(
    `id`         INT         NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `name`       VARCHAR(30) NOT NULL COMMENT '账号名称',
    `password`   VARCHAR(64) NOT NULL COMMENT '登录密码(SHA256加密)',
    `supperpass` VARCHAR(64) COMMENT '二级密码',
    `zhiye`      VARCHAR(20)  DEFAULT 'warrior' COMMENT '职业(warrior/mage/archer)',
    `chenghao`   VARCHAR(30) COMMENT '称号',
    `jingyan`    INT          DEFAULT 0 COMMENT '当前经验值',
    `sjxiaolv`   INT          DEFAULT 100 COMMENT '升级效率百分比',
    `tilizhi`    INT          DEFAULT 100 COMMENT '体力值(0-100)',
    `jin`        INT          DEFAULT 0 COMMENT '金币',
    `yin`        INT          DEFAULT 0 COMMENT '银币',
    `tanwei`     VARCHAR(50) COMMENT '摊位信息',
    `juzhudi`    VARCHAR(50)  DEFAULT '新手村' COMMENT '居住地',
    `house`      VARCHAR(50) COMMENT '房产信息',
    `jiaopai`    VARCHAR(100) COMMENT '交友宣言',
    `killsum`    INT          DEFAULT 0 COMMENT '总击杀数',
    `peiou`      VARCHAR(30) COMMENT '配偶名称',
    `shuxing`    INT          DEFAULT 1 COMMENT '属性品质(1-5星)',
    `fujiang`    VARCHAR(500) COMMENT '副将JSON数据',
    `zuoji`      VARCHAR(100) COMMENT '坐骑信息',
    `qixue1`     INT          DEFAULT 100 COMMENT '最大气血',
    `qixue2`     INT          DEFAULT 100 COMMENT '当前气血',
    `jingli1`    INT          DEFAULT 50 COMMENT '最大精力',
    `jingli2`    INT          DEFAULT 50 COMMENT '当前精力',
    `gongji`     INT          DEFAULT 10 COMMENT '攻击力',
    `sudu`       INT          DEFAULT 10 COMMENT '速度',
    `fangyu`     INT          DEFAULT 5 COMMENT '防御力',
    `fuzhong1`   INT          DEFAULT 0 COMMENT '负重值',
    `touxiang`   VARCHAR(255) DEFAULT 'default.jpg' COMMENT '头像路径',
    `dengji`     INT          DEFAULT 1 COMMENT '等级',
    `huilizhi`   INT          DEFAULT 0 COMMENT '会理值(社交货币)',
    `juesename`  VARCHAR(30) NOT NULL COMMENT '角色显示名称',
    `sex`        VARCHAR(10)  DEFAULT 'male' COMMENT '性别(male/female)',
    `status`     INT          DEFAULT 1 COMMENT '状态(0=冻结,1=正常,2=禁言)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_name` (`name`),
    INDEX        `idx_level` (`dengji`),
    INDEX        `idx_profession` (`zhiye`),
    INDEX        `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游戏角色主表(2025年5月22日建表)';

CREATE TABLE `role_message`
(
    `id`       INT           NOT NULL AUTO_INCREMENT COMMENT '消息ID',
    `roleid`   INT           NOT NULL COMMENT '关联角色ID',
    `rolename` VARCHAR(30)   NOT NULL COMMENT '角色名称',
    `message`  VARCHAR(1000) NOT NULL COMMENT '消息内容(支持富文本)',
    `type`     VARCHAR(20)   NOT NULL COMMENT '消息类型(system/private/world/guild)',
    `data`     TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
    PRIMARY KEY (`id`),
    INDEX      `idx_role_time` (`roleid`, `data`),
    INDEX      `idx_type_time` (`type`, `data`),
    INDEX      `idx_fulltext_msg` (`message`(255)) COMMENT '全文索引前缀'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色消息记录表(2025年5月22日建表)';

CREATE TABLE `role_money`
(
    `id`      INT          NOT NULL AUTO_INCREMENT COMMENT '资金记录ID',
    `roleid`  INT          NOT NULL COMMENT '关联角色ID',
    `jin`     INT          NOT NULL DEFAULT 0 COMMENT '金币变动值(支持正负)',
    `yin`     INT          NOT NULL DEFAULT 0 COMMENT '银币变动值(支持正负)',
    `message` VARCHAR(255) NOT NULL COMMENT '资金变动说明',
    `date`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
    PRIMARY KEY (`id`),
    INDEX     `idx_role_finance` (`roleid`, `date`),
    INDEX     `idx_currency_flow` (`jin`, `yin`, `date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色资金流水表(2025年5月22日建表)';



CREATE TABLE `role_new_shu_xing`
(
    `id`            INT       NOT NULL AUTO_INCREMENT COMMENT '属性记录ID',
    `roleId`        INT       NOT NULL COMMENT '关联角色ID',
    `kangXingTotal` INT                DEFAULT 0 COMMENT '抗性总值(0-1000)',
    `kangXing`      VARCHAR(500) COMMENT '抗性分布(JSON格式:{"fire":50,"ice":30})',
    `date`          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
    `status`        VARCHAR(20)        DEFAULT 'active' COMMENT '状态(active/inactive/locked)',
    `custom1`       VARCHAR(100) COMMENT '自定义属性1(预留扩展)',
    `custom2`       VARCHAR(100) COMMENT '自定义属性2(预留扩展)',
    `custom3`       VARCHAR(100) COMMENT '自定义属性3(预留扩展)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role` (`roleId`),
    INDEX           `idx_kangxing` (`kangXingTotal`),
    INDEX           `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色新属性系统表(2025年5月22日建表)';


CREATE TABLE `role_new_zhuang_bei`
(
    `id`        INT         NOT NULL AUTO_INCREMENT COMMENT '装备实例ID',
    `roleId`    INT         NOT NULL COMMENT '所属角色ID',
    `wqId`      INT         NOT NULL COMMENT '武器模板ID',
    `name`      VARCHAR(50) NOT NULL COMMENT '装备名称',
    `wqXiaoGuo` INT         DEFAULT 0 COMMENT '武器效果值(攻击/防御等)',
    `status`    VARCHAR(20) DEFAULT 'equipped' COMMENT '状态(equipped/stored/sold)',
    `type`      VARCHAR(30) NOT NULL COMMENT '装备类型(weapon/armor/accessory)',
    `date`      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
    `baoShi1`   INT COMMENT '宝石槽位1ID',
    `baoShi2`   INT COMMENT '宝石槽位2ID',
    `baoShi3`   INT COMMENT '宝石槽位3ID',
    `zb`        INT         DEFAULT 0 COMMENT '装备评分',
    `kangXing`  VARCHAR(200) COMMENT '抗性属性(JSON格式:{"fire":10,"ice":5})',
    PRIMARY KEY (`id`),
    INDEX       `idx_role_equip` (`roleId`, `status`),
    INDEX       `idx_type_score` (`type`, `zb`),
    INDEX       `idx_weapon_effect` (`wqXiaoGuo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色新装备系统表(2025年5月22日建表)';

CREATE TABLE `role_pass`
(
    `id`         INT         NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `name`       VARCHAR(30) NOT NULL COMMENT '账号名称',
    `password`   VARCHAR(64) NOT NULL COMMENT '登录密码(建议SHA256加密存储)',
    `supperpass` VARCHAR(64) COMMENT '二级密码(敏感操作验证)',
    `email`      VARCHAR(50) COMMENT '绑定邮箱',
    `phone`      VARCHAR(20) COMMENT '绑定手机号',
    `mibao`      VARCHAR(50) COMMENT '密保问题',
    `answer`     VARCHAR(100) COMMENT '密保答案(建议加密存储)',
    `roleid`     INT         NOT NULL COMMENT '关联角色ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_name` (`name`),
    UNIQUE KEY `uk_role` (`roleid`),
    INDEX        `idx_contact` (`email`, `phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游戏账号安全表(2025年5月22日建表)';

CREATE TABLE `role_shuxing`
(
    `id`        INT NOT NULL AUTO_INCREMENT COMMENT '属性ID',
    `roleid`    INT NOT NULL COMMENT '角色ID',
    `mingzhong` INT DEFAULT 0 COMMENT '命中率(0-100)',
    `baoji`     INT DEFAULT 0 COMMENT '暴击率(0-100)',
    `fanji`     INT DEFAULT 0 COMMENT '反击率(0-100)',
    `zhiming`   INT DEFAULT 0 COMMENT '致命一击率(0-100)',
    `fabao`     INT DEFAULT 0 COMMENT '法宝触发率(0-100)',
    `fanzhen`   INT DEFAULT 0 COMMENT '反震率(0-100)',
    `duobi`     INT DEFAULT 0 COMMENT '躲避率(0-100)',


    `kwuli`     INT DEFAULT 0 COMMENT '物理抗性',
    `kxuanji`   INT DEFAULT 0 COMMENT '眩晕抗性',
    `kweikun`   INT DEFAULT 0 COMMENT '围困抗性',
    `kraoluan`  INT DEFAULT 0 COMMENT '扰乱抗性',
    `kfengsuo`  INT DEFAULT 0 COMMENT '封印抗性',
    `kfengsha`  INT DEFAULT 0 COMMENT '风沙抗性',
    `kyaohuo`   INT DEFAULT 0 COMMENT '妖火抗性',
    `kluolei`   INT DEFAULT 0 COMMENT '落雷抗性',
    `kdushu`    INT DEFAULT 0 COMMENT '毒素抗性',

    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role` (`roleid`),
    INDEX       `idx_combat` (`mingzhong`, `baoji`, `fanji`),
    INDEX       `idx_resist` (`kwuli`, `kxuanji`, `kfengsuo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色战斗属性表(2025年5月22日建表)';


CREATE TABLE `role_vip`
(
    `id`       INT NOT NULL AUTO_INCREMENT COMMENT 'VIP记录ID',
    `roleid`   INT NOT NULL COMMENT '角色ID',
    `level`    INT         DEFAULT 0 COMMENT 'VIP等级(0-12)',
    `data`     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '最后续费时间',
    `money`    INT         DEFAULT 0 COMMENT '累计充值金额(单位:元)',
    `status`   VARCHAR(20) DEFAULT 'active' COMMENT '状态(active/expired/frozen)',
    `supervip` VARCHAR(5)  DEFAULT 'no' COMMENT '是否超级VIP(yes/no)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role` (`roleid`),
    INDEX      `idx_level_status` (`level`, `status`),
    INDEX      `idx_money` (`money`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色VIP特权表(2025年5月22日建表)';


CREATE TABLE `role_wu_pin`
(
    `id`      INT         NOT NULL AUTO_INCREMENT COMMENT '物品实例ID',
    `roleid`  INT         NOT NULL COMMENT '所属角色ID',
    `name`    VARCHAR(50) NOT NULL COMMENT '物品名称',
    `num`     INT         DEFAULT 1 COMMENT '物品数量',
    `type1`   VARCHAR(30) NOT NULL COMMENT '主类型(weapon/armor/potion)',
    `type2`   VARCHAR(30) COMMENT '子类型(sword/bow/hp_potion)',
    `status`  VARCHAR(20) DEFAULT 'normal' COMMENT '状态(normal/locked/expired)',
    `wupinId` INT         NOT NULL COMMENT '物品模板ID',
    `custom1` VARCHAR(100) COMMENT '自定义属性1(强化等级)',
    `custom2` VARCHAR(100) COMMENT '自定义属性2(耐久度)',
    `custom3` VARCHAR(100) COMMENT '自定义属性3(附加效果)',
    `custom4` VARCHAR(100) COMMENT '自定义属性4(获取途径)',
    `custom5` VARCHAR(100) COMMENT '自定义属性5(有效期)',
    `sell`    INT         DEFAULT 0 COMMENT '出售价格(铜币)',
    PRIMARY KEY (`id`),
    INDEX     `idx_role_item` (`roleid`, `type1`),
    INDEX     `idx_template` (`wupinId`),
    INDEX     `idx_status` (`status`),
    INDEX     `idx_sell` (`sell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色物品背包表(2025年5月22日建表)';



CREATE TABLE `role_yao`
(
    `id`      INT         NOT NULL AUTO_INCREMENT COMMENT '药品记录ID',
    `roleid`  INT         NOT NULL COMMENT '所属角色ID',
    `yaoid`   INT         NOT NULL COMMENT '药品模板ID',
    `yaonum`  INT DEFAULT 1 COMMENT '药品数量(可堆叠)',
    `yaoname` VARCHAR(50) NOT NULL COMMENT '药品名称',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_yao` (`roleid`, `yaoid`),
    INDEX     `idx_yaoname` (`yaoname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色药品背包表(2025年5月22日建表)';


CREATE TABLE `role_zb_detail`
(
    `id`     INT NOT NULL AUTO_INCREMENT COMMENT '装备配置ID',
    `roleid` INT NOT NULL COMMENT '角色ID',
    `toukui` INT COMMENT '头盔装备ID',
    `wuqi`   INT COMMENT '武器装备ID',
    `huwan`  INT COMMENT '护腕装备ID',
    `xiezi`  INT COMMENT '鞋子装备ID',
    `xl`     INT COMMENT '项链装备ID',
    `yifu`   INT COMMENT '衣服装备ID',
    `status` INT DEFAULT 1 COMMENT '装备方案状态(0=备用,1=当前使用)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_status` (`roleid`, `status`),
    INDEX    `idx_equipment` (`toukui`, `wuqi`, `yifu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色装备详情表(2025年5月22日建表)';

CREATE TABLE `role_zb`
(
    `id`      INT         NOT NULL AUTO_INCREMENT COMMENT '装备实例ID',
    `roleid`  INT         NOT NULL COMMENT '所属角色ID',
    `wqid`    INT         NOT NULL COMMENT '武器模板ID',
    `name`    VARCHAR(50) NOT NULL COMMENT '装备名称',
    `xiaoguo` INT DEFAULT 0 COMMENT '装备效果值(攻击/防御等)',
    PRIMARY KEY (`id`),
    INDEX     `idx_role_weapon` (`roleid`, `wqid`),
    INDEX     `idx_effect` (`xiaoguo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色装备基础表(2025年5月22日建表)';


CREATE TABLE `role_zhuangbei_ms`
(
    `id`        INT         NOT NULL AUTO_INCREMENT COMMENT '装备实例ID',
    `roleId`    INT         NOT NULL COMMENT '所属角色ID',
    `wqId`      INT         NOT NULL COMMENT '武器模板ID',
    `name`      VARCHAR(50) NOT NULL COMMENT '装备名称',
    `wqXiaoGuo` INT          DEFAULT 0 COMMENT '基础效果值',
    `status`    VARCHAR(20)  DEFAULT 'equipped' COMMENT '状态(equipped/stored/sold)',
    `type`      VARCHAR(30) NOT NULL COMMENT '装备类型(weapon/armor/accessory)',
    `date`      TIMESTAMP    DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
    `baoShi1`   INT COMMENT '宝石槽位1ID',
    `baoShi2`   INT COMMENT '宝石槽位2ID',
    `baoShi3`   INT COMMENT '宝石槽位3ID',
    `level`     INT          DEFAULT 1 COMMENT '强化等级',
    `miaoShu`   VARCHAR(255) COMMENT '装备描述',
    `xiaoGuo`   INT          DEFAULT 0 COMMENT '实际效果值(含强化加成)',
    `powerNum`  INT          DEFAULT 0 COMMENT '战力评分',
    `wuQiName`  VARCHAR(50) COMMENT '武器类型名称',
    `roleLevel` INT          DEFAULT 1 COMMENT '装备需求等级',
    `wuqiType`  VARCHAR(30) COMMENT '武器细分类型(sword/bow/staff)',
    `imgUrl`    VARCHAR(255) DEFAULT 'default.png' COMMENT '图标路径',
    `kangXing`  VARCHAR(200) COMMENT '抗性属性(JSON格式)',
    PRIMARY KEY (`id`),
    INDEX       `idx_role_equip` (`roleId`, `status`),
    INDEX       `idx_power_level` (`powerNum`, `level`),
    INDEX       `idx_equip_type` (`type`, `wuqiType`),
    FULLTEXT    INDEX `ft_desc` (`miaoShu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色装备详情表(2025年5月22日建表)';


CREATE TABLE `skill_describe`
(
    `id`        INT          NOT NULL AUTO_INCREMENT COMMENT '技能ID',
    `name`      VARCHAR(50)  NOT NULL COMMENT '技能名称',
    `decccribe` VARCHAR(500) NOT NULL COMMENT '技能描述(含效果公式)',
    `zhiye`     VARCHAR(30) COMMENT '职业限制(warrior/mage等)',
    `xingBie`   VARCHAR(10) DEFAULT 'all' COMMENT '性别限制(male/female/all)',
    `level`     VARCHAR(20)  NOT NULL COMMENT '技能等级要求(格式:1,15,30)',
    PRIMARY KEY (`id`),
    INDEX       `idx_profession` (`zhiye`),
    INDEX       `idx_level` (`level`),
    FULLTEXT    INDEX `ft_search` (`name`, `decccribe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='技能描述库表(2025年5月22日建表)';


CREATE TABLE `skill`
(
    `id`         INT         NOT NULL AUTO_INCREMENT COMMENT '技能实例ID',
    `shuLianDu`  INT         DEFAULT 0 COMMENT '熟练度(0-10000)',
    `skillName`  VARCHAR(50) NOT NULL COMMENT '技能名称',
    `level`      VARCHAR(20) NOT NULL COMMENT '当前等级(格式:1/10)',
    `rfId`       INT         NOT NULL COMMENT '关联角色ID',
    `date`       TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '最后使用时间',
    `describeId` INT         NOT NULL COMMENT '关联描述ID',
    `type`       INT         DEFAULT 1 COMMENT '技能类型(1=主动,2=被动)',
    `roleName`   VARCHAR(30) NOT NULL COMMENT '角色名称',
    `status`     VARCHAR(20) DEFAULT 'normal' COMMENT '状态(normal/locked/sealed)',
    `fuLevel`    INT         DEFAULT 0 COMMENT '附加等级(符文/强化加成)',
    `skillId`    INT         NOT NULL COMMENT '技能模板ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_role_skill` (`rfId`, `skillId`),
    INDEX        `idx_skill_type` (`type`, `status`),
    INDEX        `idx_skill_level` (`level`, `fuLevel`),
    INDEX        `idx_skill_use` (`date`, `shuLianDu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色技能表(2025年5月22日建表)';


CREATE TABLE `system_notis`
(
    `id`      INT           NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `msg`     VARCHAR(1000) NOT NULL COMMENT '公告内容(支持HTML富文本)',
    `data`    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
    `status`  VARCHAR(20)            DEFAULT 'published' COMMENT '状态(published/archived/deleted)',
    `custom1` VARCHAR(100) COMMENT '扩展字段1(跳转链接)',
    `custom2` VARCHAR(100) COMMENT '扩展字段2(优先级)',
    PRIMARY KEY (`id`),
    INDEX     `idx_status_time` (`status`, `data`),
    FULLTEXT  INDEX `ft_msg` (`msg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统公告表(2025年5月22日建表)';


CREATE TABLE `task_detail`
(
    `id`       INT         NOT NULL AUTO_INCREMENT COMMENT '任务记录ID',
    `roleId`   INT         NOT NULL COMMENT '关联角色ID',
    `guaiName` VARCHAR(50) NOT NULL COMMENT '关联怪物名称',
    `status`   VARCHAR(20)          DEFAULT 'accepted' COMMENT '状态(accepted/completed/failed)',
    `type`     VARCHAR(30) NOT NULL COMMENT '任务类型(kill/collect/delivery)',
    `data`     TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务接取时间',
    PRIMARY KEY (`id`),
    INDEX      `idx_role_task` (`roleId`, `status`),
    INDEX      `idx_type_time` (`type`, `data`),
    INDEX      `idx_monster` (`guaiName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色任务追踪表(2025年5月22日建表)';



CREATE TABLE `tax`
(
    `id`     INT         NOT NULL AUTO_INCREMENT COMMENT '税收记录ID',
    `name`   VARCHAR(50) NOT NULL COMMENT '税收项目名称',
    `tax` DOUBLE(10,2) NOT NULL DEFAULT 0.00 COMMENT '税率/税额(支持小数)',
    `type`   VARCHAR(30) NOT NULL COMMENT '税收类型(trade/property/income)',
    `status` VARCHAR(20) DEFAULT 'active' COMMENT '状态(active/inactive/archived)',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_tax_name` (`name`, `type`),
    INDEX    `idx_tax_type` (`type`, `status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游戏经济系统税收配置表(2025年5月22日建表)';


CREATE TABLE `wa_bao`
(
    `id`       INT         NOT NULL AUTO_INCREMENT COMMENT '挖宝记录ID',
    `roleid`   INT         NOT NULL COMMENT '角色ID',
    `rolename` VARCHAR(30) NOT NULL COMMENT '角色名称',
    `w1`       INT         DEFAULT 0 COMMENT '宝物类型1数量',
    `w2`       INT         DEFAULT 0 COMMENT '宝物类型2数量',
    `w3`       INT         DEFAULT 0 COMMENT '宝物类型3数量',
    `w4`       INT         DEFAULT 0 COMMENT '宝物类型4数量',
    `w5`       INT         DEFAULT 0 COMMENT '宝物类型5数量',
    `w6`       INT         DEFAULT 0 COMMENT '宝物类型6数量',
    `w7`       INT         DEFAULT 0 COMMENT '宝物类型7数量',
    `w8`       INT         DEFAULT 0 COMMENT '宝物类型8数量',
    `w9`       INT         DEFAULT 0 COMMENT '宝物类型9数量',
    `status`   VARCHAR(20) DEFAULT 'digging' COMMENT '状态(digging/completed/claimed)',
    `type`     VARCHAR(30) NOT NULL COMMENT '挖宝类型(normal/premium/event)',
    `date`     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '最后操作时间',
    `num`      INT         DEFAULT 0 COMMENT '今日挖宝次数',
    PRIMARY KEY (`id`),
    INDEX      `idx_role_dig` (`roleid`, `status`),
    INDEX      `idx_type_time` (`type`, `date`),
    INDEX      `idx_daily_count` (`num`, `date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色挖宝进度表(2025年5月22日建表)';



CREATE TABLE `wa_bao_miao_shu`
(
    `id`       INT         NOT NULL AUTO_INCREMENT COMMENT '挖宝记录ID',
    `roleid`   INT         NOT NULL COMMENT '角色ID',
    `rolename` VARCHAR(30) NOT NULL COMMENT '角色名称',
    `baoid`    INT         NOT NULL COMMENT '宝物模板ID',
    `baoname`  VARCHAR(50) NOT NULL COMMENT '宝物名称',
    `status`   VARCHAR(20) DEFAULT 'unclaimed' COMMENT '状态(unclaimed/claimed/expired)',
    `date`     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '获得时间',
    PRIMARY KEY (`id`),
    INDEX      `idx_role_treasure` (`roleid`, `status`),
    INDEX      `idx_treasure_time` (`baoid`, `date`),
    INDEX      `idx_expiry_check` (`status`, `date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色挖宝获得记录表(2025年5月22日建表)';



CREATE TABLE `world_msg`
(
    `id`       INT          NOT NULL AUTO_INCREMENT COMMENT '消息ID',
    `message`  VARCHAR(500) NOT NULL COMMENT '消息内容(支持Emoji)',
    `data`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间(精确到毫秒)',
    `type`     VARCHAR(30)  NOT NULL COMMENT '消息类型(system/player/guild)',
    `rolename` VARCHAR(30) COMMENT '发送者名称',
    `roleid`   INT COMMENT '发送者ID',
    PRIMARY KEY (`id`),
    INDEX      `idx_msg_type` (`type`, `data`),
    INDEX      `idx_sender` (`roleid`),
    FULLTEXT   INDEX `ft_msg_content` (`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='世界频道消息表(2025年5月22日建表)';


CREATE TABLE `wupin`
(
    `roleid`    INT NOT NULL COMMENT '角色ID',
    `yaopinid`  INT NOT NULL COMMENT '药品模板ID',
    `yaopinnum` INT DEFAULT 1 COMMENT '药品数量(可堆叠)',
    PRIMARY KEY (`roleid`, `yaopinid`),
    INDEX       `idx_medicine` (`yaopinid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色药品背包表(2025年5月22日建表)';


CREATE TABLE `wuqi_describe`
(
    `id`        INT          NOT NULL AUTO_INCREMENT COMMENT '武器ID',
    `level`     INT          DEFAULT 1 COMMENT '武器等级',
    `miaoShu`   VARCHAR(500) NOT NULL COMMENT '武器描述(含特效说明)',
    `xiaoGuo`   INT          NOT NULL COMMENT '基础效果值(攻击力/防御力)',
    `powerNum`  INT          DEFAULT 0 COMMENT '战力评分',
    `wuQiName`  VARCHAR(50)  NOT NULL COMMENT '武器名称',
    `roleLevel` INT          DEFAULT 1 COMMENT '装备需求等级',
    `price`     INT          DEFAULT 0 COMMENT '基础售价(铜币)',
    `imgUrl`    VARCHAR(255) DEFAULT 'default.png' COMMENT '图标路径',
    `status`    VARCHAR(20)  DEFAULT 'active' COMMENT '状态(active/disabled/maintenance)',
    `custom1`   VARCHAR(100) COMMENT '自定义属性1(暴击率)',
    `custom2`   VARCHAR(100) COMMENT '自定义属性2(攻速)',
    `custom3`   VARCHAR(100) COMMENT '自定义属性3(特殊效果)',
    `type`      VARCHAR(30)  NOT NULL COMMENT '武器类型(sword/bow/staff)',
    PRIMARY KEY (`id`),
    INDEX       `idx_weapon_level` (`level`, `roleLevel`),
    INDEX       `idx_weapon_power` (`powerNum`),
    INDEX       `idx_weapon_type` (`type`, `status`),
    FULLTEXT    INDEX `ft_weapon_desc` (`miaoShu`, `wuQiName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='武器属性描述表(2025年5月22日建表)';



CREATE TABLE `wu_qi_detail`
(
    `id`        INT         NOT NULL AUTO_INCREMENT COMMENT '武器实例ID',
    `zbid`      INT         NOT NULL COMMENT '装备基础ID',
    `level`     VARCHAR(20) NOT NULL COMMENT '强化等级(格式:1/10)',


    `gongji`    INT         DEFAULT 0 COMMENT '攻击力',
    `fangyu`    INT         DEFAULT 0 COMMENT '防御力',
    `qixue`     INT         DEFAULT 0 COMMENT '气血加成',
    `jingli`    INT         DEFAULT 0 COMMENT '精力加成',
    `sudu`      INT         DEFAULT 0 COMMENT '速度加成',


    `baoji`     INT         DEFAULT 0 COMMENT '暴击率(0-100)',
    `zhiming`   INT         DEFAULT 0 COMMENT '致命率(0-100)',
    `fanji`     INT         DEFAULT 0 COMMENT '反击率(0-100)',
    `mingzhong` INT         DEFAULT 0 COMMENT '命中率(0-100)',


    `bs1`       INT COMMENT '宝石槽位1ID',
    `bs2`       INT COMMENT '宝石槽位2ID',
    `bs3`       INT COMMENT '宝石槽位3ID',


    `jnjc`      INT         DEFAULT 0 COMMENT '技能加成',
    `jnid`      INT COMMENT '绑定技能ID',


    `wuli`      INT         DEFAULT 0 COMMENT '物理抗性',
    `lei`       INT         DEFAULT 0 COMMENT '雷抗',
    `hufeng`    INT         DEFAULT 0 COMMENT '火抗',
    `du`        INT         DEFAULT 0 COMMENT '毒抗',
    `luan`      INT         DEFAULT 0 COMMENT '混乱抗性',
    `wei`       INT         DEFAULT 0 COMMENT '围困抗性',
    `feng`      INT         DEFAULT 0 COMMENT '风抗',
    `yaohuo`    INT         DEFAULT 0 COMMENT '妖火抗性',


    `pinzhi`    VARCHAR(10) DEFAULT 'C' COMMENT '品质(S/A/B/C/D)',
    `status`    VARCHAR(20) DEFAULT 'normal' COMMENT '状态(normal/locked/refining)',
    `name`      VARCHAR(50) NOT NULL COMMENT '武器全称',
    `addgongji` INT         DEFAULT 0 COMMENT '附加攻击力',
    `data`      TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '最后强化时间',
    `type`      VARCHAR(30) NOT NULL COMMENT '武器类型(sword/bow/staff)',


    `fashubao`  INT         DEFAULT 0 COMMENT '法术暴击率',
    `fanzhen`   INT         DEFAULT 0 COMMENT '反震率',
    `duobi`     INT         DEFAULT 0 COMMENT '躲避率',
    `xuanji`    INT         DEFAULT 0 COMMENT '眩晕几率',

    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_weapon_instance` (`zbid`, `id`),
    INDEX       `idx_combat_power` (`gongji`, `fangyu`, `baoji`),
    INDEX       `idx_element_resist` (`wuli`, `lei`, `hufeng`, `du`),
    INDEX       `idx_weapon_status` (`status`, `pinzhi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='武器详细属性表(2025年5月22日建表)';



CREATE TABLE `xun_lian`
(
    `id`      INT         NOT NULL AUTO_INCREMENT COMMENT '训练记录ID',
    `roleid`  INT         NOT NULL COMMENT '角色ID',
    `date`    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始训练时间',
    `status`  VARCHAR(20)          DEFAULT 'training' COMMENT '状态(training/completed/interrupted)',
    `type`    VARCHAR(30) NOT NULL COMMENT '训练类型(combat/skill/fitness)',
    `jingYan` INT                  DEFAULT 0 COMMENT '获得经验值',
    PRIMARY KEY (`id`),
    INDEX     `idx_role_training` (`roleid`, `status`),
    INDEX     `idx_training_type` (`type`, `date`),
    INDEX     `idx_exp_gain` (`jingYan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色训练记录表(2025年5月22日建表)';


CREATE TABLE `yaoping`
(
    `yaoid`    INT         NOT NULL COMMENT '药品ID',
    `yaoname`  VARCHAR(50) NOT NULL COMMENT '药品名称',
    `yaoprice` INT          DEFAULT 0 COMMENT '基础售价(铜币)',
    `qixuezhi` DOUBLE(8,2) DEFAULT 0.00 COMMENT '气血恢复值(支持小数)',
    `dengji`   VARCHAR(20) NOT NULL COMMENT '使用等级要求(格式:1-99)',
    `sx`       INT          DEFAULT 0 COMMENT '特殊效果ID',
    `touxiang` VARCHAR(255) DEFAULT 'default.png' COMMENT '图标路径',
    PRIMARY KEY (`yaoid`),
    INDEX      `idx_medicine_level` (`dengji`),
    INDEX      `idx_medicine_effect` (`qixuezhi`, `sx`),
    FULLTEXT   INDEX `ft_medicine_name` (`yaoname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='药品基础属性表(2025年5月22日建表)';


CREATE TABLE `ye_guai_qun`
(
    `id`     INT         NOT NULL AUTO_INCREMENT COMMENT '怪群ID',
    `name`   VARCHAR(50) NOT NULL COMMENT '怪群名称',
    `guai1`  VARCHAR(30) NOT NULL COMMENT '怪物类型1',
    `guai2`  VARCHAR(30) COMMENT '怪物类型2',
    `guai3`  VARCHAR(30) COMMENT '怪物类型3',
    `guai4`  VARCHAR(30) COMMENT '怪物类型4',
    `guai5`  VARCHAR(30) COMMENT '怪物类型5',
    `guai6`  VARCHAR(30) COMMENT '怪物类型6',
    PRIMARY KEY (`id`),
    INDEX    `idx_monster_group` (`guai1`, `guai2`, `guai3`),
    FULLTEXT INDEX `ft_group_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='野怪组合配置表(2025年5月22日建表)';


CREATE TABLE `yl_da_xiao`
(
    `id`     INT         NOT NULL AUTO_INCREMENT COMMENT '游戏记录ID',
    `num1`   INT         NOT NULL COMMENT '随机数1(1-6)',
    `num2`   INT         NOT NULL COMMENT '随机数2(1-6)',
    `num3`   INT         NOT NULL COMMENT '随机数3(1-6)',
    `result` VARCHAR(10) NOT NULL COMMENT '开奖结果(big/small/triple)',
    `status` VARCHAR(20) DEFAULT 'completed' COMMENT '状态(completed/canceled)',
    PRIMARY KEY (`id`),
    INDEX    `idx_result_stats` (`result`, `status`),
    INDEX    `idx_dice_combine` (`num1`, `num2`, `num3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='骰宝游戏记录表(2025年5月22日建表)';



CREATE TABLE `yl_dx_xq`
(
    `id`       INT         NOT NULL AUTO_INCREMENT COMMENT '下注记录ID',
    `roleid`   INT         NOT NULL COMMENT '玩家角色ID',
    `rolename` VARCHAR(30) NOT NULL COMMENT '玩家名称',
    `jin`      INT       DEFAULT 0 COMMENT '金币下注额',
    `yin`      INT       DEFAULT 0 COMMENT '银币下注额',
    `result`   VARCHAR(10) NOT NULL COMMENT '押注方向(big/small/triple)',
    `num`      INT       DEFAULT 1 COMMENT '下注倍数(1-10)',
    `status`   INT       DEFAULT 0 COMMENT '结算状态(0=未开奖,1=已赢,2=已输,3=已退款)',
    `jieguo`   VARCHAR(20) COMMENT '实际开奖结果',
    `data`     TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '下注时间',
    PRIMARY KEY (`id`),
    INDEX      `idx_player_bet` (`roleid`, `status`),
    INDEX      `idx_bet_time` (`data`),
    INDEX      `idx_bet_result` (`result`, `jieguo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='押大小游戏下注详情表(2025年5月22日建表)';


CREATE TABLE `you_jian`
(
    `id`           INT           NOT NULL AUTO_INCREMENT COMMENT '邮件ID',
    `roleid`       INT           NOT NULL COMMENT '发件人ID',
    `rolename`     VARCHAR(30)   NOT NULL COMMENT '发件人名称',
    `receiveId`    INT           NOT NULL COMMENT '收件人ID',
    `receivedname` VARCHAR(30)   NOT NULL COMMENT '收件人名称',
    `status`       VARCHAR(20) DEFAULT 'unread' COMMENT '状态(unread/read/claimed/deleted)',
    `data`         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
    `data2`        TIMESTAMP NULL COMMENT '领取/阅读时间',
    `yin`          INT         DEFAULT 0 COMMENT '附件银两',
    `message`      VARCHAR(1000) NOT NULL COMMENT '邮件内容(支持HTML)',
    PRIMARY KEY (`id`),
    INDEX          `idx_receiver` (`receiveId`, `status`),
    INDEX          `idx_sender` (`roleid`),
    INDEX          `idx_time` (`data`, `data2`),
    FULLTEXT       INDEX `ft_message` (`message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游戏邮件系统表(2025年5月22日建表)';

CREATE TABLE `you_jian_wu_pin`
(
    `id`           INT         NOT NULL AUTO_INCREMENT COMMENT '附件ID',
    `wupinid`      INT         NOT NULL COMMENT '物品模板ID',
    `wupinnName`   VARCHAR(50) NOT NULL COMMENT '物品名称',
    `num`          INT         DEFAULT 1 COMMENT '物品数量',
    `date`         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
    `status`       VARCHAR(20) DEFAULT 'unclaimed' COMMENT '状态(unclaimed/claimed/expired)',
    `typeid`       INT         NOT NULL COMMENT '物品类型ID',


    `roleid`       INT         NOT NULL COMMENT '发件人ID',
    `rolename`     VARCHAR(30) NOT NULL COMMENT '发件人名称',
    `receiveid`    INT         NOT NULL COMMENT '收件人ID',
    `receivedname` VARCHAR(30) NOT NULL COMMENT '收件人名称',


    `yin`          INT         DEFAULT 0 COMMENT '附加银两',
    `youjianid`    INT         NOT NULL COMMENT '关联邮件ID',

    PRIMARY KEY (`id`),
    INDEX          `idx_mail_attach` (`youjianid`, `status`),
    INDEX          `idx_receiver_items` (`receiveid`, `status`),
    INDEX          `idx_item_type` (`typeid`, `wupinid`),
    INDEX          `idx_expiry_check` (`status`, `date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮件物品附件记录表(2025年5月22日建表)';



CREATE TABLE `za_wu_miao_shu`
(
    `id`      INT          NOT NULL AUTO_INCREMENT COMMENT '杂物ID',
    `name`    VARCHAR(50)  NOT NULL COMMENT '物品名称',
    `level`   INT         DEFAULT 1 COMMENT '使用等级',
    `jieshao` VARCHAR(500) NOT NULL COMMENT '详细介绍(含使用说明)',
    `status`  VARCHAR(20) DEFAULT 'active' COMMENT '状态(active/inactive/test)',
    `type`    VARCHAR(30)  NOT NULL COMMENT '物品类型(material/task/special)',
    `xiaoguo` INT         DEFAULT 0 COMMENT '使用效果值',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_item_name` (`name`),
    INDEX     `idx_item_level` (`level`, `status`),
    INDEX     `idx_item_type` (`type`, `xiaoguo`),
    FULLTEXT  INDEX `ft_item_desc` (`jieshao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='杂物基础属性表(2025年5月22日建表)';




