/*
Navicat MySQL Data Transfer

Source Server         : 51jk_server
Source Server Version : 50626
Source Host           : 172.20.10.66:3306
Source Database       : 51jk_db

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-08-10 09:28:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_about
-- ----------------------------
DROP TABLE IF EXISTS `b_about`;
CREATE TABLE `b_about` (
  `site_id` int(11) NOT NULL,
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面ID',
  `page_title` text NOT NULL COMMENT '标题',
  `page_content` text COMMENT '页面内容',
  `page_pid` int(10) unsigned DEFAULT '0' COMMENT '父级ID',
  `page_status` int(10) unsigned DEFAULT '1' COMMENT '状态 0=删除 1=使用',
  `page_order` int(3) unsigned DEFAULT '999' COMMENT '顺序',
  `page_alias` text COMMENT '别名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_tag` int(11) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  PRIMARY KEY (`page_id`,`site_id`),
  KEY `del_tag` (`del_tag`),
  KEY `idx_site_id` (`site_id`,`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_about_copy
-- ----------------------------
DROP TABLE IF EXISTS `b_about_copy`;
CREATE TABLE `b_about_copy` (
  `site_id` int(11) NOT NULL,
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面ID',
  `page_title` text NOT NULL COMMENT '标题',
  `page_content` text COMMENT '页面内容',
  `page_pid` int(10) unsigned DEFAULT '0' COMMENT '父级ID',
  `page_status` int(10) unsigned DEFAULT '1' COMMENT '状态 0=删除 1=使用',
  `page_order` int(3) unsigned DEFAULT '999' COMMENT '顺序',
  `page_alias` text COMMENT '别名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_tag` int(11) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  PRIMARY KEY (`page_id`,`site_id`),
  KEY `del_tag` (`del_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_address
-- ----------------------------
DROP TABLE IF EXISTS `b_address`;
CREATE TABLE `b_address` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '买家地址库',
  `buyer_id` int(11) NOT NULL COMMENT '买家唯一id,对应yb_member.id',
  `province_code` int(11) NOT NULL COMMENT '地区代码(省/市)',
  `province` varchar(60) DEFAULT '' COMMENT '省',
  `city` varchar(60) DEFAULT '' COMMENT '市',
  `country` varchar(60) DEFAULT '' COMMENT '区',
  `addr` varchar(255) NOT NULL COMMENT '详细地址,不需要重复填写省/市/区',
  `zip_code` varchar(20) DEFAULT '' COMMENT '地区邮政编码',
  `phone` varchar(20) DEFAULT '' COMMENT '电话号码',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `name` varchar(60) NOT NULL COMMENT '收货人姓名',
  `del_tag` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标签 0=正常 1=删除',
  `is_default` int(1) NOT NULL COMMENT '是否为默认地址: 0 （不是），1(是)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`,`site_id`),
  KEY `idx_buyer_id` (`buyer_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100359 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_address_20170516
-- ----------------------------
DROP TABLE IF EXISTS `b_address_20170516`;
CREATE TABLE `b_address_20170516` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '买家地址库',
  `buyer_id` int(11) NOT NULL COMMENT '买家唯一id,对应yb_member.id',
  `province_code` int(11) NOT NULL COMMENT '地区代码(省/市)',
  `province` varchar(60) DEFAULT '' COMMENT '省',
  `city` varchar(60) DEFAULT '' COMMENT '市',
  `country` varchar(60) DEFAULT '' COMMENT '区',
  `addr` varchar(255) NOT NULL COMMENT '详细地址,不需要重复填写省/市/区',
  `zip_code` varchar(20) DEFAULT '' COMMENT '地区邮政编码',
  `phone` varchar(20) DEFAULT '' COMMENT '电话号码',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `name` varchar(60) NOT NULL COMMENT '收货人姓名',
  `del_tag` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标签 0=正常 1=删除',
  `is_default` int(1) NOT NULL COMMENT '是否为默认地址: 0 （不是），1(是)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`,`site_id`),
  KEY `idx_buyer_id` (`buyer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100194 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_adverisement
-- ----------------------------
DROP TABLE IF EXISTS `b_adverisement`;
CREATE TABLE `b_adverisement` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `adv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页广告',
  `slide_oneimg` varchar(255) DEFAULT '' COMMENT '幻灯片图片',
  `slide_oneurl` varchar(255) DEFAULT '' COMMENT '幻灯片超链接',
  `slide_sort` int(11) unsigned DEFAULT '0' COMMENT '幻灯片排序(数字越大越靠前，非负数)',
  `slide_type` int(11) unsigned DEFAULT '0' COMMENT '广告类型',
  `ad_status` tinyint(1) unsigned zerofill DEFAULT '1' COMMENT '状态 0=禁用 1=启用 ',
  `platform_type` tinyint(4) DEFAULT '110' COMMENT '平台类型：120(微信) 110（A站）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`adv_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_app_logs
-- ----------------------------
DROP TABLE IF EXISTS `b_app_logs`;
CREATE TABLE `b_app_logs` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家操作记录表主键',
  `operator_id` int(11) unsigned DEFAULT '0' COMMENT '操作者ID',
  `operator` varchar(50) DEFAULT '' COMMENT '操作者(张三)',
  `operator_type` int(3) unsigned DEFAULT '110' COMMENT '操作者类型 110=管理员 200=店员 300=买家（用户）',
  `action` varchar(100) NOT NULL COMMENT '动作',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `platform_type` int(3) unsigned NOT NULL DEFAULT '110' COMMENT '当前使用的平台 110 (网站)，120（微信），130（app）, 140（门店后台）9999（其它）',
  `store_id` int(11) DEFAULT '0' COMMENT '门店ID 对应  b_stores.id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=702792 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_ask
-- ----------------------------
DROP TABLE IF EXISTS `b_ask`;
CREATE TABLE `b_ask` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '问答唯一id',
  `questions` varchar(255) DEFAULT '' COMMENT '问题',
  `answers` varchar(255) DEFAULT NULL COMMENT '答案',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '问答删除（1：表示软删除，默认为0）',
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1649 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_barnd
-- ----------------------------
DROP TABLE IF EXISTS `b_barnd`;
CREATE TABLE `b_barnd` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `barnd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `barnd_name` varchar(255) NOT NULL COMMENT '品牌名',
  `barnd_desc` varchar(255) DEFAULT '' COMMENT '品牌描述',
  `site_url` varchar(255) DEFAULT '' COMMENT '公司网址',
  `barnd_logo` varchar(255) DEFAULT '' COMMENT '品牌logo',
  `is_show` int(1) DEFAULT '0' COMMENT '是否显示: 0(显示) ，1（不显示）',
  `barnd_sort` int(11) DEFAULT '99999' COMMENT '排序字段（数字越小越靠前，非负数），默认为：99999',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yb_barndid` int(11) DEFAULT '0' COMMENT '对应  yb_barnd.id',
  PRIMARY KEY (`barnd_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`barnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9351 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_category
-- ----------------------------
DROP TABLE IF EXISTS `b_category`;
CREATE TABLE `b_category` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户自己定义分类ID（分类表）',
  `parent_id` int(11) NOT NULL COMMENT '父类ID: 0(表示顶级分类)，其它数字为分类的ID',
  `cate_code` varchar(200) NOT NULL DEFAULT '' COMMENT '商品分类code(100310021000)',
  `cate_name` varchar(255) NOT NULL COMMENT '分类名称',
  `cate_sort` int(11) DEFAULT '9999' COMMENT '排序用 （数字越小越靠前，非负数），默认为: 9999',
  `img_hash` varchar(64) DEFAULT '' COMMENT '分类图片',
  `cate_ishow` int(11) DEFAULT '0' COMMENT '是否显示:   0(显示)，1（不显示）',
  `yb_cateid` int(11) DEFAULT '0' COMMENT '应对yb_category.cate_id, 0表示用户新增的分类',
  `del_tag` int(11) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  `is_del` int(11) DEFAULT '0' COMMENT '该分类是否可删除0：可删除1：不可删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cate_id`,`site_id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `cate_code` (`cate_code`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=820436 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_city_statistics_stores
-- ----------------------------
DROP TABLE IF EXISTS `b_city_statistics_stores`;
CREATE TABLE `b_city_statistics_stores` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '统计每个城市有多少门店个（微信）',
  `city_id` int(11) NOT NULL COMMENT '门店所属城市',
  `store_quantity` int(11) NOT NULL COMMENT '所属城市门店数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `id_city_id` (`city_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_close_index_recode
-- ----------------------------
DROP TABLE IF EXISTS `b_close_index_recode`;
CREATE TABLE `b_close_index_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '�̼�id',
  `storeadmin_id` int(11) DEFAULT NULL COMMENT '��Աid',
  `history_index` double(11,2) DEFAULT NULL,
  `order_index` double(11,2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `customer_user_name` varchar(255) DEFAULT NULL COMMENT '�ͻ��û���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1074203 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_compaign_goods
-- ----------------------------
DROP TABLE IF EXISTS `b_compaign_goods`;
CREATE TABLE `b_compaign_goods` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动商品表',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品 ID',
  `compaign_id` int(11) NOT NULL COMMENT '活动ID，对应 b_iconlink.link_id',
  `compaign_type` varchar(100) NOT NULL COMMENT '活动类别',
  `goods_status` int(11) DEFAULT '0' COMMENT '商品状态,是否启用 1是 2否',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_compaign_type` (`compaign_type`,`compaign_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='活动与商品关联表';

-- ----------------------------
-- Table structure for b_concern
-- ----------------------------
DROP TABLE IF EXISTS `b_concern`;
CREATE TABLE `b_concern` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关注表',
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '商家id',
  `type_pk` int(10) unsigned NOT NULL COMMENT '店员id对应b_store_admin.id/门店id对应b_stores.id/商户site_id',
  `type` tinyint(4) NOT NULL COMMENT '扫码类型 1店员 2门店 3商户',
  `open_id` varchar(32) NOT NULL COMMENT '用户帐号',
  `scene_str` varchar(255) DEFAULT NULL COMMENT '二维码场景值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8 COMMENT='关注表';

-- ----------------------------
-- Table structure for b_contact_person
-- ----------------------------
DROP TABLE IF EXISTS `b_contact_person`;
CREATE TABLE `b_contact_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT 'memeber_id 关联b_member表中的member_id',
  `name` varchar(45) DEFAULT NULL COMMENT '联系人姓名',
  `idcard` varchar(45) DEFAULT NULL COMMENT '身份证号',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别：0 男 1 女 3 未知',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '生日',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号',
  `is_del` tinyint(2) DEFAULT '1' COMMENT '是否删除 0 删除 1 正常',
  `is_default` tinyint(2) DEFAULT '0' COMMENT '是否是默认联系人 0 不是默认联系人 1 默认联系人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon`;
CREATE TABLE `b_coupon` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券表',
  `coupon_name` varchar(80) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `coupon_type` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券类别,1:现金,2:满减 ',
  `coupon_campaign_name` varchar(20) DEFAULT '' COMMENT '活动名称',
  `coupon_amount` varchar(255) DEFAULT '0' COMMENT '金额设定范围，固定值： 100， 或者随机值： 1，100 ， 单位：元',
  `coupon_status` int(11) unsigned DEFAULT '0' COMMENT '优惠券状态 0可发放 1已发完 2手动停发 3已过期 4手动作废 10待发放',
  `coupon_limit_type` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券限制类别,0:无限制,1:类目限制,配合coupon_limit_vals使用,2:商品限制',
  `coupon_limit_vals` text COMMENT '优惠券使用条件,如商品类别ID,商品ID等',
  `coupon_amount_min` int(11) DEFAULT '0' COMMENT '优惠券金额限制, 对订单的最小金额进行限制',
  `coupon_amount_max` int(11) DEFAULT '0' COMMENT '优惠券金额限制, 对订单的最大金额进行限制',
  `coupon_is_exclusive` int(11) unsigned DEFAULT '0' COMMENT '优惠券是否排他限制,0: 不允许与其他一起使用 1:可以与其他优惠券一起使用',
  `coupon_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券开始时间',
  `coupon_end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券结束时间',
  `coupon_extra_time` int(11) DEFAULT '0' COMMENT 'USE COUPON EXTRA TIME, UNIT:SECONDS',
  `coupon_amount_type` varchar(255) DEFAULT 'fixed' COMMENT '卡券额度设定:\r\n固定金额: fixed  \r\n 范围随机: random',
  `coupon_create_num` int(11) DEFAULT '0' COMMENT '优惠券最大数目,如果为-1表示不限制',
  `coupon_available_num` int(11) DEFAULT '0' COMMENT '优惠券剩余数目,如果coupon_create_num未-1,则这个值应该是0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coupon_dispatch_num` int(11) DEFAULT '0' COMMENT '优惠券发送数目',
  `coupon_use_num` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用数量',
  `coupon_is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '优惠券软删除标记',
  `coupon_is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否占用，0否， 1是',
  `coupon_trigger_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券绑定的触发器ID',
  PRIMARY KEY (`coupon_id`,`site_id`),
  KEY `coupon_statusx` (`coupon_status`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_coupon_activity
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_activity`;
CREATE TABLE `b_coupon_activity` (
  `site_id` int(11) NOT NULL COMMENT '商户ID',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) DEFAULT NULL COMMENT '活动标题',
  `content` varchar(255) DEFAULT NULL COMMENT '活动描述',
  `image` varchar(255) DEFAULT NULL COMMENT '图片ID',
  `send_obj` tinyint(4) DEFAULT NULL COMMENT '发放对象：1全部会员 2指定会员',
  `send_type` tinyint(4) DEFAULT NULL COMMENT '发放类型：1注册后 2直接发 3固定时间范围 4付款发放 5首次付款发放',
  `send_condition_type` tinyint(4) DEFAULT NULL COMMENT '发放条件:1(满足多少元)，2（满足多少件）',
  `send_condition` text COMMENT '发放限制条件',
  `send_way` tinyint(4) DEFAULT NULL COMMENT '发放方式:1直接发送到账户 2需领券 3发送红包 4门店 5店员',
  `send_limit` int(11) DEFAULT NULL COMMENT '当 sendWay == 2 sendLimit表示每个会员最多可领多少次，0代表无限',
  `start_time` datetime DEFAULT NULL COMMENT '生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `send_way_value` text COMMENT '发放方式如果是门店或者店员需要在此字段记录 店员ID 或者 门店ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：0发布中 1定时发布(未到达发布时间，定时任务使用) 2过期结束(根据活动定义的时间结束) 3已发完结束(该活动下的所有优惠券已经发完) 4手动结束(手动停止发布优惠券活动) 10待发布(活动可编辑，草稿状态) 11发布中(未开始)',
  `created_total` int(11) DEFAULT '0' COMMENT '生成的优惠券总数',
  `used_total` int(11) DEFAULT '0' COMMENT '使用优惠券总数',
  `send_status` tinyint(1) DEFAULT '0' COMMENT '是否发放成功  0 未发放 1发放成功  2发放失败',
  `sign_members` text COMMENT '会员标签信息',
  `send_rules` text COMMENT '优惠券活动中的发放种类',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_activity_coupon
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_activity_coupon`;
CREATE TABLE `b_coupon_activity_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL COMMENT '商家ID',
  `rule_id` int(11) DEFAULT NULL COMMENT '优惠券规则ID',
  `active_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `num` int(11) DEFAULT NULL COMMENT '发送数量',
  `amount` int(11) DEFAULT NULL COMMENT '限制总量',
  `send_num` int(11) DEFAULT '0' COMMENT '发放会员数',
  `use_num` int(11) DEFAULT '0' COMMENT '使用数量',
  `receive_num` int(11) DEFAULT '0' COMMENT '领取数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未删除 1已删除',
  PRIMARY KEY (`id`,`site_id`),
  KEY `FK_B_COUPON_ACTIVE_CO_B_COUPON` (`rule_id`,`site_id`),
  KEY `FK_B_COUPON_ACTIVE_DE_B_ACTIVE` (`active_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_activity_recorde
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_activity_recorde`;
CREATE TABLE `b_coupon_activity_recorde` (
  `site_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '补发优惠券操作日志',
  `total_num` int(11) DEFAULT NULL COMMENT '需要补发的会员数',
  `success_num` int(11) DEFAULT NULL COMMENT '成功补发的会员数',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `reissue_manager_id` int(11) NOT NULL COMMENT '补发的实际操作者',
  `reissue_manager_name` varchar(255) NOT NULL COMMENT '补发的实际操作者名称',
  `activity_id` int(11) NOT NULL COMMENT '活动',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_activity_reissue_record
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_activity_reissue_record`;
CREATE TABLE `b_coupon_activity_reissue_record` (
  `site_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '补发优惠券操作日志',
  `total_num` int(11) DEFAULT NULL COMMENT '需要补发的会员数',
  `success_num` int(11) DEFAULT NULL COMMENT '成功补发的会员数',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `reissue_manager_id` int(11) NOT NULL COMMENT '补发的实际操作者',
  `reissue_manager_name` varchar(255) NOT NULL COMMENT '补发的实际操作者名称',
  `activity_id` int(11) NOT NULL COMMENT '活动',
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_clerk
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_clerk`;
CREATE TABLE `b_coupon_clerk` (
  `site_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店员领券表',
  `rule_id` int(11) NOT NULL DEFAULT '0',
  `active_id` int(11) DEFAULT NULL COMMENT '活动id',
  `use_coupon_num` int(6) NOT NULL DEFAULT '0' COMMENT '已使用多少',
  `manager_id` varchar(20) DEFAULT '' COMMENT '店员id',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_copy
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_copy`;
CREATE TABLE `b_coupon_copy` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券表',
  `coupon_name` varchar(80) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `coupon_type` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券类别,1:现金,2:满减 ',
  `coupon_campaign_name` varchar(20) DEFAULT '' COMMENT '活动名称',
  `coupon_amount` varchar(255) DEFAULT '0' COMMENT '金额设定范围，固定值： 100， 或者随机值： 1，100 ， 单位：元',
  `coupon_status` int(11) unsigned DEFAULT '0' COMMENT '优惠券状态 0 正常 1 已结束',
  `coupon_limit_type` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券限制类别,0:无限制,1:类目限制,配合coupon_limit_vals使用,2:商品限制',
  `coupon_limit_vals` text COMMENT '优惠券使用条件,如商品类别ID,商品ID等',
  `coupon_amount_min` int(11) DEFAULT '0' COMMENT '优惠券金额限制, 对订单的最小金额进行限制',
  `coupon_amount_max` int(11) DEFAULT '0' COMMENT '优惠券金额限制, 对订单的最大金额进行限制',
  `coupon_is_exclusive` int(11) unsigned DEFAULT '0' COMMENT '优惠券是否排他限制,0: 不允许与其他一起使用 1:可以与其他优惠券一起使用',
  `coupon_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券开始时间',
  `coupon_end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券结束时间',
  `coupon_extra_time` int(11) DEFAULT '0' COMMENT 'USE COUPON EXTRA TIME, UNIT:SECONDS',
  `coupon_amount_type` varchar(255) DEFAULT 'fixed' COMMENT '卡券额度设定:\r\n固定金额: fixed  \r\n 范围随机: random',
  `coupon_create_num` int(11) DEFAULT '0' COMMENT '优惠券最大数目,如果为-1表示不限制',
  `coupon_available_num` int(11) DEFAULT '0' COMMENT '优惠券剩余数目,如果coupon_create_num未-1,则这个值应该是0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `coupon_dispatch_num` int(11) DEFAULT '0' COMMENT '优惠券发送数目',
  `coupon_use_num` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券使用数量',
  `coupon_is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '优惠券软删除标记',
  `coupon_is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否占用，0否， 1是',
  `coupon_trigger_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券绑定的触发器ID',
  PRIMARY KEY (`coupon_id`,`site_id`),
  KEY `coupon_statusx` (`coupon_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_coupon_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_detail`;
CREATE TABLE `b_coupon_detail` (
  `site_id` int(11) NOT NULL COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_no` varchar(50) NOT NULL COMMENT '优惠券编码',
  `order_id` varchar(20) DEFAULT NULL COMMENT '订单id',
  `status` int(3) NOT NULL DEFAULT '1' COMMENT '优惠券状态0:已使用1:待使用',
  `source` varchar(20) DEFAULT NULL COMMENT '优惠券来源',
  `manager_id` varchar(20) DEFAULT NULL COMMENT '店员id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间及领取时间或是补发时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_copy` int(3) DEFAULT NULL COMMENT '是否可复制0:不可复制1:可复制',
  `is_share` int(3) DEFAULT NULL COMMENT '是否可分享0:不可分享1:可分享',
  `share_num` int(11) DEFAULT NULL COMMENT '如果可分享记录可分享数量',
  `share_url` varchar(100) DEFAULT NULL COMMENT '分享链接',
  `rule_id` int(11) NOT NULL COMMENT 'b_coupon_rule主键关联',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `money` decimal(11,2) DEFAULT NULL COMMENT '优惠券金额',
  `version` int(11) DEFAULT NULL COMMENT '加锁用',
  `store_id` int(11) DEFAULT NULL COMMENT '门店id',
  `send_order_id` varchar(20) DEFAULT NULL COMMENT '赠送订单id',
  `recovery_time` timestamp NULL DEFAULT NULL COMMENT '回收时间',
  `recovery_status` int(3) DEFAULT '1' COMMENT '回收状态0已回收1未回收',
  `return_status` int(3) DEFAULT '1' COMMENT '退还状态 0:已退还1:未退还',
  `type` int(3) DEFAULT '0' COMMENT '0 非补发获取 1通过补发获取',
  PRIMARY KEY (`id`,`site_id`),
  KEY `FK_B_COUPON_RULE_CO_B_COUPON` (`rule_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`),
  KEY `idx_activity_id` (`source`) USING BTREE,
  KEY `idx_rule_id` (`rule_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3923 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_detail_transform
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_detail_transform`;
CREATE TABLE `b_coupon_detail_transform` (
  `site_id` int(11) NOT NULL COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_no` varchar(50) NOT NULL COMMENT '优惠券编码',
  `order_id` varchar(20) DEFAULT NULL COMMENT '订单id',
  `status` int(3) NOT NULL DEFAULT '1' COMMENT '优惠券状态0:已使用1:待使用',
  `source` varchar(20) DEFAULT NULL COMMENT '优惠券来源',
  `manager_id` varchar(20) DEFAULT NULL COMMENT '店员id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间及领取时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_copy` int(3) DEFAULT NULL COMMENT '是否可复制0:不可复制1:可复制',
  `is_share` int(3) DEFAULT NULL COMMENT '是否可分享0:不可分享1:可分享',
  `share_num` int(11) DEFAULT NULL COMMENT '如果可分享记录可分享数量',
  `share_url` varchar(100) DEFAULT NULL COMMENT '分享链接',
  `rule_id` int(11) NOT NULL COMMENT 'b_coupon_rule主键关联',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `money` decimal(11,2) DEFAULT NULL COMMENT '优惠券金额',
  `version` int(11) DEFAULT NULL COMMENT '加锁用',
  `store_id` int(11) DEFAULT NULL COMMENT '门店id',
  `send_order_id` varchar(20) DEFAULT NULL COMMENT '赠送订单id',
  `recovery_time` timestamp NULL DEFAULT NULL COMMENT '回收时间',
  `recovery_status` int(3) DEFAULT '1' COMMENT '回收状态0已回收1未回收',
  `return_status` int(3) DEFAULT '1' COMMENT '退还状态 0:已退还1:未退还',
  PRIMARY KEY (`id`,`site_id`),
  KEY `FK_B_COUPON_RULE_CO_B_COUPON` (`rule_id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209396 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_export_log
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_export_log`;
CREATE TABLE `b_coupon_export_log` (
  `site_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `start_coupon_no` int(11) DEFAULT NULL,
  `end_coupon_no` int(11) DEFAULT NULL,
  `is_export` tinyint(1) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_rule
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_rule`;
CREATE TABLE `b_coupon_rule` (
  `site_id` int(20) NOT NULL COMMENT '商家id',
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券规则表',
  `rule_name` varchar(125) DEFAULT NULL COMMENT '规则名',
  `marked_words` varchar(60) DEFAULT NULL COMMENT '前台提示语',
  `coupon_type` int(4) DEFAULT '100' COMMENT '优惠券规则类型 100现金券 200打折券 300 现价券 400包邮券',
  `coupon_mode_id` int(5) DEFAULT NULL COMMENT '优惠券模版id',
  `amount` int(6) DEFAULT '-1' COMMENT '库存 -1表示不限制',
  `time_rule` text COMMENT '有效期规则json',
  `limit_rule` text COMMENT '限制属性json',
  `limit_state` text COMMENT '限制属性说明',
  `limit_remark` text COMMENT '限制属性备注',
  `aim_at` tinyint(1) DEFAULT '0' COMMENT '针对对象 0订单1商品',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '生效时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0' COMMENT '优惠券规则状态 0可发放 1已发完 2手动停发 3已过期 4手动作废 10待发放',
  `order_rule` text COMMENT '按订单规则json',
  `area_rule` text COMMENT '包邮地区规则',
  `goods_rule` text COMMENT '针对商品规则',
  `version` int(6) DEFAULT '0' COMMENT '版本号，用作锁机制',
  `total` int(6) DEFAULT '-1' COMMENT '优惠券总量-1表示不限量',
  `send_num` int(11) DEFAULT '0' COMMENT '优惠券已发放次数',
  `use_amount` int(11) DEFAULT '0' COMMENT '已使用数量',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数量',
  `order_price` decimal(11,2) DEFAULT '0.00' COMMENT '订单总价(用来计算订单均价）',
  `goods_num` int(11) DEFAULT '0' COMMENT '商品总数(用来计算商品均量)',
  `receive_num` int(11) DEFAULT '0' COMMENT '领取数量',
  `old_coupon_id` int(10) DEFAULT NULL COMMENT '老数据转换过来的id，用来判断是否转过此优惠券',
  PRIMARY KEY (`rule_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_rule_copy
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_rule_copy`;
CREATE TABLE `b_coupon_rule_copy` (
  `site_id` int(20) NOT NULL COMMENT '商家id',
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券规则表',
  `rule_name` varchar(125) DEFAULT NULL COMMENT '规则名',
  `marked_words` varchar(60) DEFAULT NULL COMMENT '前台提示语',
  `coupon_type` int(4) DEFAULT '100' COMMENT '优惠券规则类型 100现金券 200打折券 300 现价券 400包邮券',
  `coupon_mode_id` int(5) DEFAULT NULL COMMENT '优惠券模版id',
  `amount` int(6) DEFAULT '-1' COMMENT '库存 -1表示不限制',
  `time_rule` text COMMENT '有效期规则json',
  `limit_rule` text COMMENT '限制属性json',
  `limit_state` text COMMENT '限制属性说明',
  `limit_remark` text COMMENT '限制属性备注',
  `aim_at` tinyint(1) DEFAULT '0' COMMENT '针对对象 0订单1商品',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '生效时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0' COMMENT '规则状态0 正常  1结束 2撤销',
  `order_rule` text COMMENT '按订单规则json',
  `area_rule` text COMMENT '包邮地区规则',
  `goods_rule` text COMMENT '针对商品规则',
  `version` int(6) DEFAULT '0' COMMENT '版本号，用作锁机制',
  `total` int(6) DEFAULT '-1' COMMENT '优惠券总量-1表示不限量',
  `send_num` int(11) DEFAULT '0' COMMENT '优惠券已发放次数',
  `use_amount` int(11) DEFAULT '0' COMMENT '已使用数量',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数量',
  `order_price` decimal(11,2) DEFAULT '0.00' COMMENT '订单总价(用来计算订单均价）',
  `goods_num` int(11) DEFAULT '0' COMMENT '商品总数(用来计算商品均量)',
  `receive_num` int(11) DEFAULT '0' COMMENT '领取数量',
  `old_coupon_id` int(10) DEFAULT NULL COMMENT '老数据转换过来的id，用来判断是否转过此优惠券',
  PRIMARY KEY (`rule_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_coupon_rule_transform
-- ----------------------------
DROP TABLE IF EXISTS `b_coupon_rule_transform`;
CREATE TABLE `b_coupon_rule_transform` (
  `site_id` int(20) NOT NULL COMMENT '商家id',
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券规则表',
  `rule_name` varchar(125) DEFAULT NULL COMMENT '规则名',
  `marked_words` varchar(60) DEFAULT NULL COMMENT '前台提示语',
  `coupon_type` int(4) DEFAULT '100' COMMENT '优惠券规则类型 100现金券 200打折券 300 现价券 400包邮券',
  `coupon_mode_id` int(5) DEFAULT NULL COMMENT '优惠券模版id',
  `amount` int(6) DEFAULT '-1' COMMENT '库存 -1表示不限制',
  `time_rule` text COMMENT '有效期规则json',
  `limit_rule` text COMMENT '限制属性json',
  `limit_state` varchar(255) DEFAULT '' COMMENT '限制属性说明',
  `limit_remark` varchar(255) DEFAULT '' COMMENT '限制属性备注',
  `aim_at` tinyint(1) DEFAULT '0' COMMENT '针对对象 0订单1商品',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '生效时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0' COMMENT '规则状态0 正常  1结束 2撤销',
  `order_rule` text COMMENT '按订单规则json',
  `area_rule` text COMMENT '包邮地区规则',
  `goods_rule` text COMMENT '针对商品规则',
  `version` int(6) DEFAULT '0' COMMENT '版本号，用作锁机制',
  `total` int(6) DEFAULT '-1' COMMENT '优惠券总量-1表示不限量',
  `send_num` int(11) DEFAULT '0' COMMENT '优惠券已发放次数',
  `use_amount` int(11) DEFAULT '0' COMMENT '已使用数量',
  `share_num` int(11) DEFAULT '0' COMMENT '分享数量',
  `order_price` decimal(11,2) DEFAULT '0.00' COMMENT '订单总价(用来计算订单均价）',
  `goods_num` int(11) DEFAULT '0' COMMENT '商品总数(用来计算商品均量)',
  `receive_num` int(11) DEFAULT '0' COMMENT '领取数量',
  `old_coupon_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`rule_id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_delivery_method
-- ----------------------------
DROP TABLE IF EXISTS `b_delivery_method`;
CREATE TABLE `b_delivery_method` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `devl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流配送表主键id',
  `post_style_id` int(11) NOT NULL DEFAULT '0' COMMENT '配送方式ID：110(卖家包邮),120(平邮),130(快递),140(EMS),150(送货上门),160(门店自提)，170(门店直销)，9999(其它)',
  `delivery_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物流配送方式名',
  `valuation` int(11) DEFAULT '11' COMMENT '计费方式: 10(表示按宝贝件数计算运费), 11(表示按宝贝重量计算运费), 12(表示按宝贝体积计算运费)',
  `first_weight` decimal(10,0) DEFAULT '0' COMMENT '首重值：如果值为1000，如果按重量计算表示为1000g, 如果按件计算表示1件。',
  `add_weight` decimal(10,0) DEFAULT '0' COMMENT '超重值：如果超出值设为1000，如果按重量计算表示为1000g, 如果按件计算表示1件。',
  `def_firstprice` decimal(10,0) DEFAULT '0' COMMENT '默认首重运费（指定地区除外）',
  `def_addprice` decimal(10,0) DEFAULT '0' COMMENT '默认续重运费（指定地区除外）',
  `appoint_firstweight` text NOT NULL COMMENT '指定地区首重(g/件)，如果有三组指定的地区： 1;2;1(分号隔开，每组分号对应指定地区的首重)',
  `appoint_addweight` text NOT NULL COMMENT '指定地区增重(g/件)，如果有三组指定的地区： 1;2;1(分号隔开，每组分号对应指定地区的增重)',
  `appoint_firstprice` text NOT NULL COMMENT '指定地区首重运费,如果有三组指定的地区： 5;6;4(分号隔开，每组分号对应指定地区的首重运费)',
  `appoint_addprice` text NOT NULL COMMENT '指定地区续重运费,,如果有三组指定的地区： 10;10;9(分号隔开，每组分号对应指定指定地区的续重)',
  `appoint_area` text NOT NULL COMMENT '指定地区代码，如果有三组指定地区，格式为: 110000;310000,21800,20900;21000 ',
  `devl_desc` varchar(255) DEFAULT '' COMMENT '各地区的预计到货时间，文字描述',
  `dev_desc` varchar(1024) DEFAULT '' COMMENT '备注',
  `is_activation` int(11) DEFAULT '0' COMMENT '是否启用这个物流公司： 0（不启用）, 1（启用',
  `default_flag` int(2) DEFAULT '0' COMMENT '是否默认: 1 (默认)  0（非默认）',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`devl_id`,`site_id`),
  KEY `idx_post_style` (`post_style_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`devl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8924 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_devlivertemplate
-- ----------------------------
DROP TABLE IF EXISTS `b_devlivertemplate`;
CREATE TABLE `b_devlivertemplate` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `devl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 运费模板表',
  `logistics_company` varchar(60) NOT NULL COMMENT '物流公司名称',
  `post_style` int(5) unsigned DEFAULT '0' COMMENT '配送方式：110(卖家包邮),120(平邮),13(0快递),14(0EMS),150(送货上门),160(无须物流)，9999(其它)',
  `logistics_code` varchar(45) NOT NULL COMMENT '物流公司code, 对应表（yb_logcompany）的code字段',
  `valuation` int(11) DEFAULT '11' COMMENT '计费方式: 10(表示按宝贝件数计算运费), 11(表示按宝贝重量计算运费), 12(表示按宝贝体积计算运费)',
  `first_weight` decimal(10,0) DEFAULT '0' COMMENT '首重值：如果值为1000，如果按重量计算表示为1000g, 如果按件计算表示1件。',
  `add_weight` decimal(10,0) DEFAULT '0' COMMENT '超重值：如果超出值设为1000，如果按重量计算表示为1000g, 如果按件计算表示1件。',
  `def_firstprice` decimal(10,0) DEFAULT '0' COMMENT '默认首重运费（指定地区除外）',
  `def_addprice` decimal(10,0) DEFAULT '0' COMMENT '默认续重运费（指定地区除外）',
  `def_delvtime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '到货时间(精确到分钟)',
  `appoint_firstweight` varchar(255) DEFAULT '' COMMENT '指定地区首重(g/件)，如果有三组指定的地区： 1;2;1(分号隔开，每组分号对应指定地区的首重)',
  `appoint_addweight` varchar(255) DEFAULT '' COMMENT '指定地区增重(g/件)，如果有三组指定的地区： 1;2;1(分号隔开，每组分号对应指定地区的增重)',
  `appoint_firstprice` varchar(255) DEFAULT '' COMMENT '指定地区首重运费,如果有三组指定的地区： 5;6;4(分号隔开，每组分号对应指定地区的首重运费)',
  `appoint_addprice` varchar(255) DEFAULT '' COMMENT '指定地区续重运费,,如果有三组指定的地区： 10;10;9(分号隔开，每组分号对应指定指定地区的续重)',
  `appoint_area` text COMMENT '指定地区代码，如果有三组指定地区，格式为: 110000;310000,21800,20900;21000 ',
  `appoint_delvtime` varchar(45) DEFAULT '' COMMENT '指定地区预计到达时间（天），如果有三组指定的地区： 10;10;9(分号隔开，每组分号对应指定指定地区的到达时间)',
  `dev_desc` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `devl_desc` varchar(255) DEFAULT '' COMMENT '各地区的预计到货时间，文字描述',
  `is_activation` int(11) DEFAULT '0' COMMENT '是否启用这个物流公司： 0（不启用）, 1（启用）',
  `del_tag` int(11) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  `default_flag` int(2) DEFAULT '0' COMMENT '是否为默认物流公司: 1 (默认)  0（非默认）',
  PRIMARY KEY (`devl_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_doctors
-- ----------------------------
DROP TABLE IF EXISTS `b_doctors`;
CREATE TABLE `b_doctors` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_erpoptlogs
-- ----------------------------
DROP TABLE IF EXISTS `b_erpoptlogs`;
CREATE TABLE `b_erpoptlogs` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ERP同步操作日志',
  `service_type` int(11) unsigned DEFAULT '9999' COMMENT '业务类型: 100(商品信息)，110(会员信息)，120(会员积分)，9999(其他)',
  `opt_content` text COMMENT '操作日志',
  `opt_bak1` varchar(80) DEFAULT '' COMMENT '备用1',
  `opt_bak2` int(11) DEFAULT '0' COMMENT '备用2',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '记录时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_first_weight
-- ----------------------------
DROP TABLE IF EXISTS `b_first_weight`;
CREATE TABLE `b_first_weight` (
  `first_weight_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'һ��Ȩ������',
  `owner` int(11) NOT NULL COMMENT '�̼�id',
  `weight_name` varchar(255) NOT NULL COMMENT 'һ��Ȩ������',
  `weight_value` double(11,2) NOT NULL COMMENT 'Ȩ',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`first_weight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_flow_analysis_records
-- ----------------------------
DROP TABLE IF EXISTS `b_flow_analysis_records`;
CREATE TABLE `b_flow_analysis_records` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '元素自增ID',
  `statics_name` varchar(100) NOT NULL COMMENT '统计类型',
  `statics_value` text NOT NULL COMMENT '统计值',
  `statics_desc` varchar(255) NOT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`,`site_id`),
  UNIQUE KEY `uk_siteid_time` (`site_id`,`statics_name`,`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=333794 DEFAULT CHARSET=utf8 COMMENT='统计流量分析记录表';

-- ----------------------------
-- Table structure for b_goods
-- ----------------------------
DROP TABLE IF EXISTS `b_goods`;
CREATE TABLE `b_goods` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID（商品主表）',
  `approval_number` varchar(60) DEFAULT '0' COMMENT '批准文号',
  `drug_name` varchar(255) NOT NULL COMMENT '药品名/商品名（非药类商品）/器械名(非药类)/',
  `com_name` varchar(255) DEFAULT '' COMMENT '药品通用名',
  `specif_cation` varchar(255) DEFAULT '' COMMENT '规格(10mg*30片)，每一个规格都是一种药品',
  `goods_company` varchar(255) DEFAULT '' COMMENT '生产企业',
  `barnd_id` varchar(255) DEFAULT '' COMMENT '品牌id（用户也可以自己填写品牌）',
  `drug_category` int(11) DEFAULT '0' COMMENT '类别: 110(甲类非处方药)，120(已类非处方药)，130(处方药)，140(双轨药)，150(非方剂)，160(方剂)，170(一类)，180(二类)，190(三类)',
  `goods_property` int(11) DEFAULT '0' COMMENT '药品属性:110(化学药制剂),120(中成药),130(生物制品),140(抗生素),150(中药材),160(中药饮片),170(复方制剂),9999(其他),180(根茎类),190(茎木类),200(皮类),210(叶类),220(花类),230(全草类),240(果实种子类),250(矿物类),260(动物类)',
  `goods_use` varchar(255) DEFAULT '0' COMMENT '使用方法: 110(口服), 120(外用), 130(注射), 140(含服), 9999(其他)',
  `goods_forts` int(11) DEFAULT '0' COMMENT '剂型:110片剂120胶囊130丸剂140颗粒150液体160膏剂170贴剂180糖浆190散剂200栓剂210喷雾220溶液剂230乳剂240混悬剂250气雾剂260粉雾剂270洗剂280搽剂290糊剂300凝胶剂310滴眼剂320滴鼻剂330滴耳剂340眼膏剂350含漱剂360舌下片剂370粘贴片380贴膜剂390滴剂400滴丸剂410芳香水剂420甘油剂430醑剂440注射剂450涂膜剂460合剂470酊剂480膜剂9999其他',
  `goods_validity` int(11) DEFAULT '0' COMMENT '有效期(月)',
  `goods_forpeople` varchar(255) DEFAULT '' COMMENT '适用人群：110(不限)， 120(成人)，130(婴幼儿)，140(儿童)，150(男性)，160(妇女) ，170 (中老年)',
  `user_cateid` varchar(200) NOT NULL DEFAULT '' COMMENT '用户自定义分类（前期固定）',
  `goods_title` varchar(255) NOT NULL COMMENT '商品标题（用户自定义）,字数限制在60-80',
  `goods_tagsid` varchar(255) DEFAULT '' COMMENT '标签id(用,号隔开),对表标签表（b_tags）',
  `market_price` int(11) NOT NULL COMMENT '市场价格（以分为单位）',
  `shop_price` int(11) NOT NULL COMMENT '药房价格（以分为单位）',
  `cost_price` int(11) unsigned DEFAULT '0' COMMENT '成本价（以分为单位）',
  `discount_price` int(11) DEFAULT '0' COMMENT '折扣价格/会员价格/用户手动改价（以分为单位）',
  `in_stock` int(11) DEFAULT '0' COMMENT '库存(件)',
  `goods_weight` int(11) DEFAULT '0' COMMENT '重量(克)',
  `control_num` int(11) DEFAULT '0' COMMENT '限购（件）, 0为不限购',
  `goods_status` int(11) DEFAULT '2' COMMENT '产品状态. 1(出售中),2(库存中), 3（违规）,4(软删除)',
  `freight_payer` int(11) DEFAULT '2' COMMENT '运费承担方式: 1(商家), 2(买家)',
  `list_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上架时间',
  `delist_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下架时间',
  `postage_id` int(11) DEFAULT '0' COMMENT '运费模版id',
  `detail_tpl` int(11) NOT NULL COMMENT '商品录入模板标识：10（药品类模板），20（其他类模板），30（器械类模板），40（保健品模板），50（2.0版本废弃），60（化妆品模板），70 (中药材模板) ，80 (消毒类模板),100（医生服务标记）',
  `is_medicare` tinyint(1) unsigned DEFAULT '0' COMMENT '是否医保 1=非医保, 2=甲类医保, 3=乙类医保',
  `medicare_code` char(32) DEFAULT '' COMMENT '医保编码',
  `medicare_top_price` int(10) unsigned DEFAULT '0' COMMENT '医保最高价格 单位：分',
  `bar_code` char(32) DEFAULT '' COMMENT '条形码',
  `mnemonic_code` varchar(255) DEFAULT '' COMMENT '助记码',
  `purchase_way` int(3) DEFAULT '140' COMMENT '购买方式：\r\n110=仅支持在电脑购买 \r\n120=仅支持在手机购买 \r\n130=支持手机和电脑购买\r\n140=仅展示，不支持购买（默认）',
  `wx_purchase_way` int(3) DEFAULT '110' COMMENT '购买方式：110=立即购买，购物车 120=商品仅供展示   130=可拨打订购电话+可预留订购信息   140=可拨打订购电话   150=可预留订购信息',
  `goods_code` varchar(50) DEFAULT '' COMMENT '商品编码',
  `yb_goods_id` int(11) DEFAULT '0' COMMENT '对应yb_goods.goods_id',
  `schedule_time` tinyint(2) DEFAULT '1' COMMENT '新增有效期 1预约当日使用（可扩展）',
  `servce_num` int(6) DEFAULT '1' COMMENT '新增服务次数（可扩展）',
  `remark` text COMMENT '新增 说明服务类商品（）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '产品修改时间',
  `erp_price` int(11) DEFAULT NULL COMMENT 'erp同步过来的价格',
  PRIMARY KEY (`goods_id`,`site_id`),
  KEY `idx_appmum` (`approval_number`),
  KEY `idx_goods_title` (`goods_title`),
  KEY `idx_durg,idx_com` (`drug_name`,`com_name`),
  KEY `idx_cate_code` (`user_cateid`) USING BTREE,
  KEY `idx_goods_code` (`goods_code`),
  KEY `idx_site_id` (`site_id`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184529 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_goods_distribute
-- ----------------------------
DROP TABLE IF EXISTS `b_goods_distribute`;
CREATE TABLE `b_goods_distribute` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID（商品主表）',
  `approval_number` varchar(60) DEFAULT '0' COMMENT '批准文号',
  `drug_name` varchar(255) NOT NULL COMMENT '药品名/商品名（非药类商品）/器械名(非药类)/',
  `com_name` varchar(255) DEFAULT '' COMMENT '药品通用名',
  `specif_cation` varchar(255) DEFAULT '' COMMENT '规格(10mg*30片)，每一个规格都是一种药品',
  `goods_company` varchar(255) DEFAULT '' COMMENT '生产企业',
  `barnd_id` varchar(255) DEFAULT '' COMMENT '品牌id（用户也可以自己填写品牌）',
  `drug_category` int(11) DEFAULT '0' COMMENT '类别: 110(甲类非处方药)，120(已类非处方药)，130(处方药)，140(双轨药)，150(非方剂)，160(方剂)，170(一类)，180(二类)，190(三类)',
  `goods_property` int(11) DEFAULT '0' COMMENT '药品属性:110(化学药制剂),120(中成药),130(生物制品),140(抗生素),150(中药材),160(中药饮片),170(复方制剂),9999(其他),180(根茎类),190(茎木类),200(皮类),210(叶类),220(花类),230(全草类),240(果实种子类),250(矿物类),260(动物类)',
  `goods_use` varchar(255) DEFAULT '0' COMMENT '使用方法: 110(口服), 120(外用), 130(注射), 140(含服), 9999(其他)',
  `goods_forts` int(11) DEFAULT '0' COMMENT '剂型:110片剂120胶囊130丸剂140颗粒150液体160膏剂170贴剂180糖浆190散剂200栓剂210喷雾220溶液剂230乳剂240混悬剂250气雾剂260粉雾剂270洗剂280搽剂290糊剂300凝胶剂310滴眼剂320滴鼻剂330滴耳剂340眼膏剂350含漱剂360舌下片剂370粘贴片380贴膜剂390滴剂400滴丸剂410芳香水剂420甘油剂430醑剂440注射剂450涂膜剂460合剂470酊剂480膜剂9999其他',
  `goods_validity` int(11) DEFAULT '0' COMMENT '有效期(月)',
  `goods_forpeople` varchar(255) DEFAULT '' COMMENT '适用人群：110(不限)， 120(成人)，130(婴幼儿)，140(儿童)，150(男性)，160(妇女) ，170 (中老年)',
  `user_cateid` varchar(200) NOT NULL DEFAULT '' COMMENT '用户自定义分类（前期固定）',
  `goods_title` varchar(255) NOT NULL COMMENT '商品标题（用户自定义）,字数限制在60-80',
  `goods_tagsid` varchar(255) DEFAULT '' COMMENT '标签id(用,号隔开),对表标签表（b_tags）',
  `market_price` int(11) NOT NULL COMMENT '市场价格（以分为单位）',
  `shop_price` int(11) NOT NULL COMMENT '药房价格（以分为单位）',
  `cost_price` int(11) unsigned DEFAULT '0' COMMENT '成本价（以分为单位）',
  `discount_price` int(11) DEFAULT '0' COMMENT '折扣价格/会员价格/用户手动改价（以分为单位）',
  `in_stock` int(11) DEFAULT '0' COMMENT '库存(件)',
  `goods_weight` int(11) DEFAULT '0' COMMENT '重量(克)',
  `control_num` int(11) DEFAULT '0' COMMENT '限购（件）, 0为不限购',
  `goods_status` int(11) DEFAULT '2' COMMENT '产品状态. 1(出售中),2(库存中), 3（违规）,4(软删除)',
  `freight_payer` int(11) DEFAULT '2' COMMENT '运费承担方式: 1(商家), 2(买家)',
  `list_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上架时间',
  `delist_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下架时间',
  `postage_id` int(11) DEFAULT '0' COMMENT '运费模版id',
  `detail_tpl` int(11) NOT NULL COMMENT '商品录入模板标识：10（药品类模板），20（其他类模板），30（器械类模板），40（保健品模板），50（2.0版本废弃），60（化妆品模板），70 (中药材模板) ，80 (消毒类模板)',
  `is_medicare` tinyint(1) unsigned DEFAULT '0' COMMENT '是否医保 1=非医保, 2=甲类医保, 3=乙类医保',
  `medicare_code` char(32) DEFAULT '' COMMENT '医保编码',
  `medicare_top_price` int(10) unsigned DEFAULT '0' COMMENT '医保最高价格 单位：分',
  `bar_code` char(32) DEFAULT '' COMMENT '条形码',
  `mnemonic_code` varchar(255) DEFAULT '' COMMENT '助记码',
  `purchase_way` int(3) DEFAULT '140' COMMENT '购买方式：\r\n110=仅支持在电脑购买 \r\n120=仅支持在手机购买 \r\n130=支持手机和电脑购买\r\n140=仅展示，不支持购买（默认）',
  `wx_purchase_way` int(3) DEFAULT '110' COMMENT '购买方式：110=立即购买，购物车 120=商品仅供展示   130=可拨打订购电话+可预留订购信息   140=可拨打订购电话   150=可预留订购信息',
  `goods_code` varchar(50) DEFAULT '' COMMENT '商品编码',
  `yb_goods_id` int(11) DEFAULT '0' COMMENT '对应yb_goods.goods_id',
  `distribution_template` int(11) NOT NULL DEFAULT '0' COMMENT '分销商品模板id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '产品修改时间',
  PRIMARY KEY (`goods_id`,`site_id`),
  KEY `idx_appmum` (`approval_number`),
  KEY `idx_goods_title` (`goods_title`),
  KEY `idx_distribution_template` (`distribution_template`),
  KEY `idx_durg,idx_com` (`drug_name`,`com_name`),
  KEY `idx_cate_code` (`user_cateid`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165082 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_goods_has_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_goods_has_tag`;
CREATE TABLE `b_goods_has_tag` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品标签关联表',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应 b_goods.goods_id',
  `tags_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品标签表tags_id',
  `tags_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0=正常,1=删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_goods_id` (`goods_id`),
  KEY `idx_tags_id` (`tags_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_goods_icon_status
-- ----------------------------
DROP TABLE IF EXISTS `b_goods_icon_status`;
CREATE TABLE `b_goods_icon_status` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '已废弃',
  `platform_type` int(3) unsigned NOT NULL DEFAULT '110' COMMENT '当前使用的平台 110 (网站)，120（微信），130（app）9999（其它）',
  `show_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要根据药品类别在”商品详情页“上显示图标： 0=不显示图片 1=显示图标',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_goods_package
-- ----------------------------
DROP TABLE IF EXISTS `b_goods_package`;
CREATE TABLE `b_goods_package` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `package_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠包ID，主键',
  `package_title` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠包名称',
  `package_cover` varchar(50) DEFAULT '' COMMENT '优惠包封面',
  `package_goods_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠包中商品id，逗号分隔',
  `package_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用 0=禁用 1=启用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`package_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_goods_prebook
-- ----------------------------
DROP TABLE IF EXISTS `b_goods_prebook`;
CREATE TABLE `b_goods_prebook` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `prebook_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `prebook_phone` varchar(20) NOT NULL COMMENT '用户手机号码',
  `prebook_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `prebook_goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `prebook_goods_num` int(11) NOT NULL DEFAULT '1' COMMENT '预约商品数量',
  `prebook_clerk_id` int(11) NOT NULL DEFAULT '0' COMMENT '接单店员ID',
  `prebook_clerk` varchar(20) NOT NULL DEFAULT '' COMMENT '接单店员',
  `prebook_trades` varchar(20) NOT NULL DEFAULT '' COMMENT '订单交易号',
  `prebook_accept_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '接单时间',
  `prebook_trades_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单交易时间',
  `prebook_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店员接单状态，0未接单，1已接单，2已下单，3已关闭',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（即预约时间）',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`prebook_id`,`site_id`),
  KEY `prebook_phonex` (`prebook_phone`) USING BTREE,
  KEY `prebook_gnamex` (`prebook_goods_name`) USING BTREE,
  KEY `prebook_gidx` (`prebook_goods_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`prebook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_goods_synchro_log
-- ----------------------------
DROP TABLE IF EXISTS `b_goods_synchro_log`;
CREATE TABLE `b_goods_synchro_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品同步log表Id',
  `site_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) DEFAULT '0' COMMENT '商家good_id',
  `yb_goods_id` int(11) DEFAULT '0' COMMENT '对应51库good_id',
  `operate_type` int(11) DEFAULT '0' COMMENT '操作方式: 1 单个add, 2 单个update, 3 批量add, 4 批量update',
  `operate_status` int(11) DEFAULT '0' COMMENT '操作状态: 1 失败,2 成功',
  `synchro_type` int(11) DEFAULT '0' COMMENT '同步方式:0 不同步, 1 51库->商家库, 2 商家库->51库',
  `synchro_status` int(11) DEFAULT '0' COMMENT '同步状态:0 默认 1 失败 ,2 成功',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品同步log表';

-- ----------------------------
-- Table structure for b_goodsextd
-- ----------------------------
DROP TABLE IF EXISTS `b_goodsextd`;
CREATE TABLE `b_goodsextd` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `goodsextd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品扩展信息表',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `main_ingredient` text COMMENT '药品主要成分/产品参数(非药品类)',
  `goods_indications` text COMMENT '功能主治/功能介绍（非药品类)',
  `goods_action` text COMMENT '药理作用/产品特色(非药品类)',
  `adverse_reactioins` text COMMENT '不良反应',
  `goods_note` text COMMENT '注意事项',
  `goods_use_method` text COMMENT '用法用量',
  `goods_contd` text COMMENT '禁忌',
  `goods_desc` text COMMENT '产品详细描述',
  `goods_mobile_desc` text COMMENT '产品手机详细描述',
  `goods_description` text COMMENT '商品说明书',
  `browse_number` int(11) DEFAULT '0' COMMENT '商品被浏览数：（后期可以放到redis，或用BI去解决）',
  `trans_mumber` int(11) DEFAULT '0' COMMENT '成交数量',
  `shopping_number` int(11) DEFAULT '0' COMMENT '被添加到购物车次数',
  `product_date` date DEFAULT '0000-00-00' COMMENT '生产日期',
  `goods_usage` text COMMENT '使用方法（非药品类特有字段）',
  `goods_deposit` text COMMENT '存放（非药品类特有字段）',
  `forpeople_desc` text COMMENT '适用人群（非药品类特有字段）',
  `qualification` text COMMENT '产品资质',
  `goods_batch_no` varchar(500) DEFAULT '' COMMENT '商品批次号',
  `net_wt` varchar(32) DEFAULT '' COMMENT '净含量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`goodsextd_id`,`site_id`),
  KEY `idx_goods_id` (`goods_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`goodsextd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184524 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for b_help
-- ----------------------------
DROP TABLE IF EXISTS `b_help`;
CREATE TABLE `b_help` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `help_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户帮助页面信息',
  `help_type` int(11) DEFAULT '0' COMMENT '菜单级别：0 为顶级，1为2级，2为3级，后面类推',
  `help_title` varchar(100) DEFAULT '' COMMENT '菜单标题',
  `help_content` text COMMENT '内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`help_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`help_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_iconlib
-- ----------------------------
DROP TABLE IF EXISTS `b_iconlib`;
CREATE TABLE `b_iconlib` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `icon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信广告图标表',
  `icon_img_url` varchar(255) DEFAULT '' COMMENT '图标地址,完整链接,例如http://www.a.com/a.gif',
  `icon_is_system` int(11) DEFAULT '0' COMMENT '是否是系统自带图标1 是 0 否',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`icon_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`icon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='图标库';

-- ----------------------------
-- Table structure for b_iconlink
-- ----------------------------
DROP TABLE IF EXISTS `b_iconlink`;
CREATE TABLE `b_iconlink` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信活动表',
  `icon_id` int(11) DEFAULT '0' COMMENT '图标ID 对应b_iconlib.icon_id',
  `link_name` varchar(255) DEFAULT '0' COMMENT '图标名称',
  `link_url` varchar(255) DEFAULT '' COMMENT '图标链接的地址',
  `link_status` int(11) DEFAULT '0' COMMENT '链接状态',
  `link_sort` int(11) DEFAULT '0' COMMENT '排序',
  `link_item_num` int(11) DEFAULT '0' COMMENT '当前链接显示多少活动商品?',
  `link_type` int(11) DEFAULT '1' COMMENT '1:方块广告,不显示商品,2:带商品的分类',
  `platform_type` int(3) unsigned DEFAULT '120' COMMENT '当前使用的平台 110 (网站)，120（微信），130（app）9999（其它）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`link_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=544 DEFAULT CHARSET=utf8 COMMENT='图标类CMS广告';

-- ----------------------------
-- Table structure for b_im_recode
-- ----------------------------
DROP TABLE IF EXISTS `b_im_recode`;
CREATE TABLE `b_im_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�����¼��',
  `appid` varchar(255) DEFAULT NULL COMMENT '����Ӧ��appid',
  `msg` text COMMENT '��������',
  `receiver` varchar(2500) DEFAULT NULL COMMENT '消息接收账户',
  `sender` varchar(255) DEFAULT NULL COMMENT '���췢���û�',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `msg_type` tinyint(1) DEFAULT NULL COMMENT '1=文本,4=图片,8=一键呼叫',
  `is_race` tinyint(1) DEFAULT '1' COMMENT '1 不是抢答，0是抢答',
  `is_system_message` tinyint(1) DEFAULT '1' COMMENT '1 不是系统消息，0是系统消息',
  `site_id` int(11) NOT NULL DEFAULT '0',
  `store_admin_id` int(11) NOT NULL DEFAULT '0' COMMENT 'b_store_admin.id',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT 'yb_member.id',
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15856 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_im_service
-- ----------------------------
DROP TABLE IF EXISTS `b_im_service`;
CREATE TABLE `b_im_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天服务表',
  `sender` varchar(100) NOT NULL COMMENT '会员',
  `receiver` varchar(100) DEFAULT NULL COMMENT '店员',
  `first_reply_time` timestamp NULL DEFAULT NULL COMMENT '店员首次答复时间',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '会员聊天发起时间',
  `race_time` timestamp NULL DEFAULT NULL COMMENT '店员抢答时间',
  `im_end_time` timestamp NULL DEFAULT NULL COMMENT '聊天结束时间',
  `im_end_type` tinyint(1) DEFAULT NULL COMMENT '聊天结束类型 1=会员评价结束 2=店员超时 3=会员超时',
  `evaluate` tinyint(2) DEFAULT NULL COMMENT '会员评价 10=满意 6=一般 1=不满意',
  `race_status` tinyint(1) DEFAULT '0' COMMENT '是否有抢答 1=有 0=无',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `im_type` tinyint(1) DEFAULT '1' COMMENT '1为文字咨询，2为一键呼叫',
  `site_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`),
  KEY `idx_start_time` (`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=57114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_images_attr
-- ----------------------------
DROP TABLE IF EXISTS `b_images_attr`;
CREATE TABLE `b_images_attr` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '商品图片表',
  `hash` char(32) NOT NULL COMMENT '图片ID',
  `width` smallint(5) unsigned NOT NULL COMMENT '宽度',
  `height` smallint(5) unsigned NOT NULL COMMENT '高度',
  `size` mediumint(5) unsigned NOT NULL COMMENT '大小',
  `type` mediumint(5) unsigned DEFAULT '10' COMMENT '类型 10=jpg 20=png 30=gif',
  `host_id` char(32) DEFAULT 'a' COMMENT '服务器ID',
  `flag` tinyint(1) unsigned DEFAULT '0' COMMENT '图片状态 0 有效 1 无效',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `is_default` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是默认图 0 不是 1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行的时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_hash` (`hash`),
  KEY `idx_goods_id` (`goods_id`),
  KEY `idex_site_id` (`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88888900 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_images_attr_copy
-- ----------------------------
DROP TABLE IF EXISTS `b_images_attr_copy`;
CREATE TABLE `b_images_attr_copy` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '商品图片表',
  `hash` char(32) NOT NULL COMMENT '图片ID',
  `width` smallint(5) unsigned NOT NULL COMMENT '宽度',
  `height` smallint(5) unsigned NOT NULL COMMENT '高度',
  `size` mediumint(5) unsigned NOT NULL COMMENT '大小',
  `type` mediumint(5) unsigned DEFAULT '10' COMMENT '类型 10=jpg 20=png 30=gif',
  `host_id` char(32) DEFAULT 'a' COMMENT '服务器ID',
  `flag` tinyint(1) unsigned DEFAULT '0' COMMENT '图片状态 0 有效 1 无效',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `is_default` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是默认图 0 不是 1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行的时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_goods_id` (`site_id`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62753 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_integral
-- ----------------------------
DROP TABLE IF EXISTS `b_integral`;
CREATE TABLE `b_integral` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分设置表',
  `title` varchar(45) NOT NULL COMMENT '规则名',
  `use_case` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '使用场景 110=用户注册 120=购物消费 130=购物时抵扣积分',
  `type` int(3) unsigned DEFAULT '1' COMMENT '1=获取积分 2=消费积分',
  `add_type` int(5) NOT NULL DEFAULT '110' COMMENT '赠送方式(110 赠送一次，120 累计赠送，130 不同条件赠送）',
  `add_max` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '赠送上限',
  `subtract_type` int(5) NOT NULL DEFAULT '110' COMMENT '抵扣方式(110 抵扣一次，120 累加抵扣，直接抵扣）',
  `subtract_max` bigint(20) NOT NULL DEFAULT '0' COMMENT '抵扣上限',
  `value` text NOT NULL COMMENT '积分数',
  `integral_desc` text COMMENT '说明',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态: 0 （关闭） 1(开启)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100058 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_integral_goods
-- ----------------------------
DROP TABLE IF EXISTS `b_integral_goods`;
CREATE TABLE `b_integral_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '商家id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `num` int(10) unsigned DEFAULT '0' COMMENT '已使用积分兑换商品数量',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '积分商品软删除（0：表示软删除，默认为1）',
  `intrgral_exchanges` int(10) unsigned NOT NULL COMMENT '多少积分兑换商品',
  `store_ids` varchar(255) DEFAULT '' COMMENT '兑换自提门店',
  `status` tinyint(4) NOT NULL COMMENT '状态 0 未开始 10 进行中 20 已结束',
  `limit_count` int(10) unsigned DEFAULT '0' COMMENT '商品兑换上限',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '兑换开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '兑换结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ugoods_id` (`site_id`,`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='积分商品';

-- ----------------------------
-- Table structure for b_integral_rule
-- ----------------------------
DROP TABLE IF EXISTS `b_integral_rule`;
CREATE TABLE `b_integral_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '商家id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `type` tinyint(3) unsigned NOT NULL COMMENT '规则类型 10 注册送 20 签到送 30 完善信息送 40 下单满额送 50 咨询评价送 60 订单评价送',
  `rule` varchar(1024) NOT NULL COMMENT '规则json',
  `limit` int(10) unsigned DEFAULT '0' COMMENT '每日赠送上线',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 关闭 1开启',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='积分规则表\r\n';

-- ----------------------------
-- Table structure for b_integral_rule_log
-- ----------------------------
DROP TABLE IF EXISTS `b_integral_rule_log`;
CREATE TABLE `b_integral_rule_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL COMMENT '操作规则id',
  `rule_name` varchar(32) NOT NULL COMMENT '操作规则名',
  `before_status` tinyint(4) NOT NULL COMMENT '历史状态',
  `after_status` tinyint(4) NOT NULL COMMENT '修改之后的状态',
  `opateror_id` int(11) NOT NULL COMMENT '操作人id',
  `operator_name` varchar(32) NOT NULL COMMENT '操作人名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_rule_id` (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=857 DEFAULT CHARSET=utf8 COMMENT='规则修改记录表';

-- ----------------------------
-- Table structure for b_integrallog
-- ----------------------------
DROP TABLE IF EXISTS `b_integrallog`;
CREATE TABLE `b_integrallog` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分使用记录表',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `buyer_nick` varchar(45) DEFAULT '' COMMENT '会员名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '规则类型 10 注册送 20 签到送 30 完善信息送 40 下单满额送 50 咨询评价送 60 订单评价送 70 兑换',
  `integral_desc` varchar(45) DEFAULT '' COMMENT '说明',
  `integral_add` bigint(20) DEFAULT '0' COMMENT '获得积分',
  `integral_diff` bigint(20) DEFAULT '0' COMMENT '使用积分',
  `integral_overplus` bigint(20) DEFAULT '0' COMMENT '剩余积分',
  `mark` varchar(45) DEFAULT '' COMMENT '标识串号，如： 用户购买商品送积分，此处可以记录一下交易号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66672332 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_label
-- ----------------------------
DROP TABLE IF EXISTS `b_label`;
CREATE TABLE `b_label` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '服务保障标签表',
  `label_name` varchar(200) NOT NULL DEFAULT '' COMMENT '保障名称',
  `label_desc` varchar(200) DEFAULT '' COMMENT '描述',
  `icon_url` varchar(200) DEFAULT '' COMMENT '图标',
  `platform` int(11) DEFAULT NULL,
  `is_show` int(1) unsigned DEFAULT '0' COMMENT '是否显示（0不显示 1显示）',
  `is_active` tinyint(1) unsigned DEFAULT '1' COMMENT '是否有效 0=无效（删除） 1=有效',
  `deleted_at` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_level
-- ----------------------------
DROP TABLE IF EXISTS `b_level`;
CREATE TABLE `b_level` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lev_icon` varchar(255) DEFAULT '' COMMENT '图标地址',
  `lev_name` varchar(45) DEFAULT '' COMMENT '名称',
  `min_money` int(11) DEFAULT '0' COMMENT '成交金额最小值',
  `max_money` int(11) DEFAULT '0' COMMENT '成交金额最大值',
  `discount` int(11) DEFAULT '1000' COMMENT '折扣，1000分制，如：985 表示 9.85折，1000表示不打折',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_logistics_log
-- ----------------------------
DROP TABLE IF EXISTS `b_logistics_log`;
CREATE TABLE `b_logistics_log` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) DEFAULT NULL COMMENT '订单编号 唯一关联配送表',
  `waybill_number` varchar(50) DEFAULT NULL COMMENT '运单号',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态code',
  `inform_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '通知时间',
  `description` varchar(255) DEFAULT NULL COMMENT '描述（拒单原因）',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_order_number` (`order_number`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8435 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_logistics_order
-- ----------------------------
DROP TABLE IF EXISTS `b_logistics_order`;
CREATE TABLE `b_logistics_order` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `waybill_number` varchar(50) DEFAULT NULL COMMENT '运单号',
  `order_number` bigint(20) unsigned NOT NULL COMMENT '订单号',
  `logistics_id` int(10) NOT NULL COMMENT '物流方式id',
  `logistics_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `province` varchar(40) DEFAULT '' COMMENT '省',
  `city` varchar(40) DEFAULT '' COMMENT '市',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `store_name` varchar(80) NOT NULL DEFAULT '' COMMENT '门店名称',
  `order_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `order_amount` int(10) DEFAULT NULL COMMENT '订单金额（分）',
  `distribution_distance` int(6) DEFAULT NULL COMMENT '配送距离(米)',
  `total_fee` int(10) DEFAULT NULL COMMENT '总费用（分）',
  `total_weight` int(10) DEFAULT NULL COMMENT '总重量（克）',
  `starting_fare` int(10) DEFAULT NULL COMMENT '配送起步费（分）',
  `surpass_distance_fare` int(6) DEFAULT NULL COMMENT '超过起始距离资费（分）',
  `overweight_charge_fare` int(10) DEFAULT NULL COMMENT '超重资费（元）',
  `overtime_fare` int(10) DEFAULT NULL COMMENT '超时费用（分）',
  `chargeback_fare` int(10) DEFAULT NULL COMMENT '退单费用',
  `diliveryman` varchar(50) DEFAULT '' COMMENT '配送员姓名',
  `distribution_phone` bigint(11) DEFAULT NULL COMMENT '配送员电话',
  `status` tinyint(2) DEFAULT '0' COMMENT '配送的状态 0：已通知 | 接收成功  1：已接单 | 系统已接单 2：已接单 | 已分配到骑手 3：以接单 | 骑手已到店 4：已取单 | 配送中 5：已送达 | 已送达  6：已取消 | 已取消 7：拒绝接单 | 异常',
  `error_code` varchar(50) DEFAULT '' COMMENT '错误码',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operator_id` int(10) DEFAULT NULL COMMENT '手动变更操作员id',
  `notify_mobile` bigint(11) DEFAULT NULL COMMENT '操作员手机号',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_status` (`status`),
  KEY `idx_operator_id` (`operator_id`),
  KEY `idx_order_number` (`order_number`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1991 DEFAULT CHARSET=utf8 COMMENT='订单号';

-- ----------------------------
-- Table structure for b_logs
-- ----------------------------
DROP TABLE IF EXISTS `b_logs`;
CREATE TABLE `b_logs` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(64) DEFAULT '',
  `id_name` varchar(50) DEFAULT '' COMMENT '字段的名称',
  `table_id` bigint(19) unsigned DEFAULT '0' COMMENT '表中的id',
  `op_type` tinyint(1) unsigned DEFAULT '1' COMMENT '执行的操作 1=add 2=delete 3=update',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行的时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_mainclass
-- ----------------------------
DROP TABLE IF EXISTS `b_mainclass`;
CREATE TABLE `b_mainclass` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `mainclass_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主页分类表',
  `class_title` varchar(60) NOT NULL COMMENT '分类名称',
  `class_url` varchar(255) DEFAULT '' COMMENT '分类首图超链接',
  `class_imgurl` varchar(255) DEFAULT '' COMMENT '分类首图url',
  `isshow` int(1) DEFAULT '0' COMMENT '显示或隐藏: 0(显示)，1(隐藏)',
  `goods_arr` varchar(255) DEFAULT '[]' COMMENT '商品列表,存储商品的id,格式：["1288","99322","98077"]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `main_tag` int(11) NOT NULL DEFAULT '0' COMMENT '首页热销商品标识: 0（表示分类），1（首页热销商品 ）2 (首页分类导航)',
  `class_sort` int(11) DEFAULT '0' COMMENT '分类排序字段，数字越大越靠前，默认：0',
  `del_tag` int(11) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  PRIMARY KEY (`mainclass_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`mainclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_manager
-- ----------------------------
DROP TABLE IF EXISTS `b_manager`;
CREATE TABLE `b_manager` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '总部用户表',
  `username` varchar(255) DEFAULT '' COMMENT '登录用户名',
  `password` varchar(255) DEFAULT '' COMMENT '密码',
  `realname` varchar(20) DEFAULT '' COMMENT '姓名',
  `sex` tinyint(4) DEFAULT '3' COMMENT '性别1男 2女 3保密',
  `cellphone` varchar(20) DEFAULT '' COMMENT '手机号',
  `email` varchar(128) DEFAULT '' COMMENT '邮箱',
  `qq` varchar(20) DEFAULT '' COMMENT 'QQ',
  `is_active` tinyint(4) unsigned DEFAULT '1' COMMENT '是否激活 1激活 0未激活',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `login_count` int(11) unsigned DEFAULT '0' COMMENT '登录次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_manager_has_role
-- ----------------------------
DROP TABLE IF EXISTS `b_manager_has_role`;
CREATE TABLE `b_manager_has_role` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '总部用户角色对应表',
  `manager_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `platform` int(11) DEFAULT NULL COMMENT '所属平台 110YBZF后台；120A站后台；130门店后台',
  `store_id` int(11) DEFAULT '0' COMMENT '门店ID 对应 b_stores.id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5282 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_member
-- ----------------------------
DROP TABLE IF EXISTS `b_member`;
CREATE TABLE `b_member` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家会员表',
  `buyer_id` int(11) NOT NULL COMMENT '用户唯一id,对应 yb_member.member_id',
  `buyer_nick` varchar(60) DEFAULT '' COMMENT '用户昵称',
  `open_id` varchar(64) DEFAULT NULL COMMENT '对应表b_concern.open_id',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `passwd` varchar(60) DEFAULT '' COMMENT '密码',
  `sex` int(1) unsigned DEFAULT '3' COMMENT '性别: 0(女)，1（男） 3=保密',
  `email` varchar(60) DEFAULT '' COMMENT 'Email',
  `idcard_number` varchar(60) DEFAULT '' COMMENT '身份证号码',
  `order_num` int(11) DEFAULT '0' COMMENT '订单数',
  `order_fee` int(11) DEFAULT '0' COMMENT '总金额,以分为单位',
  `memo` text COMMENT '备注',
  `register_stores` int(11) NOT NULL DEFAULT '0' COMMENT '门店Id,对应b_stores.id',
  `register_clerks` bigint(20) DEFAULT '0' COMMENT '注册来源(店员ID),扫店员二维码关注注册, 对应b_store_adminext.id',
  `name` varchar(45) DEFAULT '' COMMENT '姓名',
  `last_ipaddr` varchar(15) DEFAULT '' COMMENT '最后一次登录IP',
  `integrate` bigint(20) unsigned DEFAULT '0' COMMENT '用户积分',
  `total_get_integrate` bigint(20) unsigned DEFAULT '0' COMMENT '获得积分',
  `total_consume_integrate` bigint(20) unsigned DEFAULT '0' COMMENT '使用积分',
  `mem_source` int(11) DEFAULT '110' COMMENT '用户来源: \r\n110 (网站)\r\n120（微信）\r\n130（app）\r\n140 (后台手工录入)\r\n 9999（其它）',
  `is_activated` tinyint(1) DEFAULT '1' COMMENT '是否激活 0=未激活 1=已激活 ',
  `ban_status` tinyint(1) DEFAULT '0' COMMENT '限制状态 -9=黑名单 -1=冻结 0=正常',
  `last_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次登录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `offline_integral` bigint(20) unsigned DEFAULT '0' COMMENT '用户线下积分',
  `first_erp` tinyint(1) DEFAULT '0' COMMENT '是否同步过erp 0 否 1 是',
  `label_ids` varchar(255) DEFAULT '' COMMENT '会员标签ID集合，对应b_member_label.id',
  PRIMARY KEY (`member_id`,`site_id`),
  UNIQUE KEY `uk_site_mobile` (`site_id`,`mobile`),
  KEY `idx_buyer_nick` (`buyer_nick`),
  KEY `idx_stores` (`register_stores`) USING BTREE,
  KEY `IX_create_time` (`create_time`),
  KEY `IX_mobile` (`mobile`),
  KEY `member_id` (`member_id`),
  KEY `uk_member_site_buyer` (`site_id`,`buyer_id`),
  KEY `idx_site_id` (`site_id`,`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15232816 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_member_bak
-- ----------------------------
DROP TABLE IF EXISTS `b_member_bak`;
CREATE TABLE `b_member_bak` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家会员表',
  `buyer_id` int(11) DEFAULT NULL COMMENT '用户唯一id,对应 yb_member.member_id',
  `buyer_nick` varchar(60) DEFAULT '' COMMENT '用户昵称',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `passwd` varchar(60) DEFAULT '' COMMENT '密码',
  `sex` int(1) unsigned DEFAULT '3' COMMENT '性别: 0(女)，1（男） 3=保密',
  `email` varchar(60) DEFAULT '' COMMENT 'Email',
  `idcard_number` varchar(60) DEFAULT '' COMMENT '身份证号码',
  `order_num` int(11) DEFAULT '0' COMMENT '订单数',
  `order_fee` int(11) DEFAULT '0' COMMENT '总金额,以分为单位',
  `memo` text COMMENT '备注',
  `register_stores` int(11) NOT NULL DEFAULT '0' COMMENT '门店Id,对应b_stores.id',
  `register_clerks` bigint(20) DEFAULT '0' COMMENT '注册来源(店员ID),扫店员二维码关注注册, 对应b_store_adminext.id',
  `name` varchar(45) DEFAULT '' COMMENT '姓名',
  `last_ipaddr` varchar(15) DEFAULT '' COMMENT '最后一次登录IP',
  `integrate` bigint(20) unsigned DEFAULT '0' COMMENT '用户积分',
  `total_get_integrate` bigint(20) unsigned DEFAULT '0' COMMENT '获得积分',
  `total_consume_integrate` bigint(20) unsigned DEFAULT '0' COMMENT '使用积分',
  `mem_source` int(11) DEFAULT '110' COMMENT '用户来源: \r\n110 (网站)\r\n120（微信）\r\n130（app）\r\n140 (后台手工录入)\r\n 9999（其它）',
  `is_activated` tinyint(1) DEFAULT '1' COMMENT '是否激活 0=未激活 1=已激活 ',
  `ban_status` tinyint(1) DEFAULT '0' COMMENT '限制状态 -9=黑名单 -1=冻结 0=正常',
  `last_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次登录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `offline_integral` bigint(20) unsigned DEFAULT '0' COMMENT '用户线下积分',
  `first_erp` tinyint(1) DEFAULT '0' COMMENT '是否同步过erp 0 否 1 是',
  PRIMARY KEY (`member_id`,`site_id`),
  KEY `idx_buyer_nick` (`buyer_nick`),
  KEY `idx_stores` (`register_stores`) USING BTREE,
  KEY `IX_create_time` (`create_time`),
  KEY `IX_mobile` (`mobile`),
  KEY `member_id` (`member_id`),
  KEY `uk_member_site_buyer` (`site_id`,`buyer_id`),
  KEY `idx_site_id` (`site_id`,`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15231995 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_member_checkin
-- ----------------------------
DROP TABLE IF EXISTS `b_member_checkin`;
CREATE TABLE `b_member_checkin` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL COMMENT '会员ID',
  `info` varchar(100) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_member_info
-- ----------------------------
DROP TABLE IF EXISTS `b_member_info`;
CREATE TABLE `b_member_info` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员信息扩展表',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户唯一id,对应b_member.buyer_id',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `concerned` tinyint(4) DEFAULT '0' COMMENT '是否关注服务号: 1 关注， 0：未关注',
  `concerned_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '首次关注时间',
  `integrate` int(11) DEFAULT '0' COMMENT '剩余积分',
  `integrate_used` int(11) DEFAULT '0' COMMENT '用掉的积分',
  `checkin_num` int(11) DEFAULT '0' COMMENT '连续签到数',
  `checkin_sum` int(11) DEFAULT '0' COMMENT '签到总数',
  `checkin_lasttime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次签到时间',
  `weixin_code` varchar(255) DEFAULT '' COMMENT '微信号',
  `qq` varchar(16) DEFAULT '' COMMENT 'QQ号',
  `membership_number` varchar(64) DEFAULT '' COMMENT '会员卡号',
  `barcode` varchar(64) DEFAULT '' COMMENT '条形码',
  `country` int(11) DEFAULT '1' COMMENT '国家编号： 默认 1（中国）',
  `province` int(11) DEFAULT '0' COMMENT '省编码',
  `city` int(11) DEFAULT '0' COMMENT '市编码',
  `area` int(11) DEFAULT '0' COMMENT '区编码',
  `address` varchar(255) DEFAULT '' COMMENT '会员地址',
  `tag` text COMMENT '标签',
  `age` smallint(4) DEFAULT '0' COMMENT '年龄',
  `yibao_card` varchar(64) DEFAULT '' COMMENT '医保卡号',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态：0 (正常) 10(禁用：限制登录，购买) 20（小黑屋）',
  `store_id` int(11) DEFAULT '0' COMMENT '门店ID，b_stores.id',
  `avatar` varchar(50) DEFAULT '' COMMENT '用户头像',
  `invite_code` varchar(50) DEFAULT '' COMMENT '邀请码',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `IX_invite_code` (`invite_code`),
  KEY `index_invite_code` (`invite_code`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300599 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_member_label
-- ----------------------------
DROP TABLE IF EXISTS `b_member_label`;
CREATE TABLE `b_member_label` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员标签唯一id',
  `crowd_name` varchar(50) DEFAULT '' COMMENT '人群名称',
  `store_ids` varchar(255) DEFAULT NULL COMMENT '人群归属：指定商家下的门店（可以多个）',
  `crowd_sort` int(11) NOT NULL DEFAULT '0' COMMENT '人群分类：自定义人群、推荐人群等',
  `crowd_type` int(11) DEFAULT '0' COMMENT '人群类型',
  `description` varchar(255) DEFAULT NULL COMMENT '人群用途说明',
  `scene` mediumtext COMMENT '应用场景',
  `count` int(11) DEFAULT '0' COMMENT '人群数量',
  `label_sort` int(11) DEFAULT '0' COMMENT '标签分类：基础标签，交易标签，健康标签',
  `label_group` varchar(255) DEFAULT '' COMMENT '标签组',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标签软删除（1：表示软删除，默认为0）',
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1634 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_member_test
-- ----------------------------
DROP TABLE IF EXISTS `b_member_test`;
CREATE TABLE `b_member_test` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家会员表',
  `buyer_id` int(11) DEFAULT NULL COMMENT '用户唯一id,对应 yb_member.member_id',
  `buyer_nick` varchar(60) DEFAULT '' COMMENT '用户昵称',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `passwd` varchar(60) DEFAULT '' COMMENT '密码',
  `sex` int(1) unsigned DEFAULT '3' COMMENT '性别: 0(女)，1（男） 3=保密',
  `email` varchar(60) DEFAULT '' COMMENT 'Email',
  `idcard_number` varchar(60) DEFAULT '' COMMENT '身份证号码',
  `order_num` int(11) DEFAULT '0' COMMENT '订单数',
  `order_fee` int(11) DEFAULT '0' COMMENT '总金额,以分为单位',
  `memo` text COMMENT '备注',
  `register_stores` int(11) NOT NULL DEFAULT '0' COMMENT '门店Id,对应b_stores.id',
  `register_clerks` bigint(20) DEFAULT '0' COMMENT '注册来源(店员ID),扫店员二维码关注注册, 对应b_store_adminext.id',
  `name` varchar(45) DEFAULT '' COMMENT '姓名',
  `last_ipaddr` varchar(15) DEFAULT '' COMMENT '最后一次登录IP',
  `integrate` bigint(20) unsigned DEFAULT '0' COMMENT '用户积分',
  `total_get_integrate` bigint(20) unsigned DEFAULT '0' COMMENT '获得积分',
  `total_consume_integrate` bigint(20) unsigned DEFAULT '0' COMMENT '使用积分',
  `mem_source` int(11) DEFAULT '110' COMMENT '用户来源: \r\n110 (网站)\r\n120（微信）\r\n130（app）\r\n140 (后台手工录入)\r\n 9999（其它）',
  `is_activated` tinyint(1) DEFAULT '1' COMMENT '是否激活 0=未激活 1=已激活 ',
  `ban_status` tinyint(1) DEFAULT '0' COMMENT '限制状态 -9=黑名单 -1=冻结 0=正常',
  `last_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次登录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_merchantAutho_log
-- ----------------------------
DROP TABLE IF EXISTS `b_merchantAutho_log`;
CREATE TABLE `b_merchantAutho_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `autho_code` varchar(64) NOT NULL COMMENT '授权码',
  `apply_reason` varchar(255) NOT NULL COMMENT '申请原因',
  `effective_time_length` int(11) DEFAULT '5' COMMENT '有效时间段',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生成时间',
  `finish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_message
-- ----------------------------
DROP TABLE IF EXISTS `b_message`;
CREATE TABLE `b_message` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推送消息表',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `store_admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '店员ID：若推给门店所有店员，此处应为空',
  `message_type` varchar(255) NOT NULL DEFAULT '' COMMENT '消息类型',
  `message_title` varchar(255) NOT NULL DEFAULT '' COMMENT '消息标题',
  `message_icon` varchar(255) NOT NULL DEFAULT '' COMMENT '消息icon',
  `message_summary` varchar(255) NOT NULL DEFAULT '' COMMENT '消息摘要',
  `message_content` varchar(255) NOT NULL DEFAULT '' COMMENT '消息内容',
  `message_whereabouts` varchar(255) NOT NULL DEFAULT '' COMMENT '消息点击后去向',
  `notification_title` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏标题',
  `notification_text` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏内容',
  `notification_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏图标',
  `notification_logo_url` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏图标URL',
  `notification_ring` int(1) NOT NULL DEFAULT '1' COMMENT '通知是否响铃 0 = 否; 1 = 是',
  `notification_vibrate` int(1) NOT NULL DEFAULT '1' COMMENT '通知是否震动 0 = 否; 1 = 是',
  `notification_clearable` int(1) NOT NULL DEFAULT '1' COMMENT '通知是否可清除 0 = 否; 1 = 是',
  `mandatory_reminder` int(1) NOT NULL DEFAULT '0' COMMENT '应用内强提醒 0 = 否; 1 = 是',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '消息是否被推送 0 = 未推送; 1 = 已推送',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext` varchar(1024) DEFAULT NULL COMMENT '扩展',
  `offline` int(1) NOT NULL DEFAULT '1' COMMENT '是否离线 1 = 离线，0 = 不离线',
  `wifi` int(1) NOT NULL DEFAULT '0' COMMENT 'wifi  0 = 不使用，1 = 使用',
  `push_id_list` varchar(1024) DEFAULT NULL COMMENT '被推送店员ID',
  `sound` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_create` (`create_time`) USING BTREE,
  KEY `idx_site_store` (`site_id`,`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3449 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_message_received
-- ----------------------------
DROP TABLE IF EXISTS `b_message_received`;
CREATE TABLE `b_message_received` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推送给店员信息表',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID ',
  `store_admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '店员ID',
  `b_message_id` int(11) NOT NULL DEFAULT '0' COMMENT '发送的消息ID,关联表 b_message.id',
  `message_type` varchar(25) NOT NULL DEFAULT '' COMMENT '消息类型',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '消息状态：0 未读，1 已读',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_create` (`create_time`) USING BTREE,
  KEY `idx_site_store` (`site_id`,`store_id`) USING BTREE,
  KEY `idx_storeAdmin` (`store_admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16569 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_message_sender
-- ----------------------------
DROP TABLE IF EXISTS `b_message_sender`;
CREATE TABLE `b_message_sender` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '个推送ID映射表',
  `store_admin_id` int(20) NOT NULL DEFAULT '0' COMMENT '用户ID,关联表 b_store_admin.id',
  `app_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `client_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '推送ID, 个推 client_id',
  `device_token` varchar(150) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'IOS设备唯一识别号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_stadmin` (`site_id`,`store_admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13806 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for b_message_setting
-- ----------------------------
DROP TABLE IF EXISTS `b_message_setting`;
CREATE TABLE `b_message_setting` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知消息模板设置表',
  `message_type` varchar(25) NOT NULL DEFAULT '' COMMENT '消息类型',
  `message_title` varchar(25) NOT NULL DEFAULT '' COMMENT '消息标题',
  `message_icon` varchar(255) NOT NULL DEFAULT '' COMMENT '消息icon',
  `message_summary` varchar(255) NOT NULL DEFAULT '' COMMENT '消息摘要',
  `message_content` varchar(255) NOT NULL DEFAULT '' COMMENT '消息内容',
  `message_whereabouts` varchar(255) NOT NULL DEFAULT '' COMMENT '消息点击后去向',
  `notification_title` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏标题',
  `notification_text` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏内容',
  `notification_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏图标',
  `notification_logo_url` varchar(255) NOT NULL DEFAULT '' COMMENT '通知栏图标URL',
  `notification_ring` int(1) NOT NULL DEFAULT '1' COMMENT '通知是否响铃 0 = 否; 1 = 是',
  `notification_vibrate` int(1) NOT NULL DEFAULT '1' COMMENT '通知是否震动 0 = 否; 1 = 是',
  `notification_clearable` int(1) NOT NULL DEFAULT '1' COMMENT '通知是否可清除 0 = 否; 1 = 是',
  `mandatory_reminder` int(1) NOT NULL DEFAULT '0' COMMENT '应用内强提醒 0 = 否; 1 = 是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ext` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展:一般做延时时间配置',
  `offline` int(2) NOT NULL DEFAULT '1' COMMENT '是否离线 1 = 离线，0 = 不离线',
  `wifi` int(2) NOT NULL DEFAULT '0' COMMENT 'wifi  0 = 不使用，1 = 使用',
  `sound` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_meta
-- ----------------------------
DROP TABLE IF EXISTS `b_meta`;
CREATE TABLE `b_meta` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `meta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '元素自增ID（微信）',
  `theme_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联微信主题Id',
  `meta_type` varchar(100) NOT NULL COMMENT '元素类别,大类,例如 link,icon ',
  `meta_val` text NOT NULL COMMENT '元素值 key=>val 哈希对应',
  `meta_status` int(11) DEFAULT '0' COMMENT '元素状态1 正常 2 未激活或未使用',
  `meta_key` varchar(255) NOT NULL COMMENT '元素键 key=>val 哈希对应key ',
  `meta_desc` varchar(255) DEFAULT NULL COMMENT 'meta descrition ',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`meta_id`,`site_id`),
  KEY `idx_meta` (`meta_type`,`meta_key`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`meta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1441 DEFAULT CHARSET=utf8 COMMENT='元素表';

-- ----------------------------
-- Table structure for b_migrate
-- ----------------------------
DROP TABLE IF EXISTS `b_migrate`;
CREATE TABLE `b_migrate` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `site_name` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '商家上线时间',
  PRIMARY KEY (`site_id`),
  KEY `idx_site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_mobile_wechat
-- ----------------------------
DROP TABLE IF EXISTS `b_mobile_wechat`;
CREATE TABLE `b_mobile_wechat` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信openID与会员关系对应表',
  `buyer_id` int(11) unsigned DEFAULT '0' COMMENT '会员ID,对应b_member.buyer_id, b_member_info.member_id',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `open_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信openID',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效(0有效 1删除)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `user_headimgurl` varchar(255) DEFAULT '' COMMENT 'User headimg which setting  from wechat',
  `user_is_sync` tinyint(1) DEFAULT '0' COMMENT 'is this user has been sync? 1 for yes , 0 for nil ',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_mobile` (`mobile`),
  KEY `idx_open_id` (`open_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225649 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_noBody_answer_im_recode
-- ----------------------------
DROP TABLE IF EXISTS `b_noBody_answer_im_recode`;
CREATE TABLE `b_noBody_answer_im_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '商家id',
  `app_id` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL COMMENT '发送者账户',
  `msgContent` varchar(255) DEFAULT NULL COMMENT '聊天内容',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15075 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_notice
-- ----------------------------
DROP TABLE IF EXISTS `b_notice`;
CREATE TABLE `b_notice` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告列表',
  `notice_title` varchar(255) NOT NULL COMMENT '标题',
  `notice_tag` varchar(255) DEFAULT '' COMMENT '标签',
  `author` varchar(255) DEFAULT '' COMMENT '作者，转载请注明出处',
  `content` text COMMENT '正文内容',
  `notice_memo` varchar(255) DEFAULT '' COMMENT '备注',
  `isshow` int(11) DEFAULT '0' COMMENT '是否显示: 10（不显示）， 11(显示)， 12（删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`notice_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_orders
-- ----------------------------
DROP TABLE IF EXISTS `b_orders`;
CREATE TABLE `b_orders` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '子订单',
  `order_id` bigint(19) unsigned NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_title` varchar(80) NOT NULL COMMENT '商品标题',
  `goods_price` int(11) NOT NULL COMMENT '商品单价(分)',
  `goods_num` int(11) NOT NULL COMMENT '数量',
  `goods_gifts` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否赠品，0否，1是',
  `approval_number` varchar(50) DEFAULT '' COMMENT '批准文号',
  `specif_cation` varchar(255) DEFAULT '' COMMENT '规格（100mg*100片）',
  `goods_category` int(11) DEFAULT '0' COMMENT '类别:  110(甲类非处方药)，120(已类非处方药)，13(0处方药)，140(双轨药)',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID',
  `goods_imgurl` varchar(255) DEFAULT '' COMMENT '商品图片地址',
  `orders_status` int(11) NOT NULL DEFAULT '110' COMMENT '交易状态:110(等侍买家付款),  120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，',
  `goods_code` varchar(50) DEFAULT '' COMMENT '商品编码',
  `yb_goods_id` int(11) unsigned DEFAULT '0' COMMENT '对应 yb_goods.goods_id',
  `goods_batch_no` varchar(500) DEFAULT '' COMMENT '商品批次号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `trades_snapshot` int(11) DEFAULT '0' COMMENT '交易快照ID',
  `refund_goods_code` varchar(255) CHARACTER SET utf32 DEFAULT '' COMMENT '退换货物编号',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_trades_id` (`trades_id`),
  KEY `IX_order_id` (`order_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=370708 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_orders_distribute
-- ----------------------------
DROP TABLE IF EXISTS `b_orders_distribute`;
CREATE TABLE `b_orders_distribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分销商订单',
  `order_id` bigint(19) unsigned NOT NULL DEFAULT '0' COMMENT '订单号',
  `goods_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '订单中的商品ID以及价格的json串',
  `goods_price` int(11) DEFAULT '0' COMMENT '商品单价',
  `goods_num` int(11) NOT NULL,
  `price` int(11) NOT NULL COMMENT '订单价格',
  `distributor_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推荐人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `buyer_id` varchar(20) NOT NULL DEFAULT '0' COMMENT '购买人ID',
  `site_id` int(11) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '1' COMMENT '0.退款  1.交易成功  2.交易结束',
  `store_money` int(11) NOT NULL DEFAULT '0' COMMENT '使用余额支付的金额',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4489 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_pay_api_log
-- ----------------------------
DROP TABLE IF EXISTS `b_pay_api_log`;
CREATE TABLE `b_pay_api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `trades_id` bigint(20) DEFAULT '0' COMMENT '商户交易ID',
  `trades_fee` int(11) DEFAULT NULL COMMENT '订单金额',
  `refund_no` bigint(20) DEFAULT '0' COMMENT '商户退款单号',
  `refund_fee` int(11) DEFAULT NULL COMMENT '退款金额',
  `refund_id` varchar(32) DEFAULT '' COMMENT '支付方退款单号',
  `transaction_id` varchar(32) DEFAULT '' COMMENT '支付方ID',
  `pay_style` varchar(30) NOT NULL COMMENT '买家支付方式: \r\nali(支付宝) ，\r\nwx_jsapi(微信jsapi),\r\nwx_native(微信native),\r\nwx_micropay(微信micropay),\r\nwx(微信默认)，\r\nuni(银联)',
  `pay_interface` varchar(30) NOT NULL COMMENT '支付接口：\r\n1.微信：\r\nwx_po（预生成订单）,\r\nwx_at（获取access_token）,\r\nwx_tk（获取ticket）,\r\nwx_pay(支付），\r\nwx_qr(订单查询），\r\nwx_rf(退款），\r\nwx_rv(撤销订单），\r\nwx_cls(关闭订单），\r\nwx_rfoqr（退款订单查询）,\r\nwx_cb(通知商户）,\r\nwx_gop(获取openid），\r\nwx_gat(获取access_token),\r\nwx_gtk(获取ticket）\r\n2.支付宝\r\nali_po(预生成订单），\r\nali_pay（支付），\r\nali_qr(订单查询），\r\nali_rf（退款），\r\nali_rfoqr(退款订单查询），\r\nali_cls(关闭订单），\r\nali_ccl(取消订单），\r\nali_co(创建订单），\r\nali_cb(通知商户）\r\n3.银联\r\nuni_pay(支付），\r\nuni_qr(查询），\r\nuni_rf(退款），\r\nuni_ud（取消），\r\nuni_cb(通知商户）\r\n\r\n\r\n\r\n\r\n',
  `pay_request` varchar(255) DEFAULT NULL,
  `pay_result` text COMMENT '接口返回结果',
  `exe_result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '接口执行结果\r\n1（成功），\r\n2（失败）,\r\n3（错误）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31068 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_paylogs
-- ----------------------------
DROP TABLE IF EXISTS `b_paylogs`;
CREATE TABLE `b_paylogs` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付记录',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID',
  `items_total` int(11) NOT NULL COMMENT '商品总价',
  `post_fee` int(11) NOT NULL COMMENT '快递费',
  `trades_total` int(11) NOT NULL COMMENT '订单总价',
  `platform_total` int(11) DEFAULT '0' COMMENT '支付平台手续费',
  `trades_split` int(11) DEFAULT '0' COMMENT '交易佣金',
  `total_fee` int(11) NOT NULL COMMENT '到帐金额（商家）',
  `pay_style` varchar(30) NOT NULL COMMENT '买家支付方式: \r\nali (支付宝) ，\r\nwx (微信)， \r\nbil(快钱) \r\nunionPay(银联)\r\nhealth_insurance（医保）\r\ncash（现金）',
  `pay_status` int(11) unsigned DEFAULT '0' COMMENT '支付状态（成功1失败0）',
  `callback_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付平台回调时间',
  `pay_result` text COMMENT '支付结果，原始结果',
  `yb_account` varchar(100) NOT NULL COMMENT '51jk 收款帐号',
  `seller_account` varchar(100) DEFAULT NULL COMMENT '商家收款帐号',
  `buyer_account` varchar(100) DEFAULT '' COMMENT '买家支付帐号',
  `assigned_stores` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派送货的门店ID',
  `trades_status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '交易状态:110(等侍买家付款), 120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，1',
  `confirm_goods_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '确认收货时间',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `buyer_id` int(11) NOT NULL COMMENT '买家ID',
  `pay_member` varchar(45) NOT NULL DEFAULT '0' COMMENT '支付交易号',
  `prescription_orders` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为处方药订单 0=不是处方药订单 1=处方药订单',
  `trades_store` int(11) unsigned DEFAULT '0' COMMENT '订单来源：门店ID，对应 b_stores.id',
  `account_checking_status` tinyint(1) unsigned DEFAULT '0' COMMENT '对账状态 0=未对账（默认） 1=已对账',
  `store_user_id` int(11) unsigned DEFAULT '0' COMMENT '服务店员ID(促销员)，对应 b_store_adminext.id',
  `store_shipping_clerk_id` int(11) unsigned DEFAULT '0' COMMENT '送货员（门店店员），对应b_store_admin.id',
  `recommend_user_id` int(11) unsigned DEFAULT '0' COMMENT '买家的推荐人（邀请员），对应 b_store_adminext.storeadmin_id=b_store_admin.id',
  `cashier_id` int(11) unsigned DEFAULT '0' COMMENT '收银员，对应b_store_admin.id',
  `stockup_user_id` int(11) unsigned DEFAULT '0' COMMENT '备货员,对应b_store_admin.id',
  `settlement_status` smallint(3) unsigned DEFAULT '100' COMMENT '资金可结算状态 100=不结算 150=待结算 200=可结算',
  `settlement_final_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`pay_id`,`site_id`),
  UNIQUE KEY `idx_trades_id` (`trades_id`) USING BTREE,
  KEY `idx_pay_member` (`pay_member`),
  KEY `idx_site_id` (`site_id`,`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73095 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_promotion_settings
-- ----------------------------
DROP TABLE IF EXISTS `b_promotion_settings`;
CREATE TABLE `b_promotion_settings` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `promotion_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '全站活动表',
  `promotion_type` int(5) unsigned DEFAULT '110' COMMENT '110=打折,120=包邮,130=满减,140=首单满减,150=会员日,160=限价促销',
  `promotion_name` varchar(300) NOT NULL DEFAULT '' COMMENT '活动名称',
  `promotion_tags` varchar(30) NOT NULL DEFAULT '' COMMENT '促销标签',
  `promotion_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `promotion_end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `promotion_desc` text COMMENT '活动描述',
  `promotion_join_user_level` varchar(200) DEFAULT '110' COMMENT '适用会员 110=普通会员，120=高级会员,130=VIP会员,140=至尊会员 多种用,分隔',
  `promotion_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '活动状态 0=未结束 1=已结束',
  `promotion_goods_range` tinyint(1) NOT NULL DEFAULT '0' COMMENT '参加商品 1=全部商品 2=指\n定部分 商品参加 3=指定部分商品不参加',
  `promotion_goods` longtext COMMENT '参加活动商品id 多个商品用,号隔开',
  `promotion_info` longtext COMMENT '活动规则内容',
  `integral_multiple` int(5) unsigned DEFAULT '1' COMMENT '送积分倍数',
  `buyer_days_type` int(3) unsigned DEFAULT '100' COMMENT '会员日类型  100=按日期 200=按星期【会员日用】',
  `buyer_days` varchar(200) DEFAULT '' COMMENT '会员日的值,逗号分隔【会员日用】',
  `show_tags` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示标签 0=不显示 1=显示',
  `calculate_order` int(3) unsigned DEFAULT '0' COMMENT '冲突时，是否按会员日计算 0=按活动 1=按会员日计算 ',
  `quantity_limit` varchar(200) DEFAULT '' COMMENT '限购条件设置',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`promotion_id`,`site_id`),
  KEY `IX_status` (`promotion_status`),
  KEY `idx_site_id` (`site_id`,`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_promotions_activity
-- ----------------------------
DROP TABLE IF EXISTS `b_promotions_activity`;
CREATE TABLE `b_promotions_activity` (
  `site_id` int(10) NOT NULL DEFAULT '0',
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `promotions_id` int(10) DEFAULT NULL COMMENT '规则id',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '活动开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '活动结束时间',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否显示在活动中心 0 不显示 1显示  2显示且打开首页时提醒（默认显示最近的一个优惠活动）',
  `template_pic` varchar(225) DEFAULT '' COMMENT '活动模版图片，显示在活动中心雷彪的图片',
  `intro` varchar(225) DEFAULT NULL COMMENT '活动描叙',
  `poster_pic` varchar(225) DEFAULT NULL COMMENT '活动海报',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态：0待发布(活动可编辑，草稿状态) 1发布中(未开始) 2发布中(已开始) 3定时发布(未到达发布时间，定时任务使用) 4过期结束(根据活动定义的时间结束) 5已发完结束(该活动下的所有优惠券已经发完) 6手动结束(手动停止发布优惠券活动)',
  `use_object` text COMMENT '针对对象，json串',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_promotions_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_promotions_detail`;
CREATE TABLE `b_promotions_detail` (
  `site_id` int(10) NOT NULL DEFAULT '0',
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `promotions_no` varchar(60) DEFAULT NULL COMMENT '优惠活动编码',
  `order_id` varchar(20) DEFAULT NULL COMMENT '订单id',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态0:已使用1:以退款',
  `activity_id` int(10) DEFAULT '0' COMMENT '优惠活动发放id   b_promotions_activity',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `refund_time` timestamp NULL DEFAULT NULL COMMENT '退款时间',
  `rule_id` int(10) DEFAULT '0' COMMENT '规则id表 b_promotions_rule',
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_promotions_rule
-- ----------------------------
DROP TABLE IF EXISTS `b_promotions_rule`;
CREATE TABLE `b_promotions_rule` (
  `site_id` int(10) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `promotions_type` int(4) DEFAULT '10' COMMENT '类型 10满赠活动 20打折活动 30包邮活动 ',
  `promotions_name` varchar(255) DEFAULT '' COMMENT '优惠名称',
  `label` varchar(126) DEFAULT '' COMMENT '优惠标签',
  `status` tinyint(2) DEFAULT '0' COMMENT '规则状态, 默认值是0，定义：0待发放 1正常(可发放) 2已发完 3已过期 4手动停发 5手动作废',
  `promotions_rule` text COMMENT '优惠规则 json串',
  `amount` int(6) DEFAULT '-1' COMMENT '库存 -1表示不限量',
  `time_rule` text COMMENT '时间规则 json',
  `is_first_order` tinyint(1) DEFAULT '0' COMMENT '是否首单 0不限  1首单',
  `order_type` varchar(126) DEFAULT '' COMMENT '订单类型 -1表示全部 100门店自提 101送货上门 102门店直购（app下单） 多选逗号隔开',
  `use_store` varchar(225) DEFAULT '' COMMENT '使用门店 -1表示全部门店  多个门店逗号隔开',
  `version` int(6) DEFAULT '0' COMMENT '用作锁机制',
  `total` int(6) DEFAULT '-1' COMMENT '总量-1表示不限量',
  `use_amount` int(11) DEFAULT '0' COMMENT '已使用数量',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_purchase
-- ----------------------------
DROP TABLE IF EXISTS `b_purchase`;
CREATE TABLE `b_purchase` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `status` smallint(11) unsigned NOT NULL DEFAULT '100' COMMENT '状态 100待处理 110处理中 120已处理 ',
  `product_name` varchar(32) NOT NULL DEFAULT '' COMMENT '商品名称',
  `purchase_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `manufacturer` varchar(100) NOT NULL DEFAULT '' COMMENT '生产厂家',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `cellphone` varchar(16) NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(60) DEFAULT '' COMMENT '邮箱',
  `remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '留言',
  `handle_result` varchar(1024) NOT NULL DEFAULT '' COMMENT '处理结果',
  `images` varchar(1024) NOT NULL DEFAULT '' COMMENT '附图JSON格式',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_qrcode_log
-- ----------------------------
DROP TABLE IF EXISTS `b_qrcode_log`;
CREATE TABLE `b_qrcode_log` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL COMMENT '会员手机号',
  `openid` varchar(64) DEFAULT NULL COMMENT '会员openid',
  `event_key` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_race_answer_recode
-- ----------------------------
DROP TABLE IF EXISTS `b_race_answer_recode`;
CREATE TABLE `b_race_answer_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�����¼��',
  `appid` varchar(255) DEFAULT NULL COMMENT '����Ӧ��appid',
  `receiver` varchar(255) DEFAULT NULL COMMENT '������Ϣ�����û�',
  `sender` varchar(255) DEFAULT NULL COMMENT '������Ϣ�����û�',
  `msg` text COMMENT '������Ϣ����',
  `isGet` char(1) DEFAULT NULL COMMENT '�Ƿ�����ɹ�',
  `isBreak` char(1) DEFAULT NULL COMMENT '������Ƿ�Ͽ�',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `send_race_answer_recode_time` timestamp NULL DEFAULT NULL COMMENT '���������ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3671 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_refund
-- ----------------------------
DROP TABLE IF EXISTS `b_refund`;
CREATE TABLE `b_refund` (
  `site_id` int(11) NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `operator_name` varchar(16) NOT NULL DEFAULT '' COMMENT '操作员名称',
  `merchant_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `merchant_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商家名称',
  `pay_style` varchar(30) NOT NULL DEFAULT '' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bill(快钱)',
  `status` smallint(6) unsigned NOT NULL DEFAULT '100' COMMENT '退款状态 100=申请退款  110=拒绝退款 120=退款成功 ',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `trade_id` char(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `trade_status` smallint(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `real_pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际付款金额 单位分',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费 单位分',
  `apply_refund_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '申请退款金额 单位分',
  `refund_serial_no` varchar(64) DEFAULT '' COMMENT '退款流水号',
  `real_refund_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际退款金额 单位分',
  `refund_cash` int(11) unsigned DEFAULT '0' COMMENT '现金部分退款',
  `refund_health_insurance` int(11) unsigned DEFAULT '0' COMMENT '医保部分退款',
  `is_refund_goods` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要退货 0不需要  1需要',
  `refund_express_no` varchar(64) NOT NULL DEFAULT '' COMMENT '退款快递号',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退货原因',
  `explain` varchar(512) NOT NULL DEFAULT '' COMMENT '退货说明',
  `voucher` varchar(1024) NOT NULL DEFAULT '' COMMENT '退货图片凭证 JSON',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '是否删除',
  `refund_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '退款时间',
  `account_checking_status` tinyint(1) DEFAULT '0' COMMENT '对账状态 0=待处理 1=已处理',
  `operator_type` smallint(3) unsigned DEFAULT '100' COMMENT '操作者类型 100=用户 200=商户',
  `is_refund_integral` tinyint(3) unsigned DEFAULT '0' COMMENT '是否退还积分 0=不退还 1=退还',
  `is_refund_coupon` tinyint(3) unsigned DEFAULT '0' COMMENT '是否退还优惠券 0=不退还 1=退还',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  UNIQUE KEY `idx_trade_id` (`trade_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11689 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_reissue_coupon_activity_record
-- ----------------------------
DROP TABLE IF EXISTS `b_reissue_coupon_activity_record`;
CREATE TABLE `b_reissue_coupon_activity_record` (
  `site_id` int(11) NOT NULL COMMENT '商户 id',
  `reissue_id` int(11) NOT NULL COMMENT '补发优惠券操作日志',
  `total_num` int(11) DEFAULT NULL,
  `success_num` int(11) DEFAULT NULL COMMENT '补发的成功数',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `reissue_manager_id` int(11) NOT NULL COMMENT '补发的实际操作者',
  `reissue_manager_name` varchar(255) NOT NULL COMMENT '补发的实际操作者名称',
  `activity_id` int(11) NOT NULL COMMENT '补发的活动id',
  PRIMARY KEY (`site_id`,`reissue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_reissue_coupon_activity_record_copy
-- ----------------------------
DROP TABLE IF EXISTS `b_reissue_coupon_activity_record_copy`;
CREATE TABLE `b_reissue_coupon_activity_record_copy` (
  `site_id` int(11) NOT NULL COMMENT '商户 id',
  `reissue_id` int(11) NOT NULL COMMENT '补发优惠券操作日志',
  `total_num` int(11) DEFAULT NULL,
  `success_num` int(11) DEFAULT NULL COMMENT '补发的成功数',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `reissue_manager_id` int(11) NOT NULL COMMENT '补发的实际操作者',
  `reissue_manager_name` varchar(255) NOT NULL COMMENT '补发的实际操作者名称',
  `activity_id` int(11) NOT NULL COMMENT '补发的活动id',
  PRIMARY KEY (`site_id`,`reissue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_role
-- ----------------------------
DROP TABLE IF EXISTS `b_role`;
CREATE TABLE `b_role` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '色角表',
  `platform` smallint(6) unsigned DEFAULT '0' COMMENT '所属平台 110YBZF后台；120A站后台；130门店后台',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID 对应b_stores.id',
  `name` varchar(255) DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(1024) DEFAULT '' COMMENT '角色描述',
  `permissions` text COMMENT '权限组',
  `is_active` tinyint(4) unsigned DEFAULT '1' COMMENT '是否激活 1是；0否 默认1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111364 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_send_race_answer_recode
-- ----------------------------
DROP TABLE IF EXISTS `b_send_race_answer_recode`;
CREATE TABLE `b_send_race_answer_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '���������¼��',
  `appid` varchar(255) DEFAULT NULL COMMENT '����Ӧ��appid',
  `receiver` varchar(1000) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL COMMENT '������Ϣ�����˻�',
  `msg` text COMMENT '������Ϣ����',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isGet` char(1) DEFAULT NULL COMMENT '���͵�������Ϣ�Ƿ�����������',
  `msg_type` tinyint(1) DEFAULT NULL COMMENT '1=文本,4=图片,8=一键呼叫',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71180 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_servce_doctor
-- ----------------------------
DROP TABLE IF EXISTS `b_servce_doctor`;
CREATE TABLE `b_servce_doctor` (
  `site_id` int(10) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '服务类医生表',
  `goods_id` int(10) DEFAULT NULL COMMENT '关联商品表goods_id',
  `doctor_img` varchar(255) DEFAULT '' COMMENT '医生头像url',
  `doctor_name` varchar(125) DEFAULT '' COMMENT '医生姓名',
  `doctor_phone` varchar(20) DEFAULT '' COMMENT '医生手机号',
  `sex` tinyint(2) DEFAULT '1' COMMENT '0女 1男 3保密',
  `doctor_position` varchar(125) DEFAULT '' COMMENT '医生职称',
  `describe` text COMMENT '擅长描叙',
  `honour` text COMMENT '荣誉',
  `introduce` text COMMENT '介绍',
  `stores` text COMMENT '指定门店',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 0正常 1停止',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_servce_order
-- ----------------------------
DROP TABLE IF EXISTS `b_servce_order`;
CREATE TABLE `b_servce_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '服务类订单扩展表(预约表）',
  `site_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT '门店id',
  `trades_id` varchar(60) DEFAULT NULL COMMENT '关联订单表trades_id',
  `use_detail_id` int(11) DEFAULT NULL COMMENT '关联b_servce_use_detail的id',
  `booking_no` varchar(50) DEFAULT '' COMMENT '预约号',
  `use_count` int(5) DEFAULT NULL COMMENT '使用次数',
  `amount` int(5) DEFAULT NULL COMMENT '总次数',
  `serve_status` tinyint(2) DEFAULT '0' COMMENT '服务状态  0待就诊 1未签到 2服务暂停 3已取消 4签到 5退款',
  `schedule_person_id` int(11) DEFAULT NULL COMMENT '预约人id关联b_contact_person表的id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品的id关联b_goods表的goods_id字段',
  `diagnose_status` tinyint(4) DEFAULT '1' COMMENT '初复诊 初诊 1 复诊 2 ',
  `disease_info` text COMMENT '疾病信息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_servce_template
-- ----------------------------
DROP TABLE IF EXISTS `b_servce_template`;
CREATE TABLE `b_servce_template` (
  `site_id` int(10) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '模版id  服务类医生模版表',
  `store_id` int(11) DEFAULT NULL,
  `template_no` varchar(40) DEFAULT NULL COMMENT '模版no',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `account_source` int(5) DEFAULT '0' COMMENT '模版号源数',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否被删除 0正常 1删除',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_servce_use_detail
-- ----------------------------
DROP TABLE IF EXISTS `b_servce_use_detail`;
CREATE TABLE `b_servce_use_detail` (
  `site_id` int(11) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '服务类医生使用详情表',
  `store_id` int(10) DEFAULT NULL COMMENT '门店id',
  `template_no` varchar(40) DEFAULT NULL COMMENT '模版表id',
  `mine_classes_id` int(10) DEFAULT NULL COMMENT '模版表排版id',
  `use_count` int(5) DEFAULT NULL COMMENT '剩余预约数',
  `account_source` int(5) DEFAULT NULL COMMENT '号源数',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id 对应b_goods表中的goods_id',
  `use_time` date DEFAULT NULL COMMENT '排班日期年月日',
  `status` tinyint(2) DEFAULT '0' COMMENT '排班状态 0正常 1取消排班 2已过期',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_service_comment
-- ----------------------------
DROP TABLE IF EXISTS `b_service_comment`;
CREATE TABLE `b_service_comment` (
  `site_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天ID',
  `comment_rank` int(2) NOT NULL COMMENT '评价等级',
  `comment_context` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `chat_enter` int(5) NOT NULL COMMENT '聊天入口 1代表 订单',
  `chat_terr` int(5) NOT NULL COMMENT '聊天平台 1代表微信',
  `client_name` varchar(50) NOT NULL COMMENT '客户姓名',
  `client_phone` varchar(15) NOT NULL COMMENT '客户手机',
  `service_name` varchar(50) NOT NULL COMMENT '客服姓名',
  `service_phone` varchar(15) NOT NULL COMMENT '客服手机',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '评价时间',
  PRIMARY KEY (`chat_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_service_rule
-- ----------------------------
DROP TABLE IF EXISTS `b_service_rule`;
CREATE TABLE `b_service_rule` (
  `id` int(11) NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `cancellation_time` int(11) DEFAULT NULL COMMENT '针对免费预约：取消时间（预约日期前x小时可以取消预约）',
  `punishment_switch` int(10) DEFAULT NULL COMMENT '惩罚措施的开关（是否开启惩罚措施）1:开启，0:关闭',
  `limit_day` int(10) DEFAULT NULL COMMENT '限制取消天数：x天内取消预约（在x天内取消的，惩罚生效）',
  `limit_order_times` int(10) DEFAULT NULL COMMENT '限制签到次数；（即取消次数，惩罚启用时生效）',
  `limit_order_days` int(10) DEFAULT NULL COMMENT '限制预约天数；x天内不能预约（惩罚启用时生效）',
  `order_rule` varchar(255) DEFAULT NULL COMMENT '预约规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `b_sms_log`;
CREATE TABLE `b_sms_log` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信发送记录表',
  `ext_id` bigint(11) unsigned DEFAULT '0' COMMENT '外部ID',
  `store_id` int(11) unsigned DEFAULT '0' COMMENT '指派的门店ID',
  `type` int(11) DEFAULT NULL COMMENT '类别: 1订单提醒',
  `send_msg` varchar(1024) DEFAULT NULL COMMENT '发送信息',
  `return_msg` varchar(1024) DEFAULT NULL COMMENT '返回信息',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113194 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_statics_records
-- ----------------------------
DROP TABLE IF EXISTS `b_statics_records`;
CREATE TABLE `b_statics_records` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `statics_name` varchar(100) NOT NULL COMMENT '统计类型',
  `statics_value` text NOT NULL COMMENT '统计值',
  `statics_type` int(11) DEFAULT '0' COMMENT '对应类型分类',
  `statics_desc` varchar(255) NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`site_id`,`statics_name`,`create_time`),
  KEY `idx_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计记录表';

-- ----------------------------
-- Table structure for b_stockup
-- ----------------------------
DROP TABLE IF EXISTS `b_stockup`;
CREATE TABLE `b_stockup` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '备货单记录',
  `stockup_id` varchar(20) NOT NULL COMMENT '备货单号',
  `trades_id` bigint(20) NOT NULL COMMENT '订单号id',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `clerk_id` int(11) DEFAULT NULL COMMENT '店员id',
  `stockup_status` int(11) DEFAULT '110' COMMENT '备货状态（110 未备货 120 已备货）',
  `stockup_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '备货时间',
  `shipping_status` int(11) DEFAULT '110' COMMENT '发货状态(110 未发货 120 已发货)',
  `shipping_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发货时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_stockup_trades_id` (`trades_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60946 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_store_admin
-- ----------------------------
DROP TABLE IF EXISTS `b_store_admin`;
CREATE TABLE `b_store_admin` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店员表',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '账号',
  `user_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `user_type` int(11) unsigned DEFAULT '1' COMMENT '用户组 1=管理员 2=店员',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '店员状态 1=有效 0=无效',
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登入时间',
  `login_count` int(11) unsigned DEFAULT '0' COMMENT '登入次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `countIndex` double(11,2) DEFAULT NULL COMMENT '指标总分（除动态分外）',
  `chat` tinyint(1) DEFAULT '1' COMMENT '店员是否参加聊天1=参加,0=不参加',
  PRIMARY KEY (`id`,`site_id`),
  KEY `is_del` (`is_del`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_user_name` (`user_name`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100890 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_store_admin_100190
-- ----------------------------
DROP TABLE IF EXISTS `b_store_admin_100190`;
CREATE TABLE `b_store_admin_100190` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店员表',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '账号',
  `user_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `user_type` int(11) unsigned DEFAULT '1' COMMENT '用户组 1=管理员 2=店员',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '店员状态 1=有效 0=无效',
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登入时间',
  `login_count` int(11) unsigned DEFAULT '0' COMMENT '登入次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `countIndex` double(11,2) DEFAULT NULL COMMENT '指标总分（除动态分外）',
  `chat` tinyint(1) DEFAULT '1' COMMENT '店员是否参加聊天1=参加,0=不参加',
  PRIMARY KEY (`id`,`site_id`),
  KEY `is_del` (`is_del`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_user_name` (`user_name`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100864 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_store_admin_deploy
-- ----------------------------
DROP TABLE IF EXISTS `b_store_admin_deploy`;
CREATE TABLE `b_store_admin_deploy` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_admin_id` int(11) NOT NULL COMMENT '店员ID，b_store_admin.id',
  `pre_store_id` int(11) NOT NULL COMMENT '原来所属的分店ID，b_stores.id',
  `new_store_id` int(11) NOT NULL COMMENT '调配后所属的分店ID，b_stores.id',
  `operator_id` int(11) NOT NULL COMMENT '执行调配操作的ID，b_store_admin.id',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_store_adminext
-- ----------------------------
DROP TABLE IF EXISTS `b_store_adminext`;
CREATE TABLE `b_store_adminext` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店员扩展信息表',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `storeadmin_id` int(11) unsigned DEFAULT '0' COMMENT '对应b_store_admin.id',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `name` varchar(45) DEFAULT '' COMMENT '姓名',
  `sex` int(1) unsigned NOT NULL DEFAULT '3' COMMENT '性别: 0(女)，1（男） 3=保密',
  `idcard_number` varchar(60) DEFAULT '' COMMENT '身份证号码',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `age` smallint(4) DEFAULT '0' COMMENT '年龄',
  `email` varchar(60) DEFAULT '' COMMENT 'Email',
  `qq` varchar(15) DEFAULT '' COMMENT 'QQ号',
  `clerk_job` varchar(100) DEFAULT '' COMMENT '店员职业',
  `memo` text COMMENT '备注',
  `clerk_invitation_code` varchar(255) DEFAULT '' COMMENT '店员邀请码',
  `qrcode_url` varchar(200) NOT NULL DEFAULT '' COMMENT '店员推荐公众号二维码url',
  `employee_number` varchar(30) DEFAULT '' COMMENT '员工工号',
  `storeadmin_status` tinyint(1) unsigned DEFAULT '1' COMMENT '会员状态 1=有效 0=无效',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `avatar` varchar(50) DEFAULT '' COMMENT '店员头像',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_store_id` (`store_id`) USING BTREE,
  KEY `idx_storeadmin_id` (`storeadmin_id`) USING BTREE,
  KEY `clerk_invitation_code` (`clerk_invitation_code`) USING BTREE,
  KEY `index_clerk_invitation_code` (`clerk_invitation_code`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3679 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_store_adminext_100190
-- ----------------------------
DROP TABLE IF EXISTS `b_store_adminext_100190`;
CREATE TABLE `b_store_adminext_100190` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店员扩展信息表',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `storeadmin_id` int(11) unsigned DEFAULT '0' COMMENT '对应b_store_admin.id',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `name` varchar(45) DEFAULT '' COMMENT '姓名',
  `sex` int(1) unsigned NOT NULL DEFAULT '3' COMMENT '性别: 0(女)，1（男） 3=保密',
  `idcard_number` varchar(60) DEFAULT '' COMMENT '身份证号码',
  `birthday` date DEFAULT '0000-00-00' COMMENT '生日',
  `age` smallint(4) DEFAULT '0' COMMENT '年龄',
  `email` varchar(60) DEFAULT '' COMMENT 'Email',
  `qq` varchar(15) DEFAULT '' COMMENT 'QQ号',
  `clerk_job` varchar(100) DEFAULT '' COMMENT '店员职业',
  `memo` text COMMENT '备注',
  `clerk_invitation_code` varchar(255) DEFAULT '' COMMENT '店员邀请码',
  `qrcode_url` varchar(200) NOT NULL DEFAULT '' COMMENT '店员推荐公众号二维码url',
  `employee_number` varchar(30) DEFAULT '' COMMENT '员工工号',
  `storeadmin_status` tinyint(1) unsigned DEFAULT '1' COMMENT '会员状态 1=有效 0=无效',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `avatar` varchar(50) DEFAULT '' COMMENT '店员头像',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_store_id` (`store_id`) USING BTREE,
  KEY `idx_storeadmin_id` (`storeadmin_id`) USING BTREE,
  KEY `clerk_invitation_code` (`clerk_invitation_code`) USING BTREE,
  KEY `index_clerk_invitation_code` (`clerk_invitation_code`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3063 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_store_delivery
-- ----------------------------
DROP TABLE IF EXISTS `b_store_delivery`;
CREATE TABLE `b_store_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `post_style` varchar(255) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_stores
-- ----------------------------
DROP TABLE IF EXISTS `b_stores`;
CREATE TABLE `b_stores` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '门店信息表',
  `stores_number` varchar(30) NOT NULL DEFAULT '' COMMENT '门店编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '药店名称',
  `is_qjd` tinyint(1) DEFAULT '0' COMMENT '旗舰店(1 是 0 否)',
  `type` tinyint(1) DEFAULT '1' COMMENT '直营店 1 加盟店2 ',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店所属城市',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店所属区域',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '店地址',
  `baidu_lat` varchar(30) NOT NULL DEFAULT '' COMMENT '百度坐标 纬度',
  `baidu_lng` varchar(30) NOT NULL DEFAULT '' COMMENT '百度坐标  经度',
  `gaode_lng` varchar(30) DEFAULT NULL COMMENT '高德地图 经度',
  `gaode_lat` varchar(30) DEFAULT NULL COMMENT '高德地图 纬度',
  `map_flag` tinyint(1) DEFAULT '0' COMMENT '坐标是否标注: 1 是 0 否',
  `store_imgs` text COMMENT '门店图片',
  `tel` varchar(100) NOT NULL DEFAULT '' COMMENT '门店电话',
  `business_time` varchar(100) DEFAULT '' COMMENT '门店值班时间',
  `feature` varchar(1000) DEFAULT '' COMMENT '门店特色',
  `summary` varchar(1000) DEFAULT '' COMMENT '门店简介',
  `qr_code_img` varchar(200) DEFAULT '' COMMENT '二维码id',
  `qr_code_type` tinyint(1) DEFAULT '1' COMMENT '二维码是否带logo (1 是 0 否)',
  `stores_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0=禁用 1=启用)',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '门店软删除（0：表示软删除，默认为1）',
  `province` varchar(60) DEFAULT '' COMMENT '省',
  `city` varchar(60) DEFAULT '' COMMENT '市',
  `service_support` varchar(200) DEFAULT '' COMMENT '支持服务 150=送货上门 160=门店自提,多种服务请用逗号连接',
  `self_token_time` varchar(100) DEFAULT '' COMMENT '自提时间',
  `delivery_time` varchar(100) DEFAULT '' COMMENT '送货时间',
  `remind_mobile` varchar(200) DEFAULT '' COMMENT '提醒手机,多个手机号码之间用逗号隔开',
  `country` varchar(60) DEFAULT '' COMMENT '区',
  `own_pricing_type` tinyint(2) unsigned DEFAULT '0' COMMENT '自主定价(默认0,1允许)',
  `own_promotion_type` tinyint(2) unsigned DEFAULT '0' COMMENT '自主创建优惠活动(默认0,1允许)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `origin_shop_id` varchar(100) DEFAULT NULL COMMENT '门店唯一ID，调用达达物流时用到',
  PRIMARY KEY (`id`,`site_id`),
  KEY `stores_number` (`stores_number`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_stores_100190
-- ----------------------------
DROP TABLE IF EXISTS `b_stores_100190`;
CREATE TABLE `b_stores_100190` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '门店信息表',
  `stores_number` varchar(30) NOT NULL DEFAULT '' COMMENT '门店编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '药店名称',
  `is_qjd` tinyint(1) DEFAULT '0' COMMENT '旗舰店(1 是 0 否)',
  `type` tinyint(1) DEFAULT '1' COMMENT '直营店 1 加盟店2 ',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店所属城市',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店所属区域',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '店地址',
  `baidu_lat` varchar(30) NOT NULL DEFAULT '' COMMENT '百度坐标 纬度',
  `baidu_lng` varchar(30) NOT NULL DEFAULT '' COMMENT '百度坐标  经度',
  `gaode_lng` varchar(30) DEFAULT NULL COMMENT '高德地图 经度',
  `gaode_lat` varchar(30) DEFAULT NULL COMMENT '高德地图 纬度',
  `map_flag` tinyint(1) DEFAULT '0' COMMENT '坐标是否标注: 1 是 0 否',
  `store_imgs` text COMMENT '门店图片',
  `tel` varchar(100) NOT NULL DEFAULT '' COMMENT '门店电话',
  `business_time` varchar(100) DEFAULT '' COMMENT '门店值班时间',
  `feature` varchar(1000) DEFAULT '' COMMENT '门店特色',
  `summary` varchar(1000) DEFAULT '' COMMENT '门店简介',
  `qr_code_img` varchar(200) DEFAULT '' COMMENT '二维码id',
  `qr_code_type` tinyint(1) DEFAULT '1' COMMENT '二维码是否带logo (1 是 0 否)',
  `stores_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0=禁用 1=启用)',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '门店软删除（0：表示软删除，默认为1）',
  `province` varchar(60) DEFAULT '' COMMENT '省',
  `city` varchar(60) DEFAULT '' COMMENT '市',
  `service_support` varchar(200) DEFAULT '' COMMENT '支持服务 150=送货上门 160=门店自提,多种服务请用逗号连接',
  `self_token_time` varchar(100) DEFAULT '' COMMENT '自提时间',
  `delivery_time` varchar(100) DEFAULT '' COMMENT '送货时间',
  `remind_mobile` varchar(200) DEFAULT '' COMMENT '提醒手机,多个手机号码之间用逗号隔开',
  `country` varchar(60) DEFAULT '' COMMENT '区',
  `own_pricing_type` tinyint(2) unsigned DEFAULT '0' COMMENT '自主定价(默认0,1允许)',
  `own_promotion_type` tinyint(2) unsigned DEFAULT '0' COMMENT '自主创建优惠活动(默认0,1允许)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `origin_shop_id` varchar(100) DEFAULT NULL COMMENT '门店唯一ID，调用达达物流时用到',
  PRIMARY KEY (`id`,`site_id`),
  KEY `stores_number` (`stores_number`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_stores_has_promotion
-- ----------------------------
DROP TABLE IF EXISTS `b_stores_has_promotion`;
CREATE TABLE `b_stores_has_promotion` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动Id',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '0表示全部门店 非0为具体门店',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 启用 1 禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  UNIQUE KEY `idx_promotion_store_id` (`promotion_id`,`store_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_stores_promotion_settings
-- ----------------------------
DROP TABLE IF EXISTS `b_stores_promotion_settings`;
CREATE TABLE `b_stores_promotion_settings` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `promotion_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '全站活动表',
  `promotion_type` int(5) unsigned DEFAULT '110' COMMENT '110=打折,120=包邮,130=满减,140=首单满减,150=会员日,160=限价促销',
  `promotion_name` varchar(300) NOT NULL DEFAULT '' COMMENT '活动名称',
  `promotion_tags` varchar(30) NOT NULL DEFAULT '' COMMENT '促销标签',
  `promotion_start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始时间',
  `promotion_end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '结束时间',
  `promotion_desc` text COMMENT '活动描述',
  `promotion_join_user_level` varchar(200) DEFAULT '110' COMMENT '适用会员 110=普通会员，120=高级会员,130=VIP会员,140=至尊会员 多种用,分隔',
  `promotion_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '活动状态 0=未结束 1=已结束',
  `promotion_goods_range` tinyint(1) NOT NULL DEFAULT '0' COMMENT '参加商品 1=全部商品 2=指\n定部分 商品参加 3=指定部分商品不参加',
  `promotion_goods` text COMMENT '参加活动商品id 多个商品用,号隔开',
  `promotion_stores_range` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '参加门店范围 1=全部门店 2=指定部分门店参加 3=指定部分门店不参加',
  `promotion_stores` text COMMENT '参加活动的门店id 多个商品用,号隔开',
  `promotion_info` text COMMENT '活动规则内容',
  `integral_multiple` int(5) unsigned DEFAULT '1' COMMENT '送积分倍数',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建门店ID',
  `show_tags` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示标签 0=不显示 1=显示',
  `quantity_limit` varchar(200) DEFAULT '' COMMENT '限购条件设置',
  `store_number` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '涉及门店数量',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`promotion_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_tags
-- ----------------------------
DROP TABLE IF EXISTS `b_tags`;
CREATE TABLE `b_tags` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `tags_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品标签表',
  `tags_name` varchar(255) NOT NULL COMMENT '标签名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del_tag` int(11) DEFAULT '0' COMMENT '删除标签, 0:正常   1：删除',
  PRIMARY KEY (`tags_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`tags_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1272 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_target
-- ----------------------------
DROP TABLE IF EXISTS `b_target`;
CREATE TABLE `b_target` (
  `target_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ָ�������',
  `owner` int(11) NOT NULL COMMENT '�̼�ID',
  `target_name` varchar(255) NOT NULL COMMENT 'ָ������',
  `second_weigth_value` double(11,2) NOT NULL,
  `use_status` char(255) NOT NULL COMMENT 'ʹ��״̬',
  `first_weigth_id` int(11) NOT NULL COMMENT 'һ��Ȩ��id',
  `initial_value` int(11) DEFAULT NULL,
  `score_parameter_section` varchar(255) DEFAULT NULL COMMENT '������������',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL,
  `reference_value` double(11,2) DEFAULT NULL COMMENT '�ο�ֵ',
  PRIMARY KEY (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_target_record
-- ----------------------------
DROP TABLE IF EXISTS `b_target_record`;
CREATE TABLE `b_target_record` (
  `target_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ָ',
  `site_id` int(11) NOT NULL COMMENT '�̼�id',
  `storeadmin_id` varchar(255) NOT NULL COMMENT '��Աid',
  `target_record` varchar(500) NOT NULL COMMENT 'ָ',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`target_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35424 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_task
-- ----------------------------
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '商户编号',
  `name` varchar(32) NOT NULL COMMENT '任务名称',
  `target_id` int(10) unsigned NOT NULL COMMENT '任务指标id',
  `type_ids` varchar(255) NOT NULL COMMENT '统计类型列表 用,分隔',
  `time_type` tinyint(3) unsigned NOT NULL COMMENT '任务时间 10 自然日 20 自然周 30 自然月',
  `object` tinyint(3) unsigned NOT NULL COMMENT '任务对象 10 门店 20 店员',
  `reward_type` tinyint(4) NOT NULL COMMENT '任务奖励 10 人民币 20 绩效',
  `reward_detail` varchar(255) DEFAULT NULL COMMENT '奖励规则 存json',
  `explain` varchar(255) DEFAULT '' COMMENT '说明',
  `status` tinyint(3) unsigned NOT NULL COMMENT '任务状态 10 未开始 20 进行中 30 已结束 40 已删除',
  `admin_type` tinyint(3) unsigned DEFAULT '10' COMMENT '创建人类型 10 总部账号 20 门店店员账号',
  `admin_id` int(10) unsigned NOT NULL COMMENT '账号id',
  `admin_name` varchar(32) NOT NULL COMMENT '账号名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Table structure for b_task_blob
-- ----------------------------
DROP TABLE IF EXISTS `b_task_blob`;
CREATE TABLE `b_task_blob` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned DEFAULT NULL COMMENT '任务id',
  `goods_id` text COMMENT '商品id列表用,分隔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表 大字段存储在这个表';

-- ----------------------------
-- Table structure for b_taskplan
-- ----------------------------
DROP TABLE IF EXISTS `b_taskplan`;
CREATE TABLE `b_taskplan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` mediumint(8) unsigned NOT NULL COMMENT '商户编号',
  `name` varchar(32) NOT NULL COMMENT '任务计划名称',
  `task_ids` varchar(255) NOT NULL COMMENT '任务id列表用,分隔',
  `join_typ` tinyint(4) NOT NULL DEFAULT '10' COMMENT '发送对象 10 门店 20 店员',
  `join_map` varchar(255) NOT NULL COMMENT '发送对象映射 存json',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_type` varchar(255) NOT NULL COMMENT '任务有效日类型 10 每天 20 每周 30 每月',
  `day_num` varchar(255) DEFAULT '' COMMENT '每天 这个字段为空 每周 1,2,3,4,5,6,7 每月1,2,....31',
  `source_type` tinyint(4) DEFAULT '10' COMMENT '发送者 10 总部 20 门店',
  `app_position` tinyint(4) DEFAULT '10' COMMENT 'app显示位置 10 任务列表页',
  `explan` varchar(255) DEFAULT '' COMMENT '说明',
  `status` tinyint(4) NOT NULL COMMENT '计划状态 10 未开始 20 进行中 30 已结束 40 软删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='任务计划表';

-- ----------------------------
-- Table structure for b_taskreward
-- ----------------------------
DROP TABLE IF EXISTS `b_taskreward`;
CREATE TABLE `b_taskreward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL COMMENT '任务id',
  `task_name` varchar(32) NOT NULL COMMENT '任务名',
  `store_admin_id` int(10) unsigned DEFAULT NULL COMMENT '店员编号',
  `store_admin_name` varchar(32) DEFAULT NULL COMMENT '店员名称',
  `reward_type` tinyint(4) NOT NULL COMMENT '任务奖励 10 人民币 20 绩效',
  `reward` int(11) DEFAULT '0' COMMENT '奖励值 根据reward_type区分 如果是人名币 单位是分  奖励是正数  惩罚是负数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务奖励表';

-- ----------------------------
-- Table structure for b_trades
-- ----------------------------
DROP TABLE IF EXISTS `b_trades`;
CREATE TABLE `b_trades` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易流水号（交易表）',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID由：seller_id+年(取后两位)月日+每天的交易流水号 组合成唯一的交易ID(seller_id:商家唯一id,id为交易流水号)',
  `seller_id` int(11) NOT NULL COMMENT '商家ID(yb_merchant)',
  `buyer_id` int(11) NOT NULL COMMENT '买家唯一id,对应yb_member.id',
  `seller_nick` varchar(255) DEFAULT '' COMMENT '商家名称',
  `buyer_nick` varchar(255) DEFAULT '' COMMENT '买家昵称',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `pay_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款时间',
  `end_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '交易成功时间',
  `consign_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商家发货时间',
  `receiver_phone` varchar(20) DEFAULT '' COMMENT '收货人电话',
  `recevier_mobile` varchar(20) NOT NULL COMMENT '收货人电话号码',
  `recevier_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `receiver_city` varchar(60) DEFAULT '' COMMENT '收货人所在城市',
  `receiver_address` varchar(255) NOT NULL COMMENT '收货人详细地址',
  `receiver_zip` varchar(11) DEFAULT '' COMMENT '收货人所在地区邮编',
  `seller_pay_no` varchar(255) NOT NULL COMMENT '商家收款帐号',
  `seller_phone` varchar(20) DEFAULT '' COMMENT '商家电话',
  `seller_mobile` varchar(20) DEFAULT '' COMMENT '商家手机',
  `seller_name` varchar(200) DEFAULT '' COMMENT '商家姓名',
  `trades_status` int(11) unsigned NOT NULL DEFAULT '110' COMMENT '交易状态:110(等侍买家付款), 120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，200( 待取货|待自提，直购和自提专用),210（ 已取货|已自提 直购和自提专用），900（已退款），220(用户确认收货)，230(门店确认收货)，800（系统确认收货）,240(已取消【门店自提待自提后可取消订单】)',
  `is_refund` smallint(4) unsigned DEFAULT '0' COMMENT '是否有申请退款 默认为0(无退款申请) 大于0表示有退款 100=等待受理（退款中）  110=受理失败 （拒绝退款）120=退款成功',
  `closed_resion` int(11) DEFAULT '0' COMMENT '订单关闭原因,: 110(不想买了)，120(缺货)，130(拍错了，重拍)  其它（9999）',
  `total_fee` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品金额（商品价格乘以数量）。精确到2位小数，单位：分。',
  `post_fee` int(11) DEFAULT '0' COMMENT '配送费/快递费，单位分',
  `real_pay` int(11) unsigned DEFAULT '0' COMMENT '商品实际支付金额=商品总金额+运费-积分抵扣的 单位：分。',
  `trades_split` int(11) DEFAULT '0' COMMENT '交易佣金,单位分',
  `plat_split` int(11) DEFAULT '0' COMMENT '支付平台收取的费用，以分为单位',
  `post_style` int(11) DEFAULT '130' COMMENT '配送方式：110(卖家包邮),120(平邮),130(快递),140(EMS),150(送货上门),160(门店自提)，170(门店直销)，180(货到付款),9999(其它)',
  `O2O_freight` int(11) DEFAULT NULL COMMENT 'O2O第三方配送费用(目前只有蜂鸟配送)，是指51jk收取商家的费用',
  `delivery_name` varchar(255) DEFAULT '' COMMENT '物流配送方式名',
  `post_id` int(11) DEFAULT '0' COMMENT '快递公司编号,对应物流公司表中的主键(yb_logcompany)',
  `post_name` varchar(20) DEFAULT '' COMMENT '快递名称',
  `post_number` varchar(255) DEFAULT '' COMMENT '快递单号',
  `buyer_message` varchar(255) DEFAULT '' COMMENT '买家留言',
  `seller_memo` varchar(255) DEFAULT '' COMMENT '卖家备注',
  `buyer_flag` int(11) DEFAULT '0' COMMENT '买家备注旗帜：1（红）、2（黄）、3（绿）、4（蓝)、5(紫) ',
  `seller_flag` int(11) DEFAULT '0' COMMENT '卖家备注旗帜: 1（红）、2（黄）、3（绿）、4（蓝)、5(紫) ',
  `delv_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计送达时间，对应快递模板中的appoint_delvtime或def_delvtime',
  `delv_desc` varchar(255) DEFAULT '' COMMENT '预计到货时间，现在是一段文字描述',
  `confirm_goods_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '确认收货时间',
  `buyer_pay_no` varchar(255) DEFAULT '' COMMENT '买家支付帐号',
  `pay_style` varchar(30) DEFAULT '' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)， unionPay(银联)， health_insurance（医保），cash（现金）',
  `pay_number` varchar(255) DEFAULT '' COMMENT '支付交易号',
  `trades_source` int(11) DEFAULT '110' COMMENT '订单来源: 110 (网站)，120（微信），130（app）, 140（店员帮用户下单），9999（其它）',
  `trades_invoice` int(11) DEFAULT '0' COMMENT '是否要发票: 0(不需要)，1（需要）',
  `invoice_title` varchar(255) DEFAULT '' COMMENT '发票抬头',
  `trades_store` int(11) unsigned DEFAULT '0' COMMENT '订单来源门店,对应 b_stores.id',
  `self_taken_store` int(11) DEFAULT '0' COMMENT '自提门店,对应 b_stores.id',
  `self_taken_code` char(10) DEFAULT '' COMMENT '提货码（自提方式发货后生成）',
  `self_taken_code_start` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '提货开始时间',
  `self_taken_code_expires` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '提货码过期时间',
  `self_taken_code_checktime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '自提码验证通过时间',
  `assigned_stores` int(11) DEFAULT NULL COMMENT '指派送货的门店,对应 b_stores.id，当assigned_stores为0时就是说明是总部发的货',
  `stockup_status` int(11) DEFAULT '110' COMMENT '备货状态（110 未备货 120 已备货）',
  `shipping_status` int(11) unsigned DEFAULT '110' COMMENT '发货状态(110 未发货 120 已发货) 9999=确认收货',
  `prescription_orders` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为处方药订单 0=不是处方药订单 1=处方药订单',
  `lng` double DEFAULT '0' COMMENT '经度',
  `lat` double DEFAULT '0' COMMENT '纬度',
  `store_user_id` int(11) unsigned DEFAULT '0' COMMENT '服务店员ID(促销员)，对应 b_store_adminext.storeadmin_id',
  `store_shipping_clerk_id` int(11) unsigned DEFAULT '0' COMMENT '送货员（门店店员），对应b_store_admin.id',
  `recommend_user_id` int(11) unsigned DEFAULT '0' COMMENT '买家的推荐人（邀请员）,对应b_store_admin.id',
  `cashier_id` int(11) unsigned DEFAULT '0' COMMENT '收银员,对应b_store_admin.id',
  `stockup_user_id` int(11) unsigned DEFAULT '0' COMMENT '备货员,对应b_store_admin.id',
  `user_paying` tinyint(3) unsigned DEFAULT '0' COMMENT '是否正在付款 0=否 1=是',
  `trades_del` int(11) DEFAULT '0' COMMENT '订单软删除（1：表示软删除，默认为0）',
  `trades_rank` tinyint(2) unsigned DEFAULT '0' COMMENT '订单评分',
  `trades_rank_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '订单评分时间',
  `settlement_status` smallint(3) unsigned DEFAULT '100' COMMENT '资金可结算状态 100=不结算 150=待结算 200=可结算  250=已结算',
  `settlement_final_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结算时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `settlement_type` tinyint(2) DEFAULT '0' COMMENT '0 直购，1分销，2 预存金',
  `create_order_assigned_stores` int(11) DEFAULT NULL COMMENT '送货上门时系统分的最优门店',
  `budgetdate` varchar(20) DEFAULT NULL,
  `is_payment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 表示未付款  1 表示已付款  默认为0',
  `remit_account_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '划账状态 0=待处理；1=已处理',
  `account_checking_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对账状态 0=待处理 1=已处理',
  `deal_finish_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易结束状态 0=交易进行中 1=交易结束',
  `servce_type` tinyint(4) DEFAULT NULL COMMENT '是否是服务类商品 100预约服务',
  `distributor_id` int(11) NOT NULL DEFAULT '0',
  `finance_no` varchar(30) DEFAULT NULL COMMENT '账单编号(唯一关联yb_finances)',
  `refund_fee` int(11) DEFAULT NULL COMMENT '退款金额',
  PRIMARY KEY (`id`,`site_id`),
  UNIQUE KEY `idx_trades_id` (`trades_id`) USING BTREE,
  KEY `idx_trades_store` (`trades_store`) USING BTREE,
  KEY `idx_trades_status` (`trades_status`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`id`) USING BTREE,
  KEY `com_id` (`site_id`,`assigned_stores`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91672 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_trades_comments
-- ----------------------------
DROP TABLE IF EXISTS `b_trades_comments`;
CREATE TABLE `b_trades_comments` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评价表',
  `comment_rank` int(11) NOT NULL COMMENT '评分级别 1-5分',
  `comment_content` varchar(255) DEFAULT '' COMMENT '评价内容',
  `buyer_nick` varchar(255) DEFAULT '' COMMENT '买家昵称',
  `trades_id` varchar(255) DEFAULT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `is_show` int(2) unsigned DEFAULT '1' COMMENT '是否显示（0,不显示 1 显示）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评价创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`,`site_id`),
  UNIQUE KEY `uk_trade_order_id` (`trades_id`,`goods_id`) USING BTREE,
  KEY `idx_trades_id` (`trades_id`),
  KEY `idx_un_trades_ids` (`trades_id`,`goods_id`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2381 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_trades_ext
-- ----------------------------
DROP TABLE IF EXISTS `b_trades_ext`;
CREATE TABLE `b_trades_ext` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `trades_ext_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '交易扩展表',
  `trades_id` bigint(20) unsigned DEFAULT NULL COMMENT '对应 b_trades.trades_id',
  `original_goods_data` text COMMENT '交易相关商品信息（暂未使用）',
  `integral_used` int(11) unsigned DEFAULT '0' COMMENT '使用的积分',
  `integral_pre_award` int(11) unsigned DEFAULT '0' COMMENT '欲送积分',
  `integral_final_award` int(11) unsigned DEFAULT '0' COMMENT '实送积分（参与最终计算的结果）',
  `is_first_order` tinyint(1) unsigned DEFAULT '0' COMMENT '是否用户第一笔订单 0=否 1=是',
  `integral_price` int(11) unsigned DEFAULT '0' COMMENT '积分抵扣的金额 单位：分',
  `reduce_reduction_amount` int(11) NOT NULL DEFAULT '0' COMMENT '满减减少金额',
  `bj_discount_amount` int(11) NOT NULL DEFAULT '0' COMMENT '第二件半价活动优惠金额',
  `user_coupon_id` int(11) unsigned DEFAULT '0' COMMENT '使用优惠券ID',
  `user_coupon_amount` int(11) unsigned DEFAULT '0' COMMENT '优惠券抵扣金额',
  `trades_rank_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单评分时间',
  `trades_rank` tinyint(2) unsigned DEFAULT '0' COMMENT '订单评分',
  `cash_payment_pay` int(11) unsigned DEFAULT '0' COMMENT '现金付款金额 单位：分',
  `medical_insurance_card_pay` int(11) unsigned DEFAULT '0' COMMENT '医保卡付款金额 单位：分',
  `line_breaks_pay` int(11) unsigned DEFAULT '0' COMMENT '线下优惠金额 单位：分',
  `cash_receipt_note` text COMMENT '现金收款备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`trades_ext_id`,`site_id`),
  KEY `idx_trades_id` (`trades_id`),
  KEY `idx_site_id` (`site_id`,`trades_ext_id`)
) ENGINE=InnoDB AUTO_INCREMENT=347448 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_trades_records
-- ----------------------------
DROP TABLE IF EXISTS `b_trades_records`;
CREATE TABLE `b_trades_records` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `statics_name` varchar(100) NOT NULL COMMENT '统计类型',
  `statics_value` text NOT NULL COMMENT '统计值',
  `statics_type` int(11) DEFAULT '0' COMMENT '对应类型分类',
  `statics_desc` varchar(255) NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`site_id`,`statics_name`,`create_time`),
  KEY `idx_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计记录表';

-- ----------------------------
-- Table structure for b_tradeslogs
-- ----------------------------
DROP TABLE IF EXISTS `b_tradeslogs`;
CREATE TABLE `b_tradeslogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易流水号（交易日志记录表）',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID由：seller_id+年(取后两位)月日+每天的交易流水号 组合成唯一的交易ID(seller_id:商家唯一id,id为交易流水号)',
  `seller_id` int(11) NOT NULL COMMENT '商家ID(yb_merchant)',
  `buyer_id` int(11) NOT NULL COMMENT '买家唯一id,对应yb_member.id',
  `old_trades_status` int(11) unsigned DEFAULT NULL COMMENT '原交易状态',
  `new_trades_status` int(11) unsigned DEFAULT NULL COMMENT '新交易状态',
  `stockup_status` int(11) DEFAULT '110' COMMENT '备货状态（110 未备货 120 已备货)',
  `shipping_status` int(11) unsigned DEFAULT '110' COMMENT '发货状态(110 未发货 120 已发货) 9999=确认收货',
  `source_business` varchar(255) DEFAULT '' COMMENT '业务来源',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=68759 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_trans_analysis_records
-- ----------------------------
DROP TABLE IF EXISTS `b_trans_analysis_records`;
CREATE TABLE `b_trans_analysis_records` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '元素自增ID',
  `statics_name` varchar(100) NOT NULL COMMENT '统计类型',
  `statics_value` text NOT NULL COMMENT '统计值',
  `statics_desc` varchar(255) NOT NULL COMMENT '描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`,`site_id`),
  UNIQUE KEY `uk_siteid_time` (`site_id`,`statics_name`,`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=217466 DEFAULT CHARSET=utf8 COMMENT='统计交易分析记录表';

-- ----------------------------
-- Table structure for b_trigger
-- ----------------------------
DROP TABLE IF EXISTS `b_trigger`;
CREATE TABLE `b_trigger` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `trigger_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `trigger_name` varchar(50) NOT NULL DEFAULT '' COMMENT '触发器名称',
  `trigger_code` varchar(30) NOT NULL DEFAULT '' COMMENT '触发器代码，实例：ordershare、register',
  `trigger_type` varchar(30) NOT NULL DEFAULT '' COMMENT '触发器类型，关联到表model',
  `trigger_vals` varchar(255) NOT NULL DEFAULT '' COMMENT '值，json 格式',
  `trigger_title` varchar(50) NOT NULL DEFAULT '' COMMENT '触发器(或活动)标题',
  `trigger_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '触发器(或活动)描述',
  `trigger_icon` varchar(255) NOT NULL DEFAULT '' COMMENT '触发器(或活动)icon',
  `trigger_store` text COMMENT '触发器参加的活动店面ID,只有店员分享使用该字段, -1代表全部门店参加',
  `trigger_state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态: 0 正常(进行中), 1: 未开始,2: 结束(手动结束), 3: 已过期, 4: 优惠券已发完',
  `trigger_setting` varchar(500) NOT NULL DEFAULT '' COMMENT '设置',
  `trigger_issue_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发放时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trigger_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '触发器开始时间',
  `trigger_end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '触发器结束时间',
  `trigger_dispatch_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '优惠券派送类别 0： 只发1张，1：发所有，2：随机发',
  `trigger_dispatch_count` int(11) NOT NULL DEFAULT '0' COMMENT '触发器发放优惠券数量',
  `trigger_use_count` int(11) NOT NULL DEFAULT '0' COMMENT '触发器优惠券使用数量',
  PRIMARY KEY (`trigger_id`,`site_id`),
  KEY `idx_trigger_tdtimex` (`trigger_start`,`trigger_end`) USING BTREE,
  KEY `idx_trigger_codex` (`trigger_code`,`trigger_state`) USING BTREE,
  KEY `idx_trigger_title` (`trigger_title`),
  KEY `idx_trigger_use_count` (`trigger_use_count`),
  KEY `IX_trigger_state` (`trigger_state`),
  KEY `idx_site_id` (`site_id`,`trigger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `b_user_coupon`;
CREATE TABLE `b_user_coupon` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `user_coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户优惠券',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID,关联b_coupon.coupon_id',
  `user_coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '用户优惠券代码',
  `user_coupon_amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券金额,单位：分',
  `user_coupon_mobile` varchar(100) DEFAULT NULL COMMENT '用户手机号',
  `buyer_id` int(11) DEFAULT '0' COMMENT '用户ID,允许未空,用户输入手机可以先获取优惠券,注册后再进行绑定',
  `user_coupon_from` int(11) DEFAULT '0' COMMENT '优惠券来源: 0: 系统红包, 1:订单分享, 2:首单送券, 3:注册赠送,  4:订单满额,  5:店员分享,  6:用户领券',
  `user_coupon_from_desc` varchar(200) DEFAULT '' COMMENT '优惠券来源中文描述,可以为空',
  `user_coupon_state` int(11) DEFAULT '0' COMMENT '优惠券状态: 0 正常, 1: 已经使用,2: 过期 , 3: 被删除（软删除）',
  `user_coupon_from_val` varchar(255) DEFAULT '' COMMENT '用户优惠券来源值',
  `user_coupon_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'COUPON START TIME',
  `user_coupon_end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'COUPON EXPIRE  TIME',
  `user_coupon_sub_amount` int(11) DEFAULT '0' COMMENT '用户优惠券具体抵扣金额',
  `user_coupon_usetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券使用时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券开始时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_coupon_id`,`site_id`),
  UNIQUE KEY `key_coupon_code` (`user_coupon_code`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`) USING BTREE,
  KEY `key_coupon_end` (`user_coupon_end`) USING BTREE,
  KEY `key_coupon_state` (`user_coupon_state`) USING BTREE,
  KEY `un_coupon_state` (`user_coupon_state`,`user_coupon_end`) USING BTREE,
  KEY `buyer_idx` (`buyer_id`) USING BTREE,
  KEY `user_coupon_fromx` (`user_coupon_from`) USING BTREE,
  KEY `user_coupon_mobilex` (`user_coupon_mobile`) USING BTREE,
  KEY `idx_site_id` (`site_id`,`user_coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209398 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_WebPage
-- ----------------------------
DROP TABLE IF EXISTS `b_WebPage`;
CREATE TABLE `b_WebPage` (
  `site_id` int(11) NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL COMMENT 'ip',
  `url` text COMMENT '页面地址',
  `store_id` int(10) unsigned DEFAULT '0' COMMENT '门店id',
  `web_pages` varchar(40) NOT NULL COMMENT '网页描述',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `member_id` varchar(40) DEFAULT NULL COMMENT '会员id',
  `open_id` varchar(60) DEFAULT NULL COMMENT '微信id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `left_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '离开时间',
  `uv_type` int(10) DEFAULT '0' COMMENT '埋点类型0：微信商城，1：APP',
  `storeadmin_id` int(11) DEFAULT NULL COMMENT '对应b_store_admin.id(店员id)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `javen_test` (`create_time`) USING BTREE,
  KEY `test_javen` (`site_id`),
  KEY `aaaaa` (`web_pages`),
  KEY `bbbbb` (`goods_id`),
  KEY `ccccc` (`member_id`),
  KEY `dddd` (`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39768 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_wx_ads
-- ----------------------------
DROP TABLE IF EXISTS `b_wx_ads`;
CREATE TABLE `b_wx_ads` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `ads_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信广告',
  `theme_id` int(11) DEFAULT '0' COMMENT '关联 微信主题Id',
  `type` int(11) unsigned DEFAULT '110' COMMENT '110=幻灯片 120=热销 130=推荐类目 140=首页分类',
  `title` varchar(200) DEFAULT '' COMMENT '名称',
  `links` varchar(255) DEFAULT '' COMMENT '连接地址',
  `ads_img` varchar(255) DEFAULT '' COMMENT '幻灯片图',
  `icon` varchar(100) DEFAULT '' COMMENT '图标',
  `list_order` int(11) unsigned DEFAULT '0' COMMENT '排序 越大越靠前',
  `status` tinyint(1) DEFAULT '1' COMMENT '-1=删除 0=禁用 1=启用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ads_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`ads_id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_wx_autoreply
-- ----------------------------
DROP TABLE IF EXISTS `b_wx_autoreply`;
CREATE TABLE `b_wx_autoreply` (
  `site_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信回复',
  `reply_type` int(11) unsigned NOT NULL DEFAULT '130' COMMENT '回复类型 110=被添加自动回复 120=消息自动回复 130=关键词自动回复',
  `rule_name` varchar(255) DEFAULT '' COMMENT '规则名',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `reply_content` text COMMENT '文字',
  `del_tag` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '删除标签 0=删除 1=正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for b_wx_login
-- ----------------------------
DROP TABLE IF EXISTS `b_wx_login`;
CREATE TABLE `b_wx_login` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL COMMENT '登录用户账号',
  `code` varchar(30) DEFAULT NULL COMMENT '输入验证码(用户)',
  `v_code` varchar(30) DEFAULT NULL COMMENT '短信发送验证码',
  `pwd` varchar(30) DEFAULT NULL COMMENT '用户输入密码',
  `v_pwd` varchar(30) DEFAULT NULL COMMENT '用户保留的密码',
  `invite_code` varchar(30) DEFAULT NULL COMMENT '店员邀请码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_wx_pic
-- ----------------------------
DROP TABLE IF EXISTS `b_wx_pic`;
CREATE TABLE `b_wx_pic` (
  `site_id` int(11) NOT NULL COMMENT '商户id',
  `pic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片自增id',
  `pic_url` varchar(255) NOT NULL COMMENT '本地图片的地址',
  `tencent_pic_url` varchar(255) NOT NULL COMMENT '微信图片的地址',
  `status` tinyint(4) DEFAULT '0' COMMENT '图片状态 0：正常 1 删除 用于逻辑删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `md5key` varchar(255) DEFAULT NULL COMMENT '图片的md5key用于获取该图片',
  `media_id` varchar(255) DEFAULT NULL COMMENT '腾讯的media_id,对应和腾讯的图片',
  PRIMARY KEY (`pic_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`pic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=893 DEFAULT CHARSET=utf8 COMMENT='微信图片信息，联合主键 pic_id 和 site_id';

-- ----------------------------
-- Table structure for b_wx_pic_context
-- ----------------------------
DROP TABLE IF EXISTS `b_wx_pic_context`;
CREATE TABLE `b_wx_pic_context` (
  `site_id` int(11) NOT NULL COMMENT '商户id',
  `pic_context_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图文信息id',
  `title` varchar(45) NOT NULL COMMENT '标题',
  `author` varchar(45) DEFAULT '管理员' COMMENT '上传者',
  `pic_url` varchar(255) NOT NULL COMMENT '图片的url',
  `context` text NOT NULL COMMENT '正文',
  `show_in_context` tinyint(4) DEFAULT NULL COMMENT '是否把封面显示到正文',
  `context_source_url` varchar(255) DEFAULT NULL COMMENT '正文的url',
  `digest` varchar(45) DEFAULT NULL COMMENT '摘要',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更改时间',
  `status` tinyint(4) NOT NULL COMMENT '状态 0:正常 1:删除',
  `wx_media_id` varchar(255) NOT NULL COMMENT '微信的media_id可以通过此字段增删改对应的图文信息',
  PRIMARY KEY (`pic_context_id`,`site_id`),
  KEY `idx_site_id` (`site_id`,`pic_context_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='图文信息表 pic_context_id, site_id 为联合主键';

-- ----------------------------
-- Table structure for b_wx_theme
-- ----------------------------
DROP TABLE IF EXISTS `b_wx_theme`;
CREATE TABLE `b_wx_theme` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家Id',
  `theme_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信主题Id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题名称',
  `link` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除  0-未删除，1-已删除',
  PRIMARY KEY (`theme_id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='微信主题页面管理';

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION`;
CREATE TABLE `BATCH_JOB_EXECUTION` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `JOB_CONFIGURATION_LOCATION` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  KEY `JOB_INST_EXEC_FK` (`JOB_INSTANCE_ID`),
  CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `BATCH_JOB_INSTANCE` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION_CONTEXT
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_CONTEXT`;
CREATE TABLE `BATCH_JOB_EXECUTION_CONTEXT` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` text,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION_PARAMS
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_PARAMS`;
CREATE TABLE `BATCH_JOB_EXECUTION_PARAMS` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `TYPE_CD` varchar(6) NOT NULL,
  `KEY_NAME` varchar(100) NOT NULL,
  `STRING_VAL` varchar(250) DEFAULT NULL,
  `DATE_VAL` datetime DEFAULT NULL,
  `LONG_VAL` bigint(20) DEFAULT NULL,
  `DOUBLE_VAL` double DEFAULT NULL,
  `IDENTIFYING` char(1) NOT NULL,
  KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_JOB_EXECUTION_SEQ
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_EXECUTION_SEQ`;
CREATE TABLE `BATCH_JOB_EXECUTION_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_JOB_INSTANCE
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_INSTANCE`;
CREATE TABLE `BATCH_JOB_INSTANCE` (
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_NAME` varchar(100) NOT NULL,
  `JOB_KEY` varchar(32) NOT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_JOB_SEQ
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_JOB_SEQ`;
CREATE TABLE `BATCH_JOB_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_STEP_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION`;
CREATE TABLE `BATCH_STEP_EXECUTION` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL,
  `STEP_NAME` varchar(100) NOT NULL,
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `START_TIME` datetime NOT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `COMMIT_COUNT` bigint(20) DEFAULT NULL,
  `READ_COUNT` bigint(20) DEFAULT NULL,
  `FILTER_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_COUNT` bigint(20) DEFAULT NULL,
  `READ_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `PROCESS_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `ROLLBACK_COUNT` bigint(20) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_STEP_EXECUTION_CONTEXT
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION_CONTEXT`;
CREATE TABLE `BATCH_STEP_EXECUTION_CONTEXT` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` text,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `BATCH_STEP_EXECUTION` (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for BATCH_STEP_EXECUTION_SEQ
-- ----------------------------
DROP TABLE IF EXISTS `BATCH_STEP_EXECUTION_SEQ`;
CREATE TABLE `BATCH_STEP_EXECUTION_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_account_log
-- ----------------------------
DROP TABLE IF EXISTS `ch_account_log`;
CREATE TABLE `ch_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `pharmacist_id` int(11) NOT NULL DEFAULT '0' COMMENT '药师ID',
  `amount` int(11) NOT NULL DEFAULT '0' COMMENT '金额 单位分',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `operation` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作 1加 -1减',
  `desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '说明',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`),
  KEY `idx_user` (`user_id`),
  KEY `idx_oper` (`operation`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_answer_relation
-- ----------------------------
DROP TABLE IF EXISTS `ch_answer_relation`;
CREATE TABLE `ch_answer_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_openid` varchar(64) DEFAULT NULL COMMENT '用户open_id',
  `pharmacist_userid` varchar(64) DEFAULT NULL COMMENT '店员id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关系创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `disable` int(3) DEFAULT NULL COMMENT '是否生效 1：不生效  0：生效',
  `remark` varchar(30) DEFAULT NULL COMMENT '店员对会员的备注（后续可以是会员对店员，店员对店员）',
  `im_service_id` int(11) NOT NULL DEFAULT '0' COMMENT 'b_im_service.id',
  `im_recode_id` int(11) NOT NULL DEFAULT '0' COMMENT 'b_im_recode.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4629 DEFAULT CHARSET=utf8 COMMENT='用户——店员抢答关系表，反应临时好友关系';

-- ----------------------------
-- Table structure for ch_app_logs
-- ----------------------------
DROP TABLE IF EXISTS `ch_app_logs`;
CREATE TABLE `ch_app_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_name` varchar(20) NOT NULL DEFAULT '' COMMENT 'app名称',
  `contents` text COMMENT '日志内容',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_app_push_info
-- ----------------------------
DROP TABLE IF EXISTS `ch_app_push_info`;
CREATE TABLE `ch_app_push_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '设备ID',
  `app_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `push_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '推送ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_device_id` (`device_id`,`app_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4896 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for ch_app_versions
-- ----------------------------
DROP TABLE IF EXISTS `ch_app_versions`;
CREATE TABLE `ch_app_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否激活',
  `is_force_upgrade` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否强制升级',
  `version` varchar(128) NOT NULL DEFAULT '' COMMENT '版本号',
  `filename` varchar(128) NOT NULL DEFAULT '' COMMENT '文件名',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(512) NOT NULL DEFAULT '' COMMENT '内容',
  `other` varchar(512) NOT NULL DEFAULT '' COMMENT '其他',
  `download_url` varchar(512) NOT NULL DEFAULT '' COMMENT '下载地址',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_bank
-- ----------------------------
DROP TABLE IF EXISTS `ch_bank`;
CREATE TABLE `ch_bank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) NOT NULL DEFAULT '' COMMENT '银行名称',
  `is_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否激活 1激活 0不激活',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_device
-- ----------------------------
DROP TABLE IF EXISTS `ch_device`;
CREATE TABLE `ch_device` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `device_id` char(32) NOT NULL DEFAULT '' COMMENT '设备ID',
  `app` varchar(10) NOT NULL DEFAULT '' COMMENT 'app名称',
  `app_id` varchar(42) NOT NULL DEFAULT '' COMMENT '应用ID',
  `udid2` varchar(64) NOT NULL DEFAULT '' COMMENT 'ios设备唯一标识',
  `i` varchar(64) NOT NULL DEFAULT '' COMMENT 'android的IMEI',
  `macid` varchar(64) NOT NULL DEFAULT '' COMMENT 'mac地址md5',
  `cv` varchar(10) NOT NULL DEFAULT '' COMMENT '版本号',
  `cid` int(10) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_device_id_app` (`device_id`,`app`),
  KEY `idx_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_group
-- ----------------------------
DROP TABLE IF EXISTS `ch_group`;
CREATE TABLE `ch_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) NOT NULL COMMENT '组群名',
  `site_id` int(11) NOT NULL COMMENT '商家id',
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_close` tinyint(1) DEFAULT '0' COMMENT '是否隐藏 0启用  1关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2245 DEFAULT CHARSET=utf8 COMMENT='组群表';

-- ----------------------------
-- Table structure for ch_group_member
-- ----------------------------
DROP TABLE IF EXISTS `ch_group_member`;
CREATE TABLE `ch_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(128) DEFAULT NULL COMMENT '用户体系id',
  `group_id` int(11) NOT NULL COMMENT '组群id',
  `store_admin_id` varchar(45) NOT NULL COMMENT '店员id',
  `site_id` int(11) DEFAULT NULL COMMENT '商户id',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_close` tinyint(1) DEFAULT '0' COMMENT '是否启用 0 启用  1关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10721 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_match
-- ----------------------------
DROP TABLE IF EXISTS `ch_match`;
CREATE TABLE `ch_match` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员用户id 对应于user表的id',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员id 对应于member表的id',
  `msg_id` bigint(20) DEFAULT '0' COMMENT '消息ID',
  `pharmacist_uid` int(11) NOT NULL DEFAULT '0' COMMENT '药师UID',
  `pharmacist_id` int(11) NOT NULL COMMENT '药师ID',
  `is_bind` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否绑定',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_member` (`member_id`),
  KEY `idx_msg` (`msg_id`),
  KEY `idx_pharmacist_uid` (`pharmacist_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_member
-- ----------------------------
DROP TABLE IF EXISTS `ch_member`;
CREATE TABLE `ch_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `open_id` varchar(64) NOT NULL DEFAULT '' COMMENT '关注微信服务号open_id',
  `user_id` int(11) DEFAULT NULL,
  `is_subscribe` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否订阅 1已订阅；0未订阅',
  `subscribed_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订阅时间',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23071 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_msg
-- ----------------------------
DROP TABLE IF EXISTS `ch_msg`;
CREATE TABLE `ch_msg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息ID（主键）',
  `msg_type` tinyint(1) NOT NULL COMMENT '外键',
  `to_uid` varchar(64) NOT NULL COMMENT '收信人',
  `to_member_id` varchar(20) NOT NULL,
  `from_uid` varchar(64) NOT NULL COMMENT '发信人',
  `from_member_id` bigint(11) NOT NULL,
  `from_device_id` char(32) NOT NULL DEFAULT '' COMMENT '设备ID',
  `from_app` varchar(10) NOT NULL DEFAULT '' COMMENT 'app名称',
  `site_id` int(11) NOT NULL DEFAULT '100001' COMMENT '商家的站点id',
  `status` tinyint(1) NOT NULL COMMENT 'App信息状态，1 发送中，2送达，5反馈消息未接收，6反馈消息已接收，7反馈消息已读，8已被处理为垃圾信息',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `is_pushed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被推送',
  `force_send` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否强制发送,0=正常，1=强制发送',
  `account_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未知用户，1普通用户，2经纪人，3系统，4公共帐号，5服务帐号，100设备帐号',
  `sync_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'App消息同步状态(发送消息)',
  `is_web_recieve` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'web端是否需要拉取(0=不拉取，1=拉取)',
  `is_web_sync` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'web端是否需要同步(0=不同步，1=同步)',
  `is_del` int(1) DEFAULT '0' COMMENT '是否删除',
  `source` tinyint(1) NOT NULL DEFAULT '1' COMMENT '消息来源',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `created` (`created_at`),
  KEY `idx_to_uid_status` (`to_uid`,`status`),
  KEY `idx_from_uid_sync_status` (`from_uid`,`sync_status`),
  KEY `idx_from_uid_to_uid_is_read` (`from_uid`,`to_uid`,`is_read`)
) ENGINE=InnoDB AUTO_INCREMENT=46777 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_msg_ext
-- ----------------------------
DROP TABLE IF EXISTS `ch_msg_ext`;
CREATE TABLE `ch_msg_ext` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '消息id 对应msg表id',
  `type` int(2) DEFAULT NULL COMMENT '聊天内容的类型（1、文本，2、图片，3、语音等等等等等等等等）',
  `body` blob COMMENT '消息内容',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `latitude` double NOT NULL DEFAULT '0' COMMENT '纬度',
  `longitude` double NOT NULL DEFAULT '0' COMMENT '经度',
  `send_type` int(11) NOT NULL DEFAULT '1' COMMENT '发送类型，1为抢答，2为一对一应答',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '组id，默认为0',
  `create_at` datetime NOT NULL DEFAULT '1000-00-00 00:00:00' COMMENT '创建时间',
  `filename` varchar(64) NOT NULL DEFAULT '',
  `file_url` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_msg_id` (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46776 DEFAULT CHARSET=utf8 COMMENT='需要定期归档';

-- ----------------------------
-- Table structure for ch_msg_status
-- ----------------------------
DROP TABLE IF EXISTS `ch_msg_status`;
CREATE TABLE `ch_msg_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sender` varchar(64) NOT NULL DEFAULT '' COMMENT '发送方',
  `receiver` varchar(64) NOT NULL DEFAULT '' COMMENT '接收方',
  `content` blob COMMENT '消息内容',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '是否发送成功！1、ok，2、error',
  `error_reason` varchar(255) NOT NULL DEFAULT 'ok' COMMENT '错误原因',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息发送状态表';

-- ----------------------------
-- Table structure for ch_msg_type
-- ----------------------------
DROP TABLE IF EXISTS `ch_msg_type`;
CREATE TABLE `ch_msg_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '类型名称',
  `desc` varchar(128) NOT NULL DEFAULT '' COMMENT '类型描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_order_remind
-- ----------------------------
DROP TABLE IF EXISTS `ch_order_remind`;
CREATE TABLE `ch_order_remind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(128) NOT NULL DEFAULT '0' COMMENT '订单ID 即交易ID',
  `post_style` smallint(6) DEFAULT NULL COMMENT '配送方式',
  `pharmacist_id` int(11) NOT NULL DEFAULT '0' COMMENT '药师ID',
  `is_pushed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否推送 0未推送；1已推送；2推送成功；3推送失败',
  `is_readed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否已读 0未读；1已读',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '额外参数',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order` (`order_id`),
  KEY `pharmacist_id` (`pharmacist_id`),
  KEY `com_idx` (`is_pushed`,`deleted_at`),
  KEY `IX_is_readed` (`is_readed`),
  KEY `idx_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=583020 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_order_remind_bak
-- ----------------------------
DROP TABLE IF EXISTS `ch_order_remind_bak`;
CREATE TABLE `ch_order_remind_bak` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(128) NOT NULL DEFAULT '0' COMMENT '订单ID 即交易ID',
  `post_style` smallint(6) DEFAULT NULL COMMENT '配送方式',
  `pharmacist_id` int(11) NOT NULL DEFAULT '0' COMMENT '药师ID',
  `is_pushed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否推送 0未推送；1已推送；2推送成功；3推送失败',
  `is_readed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否已读 0未读；1已读',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '额外参数',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pharmacist_id` (`pharmacist_id`),
  KEY `idx_order` (`order_id`),
  KEY `com_idx` (`is_pushed`,`deleted_at`),
  KEY `IX_is_readed` (`is_readed`),
  KEY `idx_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=582117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_order_remind_bak_cp
-- ----------------------------
DROP TABLE IF EXISTS `ch_order_remind_bak_cp`;
CREATE TABLE `ch_order_remind_bak_cp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(128) NOT NULL DEFAULT '0' COMMENT '订单ID 即交易ID',
  `post_style` smallint(6) DEFAULT NULL COMMENT '配送方式',
  `pharmacist_id` int(11) NOT NULL DEFAULT '0' COMMENT '药师ID',
  `is_pushed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否推送 0未推送；1已推送；2推送成功；3推送失败',
  `is_readed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否已读 0未读；1已读',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '额外参数',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pharmacist_id` (`pharmacist_id`),
  KEY `idx_order` (`order_id`),
  KEY `com_idx` (`is_pushed`,`deleted_at`),
  KEY `IX_is_readed` (`is_readed`),
  KEY `idx_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=582117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_order_remind_bak_zq
-- ----------------------------
DROP TABLE IF EXISTS `ch_order_remind_bak_zq`;
CREATE TABLE `ch_order_remind_bak_zq` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(128) NOT NULL DEFAULT '0' COMMENT '订单ID 即交易ID',
  `post_style` smallint(6) DEFAULT NULL COMMENT '配送方式',
  `pharmacist_id` int(11) NOT NULL DEFAULT '0' COMMENT '药师ID',
  `is_pushed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否推送 0未推送；1已推送；2推送成功；3推送失败',
  `is_readed` tinyint(11) NOT NULL DEFAULT '0' COMMENT '是否已读 0未读；1已读',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '额外参数',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pharmacist_id` (`pharmacist_id`),
  KEY `idx_order` (`order_id`),
  KEY `com_idx` (`is_pushed`,`deleted_at`),
  KEY `IX_is_readed` (`is_readed`),
  KEY `idx_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=582106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_pharmacist
-- ----------------------------
DROP TABLE IF EXISTS `ch_pharmacist`;
CREATE TABLE `ch_pharmacist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `amount` bigint(20) DEFAULT '0' COMMENT '账户金额 单位：分',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `store_user_id` int(11) DEFAULT NULL COMMENT '门店用户ID',
  `store_name` varchar(100) NOT NULL DEFAULT '' COMMENT '门店名称',
  `lng` varchar(30) DEFAULT '' COMMENT '经度',
  `lat` varchar(30) DEFAULT '' COMMENT '纬度',
  `is_online` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否在线咨询 1在线；0不在线',
  `is_remind` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否提醒 1提醒；0不提醒',
  `is_active` tinyint(4) DEFAULT '1' COMMENT '是否激活',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `com_idx_id` (`site_id`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_user
-- ----------------------------
DROP TABLE IF EXISTS `ch_user`;
CREATE TABLE `ch_user` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '电话号码',
  `real_name` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(16) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `head_img_url` varchar(512) NOT NULL DEFAULT '' COMMENT '用户图像',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户类型：1普通用户；2药师',
  `country` varchar(16) NOT NULL COMMENT '国家',
  `province` varchar(16) NOT NULL COMMENT '省份',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '城市',
  `gender` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别 0未设置；1男；2女',
  `has_password` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否设置过密码 1设置过；0没有设置过',
  `source` tinyint(1) NOT NULL DEFAULT '1' COMMENT '来源 1APP；2WEB; 3SYNC',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60411 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_user_has_bank
-- ----------------------------
DROP TABLE IF EXISTS `ch_user_has_bank`;
CREATE TABLE `ch_user_has_bank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `pharmacist_id` int(11) NOT NULL DEFAULT '0' COMMENT '药师ID',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT '开户行',
  `bank_no` varchar(32) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `account_name` varchar(16) NOT NULL DEFAULT '' COMMENT '账户名',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_user_login_history
-- ----------------------------
DROP TABLE IF EXISTS `ch_user_login_history`;
CREATE TABLE `ch_user_login_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `user_type` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=238624 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_user_password
-- ----------------------------
DROP TABLE IF EXISTS `ch_user_password`;
CREATE TABLE `ch_user_password` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `PASSWORD` varchar(500) NOT NULL DEFAULT '' COMMENT '密码',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ch_user_push_info
-- ----------------------------
DROP TABLE IF EXISTS `ch_user_push_info`;
CREATE TABLE `ch_user_push_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `app_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `push_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '推送ID',
  `device_token` varchar(150) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'IOS设备唯一识别号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22780 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for cm_app
-- ----------------------------
DROP TABLE IF EXISTS `cm_app`;
CREATE TABLE `cm_app` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `git_id` int(11) NOT NULL,
  `branch` varchar(64) DEFAULT 'master' COMMENT '仓库分支',
  `online_path` varchar(128) NOT NULL DEFAULT '',
  `server_id` int(11) NOT NULL,
  `version` varchar(24) DEFAULT '0',
  `owner` varchar(64) DEFAULT 'jinwei' COMMENT '项目所有者',
  `status` int(11) NOT NULL DEFAULT '1',
  `explain` varchar(255) DEFAULT '',
  `create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_apply_log
-- ----------------------------
DROP TABLE IF EXISTS `cm_apply_log`;
CREATE TABLE `cm_apply_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cm_git_info
-- ----------------------------
DROP TABLE IF EXISTS `cm_git_info`;
CREATE TABLE `cm_git_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project` varchar(48) NOT NULL DEFAULT '',
  `url` varchar(96) NOT NULL DEFAULT '',
  `is_config` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `remark` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_menu
-- ----------------------------
DROP TABLE IF EXISTS `cm_menu`;
CREATE TABLE `cm_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(32) NOT NULL DEFAULT '',
  `uri` varchar(64) DEFAULT '',
  `parent_id` int(11) NOT NULL,
  `css_code` varchar(64) DEFAULT '',
  `sort` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_onserver
-- ----------------------------
DROP TABLE IF EXISTS `cm_onserver`;
CREATE TABLE `cm_onserver` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_ip` varchar(64) NOT NULL DEFAULT '',
  `onalived` int(11) DEFAULT '10',
  `authority` varchar(64) DEFAULT 'readonly',
  `apply_user` varchar(64) NOT NULL DEFAULT '',
  `sshkey` text,
  `status` int(11) DEFAULT '1' COMMENT '1 申请 2 已审核 3 正常 4 过期 5 驳回',
  `remark` text,
  `error_msg` text,
  `operator` varchar(24) DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_provide
-- ----------------------------
DROP TABLE IF EXISTS `cm_provide`;
CREATE TABLE `cm_provide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(64) DEFAULT '',
  `add` varchar(128) NOT NULL DEFAULT '' COMMENT '地址',
  `mobile` varchar(24) NOT NULL DEFAULT '' COMMENT '联系手机号码',
  `linkman` varchar(24) NOT NULL DEFAULT '' COMMENT '联系人',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 有效的',
  `start_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '起始时间',
  `end_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '合同有效期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_push_log
-- ----------------------------
DROP TABLE IF EXISTS `cm_push_log`;
CREATE TABLE `cm_push_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT '0',
  `version` varchar(24) NOT NULL DEFAULT '',
  `task` varchar(32) DEFAULT '',
  `task_id` varchar(64) DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 上传中 2 完成 3失败',
  `action` varchar(32) DEFAULT 'Push' COMMENT ' push  checkout  create',
  `msg` text,
  `operater` varchar(64) NOT NULL DEFAULT '',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `task_id_idx` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_rule
-- ----------------------------
DROP TABLE IF EXISTS `cm_rule`;
CREATE TABLE `cm_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_server
-- ----------------------------
DROP TABLE IF EXISTS `cm_server`;
CREATE TABLE `cm_server` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_name` varchar(48) NOT NULL DEFAULT '' COMMENT '服务器名',
  `ssh_user` varchar(24) NOT NULL DEFAULT 'ops',
  `ssh_pwd` varchar(64) DEFAULT '',
  `ssh_port` int(11) NOT NULL DEFAULT '22',
  `ip_eth0` varchar(96) NOT NULL DEFAULT '' COMMENT 'ip',
  `ip_other` varchar(192) DEFAULT '' COMMENT '其他网卡ip',
  `use_type` int(11) NOT NULL DEFAULT '2' COMMENT '0  开发 1 测试 2 预发 3生产',
  `owner` varchar(48) DEFAULT 'ops',
  `remark` varchar(255) DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1 运行',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_sms_apply
-- ----------------------------
DROP TABLE IF EXISTS `cm_sms_apply`;
CREATE TABLE `cm_sms_apply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `mid` int(11) NOT NULL COMMENT '通道ID',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT '申请权限的token',
  `template` varchar(128) NOT NULL DEFAULT '' COMMENT '短信模板实例',
  `status` tinyint(4) DEFAULT '1' COMMENT '1 有效',
  `msg_send_value` varchar(128) NOT NULL DEFAULT '' COMMENT '通道所需要的模板值',
  `create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_sms_company
-- ----------------------------
DROP TABLE IF EXISTS `cm_sms_company`;
CREATE TABLE `cm_sms_company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` int(11) DEFAULT NULL,
  `host` int(11) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `apikey` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `send_uri` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_sms_content
-- ----------------------------
DROP TABLE IF EXISTS `cm_sms_content`;
CREATE TABLE `cm_sms_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '1 验证码 2 报警通知 3 营销推广',
  `content` int(11) DEFAULT NULL,
  `is_sign` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 审核中 ，2 正常，3 失效',
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `cm_sms_log`;
CREATE TABLE `cm_sms_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apply_id` int(11) NOT NULL COMMENT '通道id',
  `mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号码',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态  1 成功 0 失败',
  `count` int(11) DEFAULT '1' COMMENT '成功发送条数',
  `fee` int(11) DEFAULT '1' COMMENT '扣费条数',
  `sid` varchar(32) NOT NULL DEFAULT '' COMMENT '短信ID',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '返回信息',
  `create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_sms_tpl
-- ----------------------------
DROP TABLE IF EXISTS `cm_sms_tpl`;
CREATE TABLE `cm_sms_tpl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `provide_id` int(11) NOT NULL COMMENT '供应商ID',
  `tpl_code` int(11) DEFAULT '0' COMMENT '模板号',
  `tpl_value` varchar(255) NOT NULL DEFAULT '' COMMENT '模板值',
  `extend` varchar(128) DEFAULT '' COMMENT '备用字段',
  `status` tinyint(4) DEFAULT '0' COMMENT '1 有效',
  `create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_station
-- ----------------------------
DROP TABLE IF EXISTS `cm_station`;
CREATE TABLE `cm_station` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `site_name` varchar(128) NOT NULL DEFAULT '',
  `server_ip` varchar(64) DEFAULT '172.20.12.0',
  `server_name` varchar(24) DEFAULT 'app12-035',
  `appkey` varchar(64) NOT NULL DEFAULT '',
  `secretkey` varchar(128) NOT NULL DEFAULT '',
  `aweb_domain` varchar(64) NOT NULL DEFAULT '',
  `aweb_title` varchar(64) DEFAULT '',
  `store_domain` varchar(64) DEFAULT '',
  `weixin_domain` varchar(64) DEFAULT '',
  `msg_sign` varchar(24) DEFAULT '51健康',
  `is_active` int(11) DEFAULT '1' COMMENT '是否存活',
  `status` int(11) DEFAULT '110' COMMENT '站点状态',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_station_alive
-- ----------------------------
DROP TABLE IF EXISTS `cm_station_alive`;
CREATE TABLE `cm_station_alive` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `aweb_head` int(11) NOT NULL DEFAULT '1' COMMENT 'aweb head信息对比',
  `aweb_http_code` int(11) NOT NULL DEFAULT '1' COMMENT 'aweb状态码',
  `api_http_code` int(11) NOT NULL DEFAULT '1' COMMENT 'api状态码',
  `store_http_code` int(11) NOT NULL DEFAULT '1' COMMENT 'store状态码',
  `goods_status` int(11) NOT NULL DEFAULT '1' COMMENT 'aweb站商品',
  `aweb_error_msg` varchar(128) DEFAULT '' COMMENT 'aweb error',
  `api_error_msg` varchar(128) DEFAULT '' COMMENT 'api erroe',
  `store_error_msg` varchar(128) DEFAULT '' COMMENT 'stoe error',
  `aweb_dns_resolve` int(11) DEFAULT '0' COMMENT 'DNS解析时间 单位：ms',
  `aweb_http_conn_time` int(11) DEFAULT '0' COMMENT '建立连接时间 单位：ms',
  `aweb_http_pre_trans` int(11) DEFAULT '0' COMMENT '准备传送时间 单位：ms',
  `aweb_http_start_trans` int(11) DEFAULT '0' COMMENT '传送开始时间 单位：ms',
  `aweb_http_total_time` int(11) DEFAULT '0' COMMENT '传送结束时间 单位：ms',
  `aweb_http_size_download` int(11) DEFAULT '0' COMMENT '数据包大小 单位：字节',
  `aweb_http_header_size` int(11) DEFAULT '0' COMMENT 'HTTP头大小 单位：字节',
  `aweb_http_speed_downlaod` int(11) DEFAULT '0' COMMENT '平均下载速度 单位：字节',
  `api_dns_resolve` int(11) DEFAULT '0' COMMENT 'DNS解析时间 单位：ms',
  `api_http_conn_time` int(11) DEFAULT '0' COMMENT '建立连接时间 单位：ms',
  `api_http_pre_trans` int(11) DEFAULT '0' COMMENT '准备传送时间  单位：ms',
  `api_http_start_trans` int(11) DEFAULT '0' COMMENT '传送开始时间  单位：ms',
  `api_http_total_time` int(11) DEFAULT '0' COMMENT '传送结束时间  单位：ms',
  `api_http_size_download` int(11) DEFAULT '0' COMMENT '数据包大小  单位：字节',
  `api_http_header_size` int(11) DEFAULT '0' COMMENT 'HTTP头大小  单位：字节',
  `api_http_speed_downlaod` int(11) DEFAULT '0' COMMENT '平均下载速度 单位：字节',
  `store_dns_resolve` int(11) DEFAULT '0' COMMENT 'DNS解析时间 单位：ms',
  `store_http_conn_time` int(11) DEFAULT '0' COMMENT '建立连接时间 单位：ms',
  `store_http_pre_trans` int(11) DEFAULT '0' COMMENT '准备传送时间  单位：ms',
  `store_http_start_trans` int(11) DEFAULT '0' COMMENT '传送开始时间 单位：ms',
  `store_http_total_time` int(11) DEFAULT '0' COMMENT '传送结束时间  单位：ms',
  `store_http_size_download` int(11) DEFAULT '0' COMMENT '数据包大小 单位：字节',
  `store_http_header_size` int(11) DEFAULT '0' COMMENT 'HTTP头大小  单位：字节',
  `store_http_speed_downlaod` int(11) DEFAULT '0' COMMENT '平均下载速度  单位：字节',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'time',
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26466 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cm_user
-- ----------------------------
DROP TABLE IF EXISTS `cm_user`;
CREATE TABLE `cm_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `sshkey` text COMMENT '用户key',
  `login_num` int(11) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_b_recharge_orders
-- ----------------------------
DROP TABLE IF EXISTS `d_b_recharge_orders`;
CREATE TABLE `d_b_recharge_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户member_id',
  `distributor_id` int(11) NOT NULL COMMENT '分销商id',
  `owner` int(11) DEFAULT '0' COMMENT '药店总部ID',
  `title` varchar(80) NOT NULL COMMENT '充值标题',
  `amount` int(11) NOT NULL COMMENT '单价(分)',
  `recharge_type` int(11) DEFAULT '0' COMMENT '类别:  110(储值卡)，120(保证金)，0(其他)',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID',
  `orders_status` int(11) NOT NULL DEFAULT '110' COMMENT '交易状态:110(等侍买家付款),  120(等待卖家确认),130(等侍买家确认收货),140(买家已确认)，150(还有未支付的金额)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，200(交易成功)',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父订单编号',
  `is_valid` tinyint(2) DEFAULT '1' COMMENT '是否显示,0:不显示(软删除),1：正常显示,2:子订单默认不显示',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `idx_trades_id` (`trades_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_disappconfig
-- ----------------------------
DROP TABLE IF EXISTS `d_disappconfig`;
CREATE TABLE `d_disappconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` mediumint(8) unsigned NOT NULL,
  `app_name` varchar(32) NOT NULL COMMENT 'app名字',
  `ios` varchar(255) NOT NULL COMMENT 'ios下载地址',
  `android` varchar(255) NOT NULL COMMENT 'android下载地址',
  `host` varchar(32) NOT NULL COMMENT '域名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分销app配置表';

-- ----------------------------
-- Table structure for d_distribut_relation
-- ----------------------------
DROP TABLE IF EXISTS `d_distribut_relation`;
CREATE TABLE `d_distribut_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分销商层级关系',
  `distributor_id` int(11) NOT NULL DEFAULT '0' COMMENT '分销商ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级分销商ID',
  `ancestor_id` int(11) NOT NULL DEFAULT '0' COMMENT '上上级分销商ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_distributor_id` (`distributor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_distribution_store
-- ----------------------------
DROP TABLE IF EXISTS `d_distribution_store`;
CREATE TABLE `d_distribution_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分销门店开关',
  `owner` int(11) NOT NULL COMMENT '门店编号',
  `is_open` tinyint(2) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_distributor
-- ----------------------------
DROP TABLE IF EXISTS `d_distributor`;
CREATE TABLE `d_distributor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分销商信息',
  `uid` int(11) unsigned NOT NULL COMMENT '分销商用户ID',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分销商会员名',
  `real_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分销商姓名',
  `wechat_name` varchar(50) NOT NULL DEFAULT '' COMMENT '微信号',
  `alipay_name` varchar(50) NOT NULL DEFAULT '' COMMENT '支付宝账号',
  `apply_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '申请渠道：0-微信，1-网站',
  `is_root` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否是顶级分销商',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '推荐等级：1-1级，2-2级，3-3级',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0-待审核，1-通过，2-拒绝，3-冻结，',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '备注',
  `owner` int(11) unsigned NOT NULL COMMENT '所属连锁店',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否开通权限',
  PRIMARY KEY (`id`),
  KEY `idx_owner` (`owner`,`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_distributor_ext
-- ----------------------------
DROP TABLE IF EXISTS `d_distributor_ext`;
CREATE TABLE `d_distributor_ext` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分销商信息',
  `did` int(11) unsigned NOT NULL COMMENT '分销商主表ID',
  `uid` int(11) unsigned NOT NULL COMMENT '用户表主表ID',
  `parent_id` int(11) unsigned NOT NULL COMMENT '分销商的上级编号',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分销商会员名',
  `account` int(11) NOT NULL DEFAULT '0' COMMENT '账户余额(分)',
  `frozen_account` int(11) NOT NULL DEFAULT '0' COMMENT '账户保证金(分)',
  `store_account` int(11) NOT NULL DEFAULT '0' COMMENT '账户储值金(分)',
  `reward_account` int(11) NOT NULL DEFAULT '0' COMMENT '账户奖励额度(分)',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0-未激活账户，1-激活，2-冻结',
  `note` char(255) NOT NULL DEFAULT '' COMMENT '冻结备注',
  `invitation_code` varchar(16) DEFAULT '' COMMENT '邀请码',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `charge_account` int(11) NOT NULL DEFAULT '0' COMMENT '账户消费金(分)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_did` (`did`),
  KEY `invitation_code` (`invitation_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 COMMENT='分销商账户扩展信息表';

-- ----------------------------
-- Table structure for d_distributor_money_record
-- ----------------------------
DROP TABLE IF EXISTS `d_distributor_money_record`;
CREATE TABLE `d_distributor_money_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distributor_id` int(11) NOT NULL COMMENT '分销商id',
  `reward_id` int(11) NOT NULL DEFAULT '0',
  `from_did` int(11) NOT NULL COMMENT '该奖励来自哪个分销商',
  `owner` int(11) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '操作类型  1：奖励  2：提现',
  `change_money` int(11) NOT NULL COMMENT '操作的金额 单位：分',
  `remaining_money` int(11) NOT NULL DEFAULT '-1' COMMENT '余额 单位：分  -1表示刚插入  状态未确认',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(2) NOT NULL COMMENT '状态  1：待处理  2：成功  3：失败',
  `order_status` int(3) NOT NULL DEFAULT '1',
  `trade_id` bigint(19) NOT NULL DEFAULT '0',
  `withdraw_fee` int(11) DEFAULT '0' COMMENT '提现手续费',
  `moment_reward_pattern` varchar(1000) DEFAULT NULL COMMENT '分佣时采用的模板',
  `remark` varchar(1000) DEFAULT NULL COMMENT '拒绝提现的备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8 COMMENT='分销商操作账户记录表';

-- ----------------------------
-- Table structure for d_distributor_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `d_distributor_recharge_record`;
CREATE TABLE `d_distributor_recharge_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值记录',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户member_id',
  `distributor_id` int(11) NOT NULL COMMENT '分销商id',
  `owner` int(11) DEFAULT '0' COMMENT '药店总部',
  `account` varchar(100) NOT NULL COMMENT '51jk 收款帐号',
  `callback_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付平台回调时间',
  `pay_result` text COMMENT '支付结果，原始结果',
  `type` tinyint(2) NOT NULL COMMENT '操作类型  1：储值金  2：保证金',
  `amount` int(11) NOT NULL COMMENT '实际支付的金额 单位：分',
  `level` tinyint(2) unsigned DEFAULT '0',
  `total_amount` int(11) NOT NULL COMMENT '到帐金额（商家）单位：分',
  `pay_style` varchar(30) NOT NULL COMMENT '买家支付方式: 1 (微信)，2 (支付宝) ，3（现金）',
  `platform_fee` int(11) DEFAULT '0' COMMENT '支付平台手续费',
  `trades_split` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '平台手续=实付金额-(平台手续费+商家到帐金额)',
  `total_fee` int(11) NOT NULL COMMENT '交易费用 单位：分',
  `pay_status` int(11) NOT NULL DEFAULT '110' COMMENT '状态  110:未支付 120：失败  200：成功  ',
  `account_checking_status` tinyint(1) unsigned DEFAULT '0' COMMENT '对账状态 0=未对账（默认） 1=已对账',
  `settlement_status` smallint(3) unsigned DEFAULT '100' COMMENT '资金可结算状态 100=不结算 150=待结算 200=可结算',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_trades_id` (`trades_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8 COMMENT='分销商账户充值记录表';

-- ----------------------------
-- Table structure for d_distributor_sign_category
-- ----------------------------
DROP TABLE IF EXISTS `d_distributor_sign_category`;
CREATE TABLE `d_distributor_sign_category` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `shop_category_id` int(8) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='对应标识bshop的分类表中分销商品类目';

-- ----------------------------
-- Table structure for d_funds
-- ----------------------------
DROP TABLE IF EXISTS `d_funds`;
CREATE TABLE `d_funds` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资金变动表',
  `owner` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '所属商家',
  `distributor_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分销商ID',
  `trades_id` varchar(20) NOT NULL DEFAULT '0' COMMENT '交易号',
  `store_amount` int(11) NOT NULL DEFAULT '0' COMMENT '充值账号',
  `amount` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '账户余额',
  `money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '金额，单位：分',
  `pay_type` tinyint(2) unsigned zerofill DEFAULT '00' COMMENT '支付方式：1：微信 2：银联',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT ' 1-充值 2-提现 3-消费 4-退款 ',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：1-失败 2-成功',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `trades_id` (`trades_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4075 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_operation_recond
-- ----------------------------
DROP TABLE IF EXISTS `d_operation_recond`;
CREATE TABLE `d_operation_recond` (
  `d_id` int(11) NOT NULL COMMENT '分销商id',
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `autding_status` int(5) NOT NULL COMMENT '总部修改分销商状态',
  `remark` varchar(255) DEFAULT '' COMMENT '操作备注',
  `snapshot` varchar(255) DEFAULT '' COMMENT '修改之前的记录快照  存放json串',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_recruit
-- ----------------------------
DROP TABLE IF EXISTS `d_recruit`;
CREATE TABLE `d_recruit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '招募',
  `owner` int(11) unsigned zerofill NOT NULL COMMENT '商家ID',
  `deposit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '保证金',
  `rule` text NOT NULL COMMENT '推荐规则',
  `total_recruit` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '招募总人数',
  `audit_mode` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核方式：0-手动审核 1-自动审核',
  `template` text COMMENT '招募模板',
  `is_diposit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要保证金：0-不需要 1-需要',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `distribut_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '分销模式：0-充值模式  1-消费模式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_recruit_grade
-- ----------------------------
DROP TABLE IF EXISTS `d_recruit_grade`;
CREATE TABLE `d_recruit_grade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `owner` int(11) unsigned zerofill NOT NULL COMMENT '商家ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '等级标题',
  `amount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值金额',
  `discount` int(11) unsigned NOT NULL DEFAULT '10' COMMENT '折扣(/10)',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要保证金：0-已删除 1-正常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值等级记录表';

-- ----------------------------
-- Table structure for d_recruit_record
-- ----------------------------
DROP TABLE IF EXISTS `d_recruit_record`;
CREATE TABLE `d_recruit_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招募书修改记录',
  `owner` int(11) NOT NULL COMMENT '商家ID',
  `is_diposit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要保证金：0-不需要 1-需要',
  `deposit` int(11) NOT NULL DEFAULT '0' COMMENT '保证金',
  `rule` text NOT NULL COMMENT '推荐规则',
  `total_recruit` int(11) NOT NULL DEFAULT '0' COMMENT '招募总人数',
  `audit_mode` int(11) NOT NULL DEFAULT '0' COMMENT '审核方式：0-手动审核 1-自动审核',
  `template` text NOT NULL COMMENT '招募模板',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_referee_list
-- ----------------------------
DROP TABLE IF EXISTS `d_referee_list`;
CREATE TABLE `d_referee_list` (
  `referee_id` int(10) NOT NULL,
  `referee_name` varchar(20) NOT NULL COMMENT '推荐人',
  `total_income_amount` int(15) DEFAULT NULL COMMENT '收入总金额',
  `total_expenditure` int(15) DEFAULT NULL COMMENT '支出总金额',
  `account_balance` int(15) DEFAULT NULL COMMENT '账户余额',
  PRIMARY KEY (`referee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_reward
-- ----------------------------
DROP TABLE IF EXISTS `d_reward`;
CREATE TABLE `d_reward` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分佣(价格单位统一为分)',
  `order_id` bigint(19) unsigned NOT NULL COMMENT '订单ID',
  `owner` int(11) NOT NULL COMMENT '门店site_id',
  `distributor_id` int(11) NOT NULL COMMENT '分销商id',
  `distributor_father_id` int(11) NOT NULL DEFAULT '0' COMMENT '分销商上级id（无上级为0）',
  `distributor_grandfather_id` int(11) NOT NULL DEFAULT '0' COMMENT '分销商上上级id（无上上级为0）',
  `order_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单总额',
  `real_pay` int(11) NOT NULL COMMENT '实际支付金额',
  `level_1_award` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下单推荐分佣',
  `level_2_award` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级推荐分佣',
  `level_3_award` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上级推荐分佣',
  `total_award` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总分佣',
  `order_status` int(11) NOT NULL DEFAULT '110' COMMENT '订单状态 0：交易失败（退款） 1：交易成功  2：交易结束',
  `reward_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '奖励状态：0-待确认 1-已确认',
  `buyer_id` bigint(19) unsigned DEFAULT '0',
  `refund_id` int(11) DEFAULT '0' COMMENT '对应ybzf退款表主键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_reward_template
-- ----------------------------
DROP TABLE IF EXISTS `d_reward_template`;
CREATE TABLE `d_reward_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分佣模板',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '模板名称',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '分佣类型：0-按比例，1-按固定金额',
  `according_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '根据实际价格还是折扣价格计算佣金   1：实际价格  2：折扣价格',
  `reward` text NOT NULL COMMENT '分佣比例',
  `discount` text NOT NULL COMMENT '推荐优惠比例',
  `is_used` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '模板是否在使用',
  `use_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '模板使用类型：1-单个商品，2-某个类目，3-全部商品',
  `owner` int(11) unsigned NOT NULL COMMENT '所属连锁店',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `d_owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_reward_template_record
-- ----------------------------
DROP TABLE IF EXISTS `d_reward_template_record`;
CREATE TABLE `d_reward_template_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分佣模板修改记录',
  `t_id` int(11) NOT NULL COMMENT '模板id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '模板名称',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '分佣类型：0-按比例，1-按固定金额',
  `according_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '根据实际价格还是折扣价格计算佣金   1：实际价格  2：折扣价格',
  `reward` text NOT NULL COMMENT '分佣比例',
  `discount` text NOT NULL COMMENT '推荐优惠比例',
  `is_used` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '模板是否在使用',
  `use_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '模板使用类型：1-单个商品，2-某个类目，3-全部商品',
  `owner` int(11) unsigned NOT NULL COMMENT '所属连锁店',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for d_withdraw_account
-- ----------------------------
DROP TABLE IF EXISTS `d_withdraw_account`;
CREATE TABLE `d_withdraw_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现账号表',
  `distributor_id` int(11) NOT NULL COMMENT '分销商id',
  `owner` int(11) NOT NULL COMMENT '药店总部',
  `name` varchar(50) NOT NULL COMMENT '开户人姓名',
  `account` varchar(100) NOT NULL COMMENT '提现帐号',
  `type` varchar(30) NOT NULL COMMENT '账号类型: 100:ali (支付宝) ，200:wx (微信)，300:银联',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `band_name` varchar(50) DEFAULT '0' COMMENT '开户行名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='分销商提现账号表';

-- ----------------------------
-- Table structure for d_withdraw_cash_setting
-- ----------------------------
DROP TABLE IF EXISTS `d_withdraw_cash_setting`;
CREATE TABLE `d_withdraw_cash_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `min_money` int(11) NOT NULL COMMENT '最低提现金额',
  `owner` int(11) NOT NULL COMMENT 'site_id',
  `wx_account` varchar(100) DEFAULT NULL COMMENT '账号',
  `wx_rate` int(11) DEFAULT NULL COMMENT '提现手续费',
  `ali_account` varchar(100) DEFAULT NULL,
  `ali_rate` int(11) DEFAULT NULL,
  `union_account` varchar(100) DEFAULT NULL,
  `union_rate` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分销商提现设置表';

-- ----------------------------
-- Table structure for d_withdraw_record
-- ----------------------------
DROP TABLE IF EXISTS `d_withdraw_record`;
CREATE TABLE `d_withdraw_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现记录',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID',
  `distributor_id` int(11) NOT NULL COMMENT '分销商id',
  `owner` int(11) DEFAULT NULL COMMENT '药店总部',
  `account` varchar(100) NOT NULL COMMENT '提现帐号',
  `pay_result` text COMMENT '支付结果',
  `type` tinyint(2) NOT NULL COMMENT '操作类型: 1.提现奖励',
  `amount` int(11) NOT NULL COMMENT '提现金额 单位：分',
  `withdraw_style` varchar(30) NOT NULL COMMENT '买家提现方式: 100:ali (支付宝) ，200:wx (微信)，300:银联',
  `withdraw_fee` int(11) DEFAULT '0' COMMENT '支付平台手续费',
  `total_fee` int(11) NOT NULL COMMENT '交易费用 单位：分',
  `pay_status` tinyint(2) NOT NULL COMMENT '状态  0：失败  1：成功  ',
  `checking_status` tinyint(1) unsigned DEFAULT '0' COMMENT '对账状态 0=未对账（默认） 1=已对账',
  `settlement_status` smallint(3) unsigned DEFAULT '100' COMMENT '资金可结算状态 100=不结算 150=待结算 200=可结算',
  `trades_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单结算时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请日期',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `money_record_id` int(11) DEFAULT '0' COMMENT 'distributor_money_id主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_trades_id` (`trades_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='分销商奖励账户记录表';

-- ----------------------------
-- Table structure for i_promotion_water
-- ----------------------------
DROP TABLE IF EXISTS `i_promotion_water`;
CREATE TABLE `i_promotion_water` (
  `id` bigint(20) unsigned NOT NULL,
  `site_id` bigint(20) DEFAULT NULL,
  `md5Key` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `is_attribute` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for i_yf_image
-- ----------------------------
DROP TABLE IF EXISTS `i_yf_image`;
CREATE TABLE `i_yf_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `md5Key` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `water_url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `goods` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_md5Key` (`md5Key`) USING BTREE,
  KEY `index_name` (`water_url`,`md5Key`)
) ENGINE=InnoDB AUTO_INCREMENT=362789 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for i_yf_image_20170605
-- ----------------------------
DROP TABLE IF EXISTS `i_yf_image_20170605`;
CREATE TABLE `i_yf_image_20170605` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `md5Key` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `water_url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `goods` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_md5Key` (`md5Key`)
) ENGINE=InnoDB AUTO_INCREMENT=358921 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for i_yf_image_20170712
-- ----------------------------
DROP TABLE IF EXISTS `i_yf_image_20170712`;
CREATE TABLE `i_yf_image_20170712` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `host` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `md5Key` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `water_url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `goods` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_md5Key` (`md5Key`) USING BTREE,
  KEY `index_name` (`water_url`,`md5Key`)
) ENGINE=InnoDB AUTO_INCREMENT=359977 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for i_yf_task
-- ----------------------------
DROP TABLE IF EXISTS `i_yf_task`;
CREATE TABLE `i_yf_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for i_yf_user
-- ----------------------------
DROP TABLE IF EXISTS `i_yf_user`;
CREATE TABLE `i_yf_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `salt` varchar(64) COLLATE utf8_bin NOT NULL,
  `roles` varchar(255) COLLATE utf8_bin NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for i_yf_website
-- ----------------------------
DROP TABLE IF EXISTS `i_yf_website`;
CREATE TABLE `i_yf_website` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `website` varchar(50) DEFAULT NULL,
  `md5Key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_ES_INDEX_FIELD_INFO
-- ----------------------------
DROP TABLE IF EXISTS `s_ES_INDEX_FIELD_INFO`;
CREATE TABLE `s_ES_INDEX_FIELD_INFO` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '?????',
  `INDEX_ID` int(10) NOT NULL COMMENT '??ID',
  `FIELD_NAME` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '????',
  `DATA_TYPE` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '????',
  `INDEX_ENABLE` tinyint(1) NOT NULL COMMENT '????',
  `STORE` tinyint(1) NOT NULL COMMENT '????',
  `DEFAULT_VALUE` varchar(1000) COLLATE utf8_bin NOT NULL COMMENT '???',
  `INDEX_SEG` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '????',
  `SEARCH_SEG` varchar(300) COLLATE utf8_bin NOT NULL COMMENT '????',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '????',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '????',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for s_ES_INDEX_INFO
-- ----------------------------
DROP TABLE IF EXISTS `s_ES_INDEX_INFO`;
CREATE TABLE `s_ES_INDEX_INFO` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '?????',
  `INDEX_NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '????',
  `ID_PATH` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '??????????',
  `SHARDS` int(10) NOT NULL COMMENT '?????',
  `REPLICAS` int(10) NOT NULL COMMENT '?????',
  `DESC` varchar(1000) COLLATE utf8_bin NOT NULL COMMENT '????',
  `OWNER` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '???',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '????',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '????',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for s_KEYWORD_COUNT
-- ----------------------------
DROP TABLE IF EXISTS `s_KEYWORD_COUNT`;
CREATE TABLE `s_KEYWORD_COUNT` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYWORD` varchar(100) DEFAULT NULL,
  `COUNT` bigint(20) DEFAULT NULL,
  `STORENUM` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27523 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_PROD_SUGGEST_KEYWORD
-- ----------------------------
DROP TABLE IF EXISTS `s_PROD_SUGGEST_KEYWORD`;
CREATE TABLE `s_PROD_SUGGEST_KEYWORD` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYWORD` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `PINYIN` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `POPULARITY` bigint(20) DEFAULT '0',
  `PROD_COUNT` bigint(20) DEFAULT '0',
  `SHOUZIMU` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='储存搜索框sugget词库';

-- ----------------------------
-- Table structure for s_PROD_SUGGEST_KEYWORD_VERSION
-- ----------------------------
DROP TABLE IF EXISTS `s_PROD_SUGGEST_KEYWORD_VERSION`;
CREATE TABLE `s_PROD_SUGGEST_KEYWORD_VERSION` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYWORD_TYPE` int(11) NOT NULL DEFAULT '1',
  `CURRENT_VERSION` timestamp NULL DEFAULT NULL,
  `INUSED_VERSION` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录sugget词库版本号';

-- ----------------------------
-- Table structure for s_SE_KWD_CLEAN_KEYWORD
-- ----------------------------
DROP TABLE IF EXISTS `s_SE_KWD_CLEAN_KEYWORD`;
CREATE TABLE `s_SE_KWD_CLEAN_KEYWORD` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYWORD` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关键词原词',
  `PINYIN` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关键词对应的拼音',
  `LISTING_COUNT` bigint(20) DEFAULT NULL COMMENT '关键对应的搜索页商品数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=492474 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用于计算生产sugget词库的原词';

-- ----------------------------
-- Table structure for s_SUGGEST_KEYWORD
-- ----------------------------
DROP TABLE IF EXISTS `s_SUGGEST_KEYWORD`;
CREATE TABLE `s_SUGGEST_KEYWORD` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYWORD` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `PINYIN` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `POPULARITY` bigint(20) DEFAULT '0',
  `PROD_COUNT` bigint(20) DEFAULT '0',
  `SHOUZIMU` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313568 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='储存搜索框sugget词库';

-- ----------------------------
-- Table structure for s_SUGGEST_KEYWORD_SOTRENUM
-- ----------------------------
DROP TABLE IF EXISTS `s_SUGGEST_KEYWORD_SOTRENUM`;
CREATE TABLE `s_SUGGEST_KEYWORD_SOTRENUM` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYWORD` varchar(100) DEFAULT NULL,
  `PINYIN` varchar(100) DEFAULT NULL,
  `POPULARITY` bigint(20) DEFAULT '0',
  `PROD_COUNT` bigint(20) DEFAULT '0',
  `SHOUZIMU` varchar(100) DEFAULT NULL,
  `STORENUM` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_SUGGEST_KEYWORD_VERSION
-- ----------------------------
DROP TABLE IF EXISTS `s_SUGGEST_KEYWORD_VERSION`;
CREATE TABLE `s_SUGGEST_KEYWORD_VERSION` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `KEYWORD_TYPE` int(11) NOT NULL DEFAULT '1',
  `CURRENT_VERSION` timestamp NULL DEFAULT NULL,
  `INUSED_VERSION` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='记录sugget词库版本号';

-- ----------------------------
-- Table structure for s_TASTE_PREFERENCES
-- ----------------------------
DROP TABLE IF EXISTS `s_TASTE_PREFERENCES`;
CREATE TABLE `s_TASTE_PREFERENCES` (
  `USER_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `PREFERENCE` float NOT NULL,
  `TIMESTETAMP` bigint(20) DEFAULT NULL,
  `STORENUM` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for schedule_execution_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_execution_log`;
CREATE TABLE `schedule_execution_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志流水id，自增',
  `schedule_id` int(11) NOT NULL COMMENT '任务id,引用自schedule_meta表id',
  `status` tinyint(4) NOT NULL COMMENT '任务执行状态,0:失败,1:成功',
  `log` varchar(512) COLLATE utf8_bin DEFAULT '' COMMENT '日志消息',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务执行开始时间',
  `finished_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务执行完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4626099 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for schedule_meta
-- ----------------------------
DROP TABLE IF EXISTS `schedule_meta`;
CREATE TABLE `schedule_meta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `bean_name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '业务目标Bean名称',
  `method` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '业务目标方法名称',
  `server_addr` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '服务器域名',
  `cron_exp` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'cron表达式',
  `param_json` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '参数，JSON格式',
  `status` tinyint(11) NOT NULL DEFAULT '0' COMMENT '状态0:未运行,1:正在运行',
  `enabled` tinyint(11) NOT NULL DEFAULT '1' COMMENT '0:不启用，1:已启用',
  `desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '任务描述',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '任务更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for schema_version
-- ----------------------------
DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_permission_init
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_init`;
CREATE TABLE `sys_permission_init` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `permission_init` varchar(255) DEFAULT NULL COMMENT '需要具备的权限',
  `sort` int(50) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` int(11) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_cat
-- ----------------------------
DROP TABLE IF EXISTS `t_cat`;
CREATE TABLE `t_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=839055148570513409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_counttype
-- ----------------------------
DROP TABLE IF EXISTS `t_counttype`;
CREATE TABLE `t_counttype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL COMMENT '任务指标组id',
  `name` varchar(32) NOT NULL COMMENT '展示名称',
  `tbl_name` varchar(32) NOT NULL COMMENT '类型 ',
  `filter_condition` varchar(255) DEFAULT NULL COMMENT '过滤条件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='统计类型表';

-- ----------------------------
-- Table structure for t_merge_table_desc
-- ----------------------------
DROP TABLE IF EXISTS `t_merge_table_desc`;
CREATE TABLE `t_merge_table_desc` (
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `create_col_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for t_quota
-- ----------------------------
DROP TABLE IF EXISTS `t_quota`;
CREATE TABLE `t_quota` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL COMMENT '指标分组id',
  `name` varchar(32) NOT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '类型',
  `enable` bit(1) DEFAULT b'1' COMMENT '是否启动',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='任务指标项';

-- ----------------------------
-- Table structure for t_quotagroup
-- ----------------------------
DROP TABLE IF EXISTS `t_quotagroup`;
CREATE TABLE `t_quotagroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '指标分组名称',
  `type` tinyint(4) NOT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='任务指标组';

-- ----------------------------
-- Table structure for wx_cart
-- ----------------------------
DROP TABLE IF EXISTS `wx_cart`;
CREATE TABLE `wx_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `quantity` int(11) NOT NULL COMMENT '手机号码',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态  1 有效 0 失效',
  `site_id` int(11) NOT NULL COMMENT '商家id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_51jk_faq_answers
-- ----------------------------
DROP TABLE IF EXISTS `yb_51jk_faq_answers`;
CREATE TABLE `yb_51jk_faq_answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_id` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID 其中51jk=999999',
  `q_no` char(30) NOT NULL DEFAULT '' COMMENT '问题ID 同问题id',
  `q_content` text NOT NULL COMMENT '问题内容',
  `actor_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提问者id',
  `actor_type` int(11) unsigned NOT NULL DEFAULT '300' COMMENT '100=用户 200=门店店员 300=管理员',
  `actor_name` char(50) DEFAULT '' COMMENT '提问者名称',
  `actor_store_id` int(11) unsigned DEFAULT '0' COMMENT '回复者所属门店ID 0=总部',
  `q_status` int(3) unsigned NOT NULL DEFAULT '100' COMMENT '问题当前状态 100=待处理 200=处理中 300=已解决',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_51jk_faq_main
-- ----------------------------
DROP TABLE IF EXISTS `yb_51jk_faq_main`;
CREATE TABLE `yb_51jk_faq_main` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_id` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID 其中51jk=999999',
  `q_no` char(30) NOT NULL DEFAULT '' COMMENT '问题ID',
  `q_type` int(3) unsigned NOT NULL DEFAULT '999' COMMENT '问题类型 \r\n110=BUG反馈\r\n120=技术支持\r\n130=需求\r\n140=商务咨询\r\n150=投诉\r\n999=其它\r\n',
  `q_title` varchar(100) DEFAULT '' COMMENT '标题',
  `q_content` text COMMENT '问题内容',
  `actor_type` int(3) unsigned NOT NULL DEFAULT '200' COMMENT '100=用户 200=门店店员 300=管理员 400=A站用户',
  `actor_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提问者id',
  `actor_name` char(50) DEFAULT '' COMMENT '提问者名称',
  `actor_store_id` int(11) unsigned DEFAULT '0' COMMENT '提问者所属门店ID 0=总部',
  `answers_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复数',
  `q_status` int(3) unsigned NOT NULL DEFAULT '100' COMMENT '问题当前状态 100=待处理 200=处理中 300=已解决',
  `last_operator_type` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '最后回复者类型 100=用户 200=门店店员 300=管理员 400=A站用户',
  `last_operator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后回复人id',
  `last_operator_name` varchar(50) DEFAULT '' COMMENT '最后回复人名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_51jk_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `yb_51jk_upgrade`;
CREATE TABLE `yb_51jk_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '升级公告ID 主键',
  `platform_type` smallint(3) unsigned NOT NULL DEFAULT '9999' COMMENT '平台 110= A站商家后台，115=A站门店后台 120=微信后台，130=app 9999=其它',
  `version` char(50) NOT NULL DEFAULT '' COMMENT '版本号',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '功能简介',
  `content` text NOT NULL COMMENT '升级详情说明',
  `tips_type` smallint(3) unsigned NOT NULL DEFAULT '100' COMMENT '提醒方式 100=显示在顶部黄条 200=不显示顶部黄条',
  `attachment` varchar(1024) DEFAULT '' COMMENT '附件列表',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 显示还是隐藏 0=隐藏 1=显示',
  `author` char(20) DEFAULT '' COMMENT '发布者',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 0=没删除 1=已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `IX_platform_type` (`platform_type`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='升级公告';

-- ----------------------------
-- Table structure for yb_51jk_watermark_goods
-- ----------------------------
DROP TABLE IF EXISTS `yb_51jk_watermark_goods`;
CREATE TABLE `yb_51jk_watermark_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `watermark_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '水印图片id',
  `position_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '水印位置',
  `position_type_coordinates` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义水印坐标',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`,`site_id`) USING BTREE,
  KEY `idx_watermark_id` (`watermark_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_51jk_watermark_images
-- ----------------------------
DROP TABLE IF EXISTS `yb_51jk_watermark_images`;
CREATE TABLE `yb_51jk_watermark_images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '水印名称',
  `goods_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品统计数',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '水印类型（0公共水印，1私有水印）',
  `host_id` char(32) NOT NULL DEFAULT 'a' COMMENT '服务器ID',
  `hash` char(32) NOT NULL COMMENT '图片ID',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '高度',
  `size` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '大小',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '图片状态 0 有效 1 无效',
  `postfix` mediumint(5) unsigned NOT NULL DEFAULT '10' COMMENT '类型 10=jpg 20=png 30=gif',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_about
-- ----------------------------
DROP TABLE IF EXISTS `yb_about`;
CREATE TABLE `yb_about` (
  `about_id` int(11) NOT NULL AUTO_INCREMENT,
  `about_us` text COMMENT '关于我们',
  `contact_us` text COMMENT '联系我们',
  `merchant_join` text COMMENT '商户加盟',
  `legal_disclaimer` text COMMENT '法律声明',
  `privacy_protection` text COMMENT '隐私保护',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`about_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_account
-- ----------------------------
DROP TABLE IF EXISTS `yb_account`;
CREATE TABLE `yb_account` (
  `account_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家收款帐号表',
  `seller_id` int(11) NOT NULL COMMENT '商家ID（yb_merchant）',
  `account_name` varchar(60) NOT NULL COMMENT '帐号实名认证的姓名',
  `payplatform_id` int(11) NOT NULL COMMENT '支付平台ID，与yb_paylatform表的id对应',
  `account` varchar(255) NOT NULL COMMENT '帐号名称',
  `payment_name` varchar(255) DEFAULT '' COMMENT '支付平台名称，如: 支付宝',
  `proportion` decimal(5,3) unsigned NOT NULL COMMENT '分账比例，此处反应的是YBZF的比例，用以进行计算 0.01=1%',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`account_id`),
  KEY `idx_user_id` (`seller_id`),
  KEY `idx_user_id,idx_payplatform_id` (`seller_id`,`payplatform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_account_check
-- ----------------------------
DROP TABLE IF EXISTS `yb_account_check`;
CREATE TABLE `yb_account_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '商家编号',
  `site_name` varchar(32) DEFAULT NULL COMMENT '商家名称',
  `trades_id` bigint(20) unsigned NOT NULL COMMENT '订单ID',
  `sub_trades_id` int(32) DEFAULT NULL COMMENT '子订单',
  `pay_number` varchar(32) DEFAULT NULL COMMENT '订单流水号',
  `pay_style` varchar(30) DEFAULT NULL COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)， unionPay(银联)， health_insurance（医保），cash（现金）',
  `real_pay` int(11) DEFAULT NULL COMMENT '支付金额',
  `pay_time` datetime DEFAULT NULL COMMENT '买家付款时间',
  `real_refund_money` int(11) DEFAULT NULL COMMENT '实际退款金额',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `plat_split` int(11) DEFAULT NULL COMMENT '代收手续费(平台佣金)',
  `trades_split` int(11) DEFAULT NULL COMMENT '佣金',
  `trades_source` smallint(6) DEFAULT NULL COMMENT '订单来源 110 (网站)，120（微信），130（app）, 140（店员帮用户下单），9999（其它）',
  `trades_status` smallint(6) DEFAULT NULL COMMENT '110(等侍买家付款), 120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，190(买家申请退款 退款中,未使用) 200(退款成功)',
  `account_checking_status` smallint(6) DEFAULT '0' COMMENT '对账状态 0=未对账,1=对账成功,2=对账失败，3=支付log未同步到yb_settlement_records 表',
  `check_status` smallint(6) DEFAULT '0' COMMENT 'check状态 0=对账未成功 1=对账已成功',
  `platform_pay_time` datetime DEFAULT NULL COMMENT '第三方平台付款时间',
  `import_trades_status` varchar(50) DEFAULT '' COMMENT '第三方交易状态   转账,在线支付,提现,交易分账,收费,买家已支付',
  `account_source` smallint(6) DEFAULT '100' COMMENT '对账来源  100:财务 110:其他',
  `settlement_status` smallint(6) DEFAULT NULL COMMENT '结算状态 100=不结算 150=待结算 200=可结算',
  `settlement_day` date DEFAULT NULL COMMENT '结算操作日',
  `trade_end_time` datetime DEFAULT NULL COMMENT '交易结束时间',
  `contract_pay_day` datetime DEFAULT NULL COMMENT '合同支付日',
  `count_status` smallint(6) DEFAULT NULL COMMENT '汇总状态',
  `account_day` date DEFAULT NULL COMMENT '支付日=结算操作日+3天',
  `handle_status` int(11) DEFAULT '100' COMMENT '处理状态(100:未开始, 110:成功, 120: 待处理, 130: 异常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`),
  KEY `idx_trades_id` (`trades_id`),
  KEY `idx_pay_style` (`pay_style`),
  KEY `IX_pay_time` (`pay_time`),
  KEY `IX_handle_status` (`handle_status`)
) ENGINE=InnoDB AUTO_INCREMENT=213412 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_account_check_log
-- ----------------------------
DROP TABLE IF EXISTS `yb_account_check_log`;
CREATE TABLE `yb_account_check_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL COMMENT '操作人id',
  `operation_name` varchar(32) NOT NULL COMMENT '操作人名字',
  `record_id` int(11) NOT NULL COMMENT '对应yb_account_check的id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_record_id` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_account_exception
-- ----------------------------
DROP TABLE IF EXISTS `yb_account_exception`;
CREATE TABLE `yb_account_exception` (
  `site_id` int(11) NOT NULL COMMENT '商家id',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '（订单异常监控表）',
  `trades_id` bigint(20) DEFAULT NULL COMMENT '交易ID由：seller_id+年(取后两位)月日+每天的交易流水号 组合成唯一的交易ID(seller_id:商家唯一id,id为交易流水号)',
  `pay_style` varchar(20) DEFAULT NULL,
  `error_code` int(11) DEFAULT NULL COMMENT '错误状态码:1:(订单类型为空);2:支付方式(付款状态成功,支付方式为空);3:付款方式(付款状态成功,但是为未付款的);4:手续费;5:佣金;6:配送费;7:订单状态;8:结束状态',
  `settlement_type` tinyint(2) DEFAULT NULL COMMENT '0 直购 1分销  2 预存金',
  `is_payment` tinyint(2) DEFAULT '0' COMMENT '是否付款(0:否 1:是)',
  `creat_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '导入时间',
  `order_time` timestamp NULL DEFAULT NULL COMMENT '下单时间',
  `consign_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '收货时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '付款时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '交易结束时间',
  `real_pay` int(11) DEFAULT NULL COMMENT '商品实付金额',
  `refund_fee` int(11) DEFAULT NULL COMMENT '退款金额',
  `plat_split` int(11) DEFAULT NULL COMMENT '手续费',
  `trades_split` int(11) DEFAULT NULL COMMENT '佣金(直销/分销)',
  `O2O_freight` int(11) DEFAULT NULL COMMENT '配送费',
  `trades_status` int(11) DEFAULT NULL COMMENT '订单状态:110(等侍买家付款), 120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，200( 待取货|待自提，直购和自提专用),210（ 已取货|已自提 直购和自提专用），900（已退款），220(用户确认收货)，230(门店确认收货)，800（系统确认收货）,240(已取消【门店自提待自提后可取消订单】)',
  `deal_finish_status` tinyint(1) DEFAULT NULL COMMENT '交易结束状态 0:交易进行中 1:交易结束',
  PRIMARY KEY (`id`),
  UNIQUE KEY `trades_id` (`trades_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1753 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_accout_commission_rate
-- ----------------------------
DROP TABLE IF EXISTS `yb_accout_commission_rate`;
CREATE TABLE `yb_accout_commission_rate` (
  `site_id` int(10) unsigned NOT NULL,
  `direct_purchase_rate` decimal(5,3) unsigned DEFAULT '0.000' COMMENT '直购订单佣金比例',
  `distributor_rate` decimal(5,3) unsigned DEFAULT NULL COMMENT '分销订单佣金比例',
  `shipping_fee_rate` decimal(5,3) unsigned DEFAULT NULL COMMENT '配送费佣金比例',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间，',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_address
-- ----------------------------
DROP TABLE IF EXISTS `yb_address`;
CREATE TABLE `yb_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '买家地址库',
  `buyer_id` int(11) NOT NULL COMMENT '买家唯一id,对应yb_member表id字段',
  `province_code` int(11) NOT NULL COMMENT '地区代码(省/市)',
  `province` varchar(60) DEFAULT '' COMMENT '省',
  `city` varchar(60) DEFAULT '' COMMENT '市',
  `country` varchar(60) DEFAULT '' COMMENT '区',
  `addr` varchar(255) NOT NULL COMMENT '详细地址,不需要重复填写省/市/区',
  `zip_code` varchar(20) DEFAULT '' COMMENT '地区邮政编码',
  `phone` varchar(20) DEFAULT '' COMMENT '电话号码',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `name` varchar(60) NOT NULL COMMENT '收货人姓名',
  `isdefault` int(1) NOT NULL COMMENT '是否为默认地址: 0 （不是），1(是)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_buyer_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_app_logs
-- ----------------------------
DROP TABLE IF EXISTS `yb_app_logs`;
CREATE TABLE `yb_app_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operator_id` int(11) unsigned DEFAULT '0' COMMENT '操作者ID',
  `operator` varchar(50) DEFAULT '' COMMENT '操作者',
  `operator_type` int(3) unsigned DEFAULT '110' COMMENT '操作者类型 110=管理员 200=店员 300=买家（用户）',
  `action` varchar(100) NOT NULL,
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_area
-- ----------------------------
DROP TABLE IF EXISTS `yb_area`;
CREATE TABLE `yb_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_letter` char(2) DEFAULT '' COMMENT '首字母',
  `areaid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '区域类型.area区域 1:country/国家;2:province/省/自治区/直辖市;3:city/地区(省下面的地级市);4:district/县/市(县级市)/区;abroad:海外. 比如北京市的area_type = 2,朝阳区是北京市的一个区,所以朝阳区的area_type = 4.',
  `name` varchar(255) NOT NULL COMMENT '地域名称.如北京市,杭州市,西湖区,每一个area_id 都代表了一个具体的地区.',
  `parent_id` int(11) NOT NULL COMMENT '父节点区域标识.如北京市的area_id是110100,朝阳区是北京市的一个区,所以朝阳区的parent_id就是北京市的area_id.',
  `zip` varchar(11) DEFAULT '' COMMENT '具体一个地区的邮编',
  PRIMARY KEY (`id`),
  KEY `idx_areaid` (`areaid`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4515 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_barnd
-- ----------------------------
DROP TABLE IF EXISTS `yb_barnd`;
CREATE TABLE `yb_barnd` (
  `barnd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌表',
  `barnd_name` varchar(255) NOT NULL COMMENT '品牌名',
  `barnd_desc` varchar(255) DEFAULT '' COMMENT '品牌描述',
  `site_url` varchar(255) DEFAULT '' COMMENT '公司网址',
  `barnd_logo` varchar(255) DEFAULT '' COMMENT '品牌logo',
  `is_show` int(1) DEFAULT '0' COMMENT '是否显示: 0(显示) ，1（不显示）',
  `barnd_sort` int(11) DEFAULT '99999' COMMENT '排序字段（数字越小越靠前，非负数），默认为：99999',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `add_status` int(11) DEFAULT '10' COMMENT '新增品牌审核状态: 10(未审核)，11（通过），12（不通过），13(忽略)',
  PRIMARY KEY (`barnd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3877 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_category
-- ----------------------------
DROP TABLE IF EXISTS `yb_category`;
CREATE TABLE `yb_category` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户自己定义分类ID',
  `parent_id` int(11) NOT NULL COMMENT '父类ID: 0(表示顶级分类)，其它数字为分类的ID',
  `cate_code` varchar(200) NOT NULL DEFAULT '' COMMENT '商品分类code',
  `cate_name` varchar(255) NOT NULL COMMENT '分类名称',
  `cate_sort` int(11) DEFAULT '9999' COMMENT '排序用 （数字越小越靠前，非负数），默认为: 9999',
  `cate_ishow` int(11) DEFAULT '0' COMMENT '是否显示:   0(显示)，1（不显示）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del_tag` tinyint(1) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  `site_id` int(11) DEFAULT '100030' COMMENT '商家ID',
  PRIMARY KEY (`cate_id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_cate_code` (`cate_code`) USING BTREE,
  KEY `IX_cate_ishow` (`cate_ishow`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_classified_statistic
-- ----------------------------
DROP TABLE IF EXISTS `yb_classified_statistic`;
CREATE TABLE `yb_classified_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算明细分类汇总表',
  `finance_no` varchar(40) DEFAULT '' COMMENT '汇总单号',
  `seller_id` int(11) NOT NULL COMMENT '商家id',
  `seller_name` varchar(225) DEFAULT NULL COMMENT '商家名称',
  `pay_style` char(40) DEFAULT 'ali' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)， unionPay(银联)， health_insurance（医保），cash（现金）',
  `settlement_start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结算起始日期',
  `settlement_end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结算结束日期',
  `total_pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单总价，实际支付金额',
  `finance_checking_total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '对账金额 (单位：分)',
  `platform_total` int(11) unsigned DEFAULT '0' COMMENT '支付平台服务手续费(单位：分)',
  `commission_total` int(11) DEFAULT '0' COMMENT '交易佣金(单位：分)',
  `refund_total` int(11) DEFAULT NULL COMMENT '退款总金额',
  `post_total` int(11) DEFAULT NULL COMMENT '代收邮费',
  `refund_checking_total` int(11) DEFAULT NULL COMMENT '对账退款总金额',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_config_goods_sync
-- ----------------------------
DROP TABLE IF EXISTS `yb_config_goods_sync`;
CREATE TABLE `yb_config_goods_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `detail_tpl` int(11) NOT NULL DEFAULT '0' COMMENT '商品录入模板标识：10（药品类模板），20（其他类模板），30（器械类模板），40（保健品模板），50（2.0版本废弃），60（化妆品模板），70 (中药材模板) ，80 (消毒类模板)',
  `allow_add` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许新增 0=拒绝新增 1=允许新增',
  `allow_update` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许更新 0=禁止更新 1=允许更新',
  `fields` text COMMENT '是否更新字段列表多个用逗号隔开如:approval_number,specif_cation,goods_company,drug_category',
  `fields_pk` varchar(255) DEFAULT '' COMMENT '允许更新的字段主键 多个用逗号隔开如:approval_number,specif_cation',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_erp
-- ----------------------------
DROP TABLE IF EXISTS `yb_erp`;
CREATE TABLE `yb_erp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `erp_name` varchar(255) DEFAULT '' COMMENT 'ERP 名称',
  `erp_plugins` varchar(60) DEFAULT '' COMMENT 'ERP 插件名(字母)',
  `erp_memo` text COMMENT 'ERP 说明',
  `erp_docurl` varchar(255) DEFAULT NULL COMMENT 'erp 文档地址',
  `erp_status` int(11) unsigned DEFAULT '10' COMMENT '开发状态（10:未开始，20:研发中，30: 已上线）',
  `erp_del` int(11) unsigned DEFAULT '0' COMMENT '软删除（0：正常，1：删除）',
  `company` varchar(255) DEFAULT '' COMMENT '开发商名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_filter_url
-- ----------------------------
DROP TABLE IF EXISTS `yb_filter_url`;
CREATE TABLE `yb_filter_url` (
  `id` int(11) NOT NULL,
  `platform` int(5) NOT NULL COMMENT '平台',
  `login_url` varchar(255) DEFAULT NULL COMMENT '登录url',
  `success_url` varchar(255) DEFAULT NULL COMMENT '登陆成功跳转的url',
  `unauthorized_url` varchar(255) DEFAULT NULL COMMENT '权限验证失败url',
  `logout_url` varchar(255) DEFAULT NULL COMMENT '退出登录',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_finance
-- ----------------------------
DROP TABLE IF EXISTS `yb_finance`;
CREATE TABLE `yb_finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付记录',
  `site_id` int(11) NOT NULL COMMENT '买家ID',
  `seller_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商家名称',
  `pay_style` char(40) NOT NULL DEFAULT 'ali' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)， unionPay(银联)， health_insurance（医保），cash（现金）',
  `settlement_start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结算起始日期',
  `settlement_end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结算结束日期',
  `pay_day` date NOT NULL DEFAULT '0000-00-00' COMMENT '结算日（付款）',
  `total_pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单总价，实际支付金额',
  `finance_checking_total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '对账金额 (单位：分)',
  `platform_total` int(11) unsigned DEFAULT '0' COMMENT '支付平台服务手续费(单位：分)',
  `commission_total` int(11) DEFAULT '0' COMMENT '交易佣金(单位：分)',
  `need_pay` int(11) NOT NULL DEFAULT '0' COMMENT '应付金额(单位：分)',
  `real_pay` int(11) DEFAULT '0' COMMENT '已付金额',
  `invoice` tinyint(2) DEFAULT '0' COMMENT '佣金发票 0=未开票 1=已开票',
  `invoice_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开票金额',
  `status` int(4) unsigned DEFAULT '0' COMMENT '结算状态 0=未处理 100 未支付 110=延期支付 200=支付部分 900=已结清',
  `remark` varchar(300) DEFAULT '' COMMENT '备注',
  `audit_status` smallint(3) unsigned DEFAULT '0' COMMENT '审核状态(0审核中 110 审核成功 120审核失败 130 商家已确认 140 商家未确认）',
  `audit_remark` varchar(300) DEFAULT '' COMMENT '审核备注',
  `refund_total` int(11) unsigned DEFAULT '0' COMMENT '退款总金额',
  `refund_checking_total` int(11) unsigned DEFAULT '0' COMMENT '对账退款总金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `pay_date` date DEFAULT NULL COMMENT '支付日期',
  `invoice_time` date DEFAULT NULL COMMENT '开票日期',
  `invoice_number` varchar(11) DEFAULT NULL COMMENT '发票号码',
  `express_number` varchar(32) DEFAULT NULL COMMENT '快递单号',
  `express_type` varchar(32) DEFAULT NULL COMMENT '快递公司',
  `change_130_time` datetime DEFAULT NULL COMMENT '商家确认时间',
  `operator_name` varchar(32) DEFAULT NULL COMMENT '结算操作人名字',
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12645 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_finance_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `yb_finance_audit_log`;
CREATE TABLE `yb_finance_audit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation_id` int(10) unsigned NOT NULL COMMENT '操作人id',
  `operation_name` varchar(32) NOT NULL COMMENT '操作人名',
  `finance_no` varchar(50) DEFAULT NULL COMMENT '汇总单号',
  `finance_id` int(11) NOT NULL COMMENT '汇总记录ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `finance_no1` varchar(50) DEFAULT NULL COMMENT '汇总单号',
  PRIMARY KEY (`id`),
  KEY `idx_finance_id` (`operation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_finances
-- ----------------------------
DROP TABLE IF EXISTS `yb_finances`;
CREATE TABLE `yb_finances` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算统计表（出账表）new',
  `finance_no` varchar(40) DEFAULT '' COMMENT '汇总单号',
  `seller_id` int(11) NOT NULL COMMENT '商家站点id',
  `seller_name` varchar(225) DEFAULT '' COMMENT '商家名称',
  `settlement_start_date` date DEFAULT '0000-00-00' COMMENT '结算起始日期',
  `settlement_end_date` date DEFAULT '0000-00-00' COMMENT '结算结束日期',
  `pay_day` date DEFAULT '0000-00-00' COMMENT '结算日（付款）',
  `total_pay` int(11) DEFAULT '0' COMMENT '订单总价，实际支付金额',
  `finance_checking_total` int(11) DEFAULT '0' COMMENT '对账金额 (单位：分)',
  `platform_total` int(11) DEFAULT '0' COMMENT '支付平台服务手续费(单位：分)',
  `post_total` int(11) DEFAULT NULL COMMENT '代收总邮费',
  `commission_total` int(11) DEFAULT '0' COMMENT '交易佣金(单位：分)',
  `need_pay` int(11) DEFAULT '0' COMMENT '应付金额(单位：分)',
  `real_pay` int(11) DEFAULT '0' COMMENT '已付金额',
  `invoice` tinyint(2) DEFAULT '0' COMMENT '佣金发票 0=未开票 1=已开票',
  `invoice_value` int(10) DEFAULT '0' COMMENT '开票金额',
  `status` int(4) DEFAULT '0' COMMENT '结算状态 0=未处理 100 未支付 110=延期支付 200=支付部分 900=已结清',
  `remark` varchar(225) DEFAULT '' COMMENT '备注',
  `audit_status` smallint(3) DEFAULT '0' COMMENT '审核状态(0审核中 110 审核成功 120审核失败 130 商家已确认 140 商家未确认）',
  `audit_remark` varchar(225) DEFAULT '' COMMENT '审核备注',
  `refund_total` int(11) DEFAULT NULL COMMENT '退款总金额',
  `refund_checking_total` int(11) DEFAULT '0' COMMENT '对账退款总金额',
  `is_charge_off` tinyint(1) DEFAULT '0' COMMENT '是否有异常，0正常，1异常',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '支付创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `pay_date` date DEFAULT NULL COMMENT '支付日期',
  `invoice_time` date DEFAULT NULL COMMENT '开票日期',
  `invoice_number` varchar(11) DEFAULT '' COMMENT '发票号码',
  `express_number` varchar(32) DEFAULT '' COMMENT '快递单号',
  `express_type` varchar(32) DEFAULT '' COMMENT '快递公司',
  `change_130_time` datetime DEFAULT NULL COMMENT '商家确认时间',
  `operator_name` varchar(32) DEFAULT '' COMMENT '结算操作人名字',
  `merchant_remark` varchar(255) DEFAULT '' COMMENT '商家备注',
  PRIMARY KEY (`id`),
  KEY `idx_finance_no` (`finance_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_goods
-- ----------------------------
DROP TABLE IF EXISTS `yb_goods`;
CREATE TABLE `yb_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `approval_number` varchar(60) DEFAULT '' COMMENT '批准文号',
  `drug_name` varchar(255) NOT NULL COMMENT '药品名/商品名（非药类商品）/器械名(非药类)/',
  `com_name` varchar(255) DEFAULT '' COMMENT '药品通用名',
  `specif_cation` varchar(255) DEFAULT '' COMMENT '规格(10mg*30片)，每一个规格都是一种药品',
  `goods_company` varchar(255) DEFAULT '' COMMENT '生产企业',
  `barnd_id` varchar(64) DEFAULT '' COMMENT '品牌（用户也可以自己填写品牌）',
  `drug_category` int(11) DEFAULT '0' COMMENT '类别: 110(甲类非处方药)，120(已类非处方药)，130(处方药)，140(双轨药)，150(非方剂)，160(方剂)，170(一类)，180(二类)，190(三类)',
  `goods_property` int(11) DEFAULT '0' COMMENT '药品属性: 110(化学药制剂 ), 120(中成药), 130(生物制品), 140(抗生素) , 150(中药材) , 160(中药饮片) , 170(复方制剂) , 9999(其他),180(根茎类), 190(茎木类), 200(皮类), 210(叶类), 220(花类), 230(全草类), 240(果实种子类), 250(矿物类), 260(动物类)',
  `goods_use` varchar(255) DEFAULT '' COMMENT '使用方法: 110(口服), 120(外用), 130(注射), 140(含服), 9999(其他)',
  `goods_forts` int(11) DEFAULT '0' COMMENT '剂型: 110(片剂), 120(胶囊), 130(丸剂), 140(颗粒), 150(液体), 160(膏剂), 170(贴剂), 180(糖浆), 190(散剂), 200(栓剂), 210(喷雾), 9999(其他)',
  `goods_validity` int(11) DEFAULT '0' COMMENT '有效期(月)',
  `goods_forpeople` varchar(255) DEFAULT '' COMMENT '适用人群：110(不限)， 120(成人)，130(婴幼儿)，140(儿童)，150(男性)，160(妇女) ，170 (中老年)',
  `user_cateid` varchar(200) NOT NULL DEFAULT '' COMMENT '用户自定义分类（前期固定)',
  `goods_title` varchar(255) NOT NULL COMMENT '商品标题（用户自定义）,字数限制在60-80',
  `goods_tagsid` varchar(255) DEFAULT '' COMMENT '标签id(用,号隔开),对表标签表（b_tags）',
  `market_price` int(11) NOT NULL COMMENT '市场价格（以分为单位）',
  `shop_price` int(11) NOT NULL COMMENT '药房价格（以分为单位）',
  `discount_price` int(11) DEFAULT '0' COMMENT '折扣价格/会员价格/用户手动改价（以分为单位）',
  `in_stock` int(11) DEFAULT '0' COMMENT '库存(件)',
  `goods_weight` int(11) DEFAULT '0' COMMENT '重量(克)',
  `control_num` int(11) DEFAULT '0' COMMENT '限购（件）, 0为不限购',
  `goods_status` int(11) DEFAULT '1' COMMENT '产品状态\r\n1(未审核 不允许商家使用)\r\n2(已审核 允许商家使用),\r\n3(软删除)\r\n10=初审',
  `freight_payer` int(11) DEFAULT '2' COMMENT '运费承担方式:  1(商家), 2(买家)',
  `list_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上架时间',
  `delist_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下架时间',
  `postage_id` int(11) DEFAULT '0' COMMENT '运费模版id',
  `detail_tpl` int(11) NOT NULL COMMENT '商品录入模板标识：10（药品类模板），20（其他类模板），30（器械类模板），40（保健品模板），50（2.0版本废弃），60（化妆品模板），70 (中药材模板) ，80 (消毒类模板)',
  `is_medicare` tinyint(1) unsigned DEFAULT '0' COMMENT '是否医保 1=非医保, 2=甲类医保, 3=乙类医保',
  `medicare_code` char(32) DEFAULT '' COMMENT '医保编码',
  `medicare_top_price` int(10) unsigned DEFAULT '0' COMMENT '医保最高价格 单位：分',
  `bar_code` char(32) DEFAULT '' COMMENT '条形码',
  `mnemonic_code` varchar(255) DEFAULT '' COMMENT '助记码',
  `goods_code` varchar(50) DEFAULT '' COMMENT '商品编码',
  `update_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品更新状态 0(锁定 不接受商家更新),1(可更新 接受商家更新) ',
  `update_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '图片更新状态（0 未处理 1已处理）',
  `syncdate_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '同步商品信息的时间',
  `merchant_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品来源商家 0表示YBZF后台新增',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '产品修改时间',
  PRIMARY KEY (`goods_id`),
  KEY `idx_appmum` (`approval_number`),
  KEY `idx_goods_title` (`goods_title`),
  KEY `idx_durg,idx_com` (`drug_name`,`com_name`),
  KEY `idx_user_cateid` (`user_cateid`) USING BTREE,
  KEY `IX_goods_status` (`goods_status`)
) ENGINE=InnoDB AUTO_INCREMENT=80371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_goods_has_tag
-- ----------------------------
DROP TABLE IF EXISTS `yb_goods_has_tag`;
CREATE TABLE `yb_goods_has_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品标签关联表',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表goods_id',
  `tags_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品标签表tags_id',
  `tags_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0=正常,1=删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`) USING BTREE,
  KEY `idx_tags_id` (`tags_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132709 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_goods_sync_draft
-- ----------------------------
DROP TABLE IF EXISTS `yb_goods_sync_draft`;
CREATE TABLE `yb_goods_sync_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `site_id` int(11) DEFAULT '0' COMMENT '来源站点 FK商家信息表merchant_id',
  `sync_type` tinyint(1) DEFAULT '2' COMMENT '类型 0=已删除 1=新增 2=更新（默认）',
  `yb_goods_id` int(11) DEFAULT NULL COMMENT '对应yb_goods.goods_id',
  `detail_tpl` int(11) DEFAULT NULL COMMENT '商品录入模板标识：10（药品类模板），20（其他类模板），30（器械类模板），40（保健品模板），50（2.0版本废弃），60（化妆品模板），70 (中药材模板) ，80 (消毒类模板)',
  `brand_id` int(11) DEFAULT '0' COMMENT '品牌（用户也可以自己填写品牌）',
  `drug_name` varchar(255) DEFAULT NULL COMMENT '药品名/商品名（非药类商品）/器械名(非药类)',
  `specif_cation` varchar(255) DEFAULT '' COMMENT '规格(10mg*30片)，每一个规格都 是一种药品',
  `approval_number` varchar(60) DEFAULT '' COMMENT '批准文号',
  `info_sync_status` int(11) DEFAULT '110' COMMENT '110(待同步，默认) 120(忽略 更新) 130(已更新/同步)',
  `img_sync_status` int(11) DEFAULT '110' COMMENT '110(待同步，默认) 120(忽略更新)  130(已更新/同步)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_site_id` (`site_id`) USING BTREE,
  KEY `idx_brand_id` (`brand_id`) USING BTREE,
  KEY `IX_sync_type` (`sync_type`),
  KEY `com_status_detail` (`detail_tpl`,`info_sync_status`)
) ENGINE=InnoDB AUTO_INCREMENT=92261 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_goods_sync_draft_ext
-- ----------------------------
DROP TABLE IF EXISTS `yb_goods_sync_draft_ext`;
CREATE TABLE `yb_goods_sync_draft_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sync_draft_id` int(11) unsigned DEFAULT '0' COMMENT 'FK yb_goods_sync_draft id',
  `com_name` varchar(255) DEFAULT '' COMMENT '药品通用名',
  `goods_company` varchar(255) DEFAULT '' COMMENT '生产企业',
  `drug_category` int(11) DEFAULT '0' COMMENT '类别: 110(甲类非处方药)，120(已类非处方药)，130(处方药)，140(双轨药)，150(非方剂)，160(方剂)，170(一类)，180(二类)，190(三类)',
  `goods_property` int(11) DEFAULT '0' COMMENT '药品属性: 110(化学药制剂 ), 120(中成药), 130(生物制品), 140(抗生素) , 150(中药材) , 160(中药饮片) , 170(复方制剂) , 9999(其他),180(根茎类), 190(茎木类), 200(皮类), 210(叶类), 220(花类), 230(全草类), 240(果实种子类), 250(矿物类), 260(动物类)',
  `goods_forts` int(11) DEFAULT '0' COMMENT '剂型: 110(片剂), 120(胶囊), 130(丸剂), 140(颗粒), 150(液体), 160(膏剂), 170(贴剂), 180(糖浆), 190(散剂), 200(栓剂), 210(喷雾), 9999(其他)',
  `goods_validity` int(11) DEFAULT '0' COMMENT '有效期(月)',
  `goods_use` varchar(255) DEFAULT '' COMMENT '使用方法: 110(口服), 120(外用), 130(注射), 140(含服), 9999(其他)',
  `goods_forpeople` varchar(255) DEFAULT '' COMMENT '适用人群：110(不限)， 120(成人)，130(婴幼儿)，140(儿童)，150(男性)，160(妇女) ，170 (中老年)',
  `is_medicare` tinyint(1) unsigned DEFAULT '0' COMMENT '是否医保 1=非医保, 2=甲类医保, 3=乙类医保',
  `medicare_code` char(32) DEFAULT '' COMMENT '医保编码',
  `bar_code` char(32) DEFAULT '' COMMENT '条形码',
  `main_ingredient` text COMMENT '药品主要成分/产品参数(非药品类)',
  `goods_indications` text COMMENT '功能主治/功能介绍（非药品类)',
  `goods_use_method` text COMMENT '用法用量',
  `forpeople_desc` text COMMENT '适用人群（非药品类特有字段）',
  `goods_action` text COMMENT '药理作用/产品特色(非药品类)',
  `goods_weight` int(11) DEFAULT '0' COMMENT '重量(克)',
  `goods_title` varchar(255) DEFAULT '' COMMENT '商品标题（用户自定义）,字数限制在60-80',
  `goods_code` varchar(50) DEFAULT '' COMMENT '商品编码',
  `goods_desc` text COMMENT '产品详细描述',
  `adverse_reactioins` text COMMENT '不良反应',
  `goods_note` text COMMENT '注意事项',
  `goods_contd` text COMMENT '禁忌',
  `goods_deposit` text COMMENT '存放（非药品类特有字段）',
  `goods_description` text COMMENT '商品说明书',
  `user_cateid` varchar(200) DEFAULT '' COMMENT '用户自定义分类（前期固定)',
  `goods_imgs` text COMMENT '商品图片',
  `fields_pk` varchar(255) DEFAULT NULL COMMENT '允许更新的字段主键 多个用逗号隔开如:approval_number,specif_cation',
  `fields` text COMMENT '是否更新字段列表多个用逗号隔开如:approval_number,specif_cation,goods_company,drug_category',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IX_sync_draft_id` (`sync_draft_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92261 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_goods_sync_queue
-- ----------------------------
DROP TABLE IF EXISTS `yb_goods_sync_queue`;
CREATE TABLE `yb_goods_sync_queue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `queue_key` char(20) DEFAULT '0' COMMENT '队列中的key',
  `detail_tpl` int(11) unsigned DEFAULT '0' COMMENT '商品模板',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品ID',
  `site_id` int(11) unsigned DEFAULT '0' COMMENT '站点ID',
  `type` tinyint(1) unsigned DEFAULT '2' COMMENT '类型 1=新增 2=更新（默认）',
  `data` text COMMENT '数据',
  `fields_pk` varchar(255) DEFAULT '' COMMENT '允许更新的字段主键 多个用逗号隔开如:approval_number,specif_cation',
  `fields` text COMMENT '是否更新字段列表多个用逗号隔开如:approval_number,specif_cation,goods_company,drug_category',
  `data_hash` varchar(50) DEFAULT '' COMMENT '数据哈希值，用来判断唯一性',
  `goods_imgs` text COMMENT '商品图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_goods_id` (`goods_id`),
  KEY `IX_key` (`queue_key`),
  KEY `IX_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=207330 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_goodsextd
-- ----------------------------
DROP TABLE IF EXISTS `yb_goodsextd`;
CREATE TABLE `yb_goodsextd` (
  `goodsextd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品扩展信息表',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `main_ingredient` text COMMENT '药品主要成分/产品参数(非药品类)',
  `goods_indications` text COMMENT '功能主治/功能介绍（非药品类)',
  `goods_action` text COMMENT '药理作用/产品特色(非药品类)',
  `adverse_reactioins` text COMMENT '不良反应',
  `goods_note` text COMMENT '注意事项',
  `goods_use_method` text COMMENT '用法用量',
  `goods_contd` text COMMENT '禁忌',
  `goods_desc` text COMMENT '产品详细描述',
  `goods_description` text COMMENT '商品说明书',
  `browse_number` int(11) unsigned zerofill DEFAULT '00000000000' COMMENT '商品被浏览数：（后期可以放到redis，或用BI去解决）',
  `trans_mumber` int(11) DEFAULT '0' COMMENT '成交数量',
  `shopping_number` int(11) DEFAULT '0' COMMENT '被添加到购物车次数',
  `product_date` date DEFAULT '0000-00-00' COMMENT '生产日期',
  `goods_usage` text COMMENT '使用方法（非药品类特有字段）',
  `goods_deposit` text COMMENT '存放（非药品类特有字段）',
  `forpeople_desc` text COMMENT '适用人群（非药品类特有字段）',
  `qualification` varchar(500) DEFAULT '' COMMENT '产品资质',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  `is_medicare` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否医保 1=非医保 2甲类医保 3乙类医保',
  PRIMARY KEY (`goodsextd_id`),
  UNIQUE KEY `idx_goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103007 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for yb_help
-- ----------------------------
DROP TABLE IF EXISTS `yb_help`;
CREATE TABLE `yb_help` (
  `help_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户帮助页面信息',
  `help_type` int(11) DEFAULT '0' COMMENT '菜单级别：0 为顶级，1为2级，2为3级，后面类推',
  `help_title` varchar(100) DEFAULT '' COMMENT '菜单标题',
  `help_content` text COMMENT '内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_helpcenter
-- ----------------------------
DROP TABLE IF EXISTS `yb_helpcenter`;
CREATE TABLE `yb_helpcenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '升级公告ID 主键',
  `platform_type` smallint(3) unsigned NOT NULL DEFAULT '9999' COMMENT '平台 110= A站商家后台，115=A站门店后台 120=微信后台，130=app 9999=其它',
  `version` char(50) NOT NULL DEFAULT '' COMMENT '版本号',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '详情说明',
  `attachment` varchar(1024) DEFAULT '' COMMENT '附件列表',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态 显示还是隐藏 0=隐藏 1=显示',
  `author` char(20) DEFAULT '' COMMENT '发布者',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除 0=没删除 1=已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_images_attr
-- ----------------------------
DROP TABLE IF EXISTS `yb_images_attr`;
CREATE TABLE `yb_images_attr` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT,
  `hash` char(32) NOT NULL COMMENT '图片ID',
  `width` smallint(5) unsigned NOT NULL COMMENT '宽度',
  `height` smallint(5) unsigned NOT NULL COMMENT '高度',
  `size` mediumint(5) unsigned NOT NULL COMMENT '大小',
  `type` mediumint(5) unsigned DEFAULT '10' COMMENT '类型 10=jpg 20=png 30=gif',
  `host_id` char(32) DEFAULT 'a' COMMENT '服务器ID',
  `flag` tinyint(1) unsigned DEFAULT '0' COMMENT '图片状态 0 有效 1 无效',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `is_default` tinyint(1) unsigned DEFAULT '0' COMMENT '是否是默认图 0 不是 1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '执行的时间',
  PRIMARY KEY (`id`),
  KEY `idx_hash` (`hash`),
  KEY `idx_goods_id` (`goods_id`),
  KEY `IX_flag` (`flag`)
) ENGINE=InnoDB AUTO_INCREMENT=218865 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_logcompany
-- ----------------------------
DROP TABLE IF EXISTS `yb_logcompany`;
CREATE TABLE `yb_logcompany` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL COMMENT '物流公司code',
  `name` varchar(45) NOT NULL COMMENT '物流公司名称',
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家id',
  `reg_mail_no` varchar(255) DEFAULT '' COMMENT '物流公司对应的运单规则',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_logistics_company
-- ----------------------------
DROP TABLE IF EXISTS `yb_logistics_company`;
CREATE TABLE `yb_logistics_company` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `logistics_code` varchar(40) DEFAULT NULL COMMENT '物流公司code唯一标识',
  `name` varchar(60) DEFAULT NULL COMMENT '物流公司名称',
  `starting_course` int(6) DEFAULT NULL COMMENT '起始距离（米）',
  `starting_weight` int(10) DEFAULT NULL COMMENT '起始重量（克）',
  `starting_fare` int(10) DEFAULT NULL COMMENT '配送起步费（分）',
  `surpass_distance_fare` int(6) DEFAULT NULL COMMENT '超过起始距离每1000米资费多少（分）',
  `overweight_charge_fare` int(10) DEFAULT NULL COMMENT '超重费用每1千克资费多少（元）',
  `overtime_fare` int(10) DEFAULT NULL COMMENT '超时费用（分）',
  `chargeback_fare` int(10) DEFAULT NULL COMMENT '退单费用（分）',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否开启，0：正常  1：关闭',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_logistics_error
-- ----------------------------
DROP TABLE IF EXISTS `yb_logistics_error`;
CREATE TABLE `yb_logistics_error` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `logistics_code` varchar(40) DEFAULT NULL COMMENT '物流公司唯一code',
  `error_code` varchar(80) DEFAULT NULL,
  `error_depicts` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='错误码总览';

-- ----------------------------
-- Table structure for yb_logistics_order
-- ----------------------------
DROP TABLE IF EXISTS `yb_logistics_order`;
CREATE TABLE `yb_logistics_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `waybill_number` varchar(50) DEFAULT NULL COMMENT '运单号',
  `order_number` bigint(20) unsigned NOT NULL COMMENT '订单号',
  `logistics_id` int(10) DEFAULT NULL COMMENT '物流方式id',
  `logistics_name` varchar(50) DEFAULT '' COMMENT '物流公司名称',
  `province` varchar(40) DEFAULT '' COMMENT '省',
  `city` varchar(40) DEFAULT '' COMMENT '市',
  `site_id` int(11) DEFAULT NULL COMMENT '商家编号',
  `site_name` varchar(80) NOT NULL COMMENT '商家名',
  `store_id` int(11) DEFAULT NULL COMMENT '门店id',
  `store_name` varchar(80) DEFAULT '' COMMENT '门店名称',
  `order_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `order_amount` int(10) DEFAULT NULL COMMENT '订单金额（分）',
  `distribution_distance` int(6) DEFAULT NULL COMMENT '配送距离(米)',
  `total_fee` int(10) DEFAULT NULL COMMENT '总费用（分）',
  `total_weight` int(10) DEFAULT NULL COMMENT '总重量（克）',
  `starting_fare` int(10) DEFAULT NULL COMMENT '配送起步费（分）',
  `surpass_distance_fare` int(6) DEFAULT NULL COMMENT '超过起始距离资费（分）',
  `overweight_charge_fare` int(10) DEFAULT NULL COMMENT '超重资费（元）',
  `overtime_fare` int(10) DEFAULT NULL COMMENT '超时费用（分）',
  `chargeback_fare` int(10) DEFAULT NULL COMMENT '退单费用',
  `diliveryman` varchar(50) DEFAULT '' COMMENT '配送员姓名',
  `distribution_phone` bigint(11) DEFAULT NULL COMMENT '配送员电话',
  `status` tinyint(2) DEFAULT '0' COMMENT '配送的状态 0：已通知 | 接收成功  1：已接单 | 系统已接单 2：已接单 | 已分配到骑手 3：以接单 | 骑手已到店 4：已取单 | 配送中 5：已送达 | 已送达  6：已取消 | 已取消 7：拒绝接单 | 异常',
  `error_code` varchar(50) DEFAULT '' COMMENT '错误码',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `operator_id` int(10) DEFAULT NULL COMMENT '手动变更操作员id',
  `notify_mobile` bigint(11) DEFAULT NULL COMMENT '操作员手机号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_order_number` (`order_number`) USING BTREE,
  KEY `idx_operatore_id` (`operator_id`),
  KEY `idx_store_id` (`store_id`),
  KEY `idx_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1095 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_manager
-- ----------------------------
DROP TABLE IF EXISTS `yb_manager`;
CREATE TABLE `yb_manager` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '登录用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `realname` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(4) DEFAULT '3' COMMENT '性别1男 2女 3保密',
  `cellphone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(128) NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否激活 1激活 0未激活',
  `is_administrator` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记是否为系统管理员 0=非系统管理员 1=系统管理员',
  `remark` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `last_login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `login_count` int(11) unsigned DEFAULT '0' COMMENT '登录次数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_manager_has_role
-- ----------------------------
DROP TABLE IF EXISTS `yb_manager_has_role`;
CREATE TABLE `yb_manager_has_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID FKyb_manager表id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_manager_id` (`manager_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_member
-- ----------------------------
DROP TABLE IF EXISTS `yb_member`;
CREATE TABLE `yb_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员总表',
  `buyer_nick` varchar(60) DEFAULT '' COMMENT '用户昵称',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `passwd` varchar(60) DEFAULT '' COMMENT '用户密码',
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次登录时间',
  `name` varchar(60) DEFAULT '' COMMENT '姓名',
  `sex` int(1) DEFAULT '3' COMMENT '性别:  0(女)，1（男），（3）保密',
  `idcard_number` varchar(60) DEFAULT '' COMMENT '身份证号码',
  `regin_source` int(11) NOT NULL DEFAULT '110' COMMENT '注册来源: 110 (网站)，120（微信），130（app）9999（其它）',
  `area` int(11) DEFAULT '0' COMMENT '所在地区编码',
  `b_usersarr` text COMMENT '注册过的商家组,格式: 1034;4566;8897，数字表示商家ID（yb_merchant）',
  `last_ipaddr` varchar(15) DEFAULT '' COMMENT '最后一次登录IP',
  `birthday` date DEFAULT '0000-00-00' COMMENT '出生年月日',
  `register_stores` int(11) NOT NULL DEFAULT '0' COMMENT '门店Id,对应b_stores表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `integrate` bigint(20) DEFAULT '0' COMMENT '用户积分(ybzf)',
  `is_activated` tinyint(1) unsigned DEFAULT '1' COMMENT '激活状态 0=未激活 1=激活',
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `UQ_mobile` (`mobile`),
  KEY `idx_buyer_nick` (`buyer_nick`),
  KEY `idx_stores` (`register_stores`)
) ENGINE=InnoDB AUTO_INCREMENT=769546 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_merchant
-- ----------------------------
DROP TABLE IF EXISTS `yb_merchant`;
CREATE TABLE `yb_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL COMMENT '商家信息表',
  `merchant_name` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '商家名称',
  `seller_nick` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商家名称',
  `seller_pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录密码',
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司名称',
  `legal_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '负责人姓名',
  `shop_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '网站名称',
  `shop_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '网站域名',
  `shop_logurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '店铺log地址',
  `shop_area` int(11) DEFAULT '0' COMMENT '所在地区编码',
  `shop_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '公司地址',
  `service_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '服务电话',
  `service_mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '负责人电话',
  `company_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '邮件地址',
  `short_message_sign` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信签名',
  `shop_qq` varchar(45) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'QQ号码',
  `shop_weixin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '店铺微信号',
  `shopwx_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '微信域名',
  `shop_desc` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商家简介',
  `invoice_is` int(11) DEFAULT '0' COMMENT '是否开发票：0(不开), 1(开)',
  `role_id` int(11) DEFAULT '0' COMMENT '角色',
  `company_qualurl` text COLLATE utf8_unicode_ci COMMENT '店铺营业执照,许可证等图片，格式如: ["url1","url2","url3"]',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次登录时间',
  `last_ipaddr` varchar(15) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '最后一次登录IP',
  `is_frozen` int(1) DEFAULT '0' COMMENT '是否被冻结: 0 (正常)， 1（冻结）, 2(无效)',
  `frozen_resion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '冻结原因',
  `site_record` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '网站备案号',
  `integral_proportion` decimal(8,1) DEFAULT '0.0' COMMENT '积分比例 10 ： 1积分=10分',
  `qrcode_tips` varchar(100) COLLATE utf8_unicode_ci DEFAULT '药师会为您提供上门送药服务' COMMENT '商品购买二维码提示文字',
  `legal_mobile` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人电话',
  `payee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '收款人名称',
  `shop_watermark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '网站防盗水印',
  `site_status` int(3) unsigned DEFAULT '130' COMMENT '网站运行状态\r\n110=审核中\r\n120=试运行（禁止购买所有商品）\r\n130=正常运行\r\n999=封网',
  `wx_site_status` int(3) unsigned DEFAULT '130' COMMENT '微信网站运行状态\r\n110=审核中\r\n120=试运行（禁止购买所有商品）\r\n130=正常运行\r\n999=封网',
  `shop_back1` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备用字短',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_merchart_id` (`merchant_id`) USING BTREE,
  KEY `idx_seller_nick` (`seller_nick`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for yb_merchant_20170519
-- ----------------------------
DROP TABLE IF EXISTS `yb_merchant_20170519`;
CREATE TABLE `yb_merchant_20170519` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL COMMENT '商家信息表',
  `merchant_name` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '商家名称',
  `seller_nick` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商家名称',
  `seller_pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录密码',
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司名称',
  `legal_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '负责人姓名',
  `shop_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '网站名称',
  `shop_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '网站域名',
  `shop_logurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '店铺log地址',
  `shop_area` int(11) DEFAULT '0' COMMENT '所在地区编码',
  `shop_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '公司地址',
  `service_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '服务电话',
  `service_mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '负责人电话',
  `company_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '邮件地址',
  `short_message_sign` varchar(15) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信签名',
  `shop_qq` varchar(45) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'QQ号码',
  `shop_weixin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '店铺微信号',
  `shopwx_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '微信域名',
  `shop_desc` text COLLATE utf8_unicode_ci NOT NULL COMMENT '商家简介',
  `invoice_is` int(11) DEFAULT '0' COMMENT '是否开发票：0(不开), 1(开)',
  `role_id` int(11) DEFAULT '0' COMMENT '角色',
  `company_qualurl` text COLLATE utf8_unicode_ci COMMENT '店铺营业执照,许可证等图片，格式如: ["url1","url2","url3"]',
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次登录时间',
  `last_ipaddr` varchar(15) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '最后一次登录IP',
  `is_frozen` int(1) DEFAULT '0' COMMENT '是否被冻结: 0 (正常)， 1（冻结）, 2(无效)',
  `frozen_resion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '冻结原因',
  `site_record` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '网站备案号',
  `integral_proportion` decimal(8,1) DEFAULT '0.0' COMMENT '积分比例 10 ： 1积分=10分',
  `qrcode_tips` varchar(100) COLLATE utf8_unicode_ci DEFAULT '药师会为您提供上门送药服务' COMMENT '商品购买二维码提示文字',
  `legal_mobile` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人电话',
  `payee_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '收款人名称',
  `shop_watermark` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '网站防盗水印',
  `site_status` int(3) unsigned DEFAULT '130' COMMENT '网站运行状态\r\n110=审核中\r\n120=试运行（禁止购买所有商品）\r\n130=正常运行\r\n999=封网',
  `wx_site_status` int(3) unsigned DEFAULT '130' COMMENT '微信网站运行状态\r\n110=审核中\r\n120=试运行（禁止购买所有商品）\r\n130=正常运行\r\n999=封网',
  `shop_back1` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备用字短',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_merchart_id` (`merchant_id`),
  KEY `idx_seller_nick` (`seller_nick`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for yb_merchant_auth
-- ----------------------------
DROP TABLE IF EXISTS `yb_merchant_auth`;
CREATE TABLE `yb_merchant_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchant_id` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID 其中merchant_ids=0 表示通用   目前由于使用了不是很多。没有性能问题，所以直接用逗号分隔符来处理',
  `duration` int(6) unsigned NOT NULL DEFAULT '0' COMMENT '时长',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `reason` text NOT NULL COMMENT '申请原因',
  `auth_code` varchar(255) NOT NULL DEFAULT '' COMMENT '授权码',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 0=禁用 1=启用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `auth_code` (`auth_code`) USING BTREE,
  KEY `end_time` (`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1142 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_merchant_erp
-- ----------------------------
DROP TABLE IF EXISTS `yb_merchant_erp`;
CREATE TABLE `yb_merchant_erp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) unsigned DEFAULT '0' COMMENT '商家编号',
  `gatewayurl` varchar(255) DEFAULT '' COMMENT 'ERP 接口网关',
  `merchant_name` varchar(255) DEFAULT '' COMMENT '商户号',
  `appkey` varchar(60) DEFAULT '' COMMENT 'ERP 提供的用户名',
  `secretkey` varchar(128) DEFAULT '' COMMENT 'ERP 提供的密码',
  `erp_plugins` varchar(20) DEFAULT '' COMMENT 'erp 插件名称，与yb_erp 中的erp_plugins 对应',
  `erp_name` varchar(255) DEFAULT '' COMMENT 'ERP 名称，与yb_erp 中的 erp_name对应',
  `status` int(11) unsigned DEFAULT '0' COMMENT '状态(0:正常 1:关闭)',
  `online_appkey` varchar(60) DEFAULT '' COMMENT 'erp 访问51健康的appkey',
  `online_secretkey` varchar(255) DEFAULT '' COMMENT 'erp 访问51健康的online_secretkey',
  `memo` text COMMENT '备注',
  `bak_key1` varchar(255) DEFAULT '' COMMENT '预留字段',
  `bak_key2` int(11) unsigned DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL COMMENT 'CURRENT_TIMESTAMP',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_merchant_id` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_merchant_ext
-- ----------------------------
DROP TABLE IF EXISTS `yb_merchant_ext`;
CREATE TABLE `yb_merchant_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL COMMENT '对应商家扩展表merchant_id',
  `client_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '商家app key',
  `client_secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '商家秘钥(secretKey)',
  `company_qualurl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '公司营业执照',
  `tax_certificate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '税务登记证',
  `organization_codecert` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '组织机构代码证',
  `gsp_approve` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'gsp_认证',
  `drug_cert` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '药品经营许可证',
  `medical_cert` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '医师证',
  `medicalequi_cert` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '医疗器械经营许可证',
  `fdcirculation_cert` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '食品流通证',
  `inter_drug_inform_cert` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '互联网药品信息服务证',
  `inter_drug_trad_cert` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '互联网药品交易服务证',
  `legal_person` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '公司法人',
  `recipe_frontend_setting` varchar(255) CHARACTER SET utf8 DEFAULT '999' COMMENT '处方药设置-》前台\r\n110=商品页面隐藏处方药购买按钮（仅展示）\r\n120=在网站上隐藏所有处方药商品（搜索不到，也无法展示）\r\n999=不限制\r\n\r\n',
  `recipe_backend_setting` varchar(255) CHARACTER SET utf8 DEFAULT '999' COMMENT '处方药设置-》后台\r\n110=后台【商品列表】中隐藏处方药商品（包括在添加页面上隐藏处方药单选项）\r\n120=后台【订单列表】中隐藏处方药订单\r\n130=后台【资金列表】中隐藏处方药记录\r\n140=用户【订单列表】中隐藏处方药订单（购物车订单只要有一个处方药全部隐藏）\r\n999=不限制',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  `wei_show_invite_code` int(1) unsigned DEFAULT '1' COMMENT '在微信端注册时是否显示邀请码 \r\n0=显示 (页面隐藏邀请码输入框，点击显示)\r\n1=不显示\r\n2=显示，页面上直接显示邀请码输入框\r\n',
  `compu_show_invite_code` int(1) unsigned DEFAULT '1' COMMENT '在电脑端注册时是否显示邀请码 \r\n0=显示 (页面隐藏邀请码输入框，点击显示)\r\n1=不显示\r\n2=显示，页面上直接显示邀请码输入框',
  `trade_cert_number` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '交易证号',
  `style_list` varchar(200) CHARACTER SET utf8 DEFAULT '' COMMENT '站点样式列表',
  `active_style` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '正在启用的样式',
  `icp_position` int(3) unsigned DEFAULT '110' COMMENT '备案号显示位置 110=底部 200=顶部',
  `order_assign_type` int(3) unsigned DEFAULT '110' COMMENT '分单分单模式 110=手工分单模式 120=自动分单模式 130=定时分单模式',
  `order_pc_alert` tinyint(1) unsigned DEFAULT '1' COMMENT '有已付款的新订单时，电脑弹窗提醒 0=禁用 1=启用',
  `order_voice_alert` tinyint(1) unsigned DEFAULT '1' COMMENT '有已付款的新订单时，电脑播放声音提醒 0=禁用 1=启用',
  `order_phone_lert` tinyint(1) unsigned DEFAULT '0' COMMENT '有已付款的新订单时，手机提醒开关 0=禁用 1=启用',
  `order_remind_phones` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '提醒手机 多个用逗号分隔',
  `balance_sheet_date` tinyint(4) DEFAULT '0' COMMENT '结账日',
  `shopwx_serverurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '微信服务号[暂时不用]',
  `shop_ip` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站ip',
  `store_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '门店域名',
  `wx_sub_mch_id` char(50) CHARACTER SET utf8 DEFAULT '' COMMENT '微信支付分配的子商户号',
  `allow_refund` tinyint(1) unsigned DEFAULT '1' COMMENT '是否允许买家发起退款申请 0=不允许 1=允许(默认)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间',
  `system_backup` int(11) DEFAULT '0' COMMENT '系统备份状态 0 隐藏  1显示',
  `wx_appid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信appid',
  `wx_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信appsecret',
  `alipay_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支付宝账号',
  `wx_original_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信的原始id',
  `has_erp_price` tinyint(1) DEFAULT '0' COMMENT '商家是否对接erp价格（默认0：不对接，1：价格）',
  `integral_shop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:积分商城未开启 1：开启',
  `integral_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '积分名称',
  PRIMARY KEY (`id`),
  KEY `idx_merchart_id` (`merchant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for yb_merchant_keywords
-- ----------------------------
DROP TABLE IF EXISTS `yb_merchant_keywords`;
CREATE TABLE `yb_merchant_keywords` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `content` text NOT NULL COMMENT '关键词',
  `platform` smallint(5) unsigned NOT NULL DEFAULT '110' COMMENT '当前使用的平台 110 (网站)，120（微信），130（app）9999（其它）',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示 1=显示 0=不显示',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `IX_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_merchant_settings
-- ----------------------------
DROP TABLE IF EXISTS `yb_merchant_settings`;
CREATE TABLE `yb_merchant_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL COMMENT '类别',
  `content` longtext COMMENT '首页数据（样式等自定义数据）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='微信首页数据';

-- ----------------------------
-- Table structure for yb_meta
-- ----------------------------
DROP TABLE IF EXISTS `yb_meta`;
CREATE TABLE `yb_meta` (
  `meta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '元素自增ID',
  `site_id` int(11) NOT NULL DEFAULT '999999' COMMENT '站点ID，999999=总站',
  `meta_key` varchar(255) NOT NULL COMMENT '元素键 key=>val 哈希对应key ',
  `meta_val` text NOT NULL COMMENT '元素值 key=>val 哈希对应',
  `meta_desc` varchar(255) DEFAULT '' COMMENT '描述',
  `meta_status` int(11) DEFAULT '1' COMMENT '元素状态1 正常 2 未激活或未使用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`meta_id`),
  KEY `com_key_site` (`meta_key`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_new_keywords
-- ----------------------------
DROP TABLE IF EXISTS `yb_new_keywords`;
CREATE TABLE `yb_new_keywords` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='词库表';

-- ----------------------------
-- Table structure for yb_orders
-- ----------------------------
DROP TABLE IF EXISTS `yb_orders`;
CREATE TABLE `yb_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(19) unsigned NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_title` varchar(80) NOT NULL COMMENT '商品标题',
  `goods_price` int(11) NOT NULL COMMENT '商品单价(分)',
  `goods_num` int(11) NOT NULL COMMENT '数量',
  `approval_number` varchar(50) DEFAULT '' COMMENT '批准文号',
  `specif_cation` varchar(255) DEFAULT '' COMMENT '规格（100mg*100片）',
  `goods_category` int(11) DEFAULT '0' COMMENT '类别:  110(甲类非处方药)，120(已类非处方药)，13(0处方药)，140(双轨药)',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID',
  `goods_imgurl` varchar(255) DEFAULT '' COMMENT '商品图片地址',
  `orders_status` int(11) NOT NULL DEFAULT '110' COMMENT '交易状态:110(等侍买家付款),  120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，190(买家申请退款),200(退款成功)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `trades_snapshot` int(11) DEFAULT '0' COMMENT '交易快照ID',
  PRIMARY KEY (`id`),
  KEY `idx_orders_id` (`order_id`),
  KEY `idx_trades_id` (`trades_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_pay_data_import
-- ----------------------------
DROP TABLE IF EXISTS `yb_pay_data_import`;
CREATE TABLE `yb_pay_data_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付记录',
  `pay_style` char(10) DEFAULT '' COMMENT '支付平台,买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)',
  `data_type` tinyint(1) unsigned DEFAULT '0' COMMENT '数据类型 0=支付记录 1=退款记录',
  `trades_id` char(40) DEFAULT '0' COMMENT '订单号',
  `income_amount` varchar(20) DEFAULT '' COMMENT '收入金额',
  `user_account` varchar(120) DEFAULT '' COMMENT '付款账号,微信中是member',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `business_order_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '业务流水号',
  `spending_amount` varchar(20) DEFAULT '' COMMENT '支出金额',
  `appid` varchar(50) DEFAULT '' COMMENT '微信中APPID信息',
  `trades_status` varchar(50) DEFAULT '' COMMENT '交易状态 : 转账,在线支付,提现,交易分账,收费,买家已支付',
  `trading_scenario` varchar(50) DEFAULT '' COMMENT '交易场景/交易渠道',
  `remark` varchar(300) DEFAULT '' COMMENT '备注',
  `account_checking_status` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '对账状态 -1=待处理 0=对账成功 1对账失败',
  `check_status` smallint(6) DEFAULT '0' COMMENT '状态：0=未处理 1=已处理',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `account_status` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL COMMENT '交易状态',
  `platform_payment_amount` varchar(20) DEFAULT '' COMMENT '手续费',
  `platform_service_fee` varchar(20) DEFAULT '' COMMENT '费率',
  PRIMARY KEY (`id`),
  KEY `idx_trades_id` (`trades_id`) USING BTREE,
  KEY `IX_status` (`account_checking_status`) USING BTREE,
  KEY `idx_data_type` (`data_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115708 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_pay_platform
-- ----------------------------
DROP TABLE IF EXISTS `yb_pay_platform`;
CREATE TABLE `yb_pay_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(10) NOT NULL DEFAULT '0',
  `pay_type` varchar(30) DEFAULT '' COMMENT '支付方式名: ali (支付宝) ，wx (微信)， bil(快钱)， unionPay(银联)， health_insurance（医保），cash（现金）',
  `payment_name` varchar(255) DEFAULT '' COMMENT '支付平台名称，如： 支付宝',
  `payment_desc` varchar(255) DEFAULT '' COMMENT '平台说明',
  `my_account` varchar(255) DEFAULT '' COMMENT '我方平台收款帐号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(45) DEFAULT NULL COMMENT '平台英文别称',
  `procedure_fee` decimal(5,3) DEFAULT NULL COMMENT '代收手续费比例，比如支付宝支付每笔收取0.01=1%',
  `brokerage` decimal(5,3) DEFAULT NULL,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_paylogs
-- ----------------------------
DROP TABLE IF EXISTS `yb_paylogs`;
CREATE TABLE `yb_paylogs` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付记录',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID',
  `items_total` int(11) NOT NULL COMMENT '商品总价',
  `post_fee` int(11) NOT NULL COMMENT '快递费',
  `trades_total` int(11) NOT NULL COMMENT '订单总价',
  `platform_total` int(11) DEFAULT '0' COMMENT '支付平台手续费',
  `trades_split` int(11) DEFAULT '0' COMMENT '交易佣金',
  `total_fee` int(11) NOT NULL COMMENT '到帐金额（商家）',
  `pay_style` varchar(10) NOT NULL COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)',
  `pay_status` int(11) DEFAULT '1' COMMENT '支付状态（成功1失败0）',
  `callback_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付平台回调时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付创建时间',
  `pay_result` text COMMENT '支付结果，原始结果',
  `yb_account` varchar(100) NOT NULL COMMENT 'ybzf 收款帐号',
  `seller_account` varchar(100) NOT NULL COMMENT '商家收款帐号',
  `buyer_account` varchar(100) DEFAULT '' COMMENT '买家支付帐号',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `seller_id` int(11) NOT NULL COMMENT '商家ID',
  `buyer_id` int(11) NOT NULL COMMENT '买家ID',
  `pay_member` varchar(45) NOT NULL COMMENT '支付交易号',
  `prescription_orders` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为处方药订单 0=不是处方药订单 1=处方药订单',
  PRIMARY KEY (`pay_id`),
  KEY `idx_trades_id` (`trades_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_payplatform
-- ----------------------------
DROP TABLE IF EXISTS `yb_payplatform`;
CREATE TABLE `yb_payplatform` (
  `payplat_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '签约的第三方支付平台表',
  `payment_name` varchar(255) NOT NULL DEFAULT '' COMMENT '支付平台名称，如： 支付宝',
  `payment_logo` varchar(255) DEFAULT '' COMMENT '支付平台logo',
  `payment_desc` varchar(255) DEFAULT '' COMMENT '平台说明',
  `my_account` varchar(255) NOT NULL COMMENT '我方平台收款帐号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(45) NOT NULL COMMENT '平台英文别称',
  `procedure_fee` decimal(5,3) unsigned NOT NULL COMMENT '手续费比例，比如支付宝支付每笔收取0.01=1%',
  PRIMARY KEY (`payplat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_permission
-- ----------------------------
DROP TABLE IF EXISTS `yb_permission`;
CREATE TABLE `yb_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限类别ID',
  `platform` smallint(6) NOT NULL DEFAULT '0' COMMENT '所属平台 110YBZF后台；120A站后台；130门店后台',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称',
  `action` varchar(256) NOT NULL DEFAULT '' COMMENT 'action',
  `permission_desc` varchar(512) NOT NULL DEFAULT '' COMMENT '描述',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) DEFAULT '0' COMMENT '权限是否删除0：未删除，1已删除',
  PRIMARY KEY (`id`),
  KEY `com_pd` (`platform`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_permission_type
-- ----------------------------
DROP TABLE IF EXISTS `yb_permission_type`;
CREATE TABLE `yb_permission_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `platform` smallint(6) NOT NULL DEFAULT '0' COMMENT '所属平台 110YBZF后台；120A站后台；130门店后台',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '权限类别',
  `permission_desc` varchar(1024) NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '权限类型是否删除0未删除，1已删除',
  PRIMARY KEY (`id`),
  KEY `IX_platform` (`platform`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_refund
-- ----------------------------
DROP TABLE IF EXISTS `yb_refund`;
CREATE TABLE `yb_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `operator_name` varchar(16) NOT NULL DEFAULT '' COMMENT '操作员名称',
  `merchant_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `merchant_name` varchar(128) NOT NULL DEFAULT '' COMMENT '商家名称',
  `pay_style` varchar(30) NOT NULL DEFAULT '' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bill(快钱)',
  `status` smallint(6) unsigned NOT NULL DEFAULT '100' COMMENT '退款状态 100=等待受理（退款中）  110=受理失败 （拒绝退款）120=等待退款 130=退款成功 140=退款失败',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `trade_id` char(20) NOT NULL DEFAULT '0' COMMENT '订单号',
  `trade_status` smallint(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态',
  `real_pay` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际付款金额 单位分',
  `freight` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费 单位分',
  `apply_refund_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '申请退款金额 单位分',
  `refund_serial_no` varchar(64) DEFAULT '' COMMENT '退款流水号',
  `real_refund_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际退款金额 单位分',
  `refund_cash` int(11) unsigned DEFAULT '0' COMMENT '现金部分退款',
  `refund_health_insurance` int(11) unsigned DEFAULT '0' COMMENT '医保部分退款',
  `is_refund_goods` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要退货 0不需要  1需要',
  `refund_express_no` varchar(64) NOT NULL DEFAULT '' COMMENT '退款快递号',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退货原因',
  `explain` varchar(512) NOT NULL DEFAULT '' COMMENT '退货说明',
  `voucher` varchar(1024) NOT NULL DEFAULT '' COMMENT '退货图片凭证 JSON',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '是否删除',
  `refund_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '退款时间',
  `operator_type` smallint(3) unsigned DEFAULT '100' COMMENT '操作者类型 100=用户 200=商户',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_trade_id` (`trade_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10444 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_refund_log
-- ----------------------------
DROP TABLE IF EXISTS `yb_refund_log`;
CREATE TABLE `yb_refund_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_id` int(11) NOT NULL DEFAULT '0' COMMENT '退款单ID',
  `operator_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `operator_name` varchar(11) NOT NULL DEFAULT '' COMMENT '操作员姓名',
  `explain` varchar(1024) NOT NULL DEFAULT '' COMMENT '退款说明',
  `voucher` varchar(1024) NOT NULL DEFAULT '' COMMENT '商家凭证',
  `trade_id` char(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `return_msg` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_trades_id` (`trade_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9696 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_role
-- ----------------------------
DROP TABLE IF EXISTS `yb_role`;
CREATE TABLE `yb_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(1024) DEFAULT '' COMMENT '角色描述',
  `permissions` text COMMENT '权限组',
  `is_active` tinyint(4) unsigned DEFAULT '1' COMMENT '是否激活 1是；0否 默认1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_role_has_permission
-- ----------------------------
DROP TABLE IF EXISTS `yb_role_has_permission`;
CREATE TABLE `yb_role_has_permission` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) DEFAULT NULL,
  `permission_id` int(12) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_time` timestamp NULL DEFAULT NULL,
  `site_id` int(11) DEFAULT '0',
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除 0=否 1=是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_salesman_log
-- ----------------------------
DROP TABLE IF EXISTS `yb_salesman_log`;
CREATE TABLE `yb_salesman_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家门店ID',
  `store_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店销售员ID',
  `merchant_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `real_pay` int(11) NOT NULL DEFAULT '0' COMMENT '销售额 单位分',
  `traders_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '交易ID',
  `traders_current_status` smallint(6) NOT NULL DEFAULT '0' COMMENT '交易当前状态',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '交易日期',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `merchant_id` (`merchant_id`,`store_id`,`store_user_id`),
  KEY `IX_trades_id` (`traders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101352 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_seller_beneficiary
-- ----------------------------
DROP TABLE IF EXISTS `yb_seller_beneficiary`;
CREATE TABLE `yb_seller_beneficiary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `seller_id` int(11) NOT NULL COMMENT '商家id',
  `seller_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商家名称',
  `beneficiary_party` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '收款方',
  `invoice_title` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '发票抬头',
  `bank_id` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '银行账号',
  `bank_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '开户行名称',
  `change_num` int(3) DEFAULT '0' COMMENT '修改次数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_seller_id` (`seller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_settlement_detail
-- ----------------------------
DROP TABLE IF EXISTS `yb_settlement_detail`;
CREATE TABLE `yb_settlement_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对账表',
  `trades_id` bigint(20) NOT NULL COMMENT '唯一关联订单表',
  `pay_style` varchar(40) DEFAULT NULL COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)',
  `pay_number` varchar(45) DEFAULT '' COMMENT '支付业务流水号',
  `account_checking_status` tinyint(1) DEFAULT '0' COMMENT '对账状态 0=未对账,1=对账成功,2=对账失败，3=支付log未同步到yb_settlement_records 表',
  `checking_user_type` tinyint(1) DEFAULT '0' COMMENT '对账操作人类型 0=System / 1=Manual',
  `remark` varchar(200) DEFAULT '' COMMENT '对账说明',
  `business_types` varchar(20) DEFAULT '' COMMENT '业务类型: 转账,在线支付,提现,交易分账,收费',
  `finance_no` varchar(40) DEFAULT '' COMMENT '汇总单号',
  `summary_status` tinyint(1) DEFAULT '0' COMMENT '是否汇总 0=未参与汇总 1=已汇总',
  `refund_fee` int(11) NOT NULL DEFAULT '0' COMMENT '退款金额',
  `refund_checking_status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '退款对账状态 -1=未对账 0=对账失败 1=对账成功',
  `platform_payment_amount` int(11) DEFAULT '0' COMMENT '付款金额（支付平台）',
  `platform_fashionable_amount` int(11) NOT NULL DEFAULT '0' COMMENT '分账金额（平台）',
  `platform_service_fee` int(11) NOT NULL DEFAULT '0' COMMENT '服务费（支付平台）',
  `platform_refund_fee` int(11) NOT NULL DEFAULT '0' COMMENT '平台退款金额',
  `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '导入时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `account_status` varchar(50) DEFAULT NULL COMMENT '已到账',
  `remit_service_fee` int(11) NOT NULL DEFAULT '0' COMMENT '划账服务费',
  `rate` decimal(5,3) DEFAULT NULL COMMENT '费率',
  `remit_account_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '划账状态 0=未对账,1=对账成功,2=对账失败',
  `remit_acount_time` timestamp NULL DEFAULT NULL COMMENT '划账时间',
  PRIMARY KEY (`id`),
  KEY `trades_id_index` (`trades_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_settlement_detail_log
-- ----------------------------
DROP TABLE IF EXISTS `yb_settlement_detail_log`;
CREATE TABLE `yb_settlement_detail_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow` tinyint(3) DEFAULT '0' COMMENT '0导入成功  1支付对账成功  2支付对账失败  3退款对账成功 4退款对账失败 5已出账 ',
  `operator_id` int(11) DEFAULT '0' COMMENT '操作者id 0表示system',
  `operator_name` varchar(60) DEFAULT '' COMMENT '操作员名',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `trades_id` bigint(20) DEFAULT NULL COMMENT 'detail_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=392310 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_settlement_log
-- ----------------------------
DROP TABLE IF EXISTS `yb_settlement_log`;
CREATE TABLE `yb_settlement_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '打款记录id',
  `seller_id` int(11) NOT NULL COMMENT '商家id',
  `payment_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '平台名称',
  `bank_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '银行账号',
  `bank_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '开户行名称',
  `settlement_fee` int(11) NOT NULL DEFAULT '0' COMMENT '打款金额',
  `actual_fee` int(11) NOT NULL DEFAULT '0' COMMENT '实付金额，精确到2位小数，单位：分。',
  `settlement_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '打款时间',
  `settlement_status` int(11) unsigned NOT NULL DEFAULT '110' COMMENT '结算状态(110已结清，120支付部分，130延期支付)',
  `has_invoice` int(11) unsigned DEFAULT '0' COMMENT '是否要发票: 0(不需要)，1（需要）',
  `invoice_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开票金额',
  `operator_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '操作员',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `finance_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_seller_id` (`seller_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1952 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_settlement_records
-- ----------------------------
DROP TABLE IF EXISTS `yb_settlement_records`;
CREATE TABLE `yb_settlement_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `merchant_id` int(11) NOT NULL COMMENT '对应商家扩展表merchant_id',
  `merchant_name` varchar(255) DEFAULT '' COMMENT '商家名称',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID由：seller_id+年(取后两位)月日+每天的交易流水号 组合成唯一的交易ID(seller_id:商家唯一id,id为交易流水号)',
  `pay_number` varchar(45) NOT NULL DEFAULT '' COMMENT '业务流水号',
  `trades_create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款成功时间',
  `post_style` int(11) NOT NULL DEFAULT '130' COMMENT '配送方式：110(卖家包邮),120(平邮),130(快递),140(EMS),150(送货上门),160(无须物流)，170(门店直销)，9999(其它)',
  `total_fee` int(11) NOT NULL COMMENT '商品总价（精确到2位小数），单位：分。',
  `post_fee` int(11) DEFAULT '0' COMMENT '配送费/快递费，单位分',
  `reduce_reduction_amount` int(11) NOT NULL DEFAULT '0' COMMENT '满减减少金额',
  `real_pay` int(11) unsigned DEFAULT '0' COMMENT '商品实际支付金额=商品总金额+运费-积分抵扣的 单位：分。',
  `pay_style` varchar(40) NOT NULL DEFAULT '' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)',
  `platform_total` int(11) NOT NULL DEFAULT '0' COMMENT '支付平台手续费',
  `trades_split` int(11) NOT NULL DEFAULT '0' COMMENT '交易佣金',
  `fashionable_amount` int(11) NOT NULL DEFAULT '0' COMMENT '分账金额（商家）',
  `account_checking_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对账状态 0=未对账,1=对账成功,2=对账失败，3=支付log未同步到yb_settlement_records 表',
  `trades_status` int(11) NOT NULL DEFAULT '0' COMMENT '交易状态:110(等侍买家付款), 120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，190(买家申请退款),200(退款成功)',
  `checking_user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对账操作人类型 0=System / 1=Manual',
  `remark` varchar(200) DEFAULT '' COMMENT '对账说明',
  `platform_payment_amount` int(11) NOT NULL DEFAULT '0' COMMENT '付款金额（平台）',
  `platform_fashionable_amount` int(11) NOT NULL DEFAULT '0' COMMENT '分账金额（平台）',
  `platform_service_fee` int(11) NOT NULL DEFAULT '0' COMMENT '服务费（平台）',
  `business_types` varchar(20) DEFAULT '' COMMENT '业务类型: 转账,在线支付,提现,交易分账,收费',
  `finance_id` int(11) NOT NULL DEFAULT '0' COMMENT '汇总id FKyb_finance表id',
  `summary_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否汇总 0=未参与汇总 1=已汇总',
  `platform_pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间(平台)',
  `show_status` tinyint(4) DEFAULT '0' COMMENT 'a站后台是否显示(0 不显示 1显示）',
  `refund_fee` int(11) unsigned DEFAULT '0' COMMENT '退款金额',
  `refund_checking_status` tinyint(4) DEFAULT '-1' COMMENT '退款对账状态 -1=未对账 0=对账失败 1=对账成功',
  `settlement_status` smallint(3) unsigned DEFAULT '100' COMMENT '资金可结算状态 100=不结算 150=待结算 200=可结算',
  `settlement_final_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单结束时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '导入时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `trades_type` tinyint(4) DEFAULT '0' COMMENT '0:直购，1:分销，2.预存金 3.保证金',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_trades_id` (`trades_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_finance_id` (`finance_id`) USING BTREE,
  KEY `IX_pay_style` (`pay_style`)
) ENGINE=InnoDB AUTO_INCREMENT=280430 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_settlement_records_copy
-- ----------------------------
DROP TABLE IF EXISTS `yb_settlement_records_copy`;
CREATE TABLE `yb_settlement_records_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `merchant_id` int(11) NOT NULL COMMENT '对应商家扩展表merchant_id',
  `merchant_name` varchar(255) DEFAULT '' COMMENT '商家名称',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID由：seller_id+年(取后两位)月日+每天的交易流水号 组合成唯一的交易ID(seller_id:商家唯一id,id为交易流水号)',
  `pay_number` varchar(45) NOT NULL DEFAULT '' COMMENT '业务流水号',
  `trades_create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款成功时间',
  `post_style` int(11) NOT NULL DEFAULT '130' COMMENT '配送方式：110(卖家包邮),120(平邮),130(快递),140(EMS),150(送货上门),160(无须物流)，170(门店直销)，9999(其它)',
  `total_fee` int(11) NOT NULL COMMENT '商品总价（精确到2位小数），单位：分。',
  `post_fee` int(11) DEFAULT '0' COMMENT '配送费/快递费，单位分',
  `reduce_reduction_amount` int(11) NOT NULL DEFAULT '0' COMMENT '满减减少金额',
  `real_pay` int(11) unsigned DEFAULT '0' COMMENT '商品实际支付金额=商品总金额+运费-积分抵扣的 单位：分。',
  `pay_style` varchar(40) NOT NULL DEFAULT '' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)',
  `platform_total` int(11) NOT NULL DEFAULT '0' COMMENT '支付平台手续费',
  `trades_split` int(11) NOT NULL DEFAULT '0' COMMENT '交易佣金',
  `fashionable_amount` int(11) NOT NULL DEFAULT '0' COMMENT '分账金额（商家）',
  `account_checking_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对账状态 0=未对账,1=对账成功,2=对账失败，3=支付log未同步到yb_settlement_records 表',
  `trades_status` int(11) NOT NULL DEFAULT '0' COMMENT '交易状态:110(等侍买家付款), 120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，190(买家申请退款),200(退款成功)',
  `checking_user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '对账操作人类型 0=System / 1=Manual',
  `remark` varchar(200) DEFAULT '' COMMENT '对账说明',
  `platform_payment_amount` int(11) NOT NULL DEFAULT '0' COMMENT '付款金额（平台）',
  `platform_fashionable_amount` int(11) NOT NULL DEFAULT '0' COMMENT '分账金额（平台）',
  `platform_service_fee` int(11) NOT NULL DEFAULT '0' COMMENT '服务费（平台）',
  `business_types` varchar(20) DEFAULT '' COMMENT '业务类型: 转账,在线支付,提现,交易分账,收费',
  `finance_id` int(11) NOT NULL DEFAULT '0' COMMENT '汇总id FKyb_finance表id',
  `summary_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否汇总 0=未参与汇总 1=已汇总',
  `platform_pay_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间(平台)',
  `show_status` tinyint(4) DEFAULT '0' COMMENT 'a站后台是否显示(0 不显示 1显示）',
  `refund_fee` int(11) unsigned DEFAULT '0' COMMENT '退款金额',
  `refund_checking_status` tinyint(4) DEFAULT '-1' COMMENT '退款对账状态 -1=未对账 0=对账失败 1=对账成功',
  `settlement_status` smallint(3) unsigned DEFAULT '100' COMMENT '资金可结算状态 100=不结算 150=待结算 200=可结算',
  `settlement_final_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '订单结束时间',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '导入时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `trades_type` tinyint(4) DEFAULT '0' COMMENT '0:直购，1:分销，2.预存金 3.保证金',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_trades_id` (`trades_id`) USING BTREE,
  KEY `idx_merchant_id` (`merchant_id`) USING BTREE,
  KEY `idx_finance_id` (`finance_id`) USING BTREE,
  KEY `IX_pay_style` (`pay_style`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_settlement_records_log
-- ----------------------------
DROP TABLE IF EXISTS `yb_settlement_records_log`;
CREATE TABLE `yb_settlement_records_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_checking_status` tinyint(1) DEFAULT '0' COMMENT '对账状态 0=未对账,1=对账成功,2=对账失败，3=支付log未同步到yb_settlement_records 表',
  `operator_name` varchar(255) DEFAULT NULL COMMENT '操作员',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `settlement_records_id` int(11) NOT NULL COMMENT '外键settlement_records_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8 COMMENT='对账历史记录';

-- ----------------------------
-- Table structure for yb_settlementday_config
-- ----------------------------
DROP TABLE IF EXISTS `yb_settlementday_config`;
CREATE TABLE `yb_settlementday_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `site_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商家id',
  `set_type` tinyint(4) unsigned DEFAULT '2' COMMENT '设置类型（0按日结 1按周结 2按月结)',
  `set_value` varchar(40) DEFAULT '' COMMENT '按周结的值(星期几);按月结的值(几号)按日接此处为0',
  `pay_day_value` int(5) unsigned DEFAULT '3' COMMENT '付款日期在结算日期之后的天数',
  `thelast_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次结算日期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_stores
-- ----------------------------
DROP TABLE IF EXISTS `yb_stores`;
CREATE TABLE `yb_stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `merchant_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `b_store_id` int(11) NOT NULL DEFAULT '0' COMMENT '所在商家的门店ID',
  `stores_number` varchar(30) NOT NULL DEFAULT '' COMMENT '门店编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '药店名称',
  `is_qjd` tinyint(1) DEFAULT '0' COMMENT '旗舰店(1 是 0 否)',
  `type` tinyint(1) DEFAULT '1' COMMENT '直营店 1 加盟店2 ',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店所属城市',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店所属区域',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '店地址',
  `baidu_lat` varchar(30) NOT NULL DEFAULT '' COMMENT '百度坐标 纬度',
  `baidu_lng` varchar(30) NOT NULL DEFAULT '' COMMENT '百度坐标 经度',
  `map_flag` tinyint(1) DEFAULT '0' COMMENT '坐标是否标注: 1 是 0 否',
  `store_imgs` text COMMENT '门店图片',
  `tel` varchar(100) NOT NULL DEFAULT '' COMMENT '门店电话',
  `business_time` varchar(100) DEFAULT '' COMMENT '门店值班时间',
  `feature` varchar(1000) DEFAULT '' COMMENT '门店特色',
  `summary` varchar(1000) DEFAULT '' COMMENT '门店简介',
  `qr_code_img` varchar(200) DEFAULT '' COMMENT '二维码id',
  `qr_code_type` tinyint(1) DEFAULT '1' COMMENT '二维码是否带logo (1 是 0 否)',
  `stores_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0=禁用 1=启用)',
  `is_del` tinyint(1) NOT NULL DEFAULT '1' COMMENT '门店软删除（0：表示软删除，默认为1）',
  `province` varchar(60) DEFAULT '' COMMENT '省',
  `city` varchar(60) DEFAULT '' COMMENT '市',
  `service_support` varchar(200) DEFAULT '' COMMENT '支持服务 150=送货上门 160=门店自提,多种服务请用逗号连接',
  `self_token_time` varchar(100) DEFAULT '' COMMENT '自提时间',
  `delivery_time` varchar(100) DEFAULT '' COMMENT '送货时间',
  `remind_mobile` varchar(200) DEFAULT '' COMMENT '提醒手机',
  `country` varchar(60) DEFAULT '' COMMENT '区',
  `own_pricing_type` tinyint(2) unsigned DEFAULT '0' COMMENT '自主定价(默认0,1允许)',
  `own_promotion_type` tinyint(2) unsigned DEFAULT '0' COMMENT '自主创建优惠活动(默认0,1允许)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `stores_number` (`stores_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4390 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_stores_goods_price
-- ----------------------------
DROP TABLE IF EXISTS `yb_stores_goods_price`;
CREATE TABLE `yb_stores_goods_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '元素自增ID',
  `site_id` int(11) unsigned NOT NULL DEFAULT '999999' COMMENT '站点ID，999999=总站',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_price` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品价格',
  `discount_price` int(11) DEFAULT '0' COMMENT '门店会员价格',
  `in_stock` int(11) DEFAULT '0' COMMENT '门店库存数量',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_tag` tinyint(1) DEFAULT '0' COMMENT '删除标签，0 正常，1表示删除',
  PRIMARY KEY (`id`),
  KEY `idx_store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_synonym_keywords
-- ----------------------------
DROP TABLE IF EXISTS `yb_synonym_keywords`;
CREATE TABLE `yb_synonym_keywords` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `synonym` text COMMENT '近义词',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='近义词表';

-- ----------------------------
-- Table structure for yb_t_dict_user_type
-- ----------------------------
DROP TABLE IF EXISTS `yb_t_dict_user_type`;
CREATE TABLE `yb_t_dict_user_type` (
  `user_type` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户类型',
  `type_name` varchar(32) NOT NULL COMMENT '名称',
  `is_enabled` int(11) NOT NULL COMMENT '是否启用',
  `created_date` date DEFAULT NULL COMMENT '创建日期',
  `updated_date` date DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户类型字典表';

-- ----------------------------
-- Table structure for yb_t_rule
-- ----------------------------
DROP TABLE IF EXISTS `yb_t_rule`;
CREATE TABLE `yb_t_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '色角表',
  `original_rule_id` int(11) unsigned NOT NULL COMMENT '原角色表ID',
  `site_id` varchar(50) NOT NULL COMMENT '连锁ID',
  `platform` smallint(6) unsigned DEFAULT '0' COMMENT '所属平台 110YBZF后台；120A站后台；130门店后台',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `name` varchar(255) DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(1024) DEFAULT '' COMMENT '角色描述',
  `permissions` text COMMENT '权限组',
  `is_active` tinyint(4) unsigned DEFAULT '1' COMMENT '是否激活 1是；0否 默认1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1763 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_t_user_account
-- ----------------------------
DROP TABLE IF EXISTS `yb_t_user_account`;
CREATE TABLE `yb_t_user_account` (
  `user_id` varchar(36) NOT NULL COMMENT '用户ID',
  `original_user_id` int(11) DEFAULT NULL COMMENT '原SHOP库用户ID',
  `user_name` varchar(128) DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `wechat_account` varchar(128) DEFAULT NULL COMMENT '微信账号',
  `wechat_openid` varchar(128) DEFAULT NULL COMMENT '微信OPEN_ID',
  `alipay_account` varchar(128) DEFAULT NULL COMMENT '支付宝账号',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `passwd` varchar(128) DEFAULT NULL COMMENT '密码',
  `active_status` varchar(2) DEFAULT NULL COMMENT '激活状态 0:未激活;1:已激活',
  `site_id` int(11) DEFAULT NULL COMMENT '连锁ID',
  `store_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `buyer_id` int(11) DEFAULT NULL COMMENT '买家ID',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型',
  `conutinued_checkin_count` int(11) DEFAULT NULL COMMENT '连续签到数',
  `checkin_sum` int(11) DEFAULT NULL COMMENT '签到总数',
  `checkin_last_time` timestamp NULL DEFAULT NULL COMMENT '最后一次签到时间',
  `register_channel` varchar(8) DEFAULT NULL COMMENT '注册渠道',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最新登录时间',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `updated_time` timestamp NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ux_user_account_us_combined` (`original_user_id`,`site_id`,`user_type`),
  KEY `fk_user_account_usertype` (`user_type`),
  KEY `ix_user_account_mobile` (`mobile`),
  KEY `ix_user_account_oui` (`original_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户表';

-- ----------------------------
-- Table structure for yb_t_user_account_base
-- ----------------------------
DROP TABLE IF EXISTS `yb_t_user_account_base`;
CREATE TABLE `yb_t_user_account_base` (
  `user_id` varchar(36) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(128) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `id_card_no` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `medicare_card_no` varchar(32) DEFAULT NULL COMMENT '医保卡号',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `birth_date` date DEFAULT NULL COMMENT '出生日期',
  `qq_account` varchar(18) DEFAULT NULL COMMENT 'QQ号',
  `user_head_url` varchar(256) DEFAULT NULL COMMENT '用户头像地址',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `occupation` varchar(128) DEFAULT NULL COMMENT '职业',
  `education_level` varchar(64) DEFAULT NULL COMMENT '学历',
  `invite_code` varchar(64) DEFAULT NULL COMMENT '邀请码',
  `status` tinyint(1) DEFAULT NULL COMMENT '用户状态 9=黑名单 -1=冻结 0=正常 -9=已删除',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '注册日期',
  `updated_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

-- ----------------------------
-- Table structure for yb_t_user_has_rule
-- ----------------------------
DROP TABLE IF EXISTS `yb_t_user_has_rule`;
CREATE TABLE `yb_t_user_has_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色对应表',
  `user_id` varchar(50) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `rule_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14482 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_t_user_store_clerk
-- ----------------------------
DROP TABLE IF EXISTS `yb_t_user_store_clerk`;
CREATE TABLE `yb_t_user_store_clerk` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` varchar(36) DEFAULT NULL COMMENT '用户ID',
  `empno` varchar(32) DEFAULT NULL COMMENT '员工号',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `FK_STORE_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14804 DEFAULT CHARSET=utf8 COMMENT='店员信息表';

-- ----------------------------
-- Table structure for yb_t_user_store_member
-- ----------------------------
DROP TABLE IF EXISTS `yb_t_user_store_member`;
CREATE TABLE `yb_t_user_store_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` varchar(36) NOT NULL COMMENT '用户ID',
  `member_card_no` varchar(64) DEFAULT NULL COMMENT '会员卡号',
  `bar_code` varchar(128) DEFAULT NULL COMMENT '条形码',
  `tag` text COMMENT '标签',
  `invited_store_id` int(11) DEFAULT NULL COMMENT '邀请门店ID',
  `register_store_id` int(11) DEFAULT NULL COMMENT '注册门店ID',
  `register_clerk_id` bigint(11) DEFAULT NULL COMMENT '注册店员ID,扫店员二维码关注注册, 对应原b_shop_*.b_store_adminext.id',
  `country` int(11) DEFAULT NULL COMMENT '国家编号： 默认 1（中国）',
  `province` int(11) DEFAULT NULL COMMENT '省份编码',
  `city` int(11) DEFAULT NULL COMMENT '城市编码',
  `county` int(11) DEFAULT NULL COMMENT '区编码',
  `avatar` varchar(64) DEFAULT NULL COMMENT '用户头像',
  `concerned` int(11) DEFAULT NULL COMMENT '是否关注',
  `concerned_time` timestamp NULL DEFAULT NULL COMMENT '关注日期',
  `total_order_count` int(11) DEFAULT NULL COMMENT '订单数',
  `total_order_fee` int(11) DEFAULT NULL COMMENT '总金额,以分为单位',
  `remaining_point` int(11) DEFAULT NULL COMMENT '剩余积分',
  `consumed_point` int(11) DEFAULT NULL COMMENT '已消费积分',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `updated_time` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `FK_USER_STORE_MEM_USERID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=767074 DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- ----------------------------
-- Table structure for yb_tags
-- ----------------------------
DROP TABLE IF EXISTS `yb_tags`;
CREATE TABLE `yb_tags` (
  `tags_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品标签表',
  `tags_name` varchar(255) NOT NULL COMMENT '标签名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del_tag` int(11) DEFAULT '0' COMMENT '删除标签, 0:正常   1：删除',
  PRIMARY KEY (`tags_id`),
  KEY `idx_tag_name` (`tags_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19578 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_task
-- ----------------------------
DROP TABLE IF EXISTS `yb_task`;
CREATE TABLE `yb_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '任务标题',
  `sign_up_start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '任务报名开始时间',
  `sign_up_end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '任务报名结束时间',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `is_long` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否长期有效 1长期',
  `is_need_sign_up` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要报名 0不需要 1需要',
  `type` smallint(6) NOT NULL COMMENT '任务类型 110销售排行奖励 120销售奖励 130注册奖励',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '任务描述',
  `rules` varchar(1024) NOT NULL DEFAULT '' COMMENT '任务规则',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '任务状态 110开始 120暂停 130结束 140软删除',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_task_has_store
-- ----------------------------
DROP TABLE IF EXISTS `yb_task_has_store`;
CREATE TABLE `yb_task_has_store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '参加任务门店ID',
  `b_store_id` int(11) DEFAULT '0',
  `merchant_id` int(11) DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `merchant_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_task_sign_up
-- ----------------------------
DROP TABLE IF EXISTS `yb_task_sign_up`;
CREATE TABLE `yb_task_sign_up` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店ID',
  `store_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '门店销售员ID',
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT '报名参加的任务ID',
  `is_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效 1=有效 0=无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_test
-- ----------------------------
DROP TABLE IF EXISTS `yb_test`;
CREATE TABLE `yb_test` (
  `id` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_trades
-- ----------------------------
DROP TABLE IF EXISTS `yb_trades`;
CREATE TABLE `yb_trades` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易流水号',
  `trades_id` bigint(20) NOT NULL COMMENT '交易ID由：seller_id+年(取后两位)月日+每天的交易流水号 组合成唯一的交易ID(seller_id:商家唯一id,id为交易流水号)',
  `seller_id` int(11) NOT NULL COMMENT '商家ID(yb_merchant)',
  `buyer_id` int(11) NOT NULL COMMENT '买家唯一id,对应yb_member 表的id',
  `seller_nick` varchar(255) DEFAULT '' COMMENT '商家名称',
  `buyer_nick` varchar(255) DEFAULT '' COMMENT '买家昵称',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `pay_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款时间',
  `end_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '交易成功时间',
  `consign_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '商家发货时间',
  `receiver_phone` varchar(20) DEFAULT '' COMMENT '收货人电话',
  `recevier_mobile` varchar(20) NOT NULL COMMENT '收货人电话号码',
  `recevier_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `receiver_city` varchar(60) DEFAULT '' COMMENT '收货人所在城市',
  `receiver_address` varchar(255) NOT NULL COMMENT '收货人详细地址',
  `receiver_zip` varchar(11) DEFAULT '' COMMENT '收货人所在地区邮编',
  `seller_pay_no` varchar(255) NOT NULL COMMENT '商家收款帐号',
  `seller_phone` varchar(20) DEFAULT '' COMMENT '商家电话',
  `seller_mobile` varchar(20) DEFAULT '' COMMENT '商家手机',
  `seller_name` varchar(20) DEFAULT '' COMMENT '商家姓名',
  `trades_status` int(11) NOT NULL COMMENT '交易状态:110(等侍买家付款),  120(等待卖家发货),130(等侍买家确认收货),140(买家已签收，货到付款专用)，150(交易成功)，160(用户未付款主动关闭)，170(超时未付款，系统关闭)，180(商家关闭订单)，190(买家申请退款),200(退款成功)',
  `closed_resion` int(11) DEFAULT '0' COMMENT '订单关闭原因,: 110(不想买了)，120(缺货)，130(拍错了，重拍)  其它（9999）',
  `total_fee` int(11) NOT NULL COMMENT '商品金额（商品价格乘以数量）。精确到2位小数，单位：分。',
  `post_fee` int(11) DEFAULT '0' COMMENT '配送费/快递费，单位分',
  `trades_split` int(11) DEFAULT '0' COMMENT '交易佣金,单位分',
  `plat_split` int(11) DEFAULT '0' COMMENT '支付平台收取的费用，以分为单位',
  `post_style` int(11) DEFAULT '130' COMMENT '配送方式：110(卖家包邮),120(平邮),130(快递),140(EMS),150(送货上门),160(无须物流)，170(门店直销)，9999(其它)',
  `post_id` int(11) DEFAULT '0' COMMENT '快递公司编号,对应运费模板中的主键(b_devlivertemplate)',
  `post_name` varchar(20) DEFAULT '' COMMENT '快递名称',
  `post_number` varchar(255) DEFAULT '' COMMENT '快递单号',
  `buyer_message` varchar(255) DEFAULT '' COMMENT '买家留言',
  `seller_memo` varchar(255) DEFAULT '' COMMENT '卖家备注',
  `buyer_flag` int(11) DEFAULT '0' COMMENT '买家备注旗帜：1（红）、2（黄）、3（绿）、4（蓝)、5(紫) ',
  `seller_flag` int(11) DEFAULT '0' COMMENT '卖家备注旗帜: 1（红）、2（黄）、3（绿）、4（蓝)、5(紫) ',
  `delv_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计送达时间，对应快递模板中的appoint_delvtime或def_delvtime',
  `delv_desc` varchar(255) DEFAULT '' COMMENT '预计到货时间，现在是一段文字描述',
  `confirm_goods_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '确认收货时间',
  `buyer_pay_no` varchar(255) DEFAULT '' COMMENT '买家支付帐号',
  `pay_style` varchar(10) DEFAULT '' COMMENT '买家支付方式: ali (支付宝) ，wx (微信)， bil(快钱)',
  `pay_number` varchar(255) DEFAULT '' COMMENT '支付交易号',
  `trades_del` int(11) DEFAULT '0' COMMENT '订单软删除（1：表示软删除，默认为0）',
  `trades_source` int(11) DEFAULT '110' COMMENT '订单来源: 110 (网站)，120（微信），130（app）, 140（店员帮用户下单），9999（其它）',
  `trades_invoice` int(11) DEFAULT '0' COMMENT '是否要发票: 0(不需要)，1（需要）',
  `invoice_title` varchar(255) DEFAULT '' COMMENT '发票抬头',
  `trades_store` int(11) DEFAULT '0' COMMENT '订单来源：门店ID',
  `self_taken_store` int(11) DEFAULT '0' COMMENT '自提门店ID',
  `self_taken_code` char(10) DEFAULT '' COMMENT '提货码（自提方式发货后生成）',
  `self_taken_code_start` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '提货开始时间',
  `self_taken_code_expires` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '提货码过期时间',
  `self_taken_code_checktime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '自提码验证通过时间',
  `assigned_stores` int(11) unsigned DEFAULT '0' COMMENT '指派送货的门店ID',
  `stockup_status` int(11) DEFAULT '110' COMMENT '备货状态（110 未备货 120 已备货）',
  `shipping_status` int(11) DEFAULT '110' COMMENT '发货状态(110 未发货 120 已发货)',
  `prescription_orders` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为处方药订单 0=不是处方药订单 1=处方药订单',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_trades_id` (`trades_id`),
  KEY `idx_buyer_nick` (`buyer_nick`) USING BTREE,
  KEY `idx_trades_store` (`trades_store`) USING BTREE,
  KEY `idx_trades_status` (`trades_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yb_trades_ext
-- ----------------------------
DROP TABLE IF EXISTS `yb_trades_ext`;
CREATE TABLE `yb_trades_ext` (
  `trades_ext_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `trades_id` bigint(20) unsigned DEFAULT NULL COMMENT 'PK for b_trades trades_id',
  `original_goods_data` text,
  `integral_used` int(11) unsigned DEFAULT '0' COMMENT '使用的积分',
  `integral_price` int(11) unsigned DEFAULT '0' COMMENT '积分抵扣的金额 单位：分',
  `reduce_reduction_amount` int(11) NOT NULL DEFAULT '0' COMMENT '满减减少金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`trades_ext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_user_tags
-- ----------------------------
DROP TABLE IF EXISTS `yb_user_tags`;
CREATE TABLE `yb_user_tags` (
  `tags_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品标签表',
  `tags_name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_del` tinyint(1) unsigned DEFAULT '0' COMMENT '删除标签, 0:正常   1：删除',
  PRIMARY KEY (`tags_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for yb_wx_public_config
-- ----------------------------
DROP TABLE IF EXISTS `yb_wx_public_config`;
CREATE TABLE `yb_wx_public_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL COMMENT '商家ID',
  `appid` varchar(32) DEFAULT NULL COMMENT '公众号appid',
  `mp_verify` varchar(255) DEFAULT NULL COMMENT '公众号授权字符串',
  `appsecret` varchar(32) DEFAULT NULL COMMENT '公众号秘钥',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
