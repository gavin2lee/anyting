-- MySQL dump 10.13  Distrib 5.6.19, for Linux (x86_64)
--
-- Host: localhost    Database: retail_fms
-- ------------------------------------------------------
-- Server version	5.6.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounting_subject`
--

DROP TABLE IF EXISTS `accounting_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounting_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subject_code` char(18) COLLATE utf8_bin NOT NULL COMMENT '科目编码',
  `subject_level` tinyint(3) NOT NULL COMMENT '科目级次',
  `subject_name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '科目名称',
  `subject_type` tinyint(3) NOT NULL COMMENT '科目类型',
  `subject_en_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '科目英文名称',
  `balance_direction` tinyint(3) DEFAULT NULL COMMENT '余额方向 1、借 2、贷',
  `currency` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '科目默认币种',
  `display_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '显示名称',
  `unit` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '计量单位',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `balance_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '余额方向控制',
  `mnemonic_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '助记码',
  `cancel_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '是否核销科目',
  `begin_period` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '启用期间',
  `begin_year` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '启用年度',
  `both_direction` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '帐簿余额双向显示',
  `cash_bank_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '现金银行科目',
  `incur_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '发生额方向控制',
  `glorg_book_creation` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '创建会计主体账簿',
  `create_year` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '创建年度',
  `create_period` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '创建月份',
  `control_system` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '控制系统',
  `del_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '删除标志',
  `end_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '末级标志',
  `end_period` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '终止期间',
  `end_year` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '终止年度',
  `recorded_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '内部交易信息是否必录',
  `inner_subject` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '内部交易科目',
  `out_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '表外科目',
  `glorg_book` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '会计主体账簿',
  `group_subject` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '对应集团科目',
  `subject_scheme` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '科目方案',
  `seal_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '封存标志',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态 1、已启用 0、已停用',
  `print_level` tinyint(3) DEFAULT NULL COMMENT '汇总打印级次',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_subject_code` (`subject_code`),
  KEY `IDX_accounting_subject_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='会计科目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `annual_cumulative`
--

DROP TABLE IF EXISTS `annual_cumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annual_cumulative` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键(UUID)',
  `year` char(4) COLLATE utf8_bin NOT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin NOT NULL COMMENT '月份',
  `brand_unit_no` char(16) COLLATE utf8_bin NOT NULL COMMENT '品牌部编码',
  `classify_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '分类编码',
  `classify_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '分类名称',
  `stock_qty` int(11) DEFAULT NULL COMMENT '进货数量',
  `return_qty` int(11) DEFAULT NULL COMMENT '退货数量',
  `balance_qty` int(11) DEFAULT NULL COMMENT '应付数量',
  `stock_amount` decimal(20,2) DEFAULT NULL COMMENT '进货金额',
  `return_amount` decimal(20,2) DEFAULT NULL COMMENT '退货金额',
  `balance_amount` decimal(20,2) DEFAULT NULL COMMENT '应付金额',
  `avg_cost` decimal(10,2) DEFAULT NULL COMMENT '平均单价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='年度月份累计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assist_project`
--

DROP TABLE IF EXISTS `assist_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assist_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` char(18) COLLATE utf8_bin NOT NULL COMMENT '辅助项目编码',
  `name` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '辅助项目名称',
  `type` tinyint(3) DEFAULT NULL COMMENT '辅助项目类型',
  `status` tinyint(3) DEFAULT '1' COMMENT '启用标志 1、已启用 0、已停用',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `fkAssistprojectType` (`type`),
  KEY `IDX_assist_project_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='辅助项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assist_project_type`
--

DROP TABLE IF EXISTS `assist_project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assist_project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_code` char(18) COLLATE utf8_bin NOT NULL COMMENT '辅助项目类型编码',
  `type_name` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '辅助项目类型名称',
  `status` tinyint(3) DEFAULT '1' COMMENT '启用标志 1、已启用 0、已停用',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_assist_project_type_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='辅助项目类别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `back_order_sales`
--

DROP TABLE IF EXISTS `back_order_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `back_order_sales` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `year` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `sum_owe_qty` int(8) DEFAULT NULL COMMENT '累计欠客数量',
  `sum_owe_cost` decimal(12,2) DEFAULT NULL COMMENT '累计欠客成本',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_001` (`company_no`,`year`,`month`,`item_no`),
  KEY `IDX_back_order_sales_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='累计欠客销售表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `balance_date`
--

DROP TABLE IF EXISTS `balance_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型(1-总部厂商结算,2-总部批发结算,3-其他结算)',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体名称',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `customer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编号',
  `customer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  `balance_date` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '结算日',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_balance_date_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算日设置-应付';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_account_info`
--

DROP TABLE IF EXISTS `bank_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '账户编码',
  `name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '账户名称',
  `company_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '开户公司',
  `account_no` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '账号',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编码',
  `bank_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '开户银行',
  `bank_area` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '开户地区',
  `zone_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '地区代码',
  `city_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `account_class` tinyint(3) DEFAULT NULL COMMENT '账户分类 1、基本账户 2、一般账户 3、临时账户 4、专用账户',
  `property` tinyint(3) DEFAULT NULL COMMENT '账户性质',
  `account_attribute` tinyint(3) DEFAULT NULL COMMENT '账户属性',
  `payment_mark` tinyint(3) DEFAULT NULL COMMENT '收付标志,1收，2付',
  `open_date` date DEFAULT NULL COMMENT '开户日期',
  `account_status` tinyint(3) DEFAULT NULL COMMENT '账户状态  1、启用 2、禁用',
  `type` tinyint(3) DEFAULT NULL COMMENT '账户类型',
  `cancel_date` date DEFAULT NULL COMMENT '销户日期',
  `status` tinyint(3) DEFAULT '1' COMMENT '启用标志 1、已启用 0、已停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`),
  KEY `IDX_bank_account_info_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='银行账户基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_ask_payment`
--

DROP TABLE IF EXISTS `bill_ask_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_ask_payment` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键(UUID)',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `buyer_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编号',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编号',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `saler_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `currency_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '币别',
  `all_qty` int(12) DEFAULT NULL COMMENT '请款数量',
  `all_amount` decimal(20,2) DEFAULT '0.00' COMMENT '请款金额',
  `balance_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_amount` decimal(20,2) DEFAULT '0.00' COMMENT '结算单金额',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态(0-制单,1-审核)',
  `balance_type` tinyint(3) DEFAULT '0' COMMENT '结算类型(1、总部厂商结算,2、总部批发结算, 3、总部其他结算,4、地区采购结算 5、地区间结算 6、地区自购结算 7、地区批发结算 8、地区团购结算 9、地区员购结算 10、地区商场结算 11、地区其他出库结算)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `audit_time` datetime DEFAULT NULL COMMENT '审批日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `is_generate` int(11) DEFAULT '0' COMMENT '是否生成',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bill_no` (`bill_no`) USING BTREE,
  KEY `IDX_bill_ask_payment_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='请款单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_ask_payment_dtl`
--

DROP TABLE IF EXISTS `bill_ask_payment_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_ask_payment_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `settle_method_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算方式',
  `settle_method_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算方式名称',
  `invoice_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `other_bank` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '对方银行',
  `other_bank_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '对方银行账号',
  `qty` int(11) DEFAULT '0' COMMENT '请款数量',
  `brand_no` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品大类编码',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品大类名称',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sys_expiration_date` datetime DEFAULT NULL COMMENT '系统到期日',
  `payment_date` datetime DEFAULT NULL COMMENT '要求付款日',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_ask_payment_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='请款单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_backsection_split`
--

DROP TABLE IF EXISTS `bill_backsection_split`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_backsection_split` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `backsection_no` char(25) COLLATE utf8_bin NOT NULL COMMENT '回款单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `back_type` tinyint(3) unsigned DEFAULT NULL COMMENT '回款方类型(1-商场，2-商业集团)',
  `back_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '回款方编码',
  `back_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '回款方名称',
  `back_amount` decimal(12,2) DEFAULT '0.00' COMMENT '回款金额',
  `back_date` date DEFAULT NULL COMMENT '回款日期',
  `receive_amount` decimal(12,2) DEFAULT '0.00' COMMENT '应回金额',
  `notreceive_amount` decimal(12,2) DEFAULT '0.00' COMMENT '未收金额',
  `diff_amount` decimal(12,2) DEFAULT '0.00' COMMENT '回款差异',
  `diff_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '差异原因',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '单据状态',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  KEY `idx_backsection_no` (`backsection_no`) USING BTREE,
  KEY `idx_back_date` (`back_date`),
  KEY `idx_campany_back` (`company_no`,`back_no`),
  KEY `IDX_bill_backsection_split_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='回款登记主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_backsection_split_dtl`
--

DROP TABLE IF EXISTS `bill_backsection_split_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_backsection_split_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `backsection_dtl_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '回款明细编号',
  `backsection_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '回款编号',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '结算月份',
  `balance_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单编号',
  `billing_amount` decimal(12,2) DEFAULT '0.00' COMMENT '开票金额',
  `ticket_deduction_amount` decimal(12,2) DEFAULT '0.00' COMMENT '票后帐扣费用',
  `receive_amount` decimal(12,2) DEFAULT '0.00' COMMENT '应回款金额',
  `already_receive_amount` decimal(12,2) DEFAULT '0.00' COMMENT '已回款金额',
  `not_receive_amount` decimal(12,2) DEFAULT '0.00' COMMENT '未回款金额',
  `the_payment_amount` decimal(12,2) DEFAULT '0.00' COMMENT '本次回款金额',
  `back_date` date DEFAULT NULL COMMENT '回款日期',
  `diff_amount` decimal(12,2) DEFAULT '0.00' COMMENT '回款差异',
  `diff_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '差异原因',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `bsgroups_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `system_sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统收入',
  `bank_back_date` date DEFAULT NULL COMMENT '银行回款日期',
  `bank_back_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '银行回款金额',
  `invoice_apply_date` date DEFAULT NULL COMMENT '申请开票日期',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  PRIMARY KEY (`id`),
  KEY `idx_backsection_no` (`backsection_no`) USING BTREE,
  KEY `idx_shop_no` (`shop_no`),
  KEY `idx_balance_no` (`balance_no`),
  KEY `IDX_bill_backsection_split_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='回款登记明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_balance`
--

DROP TABLE IF EXISTS `bill_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_balance` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键(uuid)',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号(结算单号)',
  `bill_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '单据名称',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `extend_status` tinyint(3) DEFAULT '0' COMMENT '扩展状态',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型(1、总部厂商结算,2、总部批发结算, 3、总部其他结算,4、地区采购结算 5、地区间结算 6、地区自购结算 7、地区批发结算 8、地区团购结算 9、地区员购结算 10、地区商场结算 11、地区其他出库结算)',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单买方编号',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单买方名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单卖方编号',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单卖方名称',
  `organ_no` char(120) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市编号(多选)',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市名称(多选)',
  `organ_no_from` char(120) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市编号(多选)',
  `organ_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市名称(多选)',
  `brand_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(600) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `brand_unit_no` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `category_name` varchar(600) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `extend_category_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展分类编码',
  `extend_category_name` varchar(600) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展分类名称',
  `balance_date` date DEFAULT NULL COMMENT '结算日期',
  `balance_start_date` date DEFAULT NULL COMMENT '结算开始时间',
  `balance_end_date` date DEFAULT NULL COMMENT '结算结束日期',
  `currency` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '币别',
  `out_amount` decimal(20,2) DEFAULT '0.00' COMMENT '发出金额',
  `supplier_amount` decimal(20,2) DEFAULT '0.00' COMMENT '厂商金额',
  `entry_amount` decimal(20,2) DEFAULT '0.00' COMMENT '接收金额',
  `return_amount` decimal(20,2) DEFAULT '0.00' COMMENT '退残金额',
  `custom_return_amount` decimal(20,2) DEFAULT '0.00' COMMENT '客残金额',
  `deduction_amount` decimal(20,2) DEFAULT '0.00' COMMENT '其他扣项金额',
  `balance_amount` decimal(20,2) DEFAULT '0.00' COMMENT '结算金额',
  `invoice_rebate_amount` decimal(20,2) DEFAULT '0.00' COMMENT '票后返利金额',
  `rebate_amount` decimal(20,2) DEFAULT '0.00' COMMENT '票前返利金额',
  `invoice_amount` decimal(20,2) DEFAULT '0.00' COMMENT '发票金额',
  `has_balance_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已结算金额(付款金额/收款金额)',
  `out_qty` int(11) DEFAULT '0' COMMENT '发出数(备用)',
  `entry_qty` int(11) DEFAULT '0' COMMENT '接收数(备用)',
  `return_qty` int(11) DEFAULT '0' COMMENT '退残数(备用)',
  `custom_return_qty` int(11) DEFAULT '0' COMMENT '客残数(备用)',
  `deduction_qty` int(11) DEFAULT '0' COMMENT '扣项数(备用)',
  `balance_qty` int(11) DEFAULT '0' COMMENT '结算数量(备用)',
  `ask_payment_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '请款单号',
  `invoice_apply_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请单号',
  `invoice_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `is_user_defined` tinyint(3) DEFAULT '0' COMMENT '是否自定义',
  `is_apportion_rebate` tinyint(3) DEFAULT '0' COMMENT '是否已分摊票前返利(0:未分摊，1:已分摊)',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `other_price` decimal(12,2) DEFAULT '0.00' COMMENT '其他费用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bill_no` (`bill_no`) USING BTREE,
  KEY `IDX_bill_balance_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_balance_cash_payment`
--

DROP TABLE IF EXISTS `bill_balance_cash_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_balance_cash_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '收款单号、付款单号',
  `status` tinyint(3) DEFAULT NULL COMMENT '平衡标志 1、相等 0、不相等',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_amount` decimal(20,2) DEFAULT '0.00' COMMENT '应收金额、应付金额(结算金额)',
  `receivable_amount` decimal(20,2) DEFAULT '0.00' COMMENT '收款金额',
  `payment_amount` decimal(20,2) DEFAULT '0.00' COMMENT '付款金额',
  `overage_amount` decimal(20,2) DEFAULT '0.00' COMMENT '余额=结算金额-收/付款金额',
  `bill_date` datetime DEFAULT NULL COMMENT '单据日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_balance_cash_payment_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算单收款信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_balance_invoice`
--

DROP TABLE IF EXISTS `bill_balance_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_balance_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `express_date` datetime DEFAULT NULL COMMENT '快递日期',
  `express_bill_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `invoice_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '金额',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型(1-应收,2-应付)',
  `express` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司',
  `invoice_date` datetime DEFAULT NULL COMMENT '发票日期',
  `receive_date` datetime DEFAULT NULL COMMENT '接受日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_balance_invoice_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算发票登记';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_balance_invoice_apply`
--

DROP TABLE IF EXISTS `bill_balance_invoice_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_balance_invoice_apply` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '发票申请单号',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码(开票方)-卖方',
  `saler_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码(收票方)-买方',
  `buyer_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `invoice_apply_date` date DEFAULT NULL COMMENT '申请开票日期',
  `post_pay_date` date DEFAULT NULL COMMENT '交票日期',
  `tax_registry_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `bank_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行帐号',
  `bank_account_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '银行账户名',
  `currency` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '币别',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '开票金额',
  `invoice_type` tinyint(3) DEFAULT '1' COMMENT '发票类型(0 = 普通发票 1 = 增值票)',
  `pre_invoice` tinyint(3) DEFAULT '1' COMMENT '是否预开票(2 = 是 1 = 否)',
  `status` tinyint(3) DEFAULT '1' COMMENT '单据状态',
  `export_num` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '引出次数',
  `buyer_address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '客户-买方地址',
  `buyer_tel` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '客户-买方电话',
  `mailing_address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮寄地址',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人电话',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `invoice_register_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票登记单号',
  `invoice_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `use_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '发票是否已使用：0 未使用，1 已使用',
  `organ_no` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `month` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '结算月',
  `brand_Name` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌',
  `brand_no` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bill_no` (`bill_no`) USING BTREE,
  KEY `ux_saler_buyer` (`saler_no`,`buyer_no`) USING BTREE,
  KEY `IDX_bill_balance_invoice_apply_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开票申请单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_balance_invoice_dtl`
--

DROP TABLE IF EXISTS `bill_balance_invoice_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_balance_invoice_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请单号',
  `balance_no` varchar(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_start_date` datetime DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` datetime DEFAULT NULL COMMENT '结算终止日期',
  `brand_Name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌',
  `brand_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `category_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编号',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `send_amount` decimal(12,2) DEFAULT NULL COMMENT '金额',
  `tax_rate` decimal(9,4) DEFAULT NULL COMMENT '税率',
  `tax_amount` decimal(12,2) DEFAULT NULL COMMENT '税额',
  `no_tax_amount` decimal(12,2) DEFAULT NULL COMMENT '不含税金额',
  `estimated_amount` decimal(12,2) DEFAULT NULL COMMENT '预估成本',
  `pos_earning_amount` decimal(12,2) DEFAULT NULL COMMENT '终端收入金额',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `shop_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺小类 (销售类型(门店必填, A0:商场店中店 A1:商场独立店 A2:商场\n\n特卖店 A3:商场寄卖店 BJ:独立街边店 BM:MALL B3:独立寄卖店, D0:批发加盟店 D1:批发团购店 D2:批发员购店 D3:批发调货店)',
  `contract_rate` decimal(12,2) DEFAULT NULL COMMENT '合同扣率',
  `actual_rate` decimal(12,2) DEFAULT NULL COMMENT '实际扣率',
  `cost_total` decimal(12,2) DEFAULT NULL COMMENT '销售明细成本汇总',
  `remark` varchar(225) COLLATE utf8_bin DEFAULT NULL COMMENT '备注，在销售明细成本有为0时，需要增加备注说明',
  `cate_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '一级大类编号',
  `cate_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '一级大类名称',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码(开票方)-卖方',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `bill_no` (`bill_no`) USING BTREE,
  KEY `balance_no` (`balance_no`) USING BTREE,
  KEY `IDX_bill_balance_invoice_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开票申请－按大类明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_balance_invoice_info`
--

DROP TABLE IF EXISTS `bill_balance_invoice_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_balance_invoice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '发票申请单号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `invoice_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '发票金额',
  `tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '含税金额',
  `invoice_date` date DEFAULT NULL COMMENT '发票日期',
  `delivery_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '快递日期',
  `express` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司',
  `delivery_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `receive_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '接收日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人',
  `audit_date` datetime DEFAULT NULL COMMENT '确认日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_balance_invoice_info_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开票申请单-发票信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_balance_invoice_source`
--

DROP TABLE IF EXISTS `bill_balance_invoice_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_balance_invoice_source` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '发票申请单号',
  `balance_no` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `balance_type` int(11) DEFAULT NULL COMMENT '结算类型(1、总部厂商结算,2、总部批发结算, 3、总部其他结算,4、地区采购结算 5、地区间结算 6、地区自购结算 7、地区批发结算 8、地区团购结算 9、地区员购结算 10、地区商场结算 11、地区其他出库结算)',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '开票金额',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码(开票方)-卖方',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_balance_invoice_source_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开票申请单-源结算单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_buy_balance`
--

DROP TABLE IF EXISTS `bill_buy_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_buy_balance` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `fas_bill_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'FAS单据类型编号',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `bill_type` int(11) DEFAULT NULL COMMENT '单据类型(1301-到货单,1333-调货出库单,1335-客残销售出库单)',
  `biz_type` int(11) DEFAULT NULL COMMENT '业务类型(0：订货 ，1：补货  ，2直接 4、跨区调货 5、差异处理)',
  `ref_bill_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号，多个已，隔开',
  `ref_bill_type` int(11) DEFAULT NULL COMMENT '相关单据类型',
  `original_bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '原单据编号',
  `status` int(11) DEFAULT NULL COMMENT '单据状态 1、已发未收 2、已收货 3、审核 5、确认',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编号',
  `buyer_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编号',
  `saler_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `send_date` date DEFAULT NULL COMMENT '发出日期',
  `receive_date` date DEFAULT NULL COMMENT '接收日期',
  `send_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地编号',
  `send_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地名称',
  `receive_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地编号',
  `receive_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地名称',
  `sku_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '明细id',
  `sku_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SKU编号',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编号',
  `category_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价(结算价格、默认原单据价格)',
  `bill_cost` decimal(12,2) DEFAULT '0.00' COMMENT '单据价格(原单据价格)',
  `actual_cost` decimal(12,2) DEFAULT NULL COMMENT '实际出库价格(费用分摊后的价格)',
  `other_deduct_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '票前返利与其他扣项分摊金额字段',
  `tax_rate` decimal(4,2) DEFAULT NULL COMMENT '税率',
  `exclusive_cost` decimal(12,2) DEFAULT '0.00' COMMENT '不含税单价',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `region_cost` decimal(12,2) DEFAULT '0.00' COMMENT '地区成本',
  `region_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副地区价 buy表为卖方sale表为买方',
  `unit_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '单位成本',
  `unit_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副单位成本 buy表为卖方sale表为买方',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `material_price` decimal(12,2) DEFAULT '0.00' COMMENT '物料价',
  `factory_price` decimal(12,2) DEFAULT '0.00' COMMENT '厂进价',
  `send_qty` int(11) DEFAULT '0' COMMENT '发出数量',
  `receive_qty` int(11) DEFAULT '0' COMMENT '接受数量',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_status` tinyint(3) DEFAULT NULL COMMENT '结算单状态',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型（总部-地区，总部-供应商）',
  `is_split` tinyint(3) DEFAULT NULL COMMENT '是否拆分单据',
  `path_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算路径编码',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位编号',
  `order_unit_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市编号',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市名称',
  `order_unit_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位编号',
  `order_unit_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位名称',
  `organ_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市编号',
  `organ_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区编码',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区名称',
  `zone_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区编码',
  `zone_name_from` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区名称',
  `years` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份(指上市的年份,下拉框选择,值: 2006~2026,默认当年)',
  `season` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '季节(下拉框选择,A:春 B:夏 C:秋 D:冬)',
  `orderfrom` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货形式(下拉框选择,值: 1:自产 2:外购 3:地区自购)',
  `gender` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别(下拉框选择,值: 男, 女, 童, 无性别)',
  `tag_price` decimal(10,2) DEFAULT '0.00' COMMENT '牌价',
  `tag_price_nation` decimal(12,2) DEFAULT '0.00' COMMENT '全国统一牌价',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `cost_checked` tinyint(3) DEFAULT '0' COMMENT '异常价格更新 (0:未更新 1:正常，2异常)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `claim_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '索赔编号',
  `return_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '退货编号',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`bill_no`,`item_no`) USING BTREE,
  KEY `idx_item_no` (`item_no`,`saler_no`,`buyer_no`,`send_date`),
  KEY `uk_saler_no` (`saler_no`,`buyer_no`,`send_date`,`bill_type`,`bill_no`),
  KEY `idx_original_bill_no` (`original_bill_no`,`bill_type`,`bill_no`),
  KEY `idx_send_date` (`send_date`,`saler_no`,`buyer_no`,`bill_type`,`bill_no`),
  KEY `idx_receive_date` (`receive_date`,`buyer_no`,`saler_no`,`bill_type`,`bill_no`),
  KEY `IDX_BILL_TYPE` (`bill_type`,`biz_type`),
  KEY `IDX_bill_buy_balance_update_time` (`update_time`) USING BTREE,
  KEY `idx_supplier_no` (`supplier_no`,`item_no`,`send_date`,`order_unit_no`),
  KEY `idx_zone_no` (`zone_no`,`order_no`,`order_unit_no`),
  KEY `idx_balance_no` (`balance_no`),
  KEY `uk_brand_no` (`ref_bill_no`,`item_no`,`bill_no`,`brand_no`,`bill_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='采购类单据池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_buy_balance_additional`
--

DROP TABLE IF EXISTS `bill_buy_balance_additional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_buy_balance_additional` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `original_bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '关联单据单号',
  `currency_code` char(30) COLLATE utf8_bin NOT NULL COMMENT '币别编号',
  `currency_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '币别名称',
  `item_code` char(30) COLLATE utf8_bin NOT NULL COMMENT '货品编号',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '货品名称',
  `exchange_rate` decimal(12,4) DEFAULT NULL COMMENT '汇率',
  `tariff_rate` decimal(12,4) DEFAULT NULL COMMENT '关税率',
  `vat_rate` decimal(12,4) DEFAULT NULL COMMENT '增值税率',
  `purchase_fee` decimal(12,4) DEFAULT NULL COMMENT '采购费用',
  `standard_currency_code` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '本位币编码',
  `standard_currency_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '本位币名称',
  `total_amount` decimal(12,4) DEFAULT NULL COMMENT '总金额',
  `region_price_gap` decimal(12,4) DEFAULT NULL COMMENT '地区加价',
  `region_amount` decimal(12,4) DEFAULT NULL COMMENT '地区金额',
  `region_cost` decimal(12,4) DEFAULT NULL COMMENT '地区价',
  `category_secondary` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '二级大类',
  `category_tertiary` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '三级大类',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态:0-自动、1-手工修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='bill_buy_balance扩展信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_buy_balance_his`
--

DROP TABLE IF EXISTS `bill_buy_balance_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_buy_balance_his` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `fas_bill_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'FAS单据类型编号',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `bill_type` int(11) DEFAULT NULL COMMENT '单据类型(1301-到货单,1333-调货出库单,1335-客残销售出库单)',
  `biz_type` int(11) DEFAULT NULL COMMENT '业务类型(0：订货 ，1：补货  ，2直接 4、跨区调货 5、差异处理)',
  `ref_bill_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号，多个已，隔开',
  `ref_bill_type` int(11) DEFAULT NULL COMMENT '相关单据类型',
  `original_bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '原单据编号',
  `status` int(11) DEFAULT NULL COMMENT '单据状态 1、已发未收 2、已收货 3、审核 5、确认',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编号',
  `buyer_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编号',
  `saler_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `send_date` date DEFAULT NULL COMMENT '发出日期',
  `receive_date` date DEFAULT NULL COMMENT '接收日期',
  `send_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地编号',
  `send_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地名称',
  `receive_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地编号',
  `receive_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地名称',
  `sku_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '明细id',
  `sku_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SKU编号',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编号',
  `category_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价(结算价格、默认原单据价格)',
  `bill_cost` decimal(12,2) DEFAULT '0.00' COMMENT '单据价格(原单据价格)',
  `actual_cost` decimal(12,2) DEFAULT NULL COMMENT '实际出库价格(费用分摊后的价格)',
  `other_deduct_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '票前返利与其他扣项分摊金额字段',
  `tax_rate` decimal(4,2) DEFAULT NULL COMMENT '税率',
  `exclusive_cost` decimal(12,2) DEFAULT '0.00' COMMENT '不含税单价',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `region_cost` decimal(12,2) DEFAULT '0.00' COMMENT '地区成本',
  `region_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副地区价 buy表为卖方sale表为买方',
  `unit_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '单位成本',
  `unit_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副单位成本 buy表为卖方sale表为买方',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `material_price` decimal(12,2) DEFAULT '0.00' COMMENT '物料价',
  `factory_price` decimal(12,2) DEFAULT '0.00' COMMENT '厂进价',
  `send_qty` int(11) DEFAULT '0' COMMENT '发出数量',
  `receive_qty` int(11) DEFAULT '0' COMMENT '接受数量',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_status` tinyint(3) DEFAULT NULL COMMENT '结算单状态',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型（总部-地区，总部-供应商）',
  `is_split` tinyint(3) DEFAULT NULL COMMENT '是否拆分单据',
  `path_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算路径编码',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位编号',
  `order_unit_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市编号',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市名称',
  `order_unit_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位编号',
  `order_unit_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位名称',
  `organ_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市编号',
  `organ_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区编码',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区名称',
  `zone_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区编码',
  `zone_name_from` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区名称',
  `years` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份(指上市的年份,下拉框选择,值: 2006~2026,默认当年)',
  `season` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '季节(下拉框选择,A:春 B:夏 C:秋 D:冬)',
  `orderfrom` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货形式(下拉框选择,值: 1:自产 2:外购 3:地区自购)',
  `gender` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别(下拉框选择,值: 男, 女, 童, 无性别)',
  `tag_price` decimal(10,2) DEFAULT '0.00' COMMENT '牌价',
  `tag_price_nation` decimal(12,2) DEFAULT '0.00' COMMENT '全国统一牌价',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `cost_checked` tinyint(3) DEFAULT '0' COMMENT '异常价格更新 (0:未更新 1:正常，2异常)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `claim_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '索赔编号',
  `return_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '退货编号',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`bill_no`,`item_no`) USING BTREE,
  KEY `idx_item_no` (`item_no`,`saler_no`,`buyer_no`,`send_date`),
  KEY `uk_saler_no` (`saler_no`,`buyer_no`,`send_date`,`bill_type`,`bill_no`),
  KEY `idx_original_bill_no` (`original_bill_no`,`bill_type`,`bill_no`),
  KEY `idx_send_date` (`send_date`,`saler_no`,`buyer_no`,`bill_type`,`bill_no`),
  KEY `idx_receive_date` (`receive_date`,`buyer_no`,`saler_no`,`bill_type`,`bill_no`),
  KEY `IDX_BILL_TYPE` (`bill_type`,`biz_type`),
  KEY `IDX_bill_buy_balance_update_time` (`update_time`) USING BTREE,
  KEY `idx_supplier_no` (`supplier_no`,`item_no`,`send_date`,`order_unit_no`),
  KEY `idx_zone_no` (`zone_no`,`order_no`,`order_unit_no`),
  KEY `idx_balance_no` (`balance_no`),
  KEY `uk_brand_no` (`ref_bill_no`,`item_no`,`bill_no`,`brand_no`,`bill_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='采购类单据池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_common_invoice_register`
--

DROP TABLE IF EXISTS `bill_common_invoice_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_common_invoice_register` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '发票单号',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码(开票方)-卖方',
  `saler_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码(收票方)-买方',
  `buyer_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '开票总金额',
  `status` tinyint(3) DEFAULT '1' COMMENT '单据状态(0-制单、1-确认)',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型（1 = 普通发票 2 = 增值票）',
  `pre_invoice` tinyint(3) unsigned DEFAULT '1' COMMENT '是否预开票(2 = 是 1 = 否)',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `balance_type` int(11) DEFAULT NULL COMMENT '源单类型(1、总部厂商结算,2、总部批发结算, 3、总部其他结算,4、地区采购结算 5、地区间结算 6、地区自购结算 7、地区批发结算 8、地区团购结算 9、地区员购结算 10、地区商场结算 11、地区其他出库结算)',
  `invoice_no_flag` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '采购发票号标志',
  `use_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '发票是否已使用：0 未使用，1 已使用',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编号',
  `shop_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `confirm_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `month` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '结算月',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_common_invoice_register_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='普通发票登记';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_common_register_dtl`
--

DROP TABLE IF EXISTS `bill_common_register_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_common_register_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据号',
  `invoice_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票编号',
  `invoice_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_date` date DEFAULT NULL COMMENT '发票日期',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '发票金额',
  `estimated_amount` decimal(20,2) DEFAULT '0.00' COMMENT '预估成本',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `invoice_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌中文名称',
  `qty` int(11) DEFAULT '0' COMMENT '商品数量',
  `tax_rate` decimal(9,4) DEFAULT NULL COMMENT '税率',
  `no_tax_amount` decimal(18,2) DEFAULT NULL COMMENT '不含税金额',
  `tax_amount` decimal(18,2) DEFAULT NULL COMMENT '税额',
  `price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `delivery_date` datetime DEFAULT NULL COMMENT '快递日期',
  `express` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司',
  `delivery_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `receive_date` datetime DEFAULT NULL COMMENT '接收日期',
  `confirm_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码(开票方)-卖方',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_common_register_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='普通发票登记明细记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_cust_fine_nt`
--

DROP TABLE IF EXISTS `bill_cust_fine_nt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_cust_fine_nt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `status` tinyint(3) DEFAULT NULL COMMENT '单据状态',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算主体编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算主体名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '保证金金额',
  `reced_margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '已收保证金金额',
  `fine_amount` decimal(12,2) DEFAULT '0.00' COMMENT '罚没金额',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_status` tinyint(3) DEFAULT NULL COMMENT '审核状态(0 = 未审核 1 = 已审核)',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_cust_fine_nt_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='保证金罚没通知单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_cust_margin_nt`
--

DROP TABLE IF EXISTS `bill_cust_margin_nt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_cust_margin_nt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算主体编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算主体名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '保证金金额',
  `reced_margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '已收保证金金额',
  `rece_margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '应收保证金',
  `paid_margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实收保证金金额',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_status` tinyint(3) DEFAULT NULL COMMENT '审核状态(0 = 未审核 1 = 已审核)',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `status` tinyint(3) DEFAULT NULL COMMENT '单据状态',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_cust_margin_nt_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户保证金催缴通知单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_differences`
--

DROP TABLE IF EXISTS `bill_differences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_differences` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT 'UUID',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号,来源单据的单据编号',
  `handle_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '处理单号',
  `bill_type` int(11) NOT NULL COMMENT '单据类型',
  `asn_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '到货单单据编号',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态 (0-制单,1-出货,2-收货,98-删除,99-作废,100-完结)',
  `adjustment_type` tinyint(3) DEFAULT NULL COMMENT '调整类型:1.数据出错,2:实物丢失',
  `sys_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '制单机构',
  `order_unit_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货订货单位',
  `order_unit_name_from` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位名称',
  `order_unit_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '收货订货单位',
  `order_unit_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位名称',
  `store_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '机构编码,调出机构',
  `store_name_from` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方机构名称(如果是店铺则保存店铺名称其他则保存仓库名称)',
  `shop_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺,调出店铺',
  `store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '调入机构编码',
  `store_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方机构名称(如果是店铺则保存店铺名称其他则保存仓库名称)',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '调入店铺编码',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `send_date` date DEFAULT NULL COMMENT '发出时间',
  `receipt_date` date DEFAULT NULL COMMENT '接受时间',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品内码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `color_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色编码',
  `color_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `sku_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku编码',
  `size_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '尺寸编号',
  `send_out_qty` int(11) NOT NULL DEFAULT '0' COMMENT '发出数量',
  `stock_in_qty` int(11) NOT NULL DEFAULT '0' COMMENT '接收数量',
  `differences_qty` int(11) NOT NULL DEFAULT '0' COMMENT '差异数量',
  `adjustment_qty` int(11) NOT NULL DEFAULT '0' COMMENT '调整数量',
  `adjustment_direction` int(11) DEFAULT NULL COMMENT '调整方向:1.收货方,2:发货方',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价',
  `adjustment_cost` decimal(12,2) DEFAULT '0.00' COMMENT '调整金额',
  `merchandiser` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '业务员',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `box_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '箱号',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_differences_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='差异报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_inv_cost_adjust`
--

DROP TABLE IF EXISTS `bill_inv_cost_adjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_inv_cost_adjust` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `bill_type` smallint(6) NOT NULL COMMENT '单据类型 (货运单:1300;配货单:1325   1386:"原残退厂通知单"	1387:"客残退厂通知单"	1333:"原残退厂发货单"	1338:"原残退厂收货单"	1334:"客残退厂发货单"  1335:"客残销售出库单")',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `year` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `stock_detail_total` decimal(12,0) DEFAULT NULL COMMENT '明细数量总量',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bill_no` (`bill_no`),
  KEY `IDX_bill_inv_cost_adjust_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='库存成本调整单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_inv_cost_adjust_dtl`
--

DROP TABLE IF EXISTS `bill_inv_cost_adjust_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_inv_cost_adjust_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品系统唯一编码(系统编码,对用户不可见)',
  `barcode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品条码',
  `item_code` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '商品编码(出厂时的商品编码)',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `size_kind` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '尺寸分类,详见size_kind表',
  `adjust_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '调整的成本',
  `unit_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '单位成本',
  `closing_qty` int(11) NOT NULL DEFAULT '0' COMMENT '期末数量',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_inv_cost_adjust_dtl_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='库存成本调整单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_inv_cost_adjust_dtl_his`
--

DROP TABLE IF EXISTS `bill_inv_cost_adjust_dtl_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_inv_cost_adjust_dtl_his` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品系统唯一编码(系统编码,对用户不可见)',
  `barcode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品条码',
  `item_code` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '商品编码(出厂时的商品编码)',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `size_kind` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '尺寸分类,详见size_kind表',
  `adjust_cost` decimal(12,2) DEFAULT '0.00' COMMENT '调整的成本',
  `unit_cost` decimal(12,2) DEFAULT '0.00' COMMENT '单位成本',
  `closing_qty` int(11) NOT NULL DEFAULT '0' COMMENT '期末数量',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='库存成本调整单明细历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_inv_cost_adjust_his`
--

DROP TABLE IF EXISTS `bill_inv_cost_adjust_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_inv_cost_adjust_his` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `bill_type` int(11) NOT NULL COMMENT '单据类型 (货运单:1300;配货单:1325   1386:"原残退厂通知单"	1387:"客残退厂通知单"	1333:"原残退厂发货单"	1338:"原残退厂收货单"	1334:"客残退厂发货单"  1335:"客残销售出库单")',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `year` year(4) DEFAULT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态(1:未处理 0:已处理)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `stock_detail_total` decimal(12,0) DEFAULT NULL COMMENT '明细数量总量',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='库存成本调整单历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_inventory_control`
--

DROP TABLE IF EXISTS `bill_inventory_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_inventory_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bill_type` int(11) NOT NULL COMMENT '单据类型',
  `bill_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '单据名称',
  `in_out_flag` tinyint(3) DEFAULT NULL COMMENT '出入库标志',
  `re_bill_type` int(11) DEFAULT NULL COMMENT '相关单据类型',
  `fas_col_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'FAS系统结存列',
  `gms_col_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'GMS系统结存列',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_bill_type` (`bill_type`,`in_out_flag`,`fas_col_no`) USING BTREE,
  KEY `IDX_bill_inventory_control_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结存列数据控制表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_invoice`
--

DROP TABLE IF EXISTS `bill_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_invoice` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编码',
  `saler_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编码',
  `buyer_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `qty` int(12) DEFAULT NULL COMMENT '数量',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `currency` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '币别',
  `ref_bill_no` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '源单编码',
  `ref_amount` decimal(20,2) DEFAULT '0.00' COMMENT '源单金额',
  `payment_no` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '付款单号',
  `payment_qty` int(12) DEFAULT NULL COMMENT '付款数量',
  `payment_amount` decimal(20,2) DEFAULT '0.00' COMMENT '付款金额',
  `create_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `audit_time` datetime DEFAULT NULL COMMENT '审批时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `is_generate` int(11) DEFAULT '0' COMMENT '是否生成',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_invoice_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='发票';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_invoice_dtl`
--

DROP TABLE IF EXISTS `bill_invoice_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_invoice_dtl` (
  `id` int(18) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `invoice_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_code` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '发票编码',
  `invoice_date` date DEFAULT NULL COMMENT '发票日期',
  `invoice_amount` decimal(20,2) DEFAULT '0.00' COMMENT '发票金额',
  `tax_rate` decimal(9,4) DEFAULT NULL COMMENT '税率',
  `no_tax_amount` decimal(20,8) DEFAULT NULL COMMENT '不含税税额',
  `tax_amount` decimal(20,8) DEFAULT NULL COMMENT '税额',
  `qty` int(11) DEFAULT '0' COMMENT '数量',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `category_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_invoice_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购发票明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_mall_deduction_cost`
--

DROP TABLE IF EXISTS `bill_mall_deduction_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_mall_deduction_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `bsgroups_name` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌编码',
  `period` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '费用所属期间-会计期间结算月',
  `nc_period` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT 'NC月份',
  `cost_type` tinyint(3) DEFAULT '1' COMMENT '费用性质(1-合同内,2-合同外)',
  `cost_deduct_type` tinyint(3) DEFAULT '1' COMMENT '费用扣取方式(1-票前,2-票后)',
  `cost_pay_type` tinyint(3) DEFAULT '1' COMMENT '费用交款方式(1-帐扣,2-现金)',
  `cost_cate_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '费用类别编码',
  `cost_cate_name` varchar(60) COLLATE utf8_bin DEFAULT 'null' COMMENT '费用类别名称',
  `deduction_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商场扣费编码',
  `deduction_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商场扣费名称',
  `bill_date` date DEFAULT NULL COMMENT '业务单据日期',
  `deduct_amount` decimal(20,2) DEFAULT '0.00' COMMENT '扣费金额',
  `actual_amount` decimal(20,2) DEFAULT NULL COMMENT '实际金额',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_mall_deduction_cost_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场费用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_payment`
--

DROP TABLE IF EXISTS `bill_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payment` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编码',
  `saler_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编码',
  `buyer_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `currency` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '币别',
  `ref_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '源单编码',
  `ref_qty` int(11) DEFAULT NULL COMMENT '源单数量',
  `ref_amount` decimal(20,2) DEFAULT '0.00' COMMENT '源单金额',
  `create_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `audit_time` datetime DEFAULT NULL COMMENT '审批时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `is_generate` int(11) DEFAULT '0' COMMENT '是否生成',
  `is_pre_payment` tinyint(3) DEFAULT '0' COMMENT '是否预付(0,否，1,是)',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_payment_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='发票';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_payment_dtl`
--

DROP TABLE IF EXISTS `bill_payment_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payment_dtl` (
  `id` int(18) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `settle_method_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算方式编码',
  `settle_method_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算方式名称',
  `payment_application` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '付款用途',
  `advance_payment_order_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '预付订单号',
  `pay_qty` int(11) DEFAULT NULL COMMENT '数量',
  `pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '应付金额',
  `money_discount` decimal(20,2) DEFAULT '0.00' COMMENT '现金折扣',
  `discount_amount` decimal(20,2) DEFAULT '0.00' COMMENT '折后金额',
  `fee` decimal(20,2) DEFAULT '0.00' COMMENT '手续费',
  `balance_amount` decimal(20,2) DEFAULT '0.00' COMMENT '实付金额',
  `bank_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '银行帐号',
  `bank_balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '银行结算号',
  `remark` char(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_payment_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='付款单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_pre_payment_nt`
--

DROP TABLE IF EXISTS `bill_pre_payment_nt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_pre_payment_nt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型',
  `status` tinyint(3) DEFAULT NULL COMMENT '单据状态',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算主体编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算主体名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `paid_date` date DEFAULT NULL COMMENT '收款日期',
  `sale_order_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售订单编码',
  `order_qty` int(11) DEFAULT '0' COMMENT '订单数量',
  `order_amount` decimal(12,2) DEFAULT '0.00' COMMENT '订单金额',
  `rebate_amount` decimal(12,2) DEFAULT '0.00' COMMENT '返利金额',
  `pre_order_amount` decimal(12,2) DEFAULT '0.00' COMMENT '订货预收款',
  `pre_send_amount` decimal(12,2) DEFAULT '0.00' COMMENT '发货预收款',
  `paid_type` tinyint(3) DEFAULT NULL COMMENT '收款类型',
  `term_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收款条款编码',
  `term_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收款条款',
  `receivable_amount` decimal(12,2) DEFAULT '0.00' COMMENT '应收金额',
  `paid_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实收金额',
  `pre_payment_over` decimal(12,2) DEFAULT '0.00' COMMENT '订单预收款余额',
  `reversal_amount` decimal(12,2) DEFAULT '0.00' COMMENT '冲销金额',
  `reversal_amount_flag` tinyint(3) unsigned DEFAULT NULL COMMENT '是否冲销客户预收余额（0 = 是 1 = 否）',
  `invoice_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_type` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '发票类型',
  `invoice_date` date DEFAULT NULL COMMENT '发票日期',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_status` tinyint(3) DEFAULT NULL COMMENT '审核状态(0 = 未审核 1 = 已审核)',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_pre_payment_nt_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预收款缴款通知单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_purchase_adjust`
--

DROP TABLE IF EXISTS `bill_purchase_adjust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_purchase_adjust` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收方公司编号',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收方公司名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发方公司编号',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '发方公司名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收方公司编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收方公司名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编号',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `purchase_date` date DEFAULT NULL COMMENT '日期',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编码',
  `bill_status` tinyint(3) DEFAULT NULL COMMENT '单据状态',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) DEFAULT NULL COMMENT '单据状态',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `area_balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '地区结算单号',
  `due_date` date DEFAULT NULL COMMENT '到期日',
  `all_amount` decimal(20,2) DEFAULT NULL COMMENT '总金额',
  `no_pay_amount` decimal(20,2) DEFAULT NULL COMMENT '未付款金额',
  `pay_amount` decimal(20,2) DEFAULT NULL COMMENT '已付款金额',
  `pay_status` tinyint(3) DEFAULT NULL COMMENT '付款状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购入库调整表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_purchase_adjust_dtl`
--

DROP TABLE IF EXISTS `bill_purchase_adjust_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_purchase_adjust_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '入库单据ID',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `area_balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '地区结算单号',
  `supplier_amount` decimal(20,2) DEFAULT '0.00' COMMENT '厂商金额',
  `refer_amount` decimal(20,2) DEFAULT '0.00' COMMENT '中间额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购入库调整表明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_rebate`
--

DROP TABLE IF EXISTS `bill_rebate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_rebate` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `bill_status` tinyint(3) DEFAULT '0' COMMENT '单据状态(0,制单;1,确认;2已终止)',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `start_date` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '开始年月',
  `end_date` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '结束年月',
  `pay_term_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '支付条款描述',
  `asset_support_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '资产支持描述',
  `other_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '其他描述',
  `indeterminate_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '未确认描述',
  `create_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `audit_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `audit_time` datetime DEFAULT NULL COMMENT '审批时间',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bill_no` (`bill_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='返利备案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_rebate_credit`
--

DROP TABLE IF EXISTS `bill_rebate_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_rebate_credit` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '备案编号',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `credit_type` tinyint(3) DEFAULT NULL COMMENT '额度类型(0,退货额度;1,信贷额度)',
  `credit_amount` decimal(20,2) DEFAULT NULL COMMENT '金额',
  `credit_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '额度描述补充',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='返利额度信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_rebate_discount`
--

DROP TABLE IF EXISTS `bill_rebate_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_rebate_discount` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '备案编号',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `order_type` tinyint(3) DEFAULT NULL COMMENT '订货类型',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `category_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `correspond_period_discount` decimal(9,5) DEFAULT NULL COMMENT '同期折扣',
  `current_period_discount` decimal(9,5) DEFAULT NULL COMMENT '本期折扣',
  `change_discount` decimal(9,5) DEFAULT NULL COMMENT '变动折扣',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='返利进货折扣';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_rebate_dtl`
--

DROP TABLE IF EXISTS `bill_rebate_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_rebate_dtl` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '备案编号',
  `project_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '项目编号',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `rebate_term_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '返利条款编码',
  `rebate_term_desc` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '返利条款描述',
  `rebate_type` tinyint(3) DEFAULT NULL COMMENT '返利类型(0,固定金额;1,浮动金额)',
  `settlement_cycle` tinyint(3) DEFAULT NULL COMMENT '结算周期(0,年;1,半年;2,季度;3,月)',
  `settlement_basis` tinyint(3) DEFAULT NULL COMMENT '结算依据(0,含税进货额;1,不含税进货额;2,牌价额;3,含税进货额-含税退货额)',
  `settlement_ways` tinyint(3) DEFAULT NULL COMMENT '结算方式(0,抵扣货款;1,红字发票)',
  `stati_date` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '固定年月',
  `months` int(2) DEFAULT NULL COMMENT '周期结束XX月',
  `per` decimal(9,5) DEFAULT NULL COMMENT '计算比率',
  `estimate_amount` decimal(20,2) DEFAULT NULL COMMENT '预估金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='返利项目明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_rebate_project`
--

DROP TABLE IF EXISTS `bill_rebate_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_rebate_project` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '备案编号',
  `project_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '项目编号',
  `rebate_no` char(36) COLLATE utf8_bin DEFAULT NULL COMMENT '返利项目编号',
  `balance_date` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '结算年月',
  `estimate_amount` decimal(20,2) DEFAULT NULL COMMENT '预估金额',
  `receivable_amount` decimal(20,2) DEFAULT NULL COMMENT '应收金额',
  `account_amount` decimal(20,2) DEFAULT NULL COMMENT '到帐金额',
  `is_complete` tinyint(3) DEFAULT NULL COMMENT '是否完成(0,否;1,是)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rebate_no` (`rebate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='返利项目明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_rebate_term`
--

DROP TABLE IF EXISTS `bill_rebate_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_rebate_term` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '备案编号',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `project_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `project_desc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '项目描述',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin NOT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='返利限制性条款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_sale_balance`
--

DROP TABLE IF EXISTS `bill_sale_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_sale_balance` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `fas_bill_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'FAS单据类型编号',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `bill_type` int(11) DEFAULT NULL COMMENT '单据类型(1301-到货单,1333-调货出库单,1335-客残销售出库单)',
  `biz_type` int(11) DEFAULT NULL COMMENT '业务类型(0：订货 ，1：补货  ，2直接 4、跨区调货 5、差异处理)',
  `ref_bill_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号，多个已，隔开',
  `ref_bill_type` int(11) DEFAULT NULL COMMENT '相关单据类型',
  `original_bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '原单据编号',
  `status` int(11) DEFAULT NULL COMMENT '单据状态 1、已发未收 2、已收货 3、审核 5、确认',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编号',
  `buyer_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编号',
  `saler_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `send_date` date DEFAULT NULL COMMENT '发出日期',
  `receive_date` date DEFAULT NULL COMMENT '接收日期',
  `send_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地编号',
  `send_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地名称',
  `receive_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地编号',
  `receive_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地名称',
  `sku_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '明细id',
  `sku_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SKU编号',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编号',
  `category_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价(结算价格、默认原单据价格)',
  `bill_cost` decimal(12,2) DEFAULT '0.00' COMMENT '单据价格(原单据价格)',
  `actual_cost` decimal(12,2) DEFAULT NULL COMMENT '实际出库价格(费用分摊后的价格)',
  `other_deduct_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '票前返利与其他扣项分摊金额字段',
  `tax_rate` decimal(4,2) DEFAULT NULL COMMENT '税率',
  `exclusive_cost` decimal(12,2) DEFAULT '0.00' COMMENT '不含税单价',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `region_cost` decimal(12,2) DEFAULT '0.00' COMMENT '地区成本',
  `region_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副地区价 buy表为卖方sale表为买方',
  `unit_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '单位成本',
  `unit_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副单位成本 buy表为卖方sale表为买方',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `material_price` decimal(12,2) DEFAULT '0.00' COMMENT '物料价',
  `factory_price` decimal(12,2) DEFAULT '0.00' COMMENT '厂进价',
  `send_qty` int(11) DEFAULT '0' COMMENT '发出数量',
  `receive_qty` int(11) DEFAULT '0' COMMENT '接受数量',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算单类型',
  `balance_status` tinyint(3) DEFAULT NULL COMMENT '结算单状态',
  `is_split` tinyint(3) DEFAULT NULL COMMENT '是否拆分单据',
  `path_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算路径编码',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位编号',
  `order_unit_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市编号',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市名称',
  `order_unit_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位编号',
  `order_unit_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位名称',
  `organ_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市编号',
  `organ_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区编码',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区名称',
  `zone_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区编码',
  `zone_name_from` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区名称',
  `is_bill_invoice` tinyint(3) DEFAULT NULL COMMENT '是否已开票(0:已生成 1:未生成)',
  `invoice_apply_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请编号',
  `invoice_apply_date` date DEFAULT NULL COMMENT '开票申请日期',
  `years` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份(指上市的年份,下拉框选择,值: 2006~2026,默认当年)',
  `season` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '季节(下拉框选择,A:春 B:夏 C:秋 D:冬)',
  `orderfrom` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货形式(下拉框选择,值: 1:自产 2:外购 3:地区自购)',
  `gender` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别(下拉框选择,值: 男, 女, 童, 无性别)',
  `tag_price` decimal(10,2) DEFAULT '0.00' COMMENT '牌价',
  `tag_price_nation` decimal(12,2) DEFAULT '0.00' COMMENT '全国统一牌价',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `cost_checked` tinyint(3) DEFAULT '0' COMMENT '异常价格更新 (0:未更新 1:正常，2异常)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `claim_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '索赔编号',
  `return_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '退货编号',
  `bill_rebate_amount` decimal(12,2) DEFAULT '0.00' COMMENT '返利金额',
  `bill_rebate_discount` decimal(12,2) DEFAULT '0.00' COMMENT '返利后折扣',
  `unfrozen_date` date DEFAULT NULL COMMENT '解冻日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`bill_no`,`item_no`) USING BTREE,
  KEY `IDX_1` (`bill_type`,`bill_no`,`item_no`),
  KEY `uk_bill_no` (`bill_no`),
  KEY `uk_saler_no` (`saler_no`,`buyer_no`,`send_date`,`bill_type`,`bill_no`),
  KEY `uk_buyer_no` (`buyer_no`,`saler_no`,`send_date`,`bill_type`,`bill_no`),
  KEY `idx_original_bill_no` (`original_bill_no`,`bill_type`,`bill_no`),
  KEY `idx_send_date` (`send_date`,`saler_no`,`buyer_no`,`bill_type`,`bill_no`),
  KEY `idx_brand_no` (`brand_no`,`bill_type`,`bill_no`),
  KEY `IDX_bill_sale_balance_update_time` (`update_time`) USING BTREE,
  KEY `idx_balance_no` (`balance_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='出库类单据池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_sale_balance_his`
--

DROP TABLE IF EXISTS `bill_sale_balance_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_sale_balance_his` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `fas_bill_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'FAS单据类型编号',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `bill_type` int(11) DEFAULT NULL COMMENT '单据类型(1301-到货单,1333-调货出库单,1335-客残销售出库单)',
  `biz_type` int(11) DEFAULT NULL COMMENT '业务类型(0：订货 ，1：补货  ，2直接 4、跨区调货 5、差异处理)',
  `ref_bill_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号，多个已，隔开',
  `ref_bill_type` int(11) DEFAULT NULL COMMENT '相关单据类型',
  `original_bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '原单据编号',
  `status` int(11) DEFAULT NULL COMMENT '单据状态 1、已发未收 2、已收货 3、审核 5、确认',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编号',
  `buyer_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编号',
  `saler_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `send_date` date DEFAULT NULL COMMENT '发出日期',
  `receive_date` date DEFAULT NULL COMMENT '接收日期',
  `send_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地编号',
  `send_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '发出地名称',
  `receive_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地编号',
  `receive_store_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地名称',
  `sku_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '明细id',
  `sku_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'SKU编号',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编号',
  `category_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价(结算价格、默认原单据价格)',
  `bill_cost` decimal(12,2) DEFAULT '0.00' COMMENT '单据价格(原单据价格)',
  `actual_cost` decimal(12,2) DEFAULT NULL COMMENT '实际出库价格(费用分摊后的价格)',
  `other_deduct_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '票前返利与其他扣项分摊金额字段',
  `tax_rate` decimal(4,2) DEFAULT NULL COMMENT '税率',
  `exclusive_cost` decimal(12,2) DEFAULT '0.00' COMMENT '不含税单价',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `region_cost` decimal(12,2) DEFAULT '0.00' COMMENT '地区成本',
  `region_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副地区价 buy表为卖方sale表为买方',
  `unit_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '单位成本',
  `unit_cost_second` decimal(12,2) DEFAULT '0.00' COMMENT '副单位成本 buy表为卖方sale表为买方',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `material_price` decimal(12,2) DEFAULT '0.00' COMMENT '物料价',
  `factory_price` decimal(12,2) DEFAULT '0.00' COMMENT '厂进价',
  `send_qty` int(11) DEFAULT '0' COMMENT '发出数量',
  `receive_qty` int(11) DEFAULT '0' COMMENT '接受数量',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算单类型',
  `balance_status` tinyint(3) DEFAULT NULL COMMENT '结算单状态',
  `is_split` tinyint(3) DEFAULT NULL COMMENT '是否拆分单据',
  `path_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算路径编码',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位编号',
  `order_unit_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方订货单位名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市编号',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方管理城市名称',
  `order_unit_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位编号',
  `order_unit_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方订货单位名称',
  `organ_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市编号',
  `organ_name_from` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方管理城市名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区编码',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '收货方所属大区名称',
  `zone_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区编码',
  `zone_name_from` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方所属大区名称',
  `is_bill_invoice` tinyint(3) DEFAULT NULL COMMENT '是否已开票(0:已生成 1:未生成)',
  `invoice_apply_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请编号',
  `invoice_apply_date` date DEFAULT NULL COMMENT '开票申请日期',
  `years` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份(指上市的年份,下拉框选择,值: 2006~2026,默认当年)',
  `season` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '季节(下拉框选择,A:春 B:夏 C:秋 D:冬)',
  `orderfrom` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货形式(下拉框选择,值: 1:自产 2:外购 3:地区自购)',
  `gender` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别(下拉框选择,值: 男, 女, 童, 无性别)',
  `tag_price` decimal(10,2) DEFAULT '0.00' COMMENT '牌价',
  `tag_price_nation` decimal(12,2) DEFAULT '0.00' COMMENT '全国统一牌价',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `cost_checked` tinyint(3) DEFAULT '0' COMMENT '异常价格更新 (0:未更新 1:正常，2异常)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `claim_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '索赔编号',
  `return_no` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '退货编号',
  `bill_rebate_amount` decimal(12,2) DEFAULT '0.00' COMMENT '返利金额',
  `bill_rebate_discount` decimal(12,2) DEFAULT '0.00' COMMENT '返利后折扣',
  `unfrozen_date` date DEFAULT NULL COMMENT '解冻日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`bill_no`,`item_no`) USING BTREE,
  KEY `IDX_1` (`bill_type`,`bill_no`,`item_no`),
  KEY `uk_bill_no` (`bill_no`),
  KEY `uk_saler_no` (`saler_no`,`buyer_no`,`send_date`,`bill_type`,`bill_no`),
  KEY `uk_buyer_no` (`buyer_no`,`saler_no`,`send_date`,`bill_type`,`bill_no`),
  KEY `idx_original_bill_no` (`original_bill_no`,`bill_type`,`bill_no`),
  KEY `idx_send_date` (`send_date`,`saler_no`,`buyer_no`,`bill_type`,`bill_no`),
  KEY `idx_brand_no` (`brand_no`,`bill_type`,`bill_no`),
  KEY `IDX_bill_sale_balance_update_time` (`update_time`) USING BTREE,
  KEY `idx_balance_no` (`balance_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='出库类单据池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_sale_out`
--

DROP TABLE IF EXISTS `bill_sale_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_sale_out` (
  `id` char(32) CHARACTER SET utf8 NOT NULL COMMENT 'UUID',
  `bill_no` char(30) CHARACTER SET utf8 NOT NULL COMMENT '单据编号',
  `grade_type` tinyint(3) DEFAULT NULL COMMENT '0=原残 1=客残',
  `biz_type` int(11) NOT NULL COMMENT 'bill_type=1335	biz_type=2：地区承担客残销售单，3：总部承担客残销售单,7:样品销售单 8:索赔单 10:盘差处理单 13:其它出库单(物料) 14:其它出库单(辅料) 21:批发销售,22:批发退货23:团购销售,24:团购退货25:跨结算公司样品销售单 50-正常销售 51-跨店销售 52-商场团购 53-公司团购 54-员工内购 55-专柜团购bill_type=1374 退货入库单',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `ref_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号',
  `ref_bill_type` int(11) DEFAULT NULL COMMENT '相关单据类型',
  `notice_bill_no` char(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '通知单编号',
  `notice_bill_type` int(11) DEFAULT NULL COMMENT '通知单类型',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态 (0-制单,1-出货,2-收货,98-删除,99-作废,100-完结)',
  `price_mode` tinyint(3) DEFAULT NULL COMMENT '取价方式(0牌价,1地区价)',
  `sys_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '制单机构',
  `sale_type` tinyint(3) NOT NULL COMMENT '销售类型(1:门店.2:仓库)',
  `customer_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '客户名称',
  `order_unit_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货单位',
  `company_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '结算公司编码',
  `order_unit_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货单位名称',
  `sale_store_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售机构,调出机构',
  `sale_shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售店铺,调出店铺',
  `sale_store_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售机构名称（如果是店铺则是店铺名称）',
  `send_store_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '发货方机构编码or质检仓',
  `send_store_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '发货方名称',
  `total_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '销售总价',
  `delivery_type` tinyint(3) DEFAULT NULL COMMENT '交货方式(0:送货,1:自提)',
  `sale_date` date NOT NULL COMMENT '销售日期',
  `merchandiser` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '业务员',
  `create_user` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `auditor` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '分库字段：本部+大区',
  `send_detail_total` int(11) DEFAULT NULL COMMENT '明细数量总量',
  `supplier_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商名称',
  `zone_yyyymm` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '分库字段：本部+大区',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `reason` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '原因',
  `item_order_type` int(10) DEFAULT NULL COMMENT '订货类型',
  `discount_type` int(10) DEFAULT NULL COMMENT '折扣类型',
  `adjustment_type` tinyint(3) DEFAULT NULL COMMENT '调整类型:1.数据出错,2:实物丢失,3.索赔-补货,4.索赔-抵账,5.索赔-不处理,6.溢收-返货,7.溢收-抵账,8.溢收-不处理',
  `sum_sale_price` decimal(12,2) DEFAULT '0.00' COMMENT '销售价总额',
  `sum_tag_price` decimal(12,2) DEFAULT '0.00' COMMENT '牌价总额',
  `rebate_price` decimal(12,2) DEFAULT '0.00' COMMENT '返利额',
  `discount` decimal(12,4) DEFAULT NULL COMMENT '最低折扣率',
  `materiel_price` decimal(12,2) DEFAULT '0.00' COMMENT '物料金额',
  `other_price` decimal(12,2) DEFAULT '0.00' COMMENT '其他费用',
  `claim_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '索赔编码',
  `customer_available` decimal(12,2) DEFAULT '0.00' COMMENT '客户可用余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bill_no` (`bill_no`) USING BTREE,
  KEY `ref_bill_no` (`ref_bill_no`,`order_unit_no`,`send_store_no`) USING BTREE,
  KEY `idx_shop_date_ref` (`sale_shop_no`,`sale_date`,`ref_bill_no`,`bill_no`),
  KEY `biz_type` (`biz_type`,`ref_bill_no`,`sale_shop_no`,`sale_date`),
  KEY `IDX_bill_sale_out_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售出库单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_sale_out_dtl`
--

DROP TABLE IF EXISTS `bill_sale_out_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_sale_out_dtl` (
  `id` char(32) CHARACTER SET utf8 NOT NULL COMMENT '主键(UUID)',
  `bill_no` char(30) CHARACTER SET utf8 NOT NULL COMMENT '单据编号',
  `seq_id` int(11) DEFAULT NULL COMMENT '明细序号',
  `order_unit_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货单位(pos同步销售出入库单需要同步)',
  `order_unit_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '订货单位名称(pos同步销售出入库单需要同步)',
  `sku_no` char(32) COLLATE utf8_bin NOT NULL COMMENT 'sku编码',
  `item_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '商品内码',
  `barcode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品条码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `color_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '颜色编码',
  `color_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '颜色名称',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价',
  `brand_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌名称',
  `category_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '类别编码',
  `size_no` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '尺寸编号',
  `size_kind` char(2) CHARACTER SET utf8 NOT NULL COMMENT '尺寸分类',
  `discount` decimal(12,4) DEFAULT NULL COMMENT '折扣率',
  `ask_qty` int(11) NOT NULL DEFAULT '0' COMMENT '申请数量',
  `send_out_qty` int(11) NOT NULL DEFAULT '0' COMMENT '出库数量',
  `quote_price` decimal(12,2) DEFAULT '0.00' COMMENT '牌价',
  `unit_price` decimal(12,2) DEFAULT '0.00' COMMENT '加权平均成本',
  `region_price` decimal(12,2) DEFAULT '0.00' COMMENT '地区价',
  `headquarter_price` decimal(12,2) DEFAULT '0.00' COMMENT '总部价',
  `total_cost` decimal(12,2) DEFAULT NULL COMMENT '收入总金额',
  `box_no` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '箱号',
  `sale_price` decimal(12,2) DEFAULT '0.00' COMMENT '销售价',
  `available_flag` tinyint(3) DEFAULT NULL COMMENT '商品标识：0-正品 1-次品（POS端入库使用）',
  `handle_type` tinyint(3) DEFAULT NULL COMMENT '处理结果0总部承担，1地区承担',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '分库字段：本部+大区',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `receive_land` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货地',
  `zone_yyyymm` char(8) CHARACTER SET utf8 DEFAULT NULL COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`),
  KEY `idx_item_sku` (`bill_no`,`item_no`,`size_no`,`order_unit_no`) USING BTREE,
  KEY `bill_no` (`bill_no`,`item_no`,`sku_no`) USING BTREE,
  KEY `IDX_bill_sale_out_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售出库表体';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_sales_sum`
--

DROP TABLE IF EXISTS `bill_sales_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_sales_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `region_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '片区编码',
  `region_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '片区名称',
  `province_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政省编码',
  `province_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '行政省名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域名称',
  `major` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '主营品类(门店必填, 1:男鞋 2:女鞋 3:童鞋 4:综合)',
  `multi` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺细类 单品多品(门店必填,C:多品店 D:单品店)',
  `sale_type` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售类别(1:零售 2:批发)',
  `biz_type` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '业务类型(1-调货、2-员购、3-团购、4-批发、5-门店、6-其他)',
  `category_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '经营类型（男鞋，女鞋，综合）',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌中文名称',
  `category` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌类别(D:代理品牌，S:自有品牌)',
  `belonger` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌归属(X:鞋，S:体)',
  `brand_flag` tinyint(3) DEFAULT '0' COMMENT '是否主营品牌(1是，0否)',
  `year` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `sale_month` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '销售月份',
  `bill_month` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '开票月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `billing_date` date DEFAULT NULL COMMENT '开票日期',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `bsgroups_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `sale_mode` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺大类 批发零售(门店必填,1:零售；2:批发)',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT 'A0' COMMENT '店铺小类 (销售类型(门店必填, A0:商场店中店 A1:商场独立店 A2:商场\n\n特卖店 A3:商场寄卖店 BJ:独立街边店 BM:MALL B3:独立寄卖店, D0:批发加盟店 D1:批发团购店 D2:批发员购店 D3:批发调货店)',
  `shop_classify` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺类别',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '店铺状态( 0:冻结,1:正常,9:撤销)',
  `open_date` date DEFAULT NULL COMMENT '成立日期(店铺正式营业的日期)',
  `employe_amount` int(8) DEFAULT NULL COMMENT '店员配备数(门店必填,指标准的店员配备数量)',
  `area` decimal(10,2) DEFAULT '0.00' COMMENT '卖场面积',
  `area_left` decimal(10,2) DEFAULT '0.00' COMMENT '仓库面积',
  `area_total` decimal(10,2) DEFAULT '0.00' COMMENT '总面积',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `shop_level` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '门店级别( A、B、C、D、E)',
  `lma_period_salesnum` int(11) DEFAULT '0' COMMENT '上月结算期后销售量',
  `lma_period_salesamount` decimal(20,2) DEFAULT '0.00' COMMENT '上月结算期后销售收入',
  `lma_period_tagamount` decimal(20,2) DEFAULT '0.00' COMMENT '上月结算期后牌价额',
  `lma_period_salescost` decimal(20,2) DEFAULT '0.00' COMMENT '上月结算期后销售成本',
  `lma_period_salesdeductions` decimal(20,2) DEFAULT '0.00' COMMENT '上月结算期后商场扣费',
  `lma_period_balanceamount` decimal(20,2) DEFAULT '0.00' COMMENT '上月结算期后结算收入',
  `tmi_period_salesnum` int(11) DEFAULT '0' COMMENT '本月结算期内销售数量',
  `tmi_period_salesamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期内销售收入',
  `tmi_period_tagamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期内牌价额',
  `tmi_period_salescost` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期内销售成本',
  `tmi_period_salesdeductions` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期内商场扣费',
  `tmi_period_balanceamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期内结算收入',
  `bi_period_salesnum` int(11) DEFAULT '0' COMMENT '结算期内合计销售数量',
  `bi_period_salesamount` decimal(20,2) DEFAULT '0.00' COMMENT '结算期内合计销售收入',
  `bi_period_tagamount` decimal(20,2) DEFAULT '0.00' COMMENT '结算期内合计牌价额',
  `bi_period_salescost` decimal(20,2) DEFAULT '0.00' COMMENT '结算期内合计销售成本',
  `bi_period_salesdeductions` decimal(20,2) DEFAULT '0.00' COMMENT '结算期内合计商场扣费',
  `bi_period_balanceamount` decimal(20,2) DEFAULT '0.00' COMMENT '结算期内合计结算收入',
  `bill_qty` int(11) DEFAULT NULL COMMENT '开票数量',
  `bill_amount` decimal(20,2) DEFAULT '0.00' COMMENT '实际开票金额',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `send_amount` decimal(12,2) DEFAULT NULL COMMENT '金额',
  `invoice_apply_date` date DEFAULT NULL COMMENT '申请开票日期',
  `saler_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码(收票方)-买方',
  `buyer_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称-开票单位',
  `tma_period_salesnum` int(11) DEFAULT '0' COMMENT '本月结算期后销售量',
  `tma_period_salesamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期后销售收入',
  `tma_period_tagamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期后合计牌价额',
  `tma_period_salescost` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期后销售成本',
  `tma_period_salesdeductions` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期后商场扣费',
  `tma_period_balanceamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期后结算收入',
  `tm_salesnum` int(11) DEFAULT '0' COMMENT '本月合计销售量',
  `tm_salesamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月合计销售收入',
  `tm_tagamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月合计牌价额',
  `tm_salescost` decimal(20,2) DEFAULT '0.00' COMMENT '本月合计销售成本',
  `tm_salesdeductions` decimal(20,2) DEFAULT '0.00' COMMENT '本月合计商场扣费',
  `tm_balanceamount` decimal(20,2) DEFAULT '0.00' COMMENT '本月合计结算收入',
  `sum_changebalanceamount` decimal(20,2) DEFAULT '0.00' COMMENT '调整前期扣费',
  `sum_salesdeductions` decimal(20,2) DEFAULT '0.00' COMMENT '扣费合计',
  `contract_rate` decimal(8,4) DEFAULT NULL COMMENT '合同扣率',
  `actual_rate` decimal(8,4) DEFAULT NULL COMMENT '实际扣率',
  `tm_mall_deductions` decimal(20,2) DEFAULT '0.00' COMMENT '本月商场扣费合计',
  `tm_salesamount_discount` decimal(20,2) DEFAULT NULL COMMENT '本月商场正价折扣',
  `tm_salesamount_prodiscount` decimal(20,2) DEFAULT NULL COMMENT '本月商场促销折扣',
  `tm_billbef_deducamount` decimal(20,2) DEFAULT NULL COMMENT '本月商场票前费用',
  `balance_diff_amount` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算差异',
  `balance_salesamount` decimal(12,2) DEFAULT '0.00' COMMENT '本月结算收入',
  `non_tax_salesamount` decimal(12,2) DEFAULT '0.00' COMMENT '本月无税收入',
  `tax_cost` decimal(12,2) DEFAULT '0.00' COMMENT '本月含税成本',
  `no_tax_costs` decimal(12,2) DEFAULT '0.00' COMMENT '本月无税成本',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `tm_nobilling_sumamount` decimal(12,2) DEFAULT '0.00' COMMENT '本月累计未开票',
  `tag_price_amount` decimal(20,2) DEFAULT NULL COMMENT '本月合计销售牌价',
  `no_billing_amount` decimal(20,2) DEFAULT '0.00' COMMENT '未开票金额',
  `balance_qty` int(11) DEFAULT '0' COMMENT '实物库存（正品库存量）',
  `balance_qty_amount` decimal(20,2) DEFAULT '0.00' COMMENT '库存金额',
  `channel_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售渠道编码',
  `channel_name` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT '销售渠道名称',
  `organ_level` int(11) DEFAULT NULL COMMENT '组织级别,1 管理城市,2 经营城市',
  `mall_deduct_amount` decimal(20,2) DEFAULT '0.00' COMMENT '扣费金额',
  `billing_amount` decimal(20,2) DEFAULT '0.00' COMMENT '开票金额',
  `str_desc` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `str_remark` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `num_desc` decimal(20,2) DEFAULT '0.00' COMMENT '金额描述',
  `num_remark` decimal(20,2) DEFAULT '0.00' COMMENT '金额备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_salessum` (`company_no`,`zone_no`,`organ_no`,`bsgroups_no`,`region_no`) USING BTREE,
  KEY `IDX_bill_sales_sum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance`
--

DROP TABLE IF EXISTS `bill_shop_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `balance_no` char(20) COLLATE utf8_bin NOT NULL COMMENT '结算单据编号',
  `bill_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '单据名称',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `balance_type` tinyint(3) unsigned DEFAULT NULL COMMENT '结算单类型(1-正式，2-预估)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '单据状态(1-制单、2-确认、3-作废、4、已开票)',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `bsgroups_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团名称',
  `region_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '片区编码',
  `region_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '片区名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT 'A0' COMMENT '(销售类型(门店必填, A0:商场店中店 A1:商场独立店 A2:商场特卖店 A3:商场寄卖店 BJ:独立街边店 BM:MALL B3:独立寄卖店, D0:批发加盟店 D1:批发团购店 D2:批发员购店 D3:批发调货店)',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `brand_no` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(250) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌中文名称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `billing_date` date DEFAULT NULL COMMENT '开票日期',
  `print_count` int(11) DEFAULT '0' COMMENT '打印次数',
  `contract_rate` decimal(20,4) DEFAULT NULL COMMENT '合同扣率',
  `actual_rate` decimal(20,4) DEFAULT NULL COMMENT '实际扣率',
  `mall_number_amount` decimal(20,4) DEFAULT NULL COMMENT '商场报数',
  `system_sales_amount` decimal(20,4) DEFAULT NULL COMMENT '系统收入',
  `sales_diffamount` decimal(12,4) DEFAULT NULL COMMENT '报数差异 报数差异',
  `mall_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '扣费总额',
  `billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '开票金额',
  `mall_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '商场开票金额',
  `system_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统开票金额',
  `no_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '未开票金额',
  `expect_cash_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '预收款金额合计',
  `balance_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '票前费用扣款金额合计',
  `balance_diff_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '结算差异总额合计 ',
  `other_total_amount` decimal(20,4) DEFAULT NULL COMMENT '其他合计',
  `difference_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '收款差异',
  `estimate_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '预估差异',
  `payment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '回款金额',
  `non_payment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '未回款金额',
  `source_balance_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '源结算单号-预估转正式赋值',
  `conprice_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '合同正价扣费',
  `prom_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '促销扣费',
  `prom_plusbuckle_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '促销加扣',
  `adjust_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '票前费用调整金额',
  `adjust_diff_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '结算差异调整金额',
  `balance_diff_type` tinyint(3) unsigned DEFAULT '1' COMMENT '结算差异方式设置(1-按明细、2-按促销活动、3-按销售)',
  `balance_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '结算描述',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `invoice_apply_no` varchar(25) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请单号',
  `invoice_register_no` varchar(25) COLLATE utf8_bin DEFAULT NULL COMMENT '发票登记申请单号',
  `invoice_no` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_apply_date` date DEFAULT NULL COMMENT '申请开票日期',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `other_deduct` decimal(20,4) DEFAULT NULL COMMENT '其它扣费',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `prepayment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '预收款金额',
  `used_prepayment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '已使用金额(冲销)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_shopbalance` (`company_no`,`zone_no`,`organ_no`,`bsgroups_no`,`region_no`,`mall_no`,`balance_no`),
  KEY `ux_sale_sum` (`shop_no`,`balance_start_date`,`balance_end_date`,`balance_type`,`create_time`) USING BTREE,
  KEY `idx_balance_no` (`balance_no`) USING BTREE,
  KEY `IDX_bill_shop_balance_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_account`
--

DROP TABLE IF EXISTS `bill_shop_balance_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '收款单号',
  `advance_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '预收单号(主要是批发)',
  `balance_no` char(25) COLLATE utf8_bin NOT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '金额',
  `proceeds_date` date DEFAULT NULL COMMENT '收款日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_account_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算收款表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_advance`
--

DROP TABLE IF EXISTS `bill_shop_balance_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `balance_no` char(25) COLLATE utf8_bin NOT NULL COMMENT '结算单据编号',
  `advance_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '预收单号编码',
  `advance_date` date DEFAULT NULL COMMENT '预收日期',
  `advance_amount` decimal(20,2) DEFAULT '0.00' COMMENT '预收金额',
  `advance_balance` decimal(10,2) DEFAULT NULL COMMENT '预收款余额',
  `order_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `customer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码',
  `wash_amount` decimal(20,2) DEFAULT '0.00' COMMENT '冲销金额',
  `wash_date` date DEFAULT NULL COMMENT '冲销日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_advance_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算商场预收款表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_back`
--

DROP TABLE IF EXISTS `bill_shop_balance_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `diff_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '差异编号',
  `root_diff_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '初始差异id',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `back_date` date DEFAULT NULL COMMENT '回款日',
  `back_amount` decimal(12,2) DEFAULT '0.00' COMMENT '回款金额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_back_update_time` (`update_time`) USING BTREE,
  KEY `IDX_root_diff_id` (`root_diff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算差异回款列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_brand`
--

DROP TABLE IF EXISTS `bill_shop_balance_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_brand` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌中文名称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '费用所属期间-会计期间结算月',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日',
  `deduct_diff_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '系统扣费',
  `report_diff_amount` decimal(12,4) DEFAULT NULL COMMENT '报数差异',
  `mall_number` decimal(20,4) DEFAULT NULL COMMENT '商场报数',
  `sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统收入',
  `sales_diffamount` decimal(12,4) DEFAULT NULL COMMENT '差异金额',
  `diff_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '扣费差异',
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '原因',
  `diff_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '差异原因',
  `actual_amount` decimal(20,4) DEFAULT NULL COMMENT '实际扣费金额',
  `deduct_allamount` decimal(20,4) DEFAULT '0.0000' COMMENT '扣费总额',
  `billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '开票金额',
  `mall_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '商场开票金额',
  `system_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统开票金额',
  `balance_diff_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '结算差异',
  `balance_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '票前费用',
  `prepayment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '预收款金额',
  `used_prepayment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '已使用金额(冲销)',
  `sys_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统差异额',
  `change_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '调整金额',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '单据状态(1-未确认、2-已确认、3-已开票)',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_brand_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算按品牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_cate_sum`
--

DROP TABLE IF EXISTS `bill_shop_balance_cate_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_cate_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌中文名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `sale_qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `sale_amount` decimal(20,4) DEFAULT NULL COMMENT '销售金额',
  `billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '开票金额',
  `prepayment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '预收款金额',
  `used_prepayment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '已使用金额(冲销)',
  `system_deduct_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '系统扣费',
  `balance_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '票前费用',
  `balance_diff_amount` decimal(12,4) DEFAULT NULL COMMENT '结算差异',
  `deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '扣费总额',
  `diff_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '扣费差异',
  `sys_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统差异额',
  `change_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '调整金额',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码(开票方)-卖方',
  `saler_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码(收票方)-买方',
  `buyer_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `mall_number_amount` decimal(20,4) DEFAULT NULL COMMENT '商场报数',
  `sales_diffamount` decimal(20,4) DEFAULT NULL COMMENT '报数差异',
  `expense_operate_amount` decimal(20,4) DEFAULT NULL COMMENT '场地经营费用金额',
  PRIMARY KEY (`id`),
  KEY `idx_balance_no` (`balance_no`,`shop_no`,`brand_no`,`category_no`) USING BTREE,
  KEY `IDX_bill_shop_balance_cate_sum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算期大类汇总数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_code_sum`
--

DROP TABLE IF EXISTS `bill_shop_balance_code_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_code_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算码',
  `sale_amount` decimal(20,4) DEFAULT NULL COMMENT '销售金额收入',
  `discount` decimal(10,4) DEFAULT NULL COMMENT '扣率,如17.00代表17.00%',
  `discount_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率名称',
  `deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '扣费',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算期按商场结算码汇总数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_daysale_sum`
--

DROP TABLE IF EXISTS `bill_shop_balance_daysale_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_daysale_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `out_date` date DEFAULT NULL COMMENT '销售日期',
  `sale_amount` decimal(20,4) DEFAULT NULL COMMENT '销售总金额',
  `pay_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式代号',
  `pay_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式名称',
  `payway_num` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式编号,卡号、券号、结算号',
  `amount` decimal(20,4) DEFAULT NULL COMMENT '金额',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_daysale_sum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算每日销售汇总数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_deduct`
--

DROP TABLE IF EXISTS `bill_shop_balance_deduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_deduct` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `bsgroups_name` char(120) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `brand_no` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` char(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌编码',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '费用所属期间-会计期间结算月',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `nc_period` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT 'NC月份',
  `cost_type` tinyint(3) DEFAULT NULL COMMENT '费用性质(1-合同内,2-合同外)',
  `cost_deduct_type` tinyint(3) DEFAULT NULL COMMENT '费用扣取方式(1-票前,2-票后)',
  `cost_pay_type` tinyint(3) DEFAULT NULL COMMENT '费用交款方式(1-帐扣,2-现金)',
  `invoice_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '发票金额',
  `account_deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '账扣金额',
  `cost_cate_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '费用类别编码',
  `cost_cate_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '费用类别名称',
  `deduction_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商场扣费编码',
  `deduction_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商场扣费名称',
  `bill_date` date DEFAULT NULL COMMENT '业务单据日期',
  `deduct_date` date DEFAULT NULL COMMENT '扣费日期',
  `deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统扣费金额',
  `actual_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '实际金额',
  `diff_amount` decimal(20,4) DEFAULT NULL COMMENT '扣费差异金额=系统扣费金额-实际金额',
  `base_pay_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  `base_other` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '其他',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '费率',
  `rate_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '费率金额',
  `balance_rate` decimal(8,4) DEFAULT NULL COMMENT '补差费率',
  `balance_rate_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '补差金额',
  `tax_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '税率',
  `tax_included` decimal(20,4) DEFAULT '0.0000' COMMENT '含税',
  `no_tax_included` decimal(20,4) DEFAULT '0.0000' COMMENT '不含税',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '税额',
  `diff_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '差异原因',
  `mark_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '唯一标示，历史发生的记录',
  `par_balance_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '上期结算编号，滚动add',
  `balance_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算人员',
  `balance_status` tinyint(3) DEFAULT '1' COMMENT '结算状态(1-未结算、2-已结算、3-作废、4-已开票)',
  `process_status` tinyint(3) DEFAULT '1' COMMENT '处理状态(1-未完成、2-已完成)',
  `deduct_type` tinyint(3) DEFAULT NULL COMMENT '费用类型(1-固定额度,2-扣率计算额度)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `generate_type` tinyint(3) DEFAULT '0' COMMENT '生成方式（0：系统自动生成，1：在界面上新增）',
  `accounts_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '会计科目编码',
  `rate_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '来源  零星表ID',
  `rate_type` tinyint(3) DEFAULT NULL COMMENT '费用标示(1-场地,2-零星费用)',
  `mall_deduction_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商场扣费名称',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_deduct_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算扣费表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_diff`
--

DROP TABLE IF EXISTS `bill_shop_balance_diff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_diff` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `zone_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `brand_no` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '品牌中文名称',
  `diff_type_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '差异类型',
  `diff_type_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '差异类型',
  `diff_date` date DEFAULT NULL COMMENT '差异结算日',
  `balance_date` date DEFAULT NULL COMMENT '结算日',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '费用所属期间-会计期间结算月',
  `bill_date` date DEFAULT NULL COMMENT '业务单据日期',
  `pro_no` varchar(350) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动编号',
  `pro_name` varchar(350) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动名称',
  `pro_start_date` date DEFAULT NULL COMMENT '活动起始日',
  `pro_end_date` date DEFAULT NULL COMMENT '活动终止日',
  `discount` decimal(10,4) DEFAULT '0.0000' COMMENT '扣率,如0.17',
  `deduct_diff_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '系统扣费',
  `mall_number` decimal(20,4) DEFAULT NULL COMMENT '商场报数',
  `sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统收入',
  `sales_diffamount` decimal(12,4) DEFAULT NULL COMMENT '差异金额',
  `report_diff_amount` decimal(12,4) DEFAULT NULL COMMENT '报数差异',
  `diff_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '扣费差异',
  `diff_reason` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `diff_balance` decimal(20,4) DEFAULT NULL COMMENT '差异余额',
  `pre_diff_balance` decimal(10,4) DEFAULT NULL COMMENT '上期差异余额',
  `diff_back_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '差异回款',
  `balance_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '本次结算金额',
  `reason` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `change_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '调整金额',
  `change_date` date DEFAULT NULL COMMENT '调整日期',
  `change_reason` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0' COMMENT '状态(0 = 未完成 1 = 完成)',
  `mark_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '唯一标示，历史发生的记录',
  `par_balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '上期结算编号，滚动add',
  `root_diff_id` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '初始差异id',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `generate_type` tinyint(3) DEFAULT '0' COMMENT '生成方式（0：系统自动生成，1：在界面上新增）',
  `discount_code` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算码',
  `balance_diff_amount` decimal(12,4) DEFAULT '0.0000' COMMENT '结算差异',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_diff_update_time` (`update_time`) USING BTREE,
  KEY `IDX_root_diff_id` (`root_diff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算结算差异表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_dtl`
--

DROP TABLE IF EXISTS `bill_shop_balance_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_dtl` (
  `id` char(32) NOT NULL COMMENT '主键ID,uuid生成',
  `balance_no` char(25) NOT NULL COMMENT '结算单据编号',
  `balance_dtl_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '结算明细编号',
  `order_no` char(18) DEFAULT NULL COMMENT '订单号',
  `sku_no` char(32) DEFAULT NULL COMMENT '商品SKU',
  `item_no` char(18) DEFAULT NULL COMMENT '商品内码',
  `size_no` varchar(10) NOT NULL COMMENT '商品尺码',
  `item_code` varchar(30) DEFAULT NULL COMMENT '商品编号',
  `category_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `item_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) DEFAULT NULL COMMENT '所属品牌',
  `item_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '商品类型,0-正常 1-赠品 促销标识',
  `tag_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品牌价',
  `sale_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品现价',
  `discount_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品折扣价',
  `settle_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品结算价',
  `reduce_cost` decimal(12,2) DEFAULT '0.00' COMMENT '减价,单价减价',
  `qty` int(11) DEFAULT '0' COMMENT '商品数量',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '商品总金额-销售收入,(结算价-减价)*数量',
  `pref_cost` decimal(12,2) DEFAULT '0.00' COMMENT '促销优惠单价',
  `pro_no` varchar(36) DEFAULT NULL COMMENT '促销活动编号',
  `pro_name` varchar(50) DEFAULT NULL COMMENT '促销活动名称',
  `discount` decimal(10,4) DEFAULT '0.0000' COMMENT '扣率,如0.17',
  `vip_discount` decimal(10,4) DEFAULT NULL COMMENT '会员折数',
  `base_score` int(11) NOT NULL DEFAULT '0' COMMENT '基本积分',
  `pro_score` int(11) NOT NULL DEFAULT '0' COMMENT '整单分摊积分',
  `affect_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '是否影响销售,0-正常 1-不可销售 默认为0',
  `item_discount` decimal(10,4) DEFAULT NULL COMMENT '商品折数',
  `out_date` date NOT NULL COMMENT '销售日期',
  `pay_code` varchar(20) NOT NULL COMMENT '支付方式代号',
  `pay_name` varchar(50) NOT NULL COMMENT '支付方式名称',
  `card_num` varchar(50) DEFAULT NULL COMMENT '卡号(或券号)',
  `pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '支付金额',
  `assistant_no` varchar(20) NOT NULL COMMENT '营业员工号,与HR工号代码一致',
  `assistant_name` varchar(10) NOT NULL COMMENT '营业员姓名',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `zone_yyyymm` char(8) DEFAULT NULL COMMENT '大区年月',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商场门店结算明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_list`
--

DROP TABLE IF EXISTS `bill_shop_balance_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `invoicing_party` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '开票方',
  `invoice_type` tinyint(3) unsigned DEFAULT '1' COMMENT '发票类型(0 = 普通发票 1 = 增值票)',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算公司编码(开票方编码)',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系地址',
  `pay_unit` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '收票方',
  `tax_registry_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `bank_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '银行帐号',
  `invoice_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '发票号',
  `invoice_apply_time` datetime DEFAULT NULL COMMENT '申请开票日期',
  `pay_time` datetime DEFAULT NULL COMMENT '客户交票日期',
  `pre_invoice` tinyint(3) unsigned DEFAULT '1' COMMENT '是否预开票(0 = 是 1 = 否)',
  `mailing_address` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '邮寄地址',
  `delivery_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '快递日期',
  `delivery_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '快递单号',
  `express` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '快递公司',
  `receive_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '接收日期',
  `ask_date` date NOT NULL COMMENT '申请日期',
  `currency` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '币别',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `taxpayer_id` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '纳税人识别号',
  `post_pay_date` date NOT NULL COMMENT '交票日期',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `export_count` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '引出次数',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_list_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开票申请单列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_operatelog`
--

DROP TABLE IF EXISTS `bill_shop_balance_operatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_operatelog` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `balance_no` char(20) COLLATE utf8_bin NOT NULL COMMENT '结算单据编号',
  `operate_no` tinyint(3) DEFAULT NULL COMMENT '操作编码(枚举表示:1-新增、2-修改、3-删除...)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `remark_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '备注描述',
  `mall_number_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '商场报数',
  `mall_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '商场开票金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算单操作日志记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_pay_sum`
--

DROP TABLE IF EXISTS `bill_shop_balance_pay_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_pay_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin NOT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `pay_code` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '支付方式代号收款方式',
  `pay_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '支付方式名称',
  `payway_num` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式编号,卡号、券号、结算号',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '金额',
  `billing_amount` decimal(20,2) DEFAULT '0.00' COMMENT '开票金额',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_pay_sum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算期按收款方式汇总数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_pro_sum`
--

DROP TABLE IF EXISTS `bill_shop_balance_pro_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_pro_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `pro_start_date` date DEFAULT NULL COMMENT '活动起始日',
  `pro_end_date` date DEFAULT NULL COMMENT '活动终止日',
  `order_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '业务编号,订单号或退换货号',
  `pro_no` varchar(350) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动编号',
  `pro_name` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动名称',
  `sale_amount` decimal(20,4) DEFAULT NULL COMMENT '销售金额收入',
  `deduct_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '扣费',
  `billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '开票金额',
  `cost_deduct_type` tinyint(3) DEFAULT '1' COMMENT '费用扣取方式(1-票前,2-票后)',
  `cost_pay_type` tinyint(3) DEFAULT '1' COMMENT '费用交款方式(1-帐扣,2-现金)',
  `discount_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率名称',
  `discount` decimal(10,4) DEFAULT NULL COMMENT '扣率,如17.00代表17.00%',
  `discount_type` tinyint(1) DEFAULT NULL COMMENT '扣率来源方式,0-取合同扣率 1-促销活动扣率',
  `discount_source_id` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率来源编号',
  `discount_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码，如A,B',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌中文名称',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算码',
  `system_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '系统开票金额',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_pro_sum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算期按活动方式汇总数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_set`
--

DROP TABLE IF EXISTS `bill_shop_balance_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `balance_diff_type` tinyint(3) unsigned DEFAULT '1' COMMENT '结算差异方式设置(1-按明细、2-按促销活动、3-按销售)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门店结算差异生成方式配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_vip`
--

DROP TABLE IF EXISTS `bill_shop_balance_vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin NOT NULL COMMENT '结算单据编号',
  `vip_sale_amount` decimal(20,2) DEFAULT '0.00' COMMENT '商场VIP销售金额',
  `vip_discount_amount` decimal(20,2) DEFAULT '0.00' COMMENT '商场VIP折扣金额',
  `share_rule` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '分摊规则',
  `base_amount` decimal(20,2) DEFAULT '0.00' COMMENT '计算基数',
  `our_proportion` decimal(10,2) DEFAULT NULL COMMENT '我方承担比例',
  `our_amount` decimal(20,2) DEFAULT '0.00' COMMENT '我方承担金额',
  `mall_amount` decimal(20,2) DEFAULT '0.00' COMMENT '商场返利金额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_shop_balance_vip_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算商场VIP分摊表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_balance_wildsale_sum`
--

DROP TABLE IF EXISTS `bill_shop_balance_wildsale_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_balance_wildsale_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `balance_no` char(25) COLLATE utf8_bin NOT NULL COMMENT '结算单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `out_date` date NOT NULL COMMENT '销售日期',
  `sale_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡销售总金额',
  `settle_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡结算金额',
  `disc_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡VIP折扣金额',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_bill_no` (`bill_no`,`shop_no`),
  KEY `IDX_bill_shop_balance_wildsale_sum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算外卡每日结算汇总数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_shop_sale_order`
--

DROP TABLE IF EXISTS `bill_shop_sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_shop_sale_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `order_no` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `order_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '销售类型,0-正常 1-换货 2-退货 默认为0',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `biz_city_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市编号',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `region_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '片区编码',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `shop_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '店铺编码',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT 'A0' COMMENT '(销售类型(门店必填, A0:商场店中店 A1:商场独立店 A2:商场特卖店 A3:商场寄卖店 BJ:独立街边店 BM:MALL B3:独立寄卖店, D0:批发加盟店 D1:批发团购店 D2:批发员购店 D3:批发调货店)',
  `sale_date` date NOT NULL COMMENT '销售日期',
  `business_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单业务类型,0-正常销售 1-跨店销售 2-商场团购 3-公司团购 4-员购 9-其他 默认为0',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态,0-已创建 10-已挂起 11-已取消 20-已审核 30-已收银 40-待配货41-已发货 50-已提货 99-已完结',
  `assistant_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '营业员工号,与HR工号代码一致',
  `assistant_name` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '营业员姓名',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `sku_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品SKU',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品内码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码(出厂时的商品编码)',
  `size_no` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '商品尺码',
  `qty` int(11) DEFAULT '0' COMMENT '商品数量',
  `item_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型,0-正常 1-赠品 促销标识',
  `tag_price` decimal(20,2) DEFAULT '0.00' COMMENT '商品牌价',
  `sale_price` decimal(20,2) DEFAULT '0.00' COMMENT '商品现价',
  `disc_price` decimal(20,2) DEFAULT '0.00' COMMENT '商品折扣价',
  `settle_price` decimal(20,2) DEFAULT '0.00' COMMENT '商品结算价',
  `reduce_price` decimal(20,2) DEFAULT '0.00' COMMENT '减价,单价减价',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '商品总金额,(结算价-减价)*数量',
  `tag_amount` decimal(20,2) DEFAULT '0.00' COMMENT '牌价额,牌价*数量',
  `sale_amount` decimal(20,2) DEFAULT '0.00' COMMENT '现价额,现价*数量',
  `settle_amount` decimal(20,2) DEFAULT '0.00' COMMENT '结算额,结算价*数量',
  `disc_amount` decimal(20,2) DEFAULT '0.00' COMMENT '折扣额,商品折扣价*数量',
  `pref_price` decimal(20,2) DEFAULT '0.00' COMMENT '促销优惠单价,促销优惠单价',
  `pro_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动编号',
  `pro_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动名称',
  `discount` decimal(10,4) DEFAULT '0.0000' COMMENT '扣率,如0.17',
  `vip_discount` decimal(10,4) DEFAULT NULL COMMENT '会员折数',
  `base_score` int(11) NOT NULL DEFAULT '0' COMMENT '基本积分',
  `pro_score` int(11) NOT NULL DEFAULT '0' COMMENT '整单分摊积分',
  `affect_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否影响销售,0-正常 1-不可销售 默认为0',
  `item_discount` decimal(10,4) DEFAULT NULL COMMENT '商品折数',
  `is_balance` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否已结算(1-未结算，2-已结算)',
  `balance_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号码',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `mall_deduct_amount` decimal(12,2) DEFAULT NULL COMMENT '商场扣额(结算额*扣率)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_saleorder` (`company_no`,`zone_no`,`biz_city_no`,`bsgroups_no`,`region_no`,`mall_no`),
  KEY `IDX_bill_shop_sale_order_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1137847 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店销售订单数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_split`
--

DROP TABLE IF EXISTS `bill_split`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_split` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '拆分后的单据编码',
  `ref_bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '原单据编码',
  `saler_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '卖方编码',
  `buyer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '买方编码',
  `bill_flag` tinyint(3) NOT NULL COMMENT '单据标志(0：应收， 1：应付)',
  `total_qty` int(11) DEFAULT '0' COMMENT '发货总数量',
  `total_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '发货总金额(不含税)',
  `total_tax_amount` decimal(12,2) DEFAULT '0.00' COMMENT '税收总额',
  `send_out_date` date DEFAULT NULL COMMENT '发货日期',
  `recon_flag` tinyint(2) DEFAULT NULL COMMENT '对账标志',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_bill_no` (`bill_no`),
  KEY `IDX_bill_split_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='拆分的单据汇总表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_split_dtl`
--

DROP TABLE IF EXISTS `bill_split_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_split_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编码',
  `ref_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '原单据编码',
  `bill_type` int(11) NOT NULL COMMENT '单据类型,Kinds1 入库单类型:0直接、1合同、2订货、3补货、4返修入库、5退厂',
  `item_no` char(32) COLLATE utf8_bin NOT NULL COMMENT '货品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码(出厂时的商品编码)',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌编码',
  `saler_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '卖方编码',
  `buyer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '买方编码',
  `store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算地',
  `order_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `bill_flag` tinyint(3) NOT NULL COMMENT '单据标志(0：应收， 1：应付)',
  `send_out_qty` int(11) DEFAULT '0' COMMENT '发货数量',
  `send_out_date` date NOT NULL COMMENT '发货日期',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税价格',
  `tax_rate` decimal(4,2) NOT NULL COMMENT '税率',
  `exclusive_cost` decimal(12,2) DEFAULT '0.00' COMMENT '不含税价格',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编号',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `supplier_cost` decimal(12,2) DEFAULT NULL COMMENT '厂商价',
  `supplier_group_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '厂商组',
  `path_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算路径编码',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_split_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='拆分的单据明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_split_log`
--

DROP TABLE IF EXISTS `bill_split_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_split_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '原单据编码',
  `bill_type` int(11) NOT NULL COMMENT '单据类型,Kinds1 入库单类型:0直接、1合同、2订货、3补货、4返修入库、5退厂',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `send_out_date` date DEFAULT NULL COMMENT '发货时间',
  `status` tinyint(3) NOT NULL COMMENT '状态标志(0：成功， 1：失败)',
  `split_time` datetime DEFAULT NULL COMMENT '拆单时间',
  `failure_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '失败原因',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `organ_type_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  KEY `ref_bill_no` (`ref_bill_no`),
  KEY `IDX_bill_split_log_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='拆单日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_status`
--

DROP TABLE IF EXISTS `bill_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_status` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_type` int(11) DEFAULT NULL COMMENT '单据类型(0-现金存入单 1-销售订单 99-内购订单)',
  `pay_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式名称',
  `bill_no` char(25) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(3) DEFAULT '0' COMMENT '状态0-未确认 1-已确认',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  KEY `IDX_bill_status_update_time` (`update_time`) USING BTREE,
  KEY `IDX_001` (`bill_no`,`pay_name`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售订单状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌编码',
  `name` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '品牌中文名称',
  `en_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌英文名称',
  `en_short_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌英文简称',
  `opcode` char(2) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品编码特征码(用于鞋类商品编码的首位字母,必须输入且只能输入一位字\n\n符)',
  `category` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '品牌类别(D:代理品牌，S:自有品牌)',
  `belonger` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '品牌归属(X:鞋，S:体)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '品牌状态(0 = 撤消 1 = 正常)',
  `sys_no` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '00' COMMENT '所属业务单元(关联品牌部编码)',
  `search_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '检索码',
  `parent_brand_id` int(11) DEFAULT NULL COMMENT '父品牌',
  `logo_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'LOGO链接地址',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_brand_no` (`brand_no`) USING BTREE,
  KEY `IDX_brand_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2546 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='品牌信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_online`
--

DROP TABLE IF EXISTS `brand_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_online` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='上线品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brand_unit`
--

DROP TABLE IF EXISTS `brand_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `brand_unit_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌部编号',
  `code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部代号',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '品牌部状态(0 = 撤消 1 = 正常)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_brand_unit_no` (`brand_unit_no`) USING BTREE,
  KEY `IDX_brand_unit_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='品牌部表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bsgroups`
--

DROP TABLE IF EXISTS `bsgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商业集团ID',
  `bsgroups_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商业集团编码',
  `name` varchar(120) CHARACTER SET utf8 NOT NULL COMMENT '商业集团名称',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bsgroups_no` (`bsgroups_no`) USING BTREE,
  KEY `IDX_bsgroups_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23809 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商业集团信息表(Business groups)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `card_return_check`
--

DROP TABLE IF EXISTS `card_return_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card_return_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `terminal_number` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `payway_time` datetime DEFAULT NULL COMMENT '原单日期',
  `return_time` datetime DEFAULT NULL COMMENT '退换货日期',
  `return_pay_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  `return_amount` decimal(20,2) DEFAULT NULL COMMENT '退款金额',
  `sale_order_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售订单编码',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态(0已确认,1银行处理中,2退款成功)',
  `poundage` decimal(20,2) DEFAULT NULL COMMENT '手续费',
  `actual_return_time` datetime DEFAULT NULL COMMENT '实际退款日期',
  `merchants_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商户编码',
  `credit_card_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '刷卡账号',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_card_return_check_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='银行卡退款核对表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_transaction_dtl`
--

DROP TABLE IF EXISTS `cash_transaction_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_transaction_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `card_number` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '卡号',
  `deposit_cash_time` date DEFAULT NULL COMMENT '存现日期',
  `deposit_amount` decimal(12,2) DEFAULT NULL COMMENT '存现金额',
  `deposit_site` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '存现地点',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_cash_transaction_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='现金交易明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '货品分类ID',
  `category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '类别编码',
  `code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '类别外码',
  `levelid` int(11) DEFAULT NULL COMMENT '类别级别(第一级为1)',
  `opcode` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类别特征码(1位,当类别级别为1大类时，必须输入且长度必须1位)',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级类别ID',
  `path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '分类路径',
  `no_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '分类编码路径',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '类别状态(0 = 禁用 1 = 正常)',
  `search_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '检索码',
  `sys_no` varchar(10) COLLATE utf8_bin DEFAULT '00' COMMENT '所属业务单元',
  `type` tinyint(3) DEFAULT NULL COMMENT '类型(0 普通节点,1 叶子节点)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  `financial_category_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '财务大类名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cate_no` (`category_no`) USING BTREE,
  KEY `IDX_category_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='类别信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `check_toler`
--

DROP TABLE IF EXISTS `check_toler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_toler` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `supplier_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `pretax_toler_low` decimal(10,2) DEFAULT NULL COMMENT '不含税容差金额>=',
  `pretax_toler_up` decimal(10,2) DEFAULT NULL COMMENT '不含税容差金额<=',
  `aftertax_toler_low` decimal(10,2) DEFAULT NULL COMMENT '含税容差金额>=',
  `aftertax_toler_up` decimal(10,2) DEFAULT NULL COMMENT '含税容差金额<=',
  `notax_toler_low` decimal(10,2) DEFAULT NULL COMMENT '不含税*1.17与含税容差(厂商)>=',
  `notax_toler_up` decimal(10,2) DEFAULT NULL COMMENT '不含税*1.17与含税容差(厂商)<=',
  `effective_date` datetime NOT NULL COMMENT '生效日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_company_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='对账容差表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clause`
--

DROP TABLE IF EXISTS `clause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clause` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `clause_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '条款编号',
  `clause_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '条款名称',
  `effective_time` date NOT NULL COMMENT '生效日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='条款登记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmcdist`
--

DROP TABLE IF EXISTS `cmcdist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmcdist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商圈ID',
  `cmcdist_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商圈编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商圈名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '检索码',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_cmcdist_no` (`cmcdist_no`) USING BTREE,
  KEY `IDX_cmcdist_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18655 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商圈信息表(commercial district)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coding_rule`
--

DROP TABLE IF EXISTS `coding_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coding_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `request_id` varchar(30) NOT NULL COMMENT '请求id，该id为业务系统预先知道的',
  `request_name` varchar(50) DEFAULT NULL COMMENT '请求名称，如仓库引进单',
  `prefix` varchar(10) DEFAULT '' COMMENT '前缀',
  `current_serial_no` int(11) NOT NULL DEFAULT '1' COMMENT '当前序号 ',
  `serial_no_length` int(11) NOT NULL DEFAULT '6' COMMENT '序号长度',
  `reset_mode` int(11) NOT NULL DEFAULT '1' COMMENT '重置模式(0:永不重置 1:按天重置 2:按月重置 3:按年重置)',
  `allow_break_no` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许断号，1表示允许，0表示不允许，允许时会在应用程序中缓存10个\n\n序号，不允许时，每次都从数据库请求，允许断号\r\n\r\n性能更好，但如果服务器重启，可能缓存中没用过的序号丢失',
  `is_abstract` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否抽象。1表抽象，抽象的不能建立实例化，只能作为模板供其他复制',
  `reset_time` datetime DEFAULT NULL COMMENT '重置时间，在判断是否需要重置时有用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_coding_rule` (`request_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='单据号配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `color_info`
--

DROP TABLE IF EXISTS `color_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '颜色ID',
  `color_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '颜色编码(必须输入且长度必须2位)',
  `code` varchar(18) CHARACTER SET utf8 NOT NULL COMMENT '颜色外码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0 = 禁用 1 = 正常)',
  `sys_no` varchar(10) COLLATE utf8_bin DEFAULT '00' COMMENT '所属业务单元',
  `rgb` varchar(7) COLLATE utf8_bin DEFAULT NULL COMMENT 'rgb',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_color_no` (`color_no`) USING BTREE,
  KEY `IDX_color_info_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2498 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='颜色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算公司ID',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算公司编码',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0 = 撤消 1 = 正常)',
  `bank_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行帐号',
  `bank_account_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '银行账户名',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `tax_registry_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `tax_level` varchar(20) COLLATE utf8_bin DEFAULT '0' COMMENT '纳税级别(0:一般纳税人 1:小规模纳税人)',
  `legal_person` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表',
  `identity_card` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '营业证号/身份证号',
  `fax` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '传真号',
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '检索码',
  `address` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司地址',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_company_no` (`company_no`) USING BTREE,
  KEY `IDX_company_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算公司信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `company_balance_bill`
--

DROP TABLE IF EXISTS `company_balance_bill`;
/*!50001 DROP VIEW IF EXISTS `company_balance_bill`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `company_balance_bill` AS SELECT 
 1 AS `company_bill_code`,
 1 AS `company_no`,
 1 AS `company_name`,
 1 AS `company_type`,
 1 AS `company_type_name`,
 1 AS `balance_no`,
 1 AS `balance_code`,
 1 AS `balance_name`,
 1 AS `part_type`,
 1 AS `part_type_name`,
 1 AS `business_type`,
 1 AS `business_type_name`,
 1 AS `is_balance`,
 1 AS `bill_code`,
 1 AS `bill_name`,
 1 AS `transfer_type`,
 1 AS `transfer_type_name`,
 1 AS `send_receive_type`,
 1 AS `send_receive_type_name`,
 1 AS `is_count`,
 1 AS `rel_sys`,
 1 AS `table_name`,
 1 AS `describe`,
 1 AS `create_user`,
 1 AS `create_time`,
 1 AS `update_user`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `company_brand_settle_period`
--

DROP TABLE IF EXISTS `company_brand_settle_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_brand_settle_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结账公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `supplier_settle_time` date DEFAULT NULL COMMENT '厂商结账日期',
  `account_settle_time` date DEFAULT NULL COMMENT '财务结账日期',
  `sale_settle_time` date DEFAULT NULL COMMENT '销售结账日期',
  `transfer_settle_time` date DEFAULT NULL COMMENT '跨区结账日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_company_brand_settle_period_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1600011328 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公司品牌结账日设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_currency`
--

DROP TABLE IF EXISTS `company_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(10) NOT NULL COMMENT '币别代码',
  `name` varchar(30) NOT NULL COMMENT '币别名称',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_company_currency_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='币别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_currency_rel`
--

DROP TABLE IF EXISTS `company_currency_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_currency_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) NOT NULL COMMENT '公司编码',
  `company_name` varchar(100) NOT NULL COMMENT '公司名称',
  `currency_id` int(11) NOT NULL COMMENT '币别主键',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_company_currency_rel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司和币别的关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_currency_set`
--

DROP TABLE IF EXISTS `company_currency_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_currency_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) NOT NULL COMMENT '公司编码',
  `base_currency` varchar(40) NOT NULL COMMENT '本位币',
  `foreign_currency` varchar(40) NOT NULL COMMENT '外币',
  `exchange_rate` decimal(10,7) DEFAULT NULL COMMENT '汇率',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_company_currency_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外币设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_foreign_currency`
--

DROP TABLE IF EXISTS `company_foreign_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_foreign_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `base_currency` varchar(40) NOT NULL COMMENT '本位币',
  `foreign_currency` varchar(40) NOT NULL COMMENT '外币',
  `exchange_rate` decimal(10,7) DEFAULT NULL COMMENT '汇率',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_company_foreign_currency_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='外币汇率设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `company_item_price`
--

DROP TABLE IF EXISTS `company_item_price`;
/*!50001 DROP VIEW IF EXISTS `company_item_price`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `company_item_price` AS SELECT 
 1 AS `company_no`,
 1 AS `zone_no`,
 1 AS `item_no`,
 1 AS `effective_time`,
 1 AS `region_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `company_period_balance`
--

DROP TABLE IF EXISTS `company_period_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_period_balance` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编码',
  `year` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin NOT NULL COMMENT '月份',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `opening_qty` int(11) DEFAULT '0' COMMENT '期初数量',
  `opening_balance` decimal(20,4) DEFAULT '0.0000' COMMENT '期初余额',
  `purchase_in_qty` int(11) DEFAULT '0' COMMENT '采购入库数量',
  `purchase_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '采购入库金额',
  `outer_transfer_in_qty` int(11) DEFAULT '0' COMMENT '跨区调入数量',
  `outer_transfer_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '跨区调入金额',
  `purchase_return_qty` int(11) DEFAULT '0' COMMENT '采购退厂数量',
  `purchase_return_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '采购退厂金额',
  `inv_surplus_qty` int(11) DEFAULT '0' COMMENT '盘盈数量',
  `inv_surplus_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '盘盈金额',
  `others_in_qty` int(11) DEFAULT '0' COMMENT '其他入库数量',
  `others_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '其他入库金额',
  `outer_way_qty` int(11) DEFAULT '0' COMMENT '外入在途数量',
  `outer_way_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '外入在途金额',
  `outer_diff_qty` int(11) DEFAULT '0' COMMENT '外在途差异数量',
  `outer_diff_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '外在途差异金额',
  `cost_adjustment_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '差异调整金额',
  `sales_out_qty` int(11) DEFAULT '0' COMMENT '销售出库数量',
  `sales_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '销售出库金额',
  `outer_transfer_out_qty` int(11) DEFAULT '0' COMMENT '跨区调出数量',
  `outer_transfer_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '跨区跳出金额',
  `inventory_loss_qty` int(11) DEFAULT '0' COMMENT '盘亏数量',
  `inventory_loss_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '盘亏金额',
  `others_out_qty` int(11) DEFAULT '0' COMMENT '其他出库数量',
  `others_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '其他出库金额',
  `during_net_qty` int(11) DEFAULT '0' COMMENT '期间净发生数量',
  `during_net_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '期间净发生金额',
  `closing_qty` int(11) DEFAULT '0' COMMENT '期末数量',
  `closing_balance` decimal(20,4) DEFAULT '0.0000' COMMENT '期末余额',
  `unit_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '单位成本',
  `region_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '地区成本价',
  `headquarter_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '总部成本价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_month_item` (`company_no`,`year`,`month`,`item_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公司期间结存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_period_sales_sum`
--

DROP TABLE IF EXISTS `company_period_sales_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_period_sales_sum` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编码',
  `year` year(4) NOT NULL COMMENT '年份',
  `month` char(4) COLLATE utf8_bin NOT NULL COMMENT '月份',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(20,4) DEFAULT NULL COMMENT '金额',
  `unit_cost` decimal(20,4) DEFAULT '0.0000' COMMENT '单位成本',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx-001` (`company_no`,`year`,`month`,`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公司期间销售汇总';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_settle_period`
--

DROP TABLE IF EXISTS `company_settle_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_settle_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结账公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `brand_no` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码（多选）',
  `brand_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称（多选）',
  `supplier_settle_time` date DEFAULT NULL COMMENT '厂商结账日期',
  `account_settle_time` date DEFAULT NULL COMMENT '财务结账日期',
  `sale_settle_time` date DEFAULT NULL COMMENT '销售结账日期',
  `transfer_settle_time` date DEFAULT NULL COMMENT '跨区结账日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_company_settle_period_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6001 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公司结账期间';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `company_store`
--

DROP TABLE IF EXISTS `company_store`;
/*!50001 DROP VIEW IF EXISTS `company_store`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `company_store` AS SELECT 
 1 AS `company_no`,
 1 AS `store_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `con_balance_type`
--

DROP TABLE IF EXISTS `con_balance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_balance_type` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `balance_no` int(11) NOT NULL COMMENT '结算类型编号',
  `balance_code` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '结算类型编码',
  `balance_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算类型名称',
  `part_type` tinyint(3) unsigned DEFAULT NULL COMMENT '主体类型(1:总部 2:地区)',
  `business_type` tinyint(3) unsigned DEFAULT NULL COMMENT '业务类型(1:采购 2:销售)',
  `is_balance` tinyint(3) unsigned DEFAULT NULL COMMENT '是否做结算单(0:否 1:是)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0:禁用 1:启用)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_balance_type` (`balance_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `con_bill_type`
--

DROP TABLE IF EXISTS `con_bill_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_bill_type` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_code` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '单据类型编码',
  `bill_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '单据类型名称',
  `rel_sys` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '来源系统',
  `table_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所在表名',
  `transfer_type` tinyint(3) unsigned DEFAULT NULL COMMENT '出入库类型(1:出库 2:入库)',
  `describe` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '描述说明',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0:禁用 1:启用)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_bill_type` (`bill_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `con_company_bill_rel`
--

DROP TABLE IF EXISTS `con_company_bill_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_company_bill_rel` (
  `id` char(32) NOT NULL COMMENT '主键',
  `company_no` char(18) NOT NULL COMMENT '结算公司编码',
  `balance_no` int(11) NOT NULL COMMENT '结算类型编号',
  `bill_code` varchar(18) NOT NULL COMMENT '单据类型编码',
  `send_receive_type` tinyint(3) unsigned DEFAULT NULL COMMENT '单据性质(1:发货单 2:收货单)',
  `is_count` tinyint(3) unsigned DEFAULT NULL COMMENT '是否用于统计(0:否 1:是)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0:禁用 1:启用)',
  `create_user` varchar(32) DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_balance_type` (`company_no`,`balance_no`,`bill_code`,`send_receive_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `bill_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `bill_status` tinyint(3) DEFAULT '0' COMMENT '单据状态(0,制单；1,业务确认；2,财务确认)',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `brand_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码(多选)',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称(多选)',
  `is_express` tinyint(3) DEFAULT '0' COMMENT '是否加急(0,否；1,是)',
  `express_desc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '加急描述',
  `contract_type` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '合同类别(多选)',
  `other_contract_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '合同类别(其他描述)',
  `contract_start_date` date DEFAULT NULL COMMENT '合同开始时间',
  `contract_end_date` date DEFAULT NULL COMMENT '合同结束时间',
  `contract_remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '合同备注',
  `submit_text` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '送审文本(多选)',
  `other_submit_text` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '送审文本(其他描述)',
  `plan_seal` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '计划用印(多选)',
  `other_plan_seal` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '计划用印(其他描述)',
  `the_contract_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '本次合同描述',
  `original_contract_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '原合同描述',
  `is_agreement_with` tinyint(3) DEFAULT '0' COMMENT '合同是否一致(0,否;1,是)',
  `create_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `audit_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `audit_time` datetime DEFAULT NULL COMMENT '审批时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='合同表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_discount`
--

DROP TABLE IF EXISTS `contract_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_discount` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `contract_discount_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '合同折扣编码',
  `contract_discount_type` tinyint(3) DEFAULT NULL COMMENT '合同折扣类型(1,供应商合同折扣;2,公司合同折扣;3,指定价折扣)',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编码',
  `saler_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编码',
  `buyer_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `order_type` tinyint(3) DEFAULT NULL COMMENT '订货类型(1,期货;2,现货;3,全部)',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `category_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品ID',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `purchase_price` decimal(9,2) DEFAULT NULL COMMENT '采购价',
  `years` year(4) DEFAULT NULL COMMENT '年份',
  `season` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '季节',
  `price_basis` tinyint(3) DEFAULT NULL COMMENT '定价依据(1,牌价;2,终端销售金额)',
  `discount1` decimal(9,5) DEFAULT NULL COMMENT '折扣1',
  `discount2` decimal(9,5) DEFAULT NULL COMMENT '折扣2',
  `refer_discount1` decimal(9,5) DEFAULT NULL COMMENT '参考折扣1',
  `refer_discount2` decimal(9,5) DEFAULT NULL COMMENT '参考折扣2',
  `add_price` decimal(9,5) DEFAULT NULL COMMENT '加价',
  `algorithm` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '算法',
  `not_tax_algorithm` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '算法(不含税金额)',
  `effective_date` date DEFAULT NULL COMMENT '生效日',
  `create_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='合同折扣';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cost_category_setting`
--

DROP TABLE IF EXISTS `cost_category_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_category_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cost_cate_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `code` char(18) COLLATE utf8_bin NOT NULL COMMENT '费用类别编码',
  `name` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT 'null' COMMENT '费用类别名称',
  `accounts_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '会计科目编码',
  `accounts_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '会计科目名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0 = 停用 1 = 启用)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_cost_category_setting_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='总账费用类别设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cost_compute_rule`
--

DROP TABLE IF EXISTS `cost_compute_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_compute_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '规则编码',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `start_year_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '起始年份编码',
  `start_year_name` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '起始年份名称',
  `start_season_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '起始季节编码',
  `start_season_name` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '起始季节名称',
  `end_year_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '终止年份编码',
  `end_year_name` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '终止年份名称',
  `end_season_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '终止季节编码',
  `end_season_name` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '终止季节名称',
  `compute_rule` tinyint(3) DEFAULT NULL COMMENT '结算规则 1、乘 2、加',
  `weighted_cost_coeff` decimal(20,2) DEFAULT '0.00' COMMENT '加权成本系数',
  `hq_cost_coeff` decimal(20,2) DEFAULT '0.00' COMMENT '总部成本系数',
  `area_cost_coeff` decimal(20,2) DEFAULT '0.00' COMMENT '地区成本系数',
  `status` tinyint(3) DEFAULT NULL COMMENT '启用状态 1、启用 0、停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编码(备用)',
  `brand_unit_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称(备用)',
  `start_year_season` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '起始年份季节(备用)',
  `end_year_season` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '终止年份季节(备用)',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_cost_compute_rule_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='价格计算规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_card_transaction_dtl`
--

DROP TABLE IF EXISTS `credit_card_transaction_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card_transaction_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `seq_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '流水号',
  `terminal_number` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `card_number` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '卡号',
  `deal_time` datetime DEFAULT NULL COMMENT '交易时间',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '金额',
  `actual_income_amount` decimal(12,2) DEFAULT NULL COMMENT '实收金额',
  `given_bank` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '发卡行',
  `reality_deal_time` datetime DEFAULT NULL COMMENT '实际交易时间',
  `rebate_amount` decimal(12,2) DEFAULT NULL COMMENT '回扣费',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_seq_no` (`seq_no`),
  KEY `IDX_credit_card_transaction_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='银联刷卡交易明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency_management`
--

DROP TABLE IF EXISTS `currency_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `currency_code` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '币种编码',
  `currency_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '币种名称',
  `currency_symbol` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '币种标识',
  `standard_money` tinyint(3) DEFAULT '0' COMMENT '是否本位币：0、否 1、是',
  `status` tinyint(3) DEFAULT '1' COMMENT '启用标志 1、已启用 0、已停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_currency_code` (`currency_code`),
  KEY `IDX_currency_management_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='币种管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_imperfect`
--

DROP TABLE IF EXISTS `custom_imperfect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_imperfect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `buyer_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编码',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `saler_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编码',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `return_date` date DEFAULT NULL COMMENT '退货日期',
  `item_no` char(36) COLLATE utf8_bin DEFAULT NULL COMMENT '商品ID',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `size_no` char(36) COLLATE utf8_bin DEFAULT NULL COMMENT '尺码',
  `qty` int(11) DEFAULT '0' COMMENT '数量',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `reason` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '原因',
  `opinion` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '意见',
  `brand_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `category_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `years` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '年份编码',
  `years_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '年份名称',
  `season` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '季节编码',
  `season_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '季节名称',
  `gender` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '性别编码',
  `gender_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '性别名称',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型',
  `balance_status` tinyint(3) DEFAULT NULL COMMENT '结算状态',
  `balance_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `IDX_custom_imperfect_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客残明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '顾客ID',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `code` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '检索码',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '客户简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '客户全称',
  `en_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '客户英文名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '客户状态(0 = 撤消 1 = 正常)',
  `category` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '客户性质(1:加盟 2:代销 3:批发)',
  `type` varchar(20) COLLATE utf8_bin DEFAULT '1' COMMENT '客户类型(1:个人 2:公司)',
  `level` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '客户等级(A B C D四种)',
  `creditlines` decimal(12,2) DEFAULT '0.00' COMMENT '信用额度',
  `discount` decimal(5,2) NOT NULL COMMENT '批发折扣(1-100之间,可以为小数,用于计算时除以100)',
  `bank_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行帐号',
  `bank_account_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '银行账户名',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `tax_registry_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `tax_level` varchar(20) COLLATE utf8_bin DEFAULT '0' COMMENT '纳税级别(0:一般纳税人 1:小规模纳税人)',
  `legal_person` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '法人代表',
  `identity_card` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '营业证号/身份证号',
  `fax` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '传真号',
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `province_no` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '行政省编码',
  `city_no` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '行政市编码',
  `county_no` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '行政县编码',
  `address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系地址',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '订货单位编号',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_customer_no` (`customer_no`) USING BTREE,
  KEY `IDX_customer_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='加盟批发客户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_order_remain`
--

DROP TABLE IF EXISTS `customer_order_remain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_order_remain` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '批发订单号',
  `amount` decimal(9,2) DEFAULT '0.00' COMMENT '批发订单金额',
  `out_amount` decimal(15,2) DEFAULT '0.00' COMMENT '批发出库单金额',
  `out_rebate_amount` decimal(9,2) DEFAULT '0.00' COMMENT '批发出库单返利金额',
  `return_amount` decimal(9,2) DEFAULT '0.00' COMMENT '批发退货单金额',
  `deduction_amount` decimal(9,2) DEFAULT '0.00' COMMENT '关联扣项金额',
  `receive_amount` decimal(9,2) DEFAULT '0.00' COMMENT '关联收款单金额',
  `remaining_amount` decimal(15,2) DEFAULT '0.00' COMMENT '订单余额',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `customer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态',
  `return_out_amount` decimal(9,2) DEFAULT '0.00' COMMENT '批发退货出库金额',
  `order_date` date DEFAULT NULL COMMENT '订单日期',
  `frozen_order_amount` decimal(9,2) DEFAULT '0.00' COMMENT '冻结订单金额',
  `unfreeze_order_amount` decimal(9,2) DEFAULT '0.00' COMMENT '解冻金额',
  `wholesale_order_type` tinyint(3) DEFAULT '0' COMMENT '订单类型(0-订货,1-现货,2-补货)',
  PRIMARY KEY (`id`),
  KEY `IDX_customer_remain_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_rece_rel`
--

DROP TABLE IF EXISTS `customer_rece_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_rece_rel` (
  `id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `term_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '条款编码',
  `term_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '条款名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体名称',
  `margin_control_flag` tinyint(3) unsigned DEFAULT NULL COMMENT '启用保证金控制(0 : 未启用， 1 ： 已启用)',
  `margin_amount` decimal(20,2) DEFAULT '0.00' COMMENT '保证金额度',
  `margin_remainder_amount` decimal(20,2) DEFAULT '0.00' COMMENT '保证金余额',
  `status` tinyint(3) unsigned DEFAULT NULL COMMENT '状态(0 ： 停用 1 ： 启用)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_customer_rece_rel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户-收款条款关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_rece_rel_dtl`
--

DROP TABLE IF EXISTS `customer_rece_rel_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_rece_rel_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ref_id` char(36) COLLATE utf8_bin NOT NULL COMMENT '主表关联建',
  `year` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `rebate_amount` decimal(20,2) DEFAULT NULL COMMENT '返利额度',
  `has_rebate_amount` decimal(20,2) DEFAULT NULL COMMENT '已返利金额',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_customer_rece_rel_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户-收款条款关联详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_task_dtl`
--

DROP TABLE IF EXISTS `data_task_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_task_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `task_no` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '任务编号',
  `task_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '任务类型',
  `task_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '任务类型名称',
  `dtl_params_str` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '明细参数字符串',
  `dtl_description` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '明细任务描述',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(1:未处理 0:已处理)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  KEY `idx_task_no` (`task_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='数据任务明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_task_main`
--

DROP TABLE IF EXISTS `data_task_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_task_main` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `task_no` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '任务编号',
  `task_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '任务类型',
  `task_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '任务类型名称',
  `params_str` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '参数字符串',
  `description` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '任务描述',
  `plan_count` int(11) DEFAULT '0' COMMENT '预计数量',
  `complete_count` int(11) DEFAULT '0' COMMENT '完成数量',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(1:未开始 2:执行中 0:完成)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_data_task` (`task_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='数据任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_transfer_record`
--

DROP TABLE IF EXISTS `data_transfer_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_transfer_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transfer_end_date` date NOT NULL COMMENT '迁移数据的截止日期',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'FAS' COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'FAS' COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据迁移记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_cash`
--

DROP TABLE IF EXISTS `deposit_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_cash` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '门店编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '门店名称',
  `assistant_id` char(36) COLLATE utf8_bin NOT NULL COMMENT '营业员主键ID',
  `assistant_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '营业员工号,与HR工号代码一致',
  `assistant_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '营业员姓名',
  `start_out_date` date NOT NULL COMMENT '起始销售日期',
  `end_out_date` date NOT NULL COMMENT '结束销售日期',
  `currency_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '币种,0-人民币',
  `account` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '存入账户',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '存入金额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,0-有效 1-无效 2-作废 默认为0',
  `confirm_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确定,0-未确定 1-已确定 默认为0',
  `deposit_date` date NOT NULL COMMENT '存入日期',
  `sale_amount` decimal(20,2) DEFAULT NULL COMMENT '销售金额',
  `cash_diff` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '存现差异原因',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人编号',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `audit_time` datetime DEFAULT NULL COMMENT '确定时间',
  `auditor_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '确定人编号',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确定人姓名',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  `transaction_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '银行流水号',
  PRIMARY KEY (`id`),
  KEY `IDX_deposit_cash_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='现金存入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_cash_cumulative_difference`
--

DROP TABLE IF EXISTS `deposit_cash_cumulative_difference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_cash_cumulative_difference` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '门店编号',
  `shop_name` char(100) COLLATE utf8_bin NOT NULL COMMENT '门店名称',
  `sale_out` date NOT NULL COMMENT '销售日期',
  `cash_amount` decimal(20,2) DEFAULT NULL COMMENT '现金金额',
  `cash_coupon_amount` decimal(20,2) DEFAULT NULL COMMENT '现金券金额',
  `bank_card_amount` decimal(20,2) DEFAULT NULL COMMENT '银行卡金额',
  `mall_card_amount` decimal(20,2) DEFAULT NULL COMMENT '商场卡金额',
  `mall_coupon_amount` decimal(20,2) DEFAULT NULL COMMENT '商场券金额',
  `expect_cash_amount` decimal(20,2) DEFAULT NULL COMMENT '预收款金额',
  `outside_card_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡金额',
  `other_amount` decimal(20,2) DEFAULT NULL COMMENT '其他金额',
  `sale_total_amount` decimal(20,2) DEFAULT NULL COMMENT '销售总额',
  `deposit_cash_total_amount` decimal(20,2) DEFAULT NULL COMMENT '存现总额',
  `current_deposit_cash_defference` decimal(20,2) DEFAULT NULL COMMENT '当前存现差异',
  `deposit_cash_difference` decimal(20,2) DEFAULT NULL COMMENT '累计存现差异',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_shop_no_sale_out_type` (`shop_no`,`sale_out`) USING BTREE,
  KEY `IDX_deposit_cash_cumulative_difference_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='存现累计差异';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit_set`
--

DROP TABLE IF EXISTS `deposit_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposit_set` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '店铺编码',
  `shop_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `prepare_cash` decimal(20,0) DEFAULT NULL COMMENT '备用金',
  `init_date` datetime DEFAULT NULL COMMENT '初始化日期',
  `start_amount` decimal(20,0) DEFAULT NULL COMMENT '期初现金余额',
  `beyond_last_deposit_date` int(4) DEFAULT NULL COMMENT '超出最近存现日(不超过1000)',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '现金余额',
  `deposit_diff` decimal(20,2) DEFAULT NULL COMMENT '存现差异',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_deposit_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺存现设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exception_price_bill`
--

DROP TABLE IF EXISTS `exception_price_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exception_price_bill` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `bill_type` int(11) NOT NULL COMMENT '单据类型',
  `biz_type` int(11) DEFAULT NULL COMMENT '业务类型',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '订货单位',
  `bill_date` date DEFAULT NULL COMMENT '业务发生日期(审核日期、销售日期)',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `sku_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'sku码',
  `size_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '尺码',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `cost` decimal(12,2) DEFAULT NULL COMMENT '单据价格',
  `cost_from` tinyint(3) NOT NULL COMMENT '取价来源（1: 采购价，2: 地区价等）',
  `base_cost` decimal(12,2) DEFAULT NULL COMMENT '实际价格',
  `exception_reason` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '异常原因',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算单类型',
  `supplier_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `company_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `zone_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '地区编码',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态 1:价格已更新 2:价格未更新',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_sku_bill_no_type` (`item_no`,`bill_no`,`bill_type`,`cost_from`),
  KEY `IDX_exception_price_bill_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='异常价格单据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exchange_rate_setup`
--

DROP TABLE IF EXISTS `exchange_rate_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rate_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `exchange_rate_code` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '汇率编码',
  `source_currency` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '源货币',
  `target_currency` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '目标货币',
  `conversion_factor` decimal(10,4) NOT NULL COMMENT '转换系数',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `company_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `status` tinyint(3) DEFAULT '1' COMMENT '启用标志 1、已启用 0、已停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_exchange_rate_code` (`exchange_rate_code`),
  KEY `IDX_exchange_rate_setup_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='汇率设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expect_cash`
--

DROP TABLE IF EXISTS `expect_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expect_cash` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `ref_bill_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '收款单据编号',
  `settle_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '结算编码',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '门店编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '门店名称',
  `assistant_id` char(36) COLLATE utf8_bin NOT NULL COMMENT '营业员主键ID',
  `assistant_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员工号,与HR工号代码一致',
  `assistant_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员姓名',
  `business_date` date NOT NULL COMMENT '日期',
  `currency_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '币种,0-人民币',
  `business_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '业务类型,1-商场预收 2-定金预收',
  `business_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '凭证名称',
  `business_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '业务标识,1-收款 2-退款',
  `used_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '已使用金额',
  `amount` decimal(20,2) NOT NULL COMMENT '金额',
  `customer_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,0-有效 1-无效 默认为0',
  `confirm_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确定,0-未确定 1-已确定 默认为0',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人编号',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `audit_time` datetime DEFAULT NULL COMMENT '确定时间',
  `auditor_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '确定人编号',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确定人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `pro_no` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动编号',
  `pro_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动名称',
  `rate_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '扣率',
  `brand_no` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `brand_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `balance_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  `balance_status` int(3) DEFAULT '1' COMMENT '结算状态 1-未结算、2-已结算',
  PRIMARY KEY (`id`),
  KEY `IDX_expect_cash_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预收款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financial_account`
--

DROP TABLE IF EXISTS `financial_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) NOT NULL COMMENT '公司编号',
  `group_lead_role` tinyint(3) DEFAULT NULL COMMENT '承担总部职能  1、是 0、否',
  `nc_id` char(32) DEFAULT NULL COMMENT 'NC账套编号',
  `parent_company` char(18) DEFAULT NULL COMMENT '父项公司编号',
  `child_company` tinyint(3) DEFAULT NULL COMMENT '是否属于分公司 1、是 0、否',
  `supplier_no` char(18) DEFAULT NULL COMMENT '相关供应商',
  `price_zone` char(18) DEFAULT NULL COMMENT '默认价格区',
  `revenue_journal_type` char(18) DEFAULT NULL COMMENT '结转收入凭证类别',
  `cost_journal_type` char(18) DEFAULT NULL COMMENT '结转成本凭证类别',
  `liabilities_journal_type` char(18) DEFAULT NULL COMMENT '存贷负债凭证类别',
  `internal_journal_type` char(18) DEFAULT NULL COMMENT '结转对内收入凭证类别',
  `assist_project_01` char(18) DEFAULT NULL COMMENT '辅助核算类别1',
  `assist_project_02` char(18) DEFAULT NULL COMMENT '辅助核算类别2',
  `assist_project_03` char(18) DEFAULT NULL COMMENT '辅助核算类别3',
  `assist_project_04` char(18) DEFAULT NULL COMMENT '辅助核算类别4',
  `assist_project_05` char(18) DEFAULT NULL COMMENT '辅助核算类别5',
  `assist_project_06` char(18) DEFAULT NULL COMMENT '辅助核算类别6',
  `assist_project_07` char(18) DEFAULT NULL COMMENT '辅助核算类别7',
  `assist_project_08` char(18) DEFAULT NULL COMMENT '辅助核算类别8',
  `status` tinyint(3) DEFAULT '1' COMMENT '启用标志 1、已启用 0、已停用',
  `create_user` varchar(32) DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_financial_account_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='财务帐套';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financial_category`
--

DROP TABLE IF EXISTS `financial_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `financial_category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '财务大类编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '分类名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `is_default` tinyint(3) DEFAULT '0' COMMENT '是否是系统默认值(0：否，1：是)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态（0 = 撤消 1 = 正常）',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_category_no` (`financial_category_no`),
  KEY `IDX_financial_category_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='财务大类设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `financial_category_dtl`
--

DROP TABLE IF EXISTS `financial_category_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_category_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `financial_category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '财务大类编码',
  `category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '大类编码',
  `qty_control_flag` tinyint(3) DEFAULT '0' COMMENT '是否启用数量控制（0：否，1：是）',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_category_no` (`financial_category_no`,`category_no`),
  KEY `IDX_financial_category_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='财务大类明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_sale_apply_invoice_rel`
--

DROP TABLE IF EXISTS `group_sale_apply_invoice_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_sale_apply_invoice_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `invoice_apply_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请单据号',
  `invoice_apply_date` datetime DEFAULT NULL COMMENT '开票申请日期',
  `invoice_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票单据号',
  `invoice_date` datetime DEFAULT NULL COMMENT '发票登记日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_group_sale_apply_invoice_rel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='团购批发开票发票关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `headquarter_cost_maintain`
--

DROP TABLE IF EXISTS `headquarter_cost_maintain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `headquarter_cost_maintain` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键(UUID)',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品出厂编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌',
  `brand_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `effective_time` date NOT NULL COMMENT '生效日期',
  `add_rule_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '加价规则编号',
  `add_basis` char(3) COLLATE utf8_bin DEFAULT NULL COMMENT '加价依据,2牌价，1厂进价',
  `add_price` decimal(10,2) DEFAULT NULL COMMENT '加价',
  `add_discount` decimal(10,2) DEFAULT NULL COMMENT '加折',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '折扣率',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_first` tinyint(3) DEFAULT NULL COMMENT '是否首增(1:是，0:否)',
  `production_cost` decimal(10,2) DEFAULT NULL COMMENT '生产成本',
  `factory_price` decimal(10,2) DEFAULT NULL COMMENT '厂进价',
  `tag_price` decimal(10,2) DEFAULT NULL COMMENT '全国统一牌价',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_item_no` (`item_no`,`effective_time`),
  KEY `IDX_headquarter_cost_maintain_update_time` (`update_time`) USING BTREE,
  KEY `idx_rule_no` (`add_rule_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='总部成本维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `headquarter_cost_weighting`
--

DROP TABLE IF EXISTS `headquarter_cost_weighting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `headquarter_cost_weighting` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键(UUID)',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品出厂编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌',
  `brand_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `effective_time` date NOT NULL COMMENT '生效日期',
  `add_rule_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '加价规则编号',
  `add_basis` char(3) COLLATE utf8_bin DEFAULT NULL COMMENT '加价依据,2牌价，1厂进价',
  `add_price` decimal(10,2) DEFAULT NULL COMMENT '加价',
  `add_discount` decimal(10,2) DEFAULT NULL COMMENT '加折',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '折扣率',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_first` tinyint(3) DEFAULT NULL COMMENT '是否首增(1:是，0:否)',
  `production_cost` decimal(10,2) DEFAULT NULL COMMENT '生产成本',
  `factory_price` decimal(10,2) DEFAULT NULL COMMENT '厂进价',
  `tag_price` decimal(10,2) DEFAULT NULL COMMENT '全国统一牌价',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_item_no` (`item_no`,`effective_time`,`company_no`),
  KEY `IDX_headquarter_cost_weighting_update_time` (`update_time`),
  KEY `idx_rule_no` (`add_rule_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='总部成本维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `headquarter_period`
--

DROP TABLE IF EXISTS `headquarter_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `headquarter_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结账公司编码',
  `company_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编码',
  `brand_unit_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `supplier_settle_time` date DEFAULT NULL COMMENT '总部结账日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='总部结账日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `headquarter_price_rule`
--

DROP TABLE IF EXISTS `headquarter_price_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `headquarter_price_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `add_rule_no` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '规则编号',
  `supplier_group_no` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '多选结算供应商组代码',
  `supplier_group_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '多选供应商组名称',
  `brand_unit_no` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '品牌部列表,字符分割形式BL,TT,FD',
  `brand_unit_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称列表',
  `category_no` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '多选结算大类',
  `category_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '多选结算大类名称',
  `two_level_category_no` varchar(300) COLLATE utf8_bin DEFAULT '' COMMENT '多选二级大类',
  `two_level_category_name` varchar(600) COLLATE utf8_bin DEFAULT '' COMMENT '多选二级大类名称',
  `new_style_flag` tinyint(3) unsigned DEFAULT NULL COMMENT '是否新旧款，0否，1是',
  `style_type` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '新旧款类型',
  `year_code` varchar(360) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `year` varchar(180) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `season` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '季节，A春，B夏，C秋，D冬',
  `season_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '季节名称',
  `add_basis` char(3) COLLATE utf8_bin NOT NULL COMMENT '加价依据,1厂进价，2牌价',
  `effective_time` date NOT NULL COMMENT '生效日期',
  `add_price` decimal(10,2) DEFAULT NULL COMMENT '加价',
  `add_discount` decimal(10,2) DEFAULT NULL COMMENT '加折',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `add_rule_no` (`add_rule_no`),
  KEY `IDX_headquarter_price_rule_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='总部加价规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `year` int(4) DEFAULT NULL COMMENT '年份',
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '假日名',
  `start_date` date DEFAULT NULL COMMENT '假日开始时间',
  `end_date` date DEFAULT NULL COMMENT '假日结束时间',
  `days` int(2) DEFAULT NULL COMMENT '天数',
  `last_work_date` date DEFAULT NULL COMMENT '假日前最近一个工作日',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='节假日';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `initial_amount`
--

DROP TABLE IF EXISTS `initial_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `initial_amount` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体名称',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `customer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '内部客户编号',
  `customer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '内部客户名称',
  `initial_date` date DEFAULT NULL COMMENT '初始日期',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `currency` char(32) COLLATE utf8_bin DEFAULT '0' COMMENT '币别',
  `qty` int(11) DEFAULT '0' COMMENT '数量',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '期初牌价额',
  `amount` decimal(12,2) DEFAULT '0.00' COMMENT '期初应付金额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型',
  `pay_date` date DEFAULT NULL COMMENT '付款日期',
  `pay_status` tinyint(3) DEFAULT '0' COMMENT '付款状态(0,未付款;1,已付款)',
  `due_date` date DEFAULT NULL COMMENT '到期日',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `IDX_initial_amount_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='初始余额(应收/应付)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inside_biz_type`
--

DROP TABLE IF EXISTS `inside_biz_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inside_biz_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `biz_type_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型编号',
  `biz_type_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型名称',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态',
  `carry_over_cost` tinyint(3) DEFAULT NULL COMMENT '是否结转成本',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(225) COLLATE utf8_bin DEFAULT NULL COMMENT '备注，在销售明细成本有为0时，需要增加备注说明',
  PRIMARY KEY (`id`),
  KEY `IDX_inside_biz_type_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='内购业务类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inside_biz_type_detail`
--

DROP TABLE IF EXISTS `inside_biz_type_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inside_biz_type_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int(11) NOT NULL,
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售门店编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '销售门店名称',
  `dtl_type` tinyint(4) DEFAULT '1' COMMENT '明细类型：1＝店铺信息；2＝手输客户信息',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_inside_biz_type_detail_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='内购业务类型适用范围（店铺）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inside_purchase_balance_date`
--

DROP TABLE IF EXISTS `inside_purchase_balance_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inside_purchase_balance_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体名称',
  `balance_month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '结算月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `invoice_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '否生成开票申请(0-未生成，1-已生成)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `bill_type` tinyint(3) DEFAULT NULL COMMENT '单据类型',
  PRIMARY KEY (`id`),
  KEY `IDX_inside_purchase_balance_date_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='内购结算期设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_book`
--

DROP TABLE IF EXISTS `inventory_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_book` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `store_no_from` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '发方机构编码',
  `store_name_from` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '发放机构名称',
  `store_no_to` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '收方机构编码',
  `store_name_to` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '收方机构名称',
  `order_unit_no_from` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '发方订货单位编码',
  `order_unit_name_from` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '发方订货单位名称',
  `order_unit_no_to` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '收方订货单位编码',
  `order_unit_name_to` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '收方订货单位名称',
  `store_no` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '机构编码',
  `store_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '机构名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `order_unit_no` char(18) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订货单位',
  `order_unit_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '订货单位名称',
  `item_no` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '商品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '商品编码(出厂时的商品编码)',
  `item_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `sku_no` char(32) COLLATE utf8_bin NOT NULL COMMENT 'sku码',
  `size_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '尺寸编码',
  `size_kind` char(2) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '尺寸分类',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '单据编码',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `in_out_flag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '出入库标志（-1：出库 1：入库）',
  `ref_bill_no` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '相关单据编码',
  `ref_bill_type` int(11) DEFAULT '0' COMMENT '相关单据类型',
  `biz_type` int(11) DEFAULT '0' COMMENT '单据的业务类型',
  `account_type` tinyint(3) DEFAULT '0' COMMENT '0:记非实物库存、1：记实物库存',
  `bill_date` date NOT NULL DEFAULT '2000-01-01' COMMENT '业务发生日期',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价',
  `balance_offset` int(11) DEFAULT '0' COMMENT '正品库存发生量',
  `balance_qty` int(11) DEFAULT '0' COMMENT '正品库存结存数量(商品库存账Inventory结存数量)',
  `factory_in_offset` int(11) DEFAULT '0' COMMENT '厂入库在途变化量',
  `factory_in_qty` int(11) DEFAULT '0' COMMENT '厂入库在途总量',
  `factory_in_diff_offset` int(11) DEFAULT '0' COMMENT '厂入库在途差异变化量',
  `factory_in_diff_qty` int(11) DEFAULT '0' COMMENT '厂入库在途差异总量',
  `transit_in_offset` int(11) DEFAULT '0' COMMENT '内区入库在途变化量',
  `transit_in_qty` int(11) DEFAULT '0' COMMENT '内区入库在途总量',
  `transit_out_offset` int(11) DEFAULT '0' COMMENT '内区出库在途变化量',
  `transit_out_qty` int(11) DEFAULT '0' COMMENT '内区出库在途总量',
  `in_diff_offset` int(11) DEFAULT '0' COMMENT '内区入库差异变化量',
  `in_diff_qty` int(11) DEFAULT '0' COMMENT '内区入库差异总量',
  `out_diff_offset` int(11) DEFAULT '0' COMMENT '内区出库差异变化量',
  `out_diff_qty` int(11) DEFAULT '0' COMMENT '内区出库差异量',
  `transit_in_account_offset` int(11) DEFAULT '0' COMMENT '外区入库在途变化量',
  `transit_in_account_qty` int(11) DEFAULT '0' COMMENT '外区入库在途总量',
  `transit_out_account_offset` int(11) DEFAULT '0' COMMENT '外区出库在途变化量',
  `transit_out_account_qty` int(11) DEFAULT '0' COMMENT '外区出库在途总量',
  `in_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区入库差异变化量',
  `in_diff_account_qty` int(11) DEFAULT '0' COMMENT '外区入库差异总量',
  `out_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区出库差异变化量',
  `out_diff_account_qty` int(11) DEFAULT '0' COMMENT '外区出库差异量',
  `lock_offset` int(11) DEFAULT '0' COMMENT '冻结变化量',
  `lock_qty` int(11) DEFAULT '0' COMMENT '冻结数量',
  `occupied_offset` int(11) DEFAULT '0' COMMENT '预占变化量',
  `occupied_qty` int(11) DEFAULT '0' COMMENT '预占数量',
  `backup_offset` int(11) DEFAULT '0' COMMENT '备货变化量',
  `backup_qty` int(11) DEFAULT '0' COMMENT '备货数量',
  `guest_bad_offset` int(11) DEFAULT '0' COMMENT '客残变化量',
  `guest_bad_qty` int(11) DEFAULT '0' COMMENT '客残数量',
  `original_bad_offset` int(11) DEFAULT '0' COMMENT '原残变化量',
  `original_bad_qty` int(11) DEFAULT '0' COMMENT '原残数量',
  `bad_transit_offset` int(11) DEFAULT '0' COMMENT '次品在途发生量',
  `bad_transit_qty` int(11) DEFAULT '0' COMMENT '次品在途量',
  `bad_diff_offset` int(11) DEFAULT '0' COMMENT '次品在途差异变化',
  `bad_diff_qty` int(11) DEFAULT '0' COMMENT '次品在途差异',
  `return_offset` int(11) DEFAULT '0' COMMENT '退厂在途变化量（暂时不用）',
  `return_qty` int(11) DEFAULT '0' COMMENT '退厂在途总量（暂时不用）',
  `borrow_offset` int(11) DEFAULT '0' COMMENT '借用在途变化量（暂时不用）',
  `borrow_qty` int(11) DEFAULT '0' COMMENT '借用在途总量（暂时不用）',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '记账时间',
  `create_timestamp` datetime(3) DEFAULT '2000-01-01 00:00:00.000' COMMENT '时间戳',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT '' COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`),
  KEY `idx_bookbill_no` (`store_no`,`sku_no`,`order_unit_no`,`bill_no`,`bill_type`,`in_out_flag`),
  KEY `idx_store_no` (`store_no`,`order_unit_no`,`bill_date`,`item_no`),
  KEY `idx_ou_cost` (`sharding_flag`,`bill_date`,`order_unit_no`,`store_no`,`bill_type`,`in_out_flag`),
  KEY `idx_ibook_zone_inventory` (`order_unit_no`,`brand_no`,`store_no`,`bill_date`,`item_no`),
  KEY `IDX_inventory_book_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商品库存台账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_book_his`
--

DROP TABLE IF EXISTS `inventory_book_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_book_his` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `store_no_from` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '发方机构编码',
  `store_name_from` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '发放机构名称',
  `store_no_to` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '收方机构编码',
  `store_name_to` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '收方机构名称',
  `order_unit_no_from` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '发方订货单位编码',
  `order_unit_name_from` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '发方订货单位名称',
  `order_unit_no_to` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '收方订货单位编码',
  `order_unit_name_to` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '收方订货单位名称',
  `store_no` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '机构编码',
  `store_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '机构名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `order_unit_no` char(18) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订货单位',
  `order_unit_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '订货单位名称',
  `item_no` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '商品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '商品编码(出厂时的商品编码)',
  `item_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `sku_no` char(32) COLLATE utf8_bin NOT NULL COMMENT 'sku码',
  `size_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '尺寸编码',
  `size_kind` char(2) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '尺寸分类',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '单据编码',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `in_out_flag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '出入库标志（-1：出库 1：入库）',
  `ref_bill_no` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '相关单据编码',
  `ref_bill_type` int(11) DEFAULT '0' COMMENT '相关单据类型',
  `biz_type` int(11) DEFAULT '0' COMMENT '单据的业务类型',
  `account_type` tinyint(3) DEFAULT '0' COMMENT '0:记非实物库存、1：记实物库存',
  `bill_date` date NOT NULL DEFAULT '2000-01-01' COMMENT '业务发生日期',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价',
  `balance_offset` int(11) DEFAULT '0' COMMENT '正品库存发生量',
  `balance_qty` int(11) DEFAULT '0' COMMENT '正品库存结存数量(商品库存账Inventory结存数量)',
  `factory_in_offset` int(11) DEFAULT '0' COMMENT '厂入库在途变化量',
  `factory_in_qty` int(11) DEFAULT '0' COMMENT '厂入库在途总量',
  `factory_in_diff_offset` int(11) DEFAULT '0' COMMENT '厂入库在途差异变化量',
  `factory_in_diff_qty` int(11) DEFAULT '0' COMMENT '厂入库在途差异总量',
  `transit_in_offset` int(11) DEFAULT '0' COMMENT '内区入库在途变化量',
  `transit_in_qty` int(11) DEFAULT '0' COMMENT '内区入库在途总量',
  `transit_out_offset` int(11) DEFAULT '0' COMMENT '内区出库在途变化量',
  `transit_out_qty` int(11) DEFAULT '0' COMMENT '内区出库在途总量',
  `in_diff_offset` int(11) DEFAULT '0' COMMENT '内区入库差异变化量',
  `in_diff_qty` int(11) DEFAULT '0' COMMENT '内区入库差异总量',
  `out_diff_offset` int(11) DEFAULT '0' COMMENT '内区出库差异变化量',
  `out_diff_qty` int(11) DEFAULT '0' COMMENT '内区出库差异量',
  `transit_in_account_offset` int(11) DEFAULT '0' COMMENT '外区入库在途变化量',
  `transit_in_account_qty` int(11) DEFAULT '0' COMMENT '外区入库在途总量',
  `transit_out_account_offset` int(11) DEFAULT '0' COMMENT '外区出库在途变化量',
  `transit_out_account_qty` int(11) DEFAULT '0' COMMENT '外区出库在途总量',
  `in_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区入库差异变化量',
  `in_diff_account_qty` int(11) DEFAULT '0' COMMENT '外区入库差异总量',
  `out_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区出库差异变化量',
  `out_diff_account_qty` int(11) DEFAULT '0' COMMENT '外区出库差异量',
  `lock_offset` int(11) DEFAULT '0' COMMENT '冻结变化量',
  `lock_qty` int(11) DEFAULT '0' COMMENT '冻结数量',
  `occupied_offset` int(11) DEFAULT '0' COMMENT '预占变化量',
  `occupied_qty` int(11) DEFAULT '0' COMMENT '预占数量',
  `backup_offset` int(11) DEFAULT '0' COMMENT '备货变化量',
  `backup_qty` int(11) DEFAULT '0' COMMENT '备货数量',
  `guest_bad_offset` int(11) DEFAULT '0' COMMENT '客残变化量',
  `guest_bad_qty` int(11) DEFAULT '0' COMMENT '客残数量',
  `original_bad_offset` int(11) DEFAULT '0' COMMENT '原残变化量',
  `original_bad_qty` int(11) DEFAULT '0' COMMENT '原残数量',
  `bad_transit_offset` int(11) DEFAULT '0' COMMENT '次品在途发生量',
  `bad_transit_qty` int(11) DEFAULT '0' COMMENT '次品在途量',
  `bad_diff_offset` int(11) DEFAULT '0' COMMENT '次品在途差异变化',
  `bad_diff_qty` int(11) DEFAULT '0' COMMENT '次品在途差异',
  `return_offset` int(11) DEFAULT '0' COMMENT '退厂在途变化量（暂时不用）',
  `return_qty` int(11) DEFAULT '0' COMMENT '退厂在途总量（暂时不用）',
  `borrow_offset` int(11) DEFAULT '0' COMMENT '借用在途变化量（暂时不用）',
  `borrow_qty` int(11) DEFAULT '0' COMMENT '借用在途总量（暂时不用）',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '记账时间',
  `create_timestamp` datetime(3) DEFAULT '2000-01-01 00:00:00.000' COMMENT '时间戳',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT '' COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`),
  KEY `idx_store_no` (`store_no`,`sku_no`,`order_unit_no`,`bill_date`,`item_no`),
  KEY `idx_ou_cost` (`sharding_flag`,`bill_date`,`order_unit_no`,`store_no`,`bill_type`,`in_out_flag`),
  KEY `IDX_inventory_book_his_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='商品库存台账历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_financial_book`
--

DROP TABLE IF EXISTS `inventory_financial_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_financial_book` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `order_unit_no_from` char(18) DEFAULT '' COMMENT '发方订货单位编码',
  `order_unit_no_to` char(18) DEFAULT '' COMMENT '收方订货单位编码',
  `store_no` char(18) DEFAULT '' COMMENT '机构编码',
  `company_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `order_unit_no` char(18) NOT NULL DEFAULT '' COMMENT '订货单位',
  `item_no` char(18) DEFAULT '' COMMENT '商品编码',
  `item_code` varchar(30) DEFAULT '' COMMENT '商品编码(出厂时的商品编码)',
  `item_name` char(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `category_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `sku_no` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'sku码',
  `size_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '尺寸编码',
  `bill_no` char(30) NOT NULL DEFAULT '' COMMENT '单据编码',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `in_out_flag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '出入库标志（-1：出库 1：入库）',
  `biz_type` int(11) DEFAULT '0' COMMENT '单据的业务类型',
  `account_type` tinyint(3) DEFAULT '0' COMMENT '0:记非实物库存、1：记实物库存',
  `bill_date` date NOT NULL DEFAULT '2000-01-01' COMMENT '业务发生日期',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价',
  `balance_offset` int(11) DEFAULT '0' COMMENT '正品库存发生量',
  `factory_in_offset` int(11) DEFAULT '0' COMMENT '厂入库在途变化量',
  `factory_in_diff_offset` int(11) DEFAULT '0' COMMENT '厂入库在途差异变化量',
  `transit_in_offset` int(11) DEFAULT '0' COMMENT '内区入库在途变化量',
  `transit_out_offset` int(11) DEFAULT '0' COMMENT '内区出库在途变化量',
  `in_diff_offset` int(11) DEFAULT '0' COMMENT '内区入库差异变化量',
  `out_diff_offset` int(11) DEFAULT '0' COMMENT '内区出库差异变化量',
  `transit_in_account_offset` int(11) DEFAULT '0' COMMENT '外区入库在途变化量',
  `transit_out_account_offset` int(11) DEFAULT '0' COMMENT '外区出库在途变化量',
  `in_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区入库差异变化量',
  `out_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区出库差异变化量',
  `lock_offset` int(11) DEFAULT '0' COMMENT '冻结变化量',
  `occupied_offset` int(11) DEFAULT '0' COMMENT '预占变化量',
  `backup_offset` int(11) DEFAULT '0' COMMENT '备货变化量',
  `guest_bad_offset` int(11) DEFAULT '0' COMMENT '客残变化量',
  `original_bad_offset` int(11) DEFAULT '0' COMMENT '原残变化量',
  `bad_transit_offset` int(11) DEFAULT '0' COMMENT '次品在途发生量',
  `bad_diff_offset` int(11) DEFAULT '0' COMMENT '次品在途差异变化',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '记账时间',
  `create_timestamp` datetime(3) DEFAULT '2000-01-01 00:00:00.000' COMMENT '时间戳',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) DEFAULT '' COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`),
  KEY `idx_inner_group` (`order_unit_no_from`,`order_unit_no_to`,`item_no`),
  KEY `idx_ou_cost` (`sharding_flag`,`bill_date`,`order_unit_no`,`store_no`,`bill_type`,`in_out_flag`),
  KEY `idx_test_billDate` (`bill_type`,`in_out_flag`),
  KEY `IDX_brand_no` (`brand_no`),
  KEY `idx_inner_group_brandANDcategory` (`order_unit_no_from`,`order_unit_no_to`,`brand_no`,`category_no`),
  KEY `idx_bill_no_sku` (`bill_no`,`sku_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存台账(财务用)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventory_financial_book_his`
--

DROP TABLE IF EXISTS `inventory_financial_book_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_financial_book_his` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '流水号',
  `order_unit_no_from` char(18) DEFAULT '' COMMENT '发方订货单位编码',
  `order_unit_no_to` char(18) DEFAULT '' COMMENT '收方订货单位编码',
  `store_no` char(18) DEFAULT '' COMMENT '机构编码',
  `company_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `order_unit_no` char(18) NOT NULL DEFAULT '' COMMENT '订货单位',
  `item_no` char(18) DEFAULT '' COMMENT '商品编码',
  `item_code` varchar(30) DEFAULT '' COMMENT '商品编码(出厂时的商品编码)',
  `item_name` char(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `category_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `sku_no` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'sku码',
  `size_no` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '尺寸编码',
  `bill_no` char(30) NOT NULL DEFAULT '' COMMENT '单据编码',
  `status` tinyint(3) DEFAULT '0' COMMENT '单据状态',
  `bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '单据类型',
  `in_out_flag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '出入库标志（-1：出库 1：入库）',
  `biz_type` int(11) DEFAULT '0' COMMENT '单据的业务类型',
  `account_type` tinyint(3) DEFAULT '0' COMMENT '0:记非实物库存、1：记实物库存',
  `bill_date` date NOT NULL DEFAULT '2000-01-01' COMMENT '业务发生日期',
  `cost` decimal(12,2) DEFAULT '0.00' COMMENT '含税单价',
  `balance_offset` int(11) DEFAULT '0' COMMENT '正品库存发生量',
  `factory_in_offset` int(11) DEFAULT '0' COMMENT '厂入库在途变化量',
  `factory_in_diff_offset` int(11) DEFAULT '0' COMMENT '厂入库在途差异变化量',
  `transit_in_offset` int(11) DEFAULT '0' COMMENT '内区入库在途变化量',
  `transit_out_offset` int(11) DEFAULT '0' COMMENT '内区出库在途变化量',
  `in_diff_offset` int(11) DEFAULT '0' COMMENT '内区入库差异变化量',
  `out_diff_offset` int(11) DEFAULT '0' COMMENT '内区出库差异变化量',
  `transit_in_account_offset` int(11) DEFAULT '0' COMMENT '外区入库在途变化量',
  `transit_out_account_offset` int(11) DEFAULT '0' COMMENT '外区出库在途变化量',
  `in_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区入库差异变化量',
  `out_diff_account_offset` int(11) DEFAULT '0' COMMENT '外区出库差异变化量',
  `lock_offset` int(11) DEFAULT '0' COMMENT '冻结变化量',
  `occupied_offset` int(11) DEFAULT '0' COMMENT '预占变化量',
  `backup_offset` int(11) DEFAULT '0' COMMENT '备货变化量',
  `guest_bad_offset` int(11) DEFAULT '0' COMMENT '客残变化量',
  `original_bad_offset` int(11) DEFAULT '0' COMMENT '原残变化量',
  `bad_transit_offset` int(11) DEFAULT '0' COMMENT '次品在途发生量',
  `bad_diff_offset` int(11) DEFAULT '0' COMMENT '次品在途差异变化',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '记账时间',
  `create_timestamp` datetime(3) DEFAULT '2000-01-01 00:00:00.000' COMMENT '时间戳',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) DEFAULT '' COMMENT '分库字段：本部+大区',
  PRIMARY KEY (`id`),
  KEY `idx_inner_group` (`order_unit_no_from`,`order_unit_no_to`,`item_no`),
  KEY `idx_ou_cost` (`sharding_flag`,`bill_date`,`order_unit_no`,`store_no`,`bill_type`,`in_out_flag`),
  KEY `idx_test_billDate` (`bill_type`,`in_out_flag`),
  KEY `IDX_brand_no` (`brand_no`),
  KEY `idx_inner_group_brandANDcategory` (`order_unit_no_from`,`order_unit_no_to`,`brand_no`,`category_no`),
  KEY `idx_bill_no_sku` (`bill_no`,`sku_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存台账(财务用)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_apply_confirm_dtl`
--

DROP TABLE IF EXISTS `invoice_apply_confirm_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_apply_confirm_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `order_no` char(32) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `order_dtl_id` char(32) COLLATE utf8_bin NOT NULL,
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算类型',
  `bill_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '单据类型，如：索赔、报废等',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编号',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编号',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态',
  `invoice_apply_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请单据号',
  `invoice_apply_date` date DEFAULT NULL COMMENT '开票申请日期',
  `invoice_amount` decimal(12,2) DEFAULT NULL COMMENT '发票金额',
  `out_start_date` date DEFAULT NULL COMMENT '销售日期',
  `out_end_date` date DEFAULT NULL COMMENT '销售日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`order_no`,`order_dtl_id`),
  KEY `IDX_invoice_apply_confirm_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='内购明细确认、开票申请关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_info`
--

DROP TABLE IF EXISTS `invoice_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `client_type` tinyint(3) DEFAULT NULL COMMENT '客户类型 1、公司 2、客户 3、商场 4、商业集团 5、供应商',
  `client_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码',
  `client_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  `invoice_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `invoice_type` tinyint(3) DEFAULT NULL COMMENT '发票类型 1、普通发票 2、增值票',
  `nc_client_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'nc客户编码',
  `nc_client_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'NC客户档案',
  `taxpayer_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '纳税人识别号',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `telephone_number` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码(可能存在多个电话)',
  `bank_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '开户行',
  `account_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '账号',
  `post_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '收票邮寄地址',
  `contact_person` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收票联系人',
  `contact_number` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '收票联系电话(可能存在多个电话)',
  `month` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态 1、已启用 0、已停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `client_short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '客户简称',
  PRIMARY KEY (`id`),
  KEY `IDX_invoice_info_update_time` (`update_time`) USING BTREE,
  KEY `idx_company_no` (`company_no`,`client_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开票信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_rule_set`
--

DROP TABLE IF EXISTS `invoice_rule_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_rule_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invoice_rule_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '申请编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `bsgroups_name` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `invoice_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `tax_registry_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `buyer_address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '客户-地址',
  `buyer_tel` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '客户-电话',
  `bank_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行帐号',
  `bank_account_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '银行账户名',
  `mailing_address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮寄地址',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人电话',
  `billing_method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '开票方式',
  `shop_group_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺分组',
  `invoice_temp_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票模板',
  `status` tinyint(3) DEFAULT NULL COMMENT '1启用、0停用状态',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_invoice_rule_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='开票申请规则设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_template_set`
--

DROP TABLE IF EXISTS `invoice_template_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_template_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invoice_temp_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '发票模版编号',
  `code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '模板编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '模板名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_invoice_template_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='发票模板设置主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_template_set_dtl`
--

DROP TABLE IF EXISTS `invoice_template_set_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_template_set_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invoicetemp_dtl_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '模版编号',
  `invoice_temp_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '发票模版编号',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码产品大类',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '类别名称',
  `type_model` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '规格型号',
  `invoice_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `qty_control_flag` tinyint(3) DEFAULT NULL COMMENT '是否启用数量控制（0：否，1：是）',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_invoice_template_set_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='发票模板设置明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '商品系统唯一编码(系统编码,对用户不可见)',
  `code` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '商品编码(出厂时的商品编码)',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品全称(默认与商品名称一致)',
  `en_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品英文名',
  `sys_no` varchar(10) COLLATE utf8_bin DEFAULT '00' COMMENT '所属业务单元',
  `style_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品款号',
  `brand_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌编码',
  `shoe_model` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '款型(下拉框选择,值: 1.5, 2, 2.5, 无)',
  `ingredients` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '主料(下拉框选择,值: 1:皮 2:布 3:绒 4:PU 5:木 6:弹力 7:\n\n网 8:其它 9:不涉及)',
  `mainqdb` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '面料成份',
  `lining` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '内里(D:单里 M:毛里 R:绒里 F:仿毛里)',
  `main_color` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '主色',
  `color_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色编码',
  `category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '类别编码',
  `root_category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品大类编码',
  `repeatlisting` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '重复上市(下拉框选择,值: 是, 否)',
  `gender` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '性别(下拉框选择,值: 男, 女, 童, 无性别)',
  `heeltype` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '跟型(下拉框选择,值: 高, 中, 低, 平, 不涉及)',
  `bottomtype` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '底型(下拉框选择,值: 成型底, 片底, 成型片, 不涉及)',
  `size_kind` char(2) COLLATE utf8_bin NOT NULL COMMENT '尺寸分类',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0 = 禁用 1 = 正常 2 = 临时)',
  `tag_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '牌价',
  `suggest_tag_price` decimal(10,2) NOT NULL COMMENT '建议牌价',
  `purchase_tax_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '含税采购价',
  `costtaxrate` decimal(4,2) DEFAULT NULL COMMENT '进项税率',
  `saletaxrate` decimal(4,2) DEFAULT NULL COMMENT '销项税率',
  `material_price` decimal(8,2) NOT NULL COMMENT '物料价',
  `supplier_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '供应商编码',
  `supplier_item_no` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商货号',
  `supplier_item_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商商品名称',
  `orderfrom` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '订货形式(下拉框选择,值: 1:自产 2:外购 3:地区自购)',
  `years` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '年份(指上市的年份,下拉框选择,值: 2006~2026,默认当年)',
  `sell_season` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '产品季节(下拉框选择,A:春 B:夏 C:秋 D:冬)',
  `purchase_season` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '季节',
  `sale_date` date DEFAULT NULL COMMENT '建议上柜日',
  `search_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '检索码',
  `style` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '风格',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `season` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '采购季节',
  `liner` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '衬里/內垫',
  `outsole` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '外底',
  `pattern` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '楦型',
  `item_code2` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '货号2',
  `ext_dev_prop` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '开发属性',
  `ext_brand_style` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌风格',
  `ext_style` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '风格',
  `ext_series` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '系列',
  `ext_spec_prop` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '特定属性',
  `item_style_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '款式编码(体育)',
  `item_series_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '系列编码(体育)',
  `japan_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '日本名称',
  `designer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '设计者',
  `origine_country` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '原产国',
  `japan_tag_price` decimal(10,2) DEFAULT NULL COMMENT '日本牌价',
  `japan_cost` decimal(10,2) DEFAULT NULL COMMENT '日本成本',
  `sale_year` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '上柜年',
  `sale_week` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '上柜周',
  `brand_season` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌季节',
  `item_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标志',
  `plate_code` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '板单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_item_no` (`item_no`) USING BTREE,
  UNIQUE KEY `uk_index_brand_category_item` (`brand_no`,`category_no`,`item_no`) USING BTREE,
  UNIQUE KEY `uk_index_category_brand_item` (`category_no`,`brand_no`,`item_no`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`,`brand_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1381186 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品资料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `item_category_brand`
--

DROP TABLE IF EXISTS `item_category_brand`;
/*!50001 DROP VIEW IF EXISTS `item_category_brand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `item_category_brand` AS SELECT 
 1 AS `item_no`,
 1 AS `category_no`,
 1 AS `category_name`,
 1 AS `brand_no`,
 1 AS `brand_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `item_cost`
--

DROP TABLE IF EXISTS `item_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_cost` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算公司编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '货品编号',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库编号(预留)',
  `location` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '库位(预留)',
  `lot` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '批次(预留)',
  `cost_method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '成本方法',
  `unit_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '单位成本',
  `unit` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '计量单位',
  `year` char(4) COLLATE utf8_bin NOT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin NOT NULL COMMENT '月份',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_no` (`company_no`,`item_no`,`year`,`month`) USING BTREE,
  KEY `IDX_item_cost_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成本主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup`
--

DROP TABLE IF EXISTS `lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '字典编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '字典名称',
  `type` tinyint(3) DEFAULT '0' COMMENT '字典类型(1 系统;0 普通)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_lookup_code` (`code`) USING BTREE,
  KEY `IDX_lookup_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='码表主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_entry`
--

DROP TABLE IF EXISTS `lookup_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_entry` (
  `lookup_entry_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '字典项编号',
  `lookup_id` int(11) NOT NULL COMMENT '字典ID',
  `code` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '字典编码',
  `opcode` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '特征码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '字典项名称',
  `order_no` int(8) DEFAULT NULL COMMENT '序号',
  `type` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '字典类型(1 系统;0 普通)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(1正常,0无效)',
  `default_flag` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '是否选中',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`lookup_entry_no`),
  UNIQUE KEY `uk_lookup` (`lookup_id`,`code`) USING BTREE,
  KEY `IDX_lookup_entry_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据字典项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lookup_rel`
--

DROP TABLE IF EXISTS `lookup_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
  `lookup_id` int(11) NOT NULL COMMENT '字典编号',
  `lookup_entry_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '字典项编号',
  `sub_lookup_id` int(8) DEFAULT NULL COMMENT '子字典编号',
  `sub_lp_entry_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '子字典项编号',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_lookup_entry` (`sub_lookup_id`,`lookup_id`,`sub_lp_entry_no`,`lookup_entry_no`) USING BTREE,
  KEY `IDX_lookup_rel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44681 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据字典关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mall`
--

DROP TABLE IF EXISTS `mall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商场ID',
  `mall_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商场编码',
  `name` varchar(120) CHARACTER SET utf8 NOT NULL COMMENT '商场名称',
  `bi_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT 'BI商场名称',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市编码',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_mall_no` (`mall_no`) USING BTREE,
  KEY `IDX_mall_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68572 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mall_balance_diff_type`
--

DROP TABLE IF EXISTS `mall_balance_diff_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_balance_diff_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `diff_type_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '差异类型编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '差异类型名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0 = 停用 1 = 启用)',
  `system_init` tinyint(3) DEFAULT '1' COMMENT '是否系统初始参数设置(0 = 系统初始化 1 = 创建)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_mall_balance_diff_type_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场结算差异类型设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mall_balance_setting`
--

DROP TABLE IF EXISTS `mall_balance_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_balance_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `biz_city_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市编号',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `shop_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '店铺编码',
  `mall_type` tinyint(3) DEFAULT '1' COMMENT '商场类型(下拉选择 1:百货商场 2:超市商场 3:购物中心 4:街铺 5:运动城 6:其它)',
  `bill_unit` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '开票单位',
  `month` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_mall_balance_setting_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算期设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mall_deduction_set`
--

DROP TABLE IF EXISTS `mall_deduction_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mall_deduction_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deduction_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '扣费编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '扣费名称',
  `cost_code` char(18) COLLATE utf8_bin NOT NULL COMMENT '总账费用类别编码',
  `cost_name` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT 'null' COMMENT '总账费用类别名称',
  `type` tinyint(3) DEFAULT NULL COMMENT '扣费类型',
  `debited_rental` tinyint(3) DEFAULT NULL COMMENT '是否是场地经营费用（0=不是 1=是）',
  `system_init` tinyint(3) DEFAULT '1' COMMENT '是否系统初始参数设置(0 = 系统初始化 1 = 创建)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0 = 停用 1 = 启用)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_mall_deduction_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场扣费名目设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_order_dtl`
--

DROP TABLE IF EXISTS `member_order_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_order_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '店铺编号',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态',
  `invoice_amount` decimal(12,2) DEFAULT NULL COMMENT '发票金额',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `out_start_date` date DEFAULT NULL COMMENT '销售日期',
  `out_end_date` date DEFAULT NULL COMMENT '销售日期',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编号',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_member_order_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='内购明细财务确认状态关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memorandum`
--

DROP TABLE IF EXISTS `memorandum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memorandum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `execution_time` datetime DEFAULT NULL COMMENT '执行时间',
  `create_no` int(11) DEFAULT NULL COMMENT '创建人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_memorandum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='备忘录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nc_finished_goods`
--

DROP TABLE IF EXISTS `nc_finished_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nc_finished_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `brand_unit_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编码',
  `brand_unit_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `category_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `direction` tinyint(3) DEFAULT NULL COMMENT '方向（1：借，2：贷）',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(20,4) DEFAULT NULL COMMENT '金额',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `year` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '年(yyyy)',
  `month` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '月(mm)',
  PRIMARY KEY (`id`),
  KEY `IDX_nc_fingoods_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='NC库存商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `official_item`
--

DROP TABLE IF EXISTS `official_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `official_item` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `quote_no` char(32) COLLATE utf8_bin NOT NULL COMMENT '报价单号',
  `item_code` char(30) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编码',
  `brand_unit_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '小类编码',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '小类名称',
  `root_category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `root_category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `style_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '款号',
  `year_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '年份编码',
  `year` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `season_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '季节编码',
  `season` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '季节',
  `aprice` decimal(9,2) DEFAULT '0.00' COMMENT '核定价',
  `qprice` decimal(9,2) DEFAULT '0.00' COMMENT '报价',
  `sys_price` decimal(9,2) DEFAULT '0.00' COMMENT '系统进货价',
  `excess_status` tinyint(3) DEFAULT NULL COMMENT 'OA超额状态(-1：未超额，1：超额OA未处理，2超额OA已处理)',
  `excess_status_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT 'OA超额状态名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_item_code` (`item_code`,`supplier_no`,`brand_no`,`year`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='官方项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `often_use_menu`
--

DROP TABLE IF EXISTS `often_use_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `often_use_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '菜单名',
  `url` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单链接',
  `user_id` char(11) COLLATE utf8_bin NOT NULL COMMENT '用户id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_often_use_menu_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='常用菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operate_log`
--

DROP TABLE IF EXISTS `operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operate_log` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `data_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '数据编码',
  `module_no` tinyint(3) NOT NULL COMMENT '模块编码(枚举类表示)',
  `operate_no` tinyint(3) DEFAULT NULL COMMENT '操作编码(枚举表示:新增、修改、删除...)',
  `status` tinyint(3) DEFAULT NULL COMMENT '单据状态',
  `status_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '单据状态名称',
  `operate_status` tinyint(3) DEFAULT NULL COMMENT '操作状态(1、通过 0、打回)',
  `operate_status_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作状态名称',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_operate_log_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_assistant`
--

DROP TABLE IF EXISTS `order_assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_assistant` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `order_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `order_dtl_id` char(32) COLLATE utf8_bin NOT NULL COMMENT '订单明细主键ID',
  `assistant_id` char(32) COLLATE utf8_bin NOT NULL COMMENT '营业员主键ID',
  `assistant_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '营业员工号',
  `assistant_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '营业员姓名',
  `share_amount` decimal(20,2) DEFAULT NULL COMMENT '分摊金额,按营业员分摊金额',
  `share_qty` decimal(20,2) DEFAULT '0.00' COMMENT '分摊数量,按营业员分摊数量',
  `counts` tinyint(1) NOT NULL DEFAULT '1' COMMENT '营业员人数,单条营业员人数',
  `order_type` tinyint(1) DEFAULT NULL COMMENT '订单类型，0-销售，1-换货，2-退货',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  KEY `order_dtl_id` (`order_dtl_id`) USING BTREE,
  KEY `IDX_order_assistant_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售订单明细-营业员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_customer_address`
--

DROP TABLE IF EXISTS `order_customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_customer_address` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `order_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `receiving_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
  `receiving_tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货电话',
  `zip_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `receiving_address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收货地址',
  `order_type` tinyint(1) DEFAULT NULL COMMENT '订单类型，0-销售，1-换货，2-退货',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  `province` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `city` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '城市',
  `county` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '县（区）',
  PRIMARY KEY (`id`),
  KEY `IDX_order_customer_address_update_time` (`update_time`) USING BTREE,
  KEY `idx_order_no` (`order_no`),
  KEY `uq_order_no` (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售订单-收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_dtl`
--

DROP TABLE IF EXISTS `order_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `order_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `ref_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '特卖备货单号',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售门店编码',
  `shop_name` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '销售门店',
  `shop_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '调货(转货)门店编码',
  `shop_name_from` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '调货(转货)门店',
  `sku_no` char(32) COLLATE utf8_bin NOT NULL COMMENT '商品SKU',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品内码',
  `size_no` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '商品尺码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `barcode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品条码',
  `brand_no` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '所属品牌',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `years` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份(指上市的年份,下拉框选择,值: 2006~2026,默认当年)',
  `region_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '片区编码',
  `region_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '片区名称',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '明细备注',
  `item_flag` tinyint(1) DEFAULT '0' COMMENT '商品类型,0-正常 1-赠品 促销标识',
  `tag_price` decimal(20,2) DEFAULT NULL COMMENT '商品牌价',
  `tag_price_nation` decimal(12,2) DEFAULT '0.00' COMMENT '全国统一牌价',
  `sale_price` decimal(20,2) DEFAULT NULL COMMENT '商品现价',
  `disc_price` decimal(20,2) DEFAULT NULL COMMENT '商品折扣价',
  `settle_price` decimal(20,2) DEFAULT NULL COMMENT '商品结算价',
  `reduce_price` decimal(20,2) DEFAULT NULL COMMENT '减价,单价减价',
  `rebate_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡折让金额',
  `score_amount` decimal(20,2) DEFAULT NULL COMMENT '积分兑换金额',
  `qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '商品总金额,(结算价-减价)*数量',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `region_cost` decimal(12,2) DEFAULT '0.00' COMMENT '地区成本',
  `unit_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '单位成本',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `material_price` decimal(12,2) DEFAULT '0.00' COMMENT '物料价',
  `factory_price` decimal(12,2) DEFAULT '0.00' COMMENT '厂进价',
  `pref_price` decimal(20,2) DEFAULT NULL COMMENT '促销优惠单价,促销优惠单价',
  `pro_no` varchar(130) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动编号，多个以逗号隔开',
  `pro_name` varchar(310) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动名称，多个以逗号隔开',
  `special_sell_flag` tinyint(4) DEFAULT '0' COMMENT '是否特卖,0-正常 1-特卖',
  `discount` decimal(10,4) DEFAULT NULL COMMENT '最终扣率,如17.00代表17.00%',
  `discount_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码，如A,B',
  `discount_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率名称',
  `discount_type` tinyint(1) DEFAULT NULL COMMENT '扣率类型 ( 1-合同正价扣 2-合同阶梯扣 3-促销扣率)',
  `discount_type_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最终扣率来源名称',
  `discount_source_id` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '最终扣率来源编号',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商场结算码',
  `properties` tinyint(3) DEFAULT NULL COMMENT '属性,1-满送 2-满减 3-折扣 4-其他',
  `virtual_flag` tinyint(3) DEFAULT NULL COMMENT '虚实,0-虚数 1-实数',
  `strength` decimal(8,2) DEFAULT NULL COMMENT '力度',
  `activity_type_name` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '活动类型名称',
  `activity_type` tinyint(3) DEFAULT NULL COMMENT '活动类型',
  `launch_type_name` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '发起方式名称',
  `launch_type` tinyint(3) DEFAULT NULL COMMENT '发起方式,1-商场发起 2-品牌公司发起',
  `pro_end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `pro_start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `balance_base` tinyint(1) DEFAULT '0' COMMENT '结算基数,0-销售金额 1-牌价金额',
  `vip_discount` decimal(10,4) DEFAULT NULL COMMENT '会员折数',
  `vip_level_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '会员等级名称',
  `vip_level_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '会员等级Code',
  `base_score` int(11) NOT NULL DEFAULT '0' COMMENT '基本积分',
  `pro_score` int(11) NOT NULL DEFAULT '0' COMMENT '整单分摊积分',
  `cost_score` int(11) DEFAULT '0' COMMENT '消费积分',
  `item_discount` decimal(10,4) DEFAULT NULL COMMENT '商品折数,如25.00代表25.00%',
  `color_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色编码',
  `color_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色名称',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `reduce_price_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '减价原因,当减价不为空，减价原因必填',
  `reason_class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类名称',
  `reason_class_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类编号',
  `reason_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '原因编码',
  `size_kind` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '尺码种类',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `bill_transfer_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '店转货单号,只有跨店销售（本店自提）才有数据',
  `price_change_bill_no` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '变价单单号',
  `return_exchange_num` smallint(4) DEFAULT '0' COMMENT '退换货数量，该条明细退换货数量',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `across_sale_flag` tinyint(1) DEFAULT '1' COMMENT '商品是否跨店销售标识 0-否 1-是',
  `specified_discount_flag` tinyint(1) DEFAULT '0' COMMENT '是否指定扣率 0-不指定扣率 1-指定扣率',
  `pickup_status` tinyint(1) DEFAULT '1' COMMENT '明细提货状态, 1-未提 2-已提 3-已提未扣(预留) 4-已提已扣(预留)',
  `take_off_type` tinyint(1) DEFAULT '0' COMMENT '欠客类型,0-正常(含正常销售、退换货、团购、特卖) 1-欠客 2-有实物无库存(预留) 3-跨店销售',
  `pickup_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '明细提货人',
  `pickup_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '明细提货人编号',
  `pickup_time` datetime DEFAULT NULL COMMENT '明细提货时间。非欠客-收银出库时间；欠客-提货时间',
  `invoice_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号(MPS),多个用逗号(,)分隔',
  `actual_amount` decimal(20,2) DEFAULT '0.00' COMMENT '实际销售金额(优惠券价值+结算金额)',
  `real_buy_amount` decimal(20,2) DEFAULT '0.00' COMMENT '券实收金额分摊额(优惠券优惠金额)',
  `surplus_amount` decimal(20,2) DEFAULT '0.00' COMMENT '用券金额(优惠券价值)',
  `rate_discount` decimal(20,4) DEFAULT '0.0000' COMMENT '促销折扣',
  `dtl_refund_status` tinyint(1) DEFAULT '30' COMMENT '10 申请退款 11 退款成功 30 未退款 默认30',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  `style_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '款号',
  `change_state` tinyint(4) DEFAULT '0' COMMENT '改价状态：0：正常，1：手动改价，2：申请改价',
  `change_audit_state` tinyint(4) DEFAULT '0' COMMENT '改价审核状态：0：正常，1：未审核，2：已审核',
  `change_state_audit_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '改价审核人',
  `change_state_audit_time` datetime DEFAULT NULL COMMENT '改价审核时间',
  `rate_pro_no` varchar(130) COLLATE utf8_bin DEFAULT NULL COMMENT '并行活动时所使用的扣率的活动编码',
  `rate_pro_name` varchar(130) COLLATE utf8_bin DEFAULT NULL COMMENT '并行活动时所使用的扣率的活动名称',
  `biz_city_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市编号',
  `biz_city_name` char(240) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` char(240) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `zone_code` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编码(有且必须只能输入一位)',
  `zone_name` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `item_style_no` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '款式编码(体育)',
  `item_series_no` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '系列编码(体育)',
  `management_area_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理区域编码',
  `management_area_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '管理区域名称',
  `order_taking` int(11) DEFAULT NULL COMMENT '是否已接单,0-正常 1-已接，2-未接,3-拒绝接单,4-待派单',
  `express_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `logistics_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司编号',
  `logistics_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `message_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '短信验证码',
  `check_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '提货经办人名称',
  `check_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '提货经办人编号',
  `pickup_date` date DEFAULT NULL COMMENT '提货日期',
  PRIMARY KEY (`id`),
  KEY `item_no` (`item_no`,`order_no`) USING BTREE,
  KEY `IDX_001` (`order_no`,`brand_no`,`item_no`,`item_code`,`sku_no`) USING BTREE,
  KEY `idx_take_off_type` (`take_off_type`,`order_no`,`item_no`,`item_code`,`id`) USING BTREE,
  KEY `IDX_order_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售订单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_main`
--

DROP TABLE IF EXISTS `order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_main` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,主键',
  `fas_bill_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'FAS单据类型编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `order_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `ref_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '销售门店编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '销售门店名称',
  `shop_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方—店铺编号',
  `shop_name_from` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '发货方-店铺名称',
  `serial_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '流水号',
  `out_date` date NOT NULL COMMENT '销售日期',
  `qty` int(11) DEFAULT NULL COMMENT '总商品数量',
  `tag_price_amount` decimal(20,2) DEFAULT NULL COMMENT '本单牌价总金额',
  `sale_price_amount` decimal(20,2) DEFAULT NULL COMMENT '本单现价总金额',
  `disc_price_amount` decimal(20,2) DEFAULT NULL COMMENT '本单折后价总金额',
  `settle_amount` decimal(20,2) DEFAULT NULL COMMENT '本单结算总金额',
  `reduce_amount` decimal(20,2) DEFAULT NULL COMMENT '本单减价总金额,(单商品减价*数量)之和',
  `total_rebate_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡总折让金额 ',
  `pref_amount` decimal(20,2) DEFAULT NULL COMMENT '促销优惠总金额',
  `coupon_amount` decimal(20,2) DEFAULT NULL COMMENT '优惠券总金额',
  `all_amount` decimal(20,2) DEFAULT NULL COMMENT '订单应收总金额',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '订单实收总金额,订单应收总金额+优惠券总金额+找零金额',
  `remain_amount` decimal(20,2) DEFAULT NULL COMMENT '订单找零金额',
  `score_amount` decimal(20,2) DEFAULT NULL COMMENT '积分兑换总金额',
  `assistant_name` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员姓名,营业员姓名，多个营业员使用逗号隔开',
  `assistant_id` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员主键ID',
  `assistant_no` varchar(210) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员工号',
  `vip_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '会员卡号',
  `vip_brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '会员所属卡品牌',
  `vip_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '会员姓名',
  `vip_phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '会员手机号',
  `wildcard_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '外卡编号',
  `wildcard_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '外卡名称',
  `wildcard_discount` decimal(10,4) DEFAULT NULL COMMENT '外卡折数',
  `base_score` int(11) NOT NULL DEFAULT '0' COMMENT '基本总积分',
  `pro_score` int(11) NOT NULL DEFAULT '0' COMMENT '整单分摊总积分',
  `cost_score` int(11) DEFAULT '0' COMMENT '消费总积分',
  `order_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否换货的订单,0-正常 1-换货 默认为0 1-为换货时产生的新订单',
  `business_type` tinyint(1) NOT NULL COMMENT '订单业务类型,0-正常销售 1-跨店销售 2-商场团购 3-内购 4-员购 5-专柜团购 6-特卖销售 默认为0',
  `biz_type_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型编号',
  `biz_type_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型名称',
  `order_source` tinyint(1) DEFAULT '0' COMMENT '订单来源,0-PC端 1-PDA端 2-微店 3-订单导入 4-离线PDA端 5-第三方平台 6-O2O商城',
  `daily_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '日结标识,0-未日结 1-已日结 默认为0',
  `daily_datetime` datetime DEFAULT NULL COMMENT '日结时间',
  `monthly_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '月结账标识,0-未月结 1-已月结 默认为0',
  `monthly_datetime` datetime DEFAULT NULL COMMENT '月结账时间',
  `balance_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态,0-已创建 10-已挂起 11-已取消 20-已审核 30-已收银未发货 41-已收银已发货 99-已完结',
  `actual_postage` decimal(20,2) DEFAULT NULL COMMENT '实收运费',
  `message_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '短信验证码',
  `express_company` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '快递公司',
  `bill_transfer_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '店转货单号,只有跨店销售（本店自提）才有数据,多张点转货单用逗号隔开',
  `express_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `logistics_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司编号',
  `take_mode` tinyint(1) DEFAULT NULL COMMENT '提货方式,0-本店自提 1-邻店自提',
  `logistics_mode` tinyint(1) DEFAULT NULL COMMENT '物流方式 1-自提 2-快递 3-现提',
  `market_ticket_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商场小票号',
  `lock_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '锁单标识,0-未锁单 1-已锁单',
  `return_exchange_time` tinyint(3) DEFAULT '0' COMMENT '退换货次数',
  `shop_terminal_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '门店收银终端号',
  `invoice_apply_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '开票申请单号,类型为团购才有值',
  `invoice_apply_date` datetime DEFAULT NULL COMMENT '开票申请日期,类型为团购才有值',
  `invoice_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_amount` decimal(20,2) DEFAULT NULL COMMENT '发票金额',
  `invoice_date` date DEFAULT NULL COMMENT '开票日期',
  `pickup_date` date DEFAULT NULL COMMENT '提货日期',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `check_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '提货经办人编号',
  `check_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '提货经办人名称',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人编号',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL COMMENT '创建时间,订单创建',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人编号',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `adjust_flag` tinyint(1) DEFAULT '0' COMMENT '是否改单，0-未改单，1-日结前改单， 2-日结后改单',
  `adjust_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '改单人',
  `adjust_time` datetime DEFAULT NULL COMMENT '改单日期',
  `adjust_order_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '改单原因',
  `reason_class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类名称',
  `reason_class_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类编号',
  `reason_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '原因编码',
  `responsibility_name` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '改单责任人',
  `responsibility_no` varchar(210) COLLATE utf8_bin DEFAULT NULL COMMENT '改单申请人编码',
  `responsibility_id` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '改单责任人ID',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  `remain_score` int(11) DEFAULT NULL COMMENT '有效积分',
  `accumulated_score` int(11) DEFAULT NULL COMMENT '累计积分',
  `notice_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '通知人',
  `notice_time` datetime DEFAULT NULL COMMENT '通知时间',
  `notice_flag` tinyint(1) DEFAULT '0' COMMENT '是否通知 0-未通知 1-通知',
  `pay_time` datetime DEFAULT NULL COMMENT '收银时间，只记录第一次收银时间',
  `refund_status` tinyint(3) DEFAULT '30' COMMENT '10 申请退款 11 退款成功 默认30',
  `take_off_type` tinyint(3) DEFAULT '1' COMMENT '跨月欠客标志(财务专用)：0 - 无跨月欠客, 1 - 存在跨月欠客',
  `place_date` date DEFAULT NULL COMMENT '下单日期',
  `reprint` tinyint(2) DEFAULT '0' COMMENT '重打累计次数，默认为0',
  `adjust_inventory_flag` tinyint(1) DEFAULT '1' COMMENT '是否调整库存, 0-不调整库存 1-调整库存，默认1',
  `platform_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '平台代码',
  `platform_name` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '平台名称',
  `delivery_time` datetime DEFAULT NULL COMMENT '配送时间',
  `delivery_date` date DEFAULT NULL COMMENT '送货日期',
  `invoice_type` tinyint(1) DEFAULT NULL COMMENT '发票类型 1:普通发票 3:不需要发票(O2O)',
  `invoice_unit` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '发票抬头(O2O)',
  `invoice_content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发票内容(O2O)',
  `is_package_mail_flag` tinyint(1) DEFAULT NULL COMMENT '是否包邮,0-正常 1-不包邮 2-包邮',
  `years` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '销售年份',
  `months` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '销售月份',
  `client_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编号',
  `client_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `IDX_001` (`shop_no`,`out_date`,`status`,`order_no`,`order_type`,`business_type`,`biz_type_code`) USING BTREE,
  KEY `IDX_002` (`out_date`,`business_type`,`status`,`order_no`,`shop_no`,`order_type`,`biz_type_code`) USING BTREE,
  KEY `status` (`status`,`out_date`,`shop_no`,`order_no`,`serial_no`,`id`) USING BTREE,
  KEY `IDX_order_main_update_time` (`update_time`) USING BTREE,
  KEY `day_report` (`id`,`status`,`out_date`,`business_type`) USING BTREE,
  KEY `company_no` (`company_no`) USING BTREE,
  KEY `year_month` (`years`,`months`) USING BTREE,
  KEY `IDX_owe` (`company_no`,`out_date`,`status`,`take_off_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_payway`
--

DROP TABLE IF EXISTS `order_payway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payway` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `order_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `pay_code` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '支付方式代号',
  `pay_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '支付方式名称',
  `payway_num` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式编号,卡号、券号、结算号',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '金额',
  `poundage` decimal(20,7) DEFAULT NULL COMMENT '银行手续费',
  `rate` decimal(20,5) DEFAULT NULL COMMENT '费率（fas财务确认）',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态(0-是 1-否)',
  `payway_flag` tinyint(3) DEFAULT NULL COMMENT '支付类型,1-虚拟支付',
  `payway_ticket_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '支付小票流水号',
  `payway_datetime` datetime NOT NULL COMMENT '支付时间',
  `out_date` date DEFAULT NULL COMMENT '销售日期',
  `order_type` tinyint(3) DEFAULT NULL COMMENT '订单类型，0-销售，1-换货，2-退货',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人',
  `auditor_time` datetime DEFAULT NULL COMMENT '确认时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  KEY `order_no` (`order_no`,`out_date`) USING BTREE,
  KEY `out_date` (`out_date`,`order_no`) USING BTREE,
  KEY `IDX_order_payway_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售订单-支付记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_promotion_dtl`
--

DROP TABLE IF EXISTS `order_promotion_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_promotion_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `seq_id` int(11) DEFAULT NULL COMMENT '顺序号',
  `order_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '业务编号,订单号或退换货号',
  `order_dtl_id` char(32) COLLATE utf8_bin NOT NULL COMMENT '业务明细ID',
  `pro_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动编号',
  `pro_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动名称',
  `special_sell_flag` tinyint(4) DEFAULT '0' COMMENT '是否特卖,0-正常 1-特卖',
  `discount` decimal(10,4) DEFAULT NULL COMMENT '扣率,如17.00代表17.00%',
  `discount_type` tinyint(1) DEFAULT NULL COMMENT '扣率类型 ( 1-合同正价扣 2-合同阶梯扣 3-促销扣率)',
  `discount_source_id` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率来源编号',
  `order_type` tinyint(1) DEFAULT NULL COMMENT '订单类型，0-销售，1-换货，2-退货',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `create_user_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '创建人编号',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `launch_type` tinyint(4) DEFAULT '2' COMMENT '活动来源,1-公司活动 2-商场活动',
  `rate_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码,A B...',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `activity_describe` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '活动描述',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  KEY `idx_001` (`pro_no`) USING BTREE,
  KEY `IDX_order_promotion_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售订单-促销活动明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_sale_wildcard_record`
--

DROP TABLE IF EXISTS `order_sale_wildcard_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_sale_wildcard_record` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,主键',
  `wildcard_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '外卡编码',
  `wildcard_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '外卡名称',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人编号',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人编号',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_wildcard_no_record` (`wildcard_no`) USING BTREE,
  KEY `IDX_order_sale_wildcard_record_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='外卡记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_unit`
--

DROP TABLE IF EXISTS `order_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订货单位ID',
  `order_unit_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '订货单位编号',
  `order_unit_code` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '订货单位编码',
  `organ_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '管理城市编号',
  `name` varchar(240) CHARACTER SET utf8 NOT NULL COMMENT '订货单位名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `status` tinyint(3) DEFAULT '1' COMMENT '1有效，0无效',
  `create_user` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '检索码',
  `type` tinyint(3) DEFAULT NULL COMMENT '订货单位类型(0 品牌部;1 批发客户)',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  `order_no` int(11) DEFAULT NULL COMMENT '序列号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_unit_no` (`order_unit_no`) USING BTREE,
  KEY `IDX_order_unit_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15095 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订货单位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_unit_company`
--

DROP TABLE IF EXISTS `order_unit_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_unit_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_unit_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '订货单位编码',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态( 0:冻结,1:正常,9:撤销)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_001` (`order_unit_no`,`company_no`,`effective_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订货单位公司关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `orderunit_company_zone`
--

DROP TABLE IF EXISTS `orderunit_company_zone`;
/*!50001 DROP VIEW IF EXISTS `orderunit_company_zone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderunit_company_zone` AS SELECT 
 1 AS `order_unit_no`,
 1 AS `company_no`,
 1 AS `zone_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `org_unit_brand_rel`
--

DROP TABLE IF EXISTS `org_unit_brand_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_unit_brand_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `store_no` char(18) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '仓库(店铺)编码',
  `store_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '机构代号',
  `store_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库(店铺)名称',
  `org_search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库(店铺)检索码',
  `order_unit_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '订货单位编号',
  `order_unit_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '订货单位编码',
  `order_unit_name` varchar(240) CHARACTER SET utf8 NOT NULL COMMENT '订货单位名称',
  `order_search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '订货单位检索码',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `shop_store_no` varchar(18) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '店仓编码',
  `shop_store_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店仓代号',
  `shop_store_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店仓名称',
  `store_search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '店仓检索码',
  `org_type` bigint(20) NOT NULL DEFAULT '0' COMMENT '组织类型',
  `zone_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '经营区域编号',
  `zone_name` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '经营区域名称',
  `brand_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌编码',
  `status` tinyint(3) DEFAULT NULL COMMENT '仓库(店铺)状态',
  `store_type` tinyint(3) DEFAULT NULL COMMENT '机构类型(21:店仓  22:仓库)',
  `rel_status` tinyint(3) DEFAULT NULL COMMENT '关系状态',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `organ_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '经营城市编号',
  `wms_store_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流仓库代号',
  `wms_store_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '物流仓库名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_brand_order_no` (`store_no`,`order_unit_no`,`brand_no`,`zone_no`,`org_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='仓库(店铺)和订货单、位品牌关系信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organ`
--

DROP TABLE IF EXISTS `organ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organ` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `organ_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '组织编号',
  `organ_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '组织编码',
  `name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '组织名称',
  `parent_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '上级组织编码',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '1有效，0无效',
  `organ_level` int(11) DEFAULT NULL COMMENT '组织级别,1 管理城市,2 经营城市',
  `order_no` int(11) DEFAULT '0' COMMENT '序号',
  `path` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '组织路径',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_organ` (`organ_no`,`parent_no`) USING BTREE,
  KEY `IDX_organ_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30107 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组织关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `other_deduction`
--

DROP TABLE IF EXISTS `other_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_deduction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方编号',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方编号',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方名称',
  `area_buyer_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '地区公司编码 (多选)',
  `area_buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '地区公司名称 (多选)',
  `balance_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `balance_type` tinyint(3) DEFAULT NULL COMMENT '结算单类型',
  `balance_status` tinyint(3) DEFAULT NULL COMMENT '结算单状态',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '产品大类编号',
  `category_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '产品大类名称',
  `currency_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '币别',
  `currency_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '币别名称',
  `deduction_category` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '扣项分类',
  `deduction_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '扣项名称',
  `deduction_qty` int(12) DEFAULT NULL COMMENT '扣项数量',
  `deduction_date` date DEFAULT NULL COMMENT '扣项日期',
  `return_amount` decimal(20,2) DEFAULT '0.00' COMMENT '残鞋金额',
  `fine_amount` decimal(20,2) DEFAULT '0.00' COMMENT '罚款金额',
  `deduction_amount` decimal(20,2) DEFAULT '0.00' COMMENT '扣项金额',
  `no_pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '未付款金额',
  `pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已付款金额',
  `due_date` date DEFAULT NULL COMMENT '到期日',
  `pay_status` tinyint(3) DEFAULT '0' COMMENT '付款状态(0,未付款;1,部分付款,2全部付款)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `status` tinyint(3) DEFAULT '0' COMMENT '是否更新到余额(0否,1是)',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '出库单号',
  `type` tinyint(3) DEFAULT '0' COMMENT '扣项类型(0-其他扣项 1-返利 2-其他费用)',
  PRIMARY KEY (`id`),
  KEY `IDX_other_deduction_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='其他扣项明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_dtl`
--

DROP TABLE IF EXISTS `param_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `param_code` char(25) COLLATE utf8_bin DEFAULT NULL,
  `dtl_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '参数名称',
  `dtl_value` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值',
  `isvalid` tinyint(4) NOT NULL COMMENT '是否有效 0-有效 1-无效',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_code` (`param_code`,`dtl_value`),
  KEY `IDX_param_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1600000533 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='参数明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `param_main`
--

DROP TABLE IF EXISTS `param_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `param_code` char(25) COLLATE utf8_bin DEFAULT NULL,
  `param_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名称',
  `lookup_level` tinyint(4) DEFAULT NULL COMMENT '参数级别 0=不允许修改，1=允许客户化修改',
  `control_level` tinyint(3) DEFAULT NULL COMMENT '控制级别 0、公用 1、大区 2、公司 3、店铺',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_code` (`param_code`),
  KEY `IDX_param_main_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1600000302 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='参数主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_relationship`
--

DROP TABLE IF EXISTS `pay_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_relationship` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `business_bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '业务单据编码',
  `ref_asn_bill_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '关联到货单号',
  `business_bill_type` int(11) DEFAULT NULL COMMENT '业务单据类型',
  `business_biz_type` smallint(6) DEFAULT NULL COMMENT '业务单据业务类型',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '买方公司编码',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '买方公司名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方公司编码',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '卖方公司名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `category_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `due_date` date DEFAULT NULL COMMENT '到期日',
  `qty` int(11) DEFAULT '0' COMMENT '数量',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `not_tax_amount` decimal(20,2) DEFAULT '0.00' COMMENT '结算金额(不含税)',
  `pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已付款金额',
  `no_pay_amount` decimal(20,2) DEFAULT '0.00' COMMENT '未付款金额',
  `prepay_amount` decimal(20,2) DEFAULT NULL COMMENT '预付款金额',
  `pay_status` tinyint(3) DEFAULT NULL COMMENT '付款状态（0:未付款;1:部分付款;2：全部付款）',
  `audit_status` tinyint(3) DEFAULT NULL COMMENT '审核状态(0、未审核 1、已审核)',
  `balance_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单号',
  `settlement_number` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '结算号',
  `supplier_amount` decimal(20,2) DEFAULT '0.00' COMMENT '厂商金额',
  `not_tax_supplier_amount` decimal(20,2) DEFAULT '0.00' COMMENT '厂商金额(不含税)',
  `order_type` tinyint(3) DEFAULT NULL COMMENT '订货类型',
  `tag_amount` decimal(20,2) DEFAULT '0.00' COMMENT '牌价额',
  `supplier_contract_discount_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '厂商折扣编码',
  `company_contract_discount_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '地区折扣编码',
  `algorithm` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '厂商结算价算法(含税)',
  `zone_price_basis` tinyint(3) DEFAULT NULL COMMENT '地区定价依据(1:牌价;2:终端销售金额;3:排挤)',
  `zone_original_discount1` decimal(9,5) DEFAULT NULL COMMENT '地区原折扣1',
  `zone_original_discount2` decimal(9,5) DEFAULT NULL COMMENT '地区原折扣2',
  `zone_add_price` decimal(20,2) DEFAULT NULL COMMENT '地区加价',
  `zone_discount` decimal(9,5) DEFAULT NULL COMMENT '地区折扣',
  `zone_amount` decimal(20,2) DEFAULT '0.00' COMMENT '地区额',
  `zone_algorithm` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '地区结算价算法',
  `order_no` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '订单号',
  `supplier_send_date` date DEFAULT NULL COMMENT '供应商发货日',
  `store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库编码',
  `store_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库名称',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '货管单位编码',
  `order_unit_name` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '货管单位名称',
  `create_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `not_tax_algorithm` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '厂商结算价算法(不含税)',
  `supplier_discount1` decimal(9,5) DEFAULT NULL COMMENT '厂商折扣1',
  `supplier_discount2` decimal(9,5) DEFAULT NULL COMMENT '厂商折扣2',
  `balance_discount1` decimal(9,5) DEFAULT NULL COMMENT '对账折扣1',
  `balance_discount2` decimal(9,5) DEFAULT NULL COMMENT '对账折扣2',
  `balance_flag` tinyint(3) DEFAULT '0' COMMENT '对账标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_business_bill_no` (`business_bill_no`) USING BTREE,
  KEY `IDX_settlement_number` (`settlement_number`),
  KEY `IDX_bill_date` (`bill_date`),
  KEY `IDX_balance_no` (`balance_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='付款关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_sale_check`
--

DROP TABLE IF EXISTS `pay_sale_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_sale_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `terminal_number` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `sale_time` datetime DEFAULT NULL COMMENT '销售日期',
  `pay_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  `sale_amount` decimal(20,2) DEFAULT NULL COMMENT '销售金额',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人',
  `auditor_time` datetime DEFAULT NULL COMMENT '确认时间',
  `status` tinyint(3) DEFAULT '1' COMMENT '财务确认(0-是 1-否)',
  `sales_order_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售订单编码',
  `merchants_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商户编码',
  `card_number` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '刷卡账号',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_pay_sale_check_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='支付方式销售核对表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_term`
--

DROP TABLE IF EXISTS `pay_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_term` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `term_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '条款编码',
  `term_name` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '条款名称',
  `term_type` tinyint(3) DEFAULT NULL COMMENT '条款类型(0:固定日;1:发货日XX天;2:发票日XX天;3:月结XX天;4:供应商发货日XX天)',
  `fixed_day` tinyint(4) DEFAULT NULL COMMENT '固定日(1-28)',
  `days` int(3) DEFAULT NULL COMMENT '天数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='付款条款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_term_supplier`
--

DROP TABLE IF EXISTS `pay_term_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_term_supplier` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `term_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '条款编码',
  `term_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '条款名称',
  `term_type` tinyint(4) DEFAULT NULL COMMENT '条款类型(0:固定日;1:发货日XX天;2:发票日XX天;3:月结XX天;4:供应商发货日XX天)',
  `fixed_day` tinyint(4) DEFAULT NULL COMMENT '固定日(1-28)',
  `days` int(3) DEFAULT NULL COMMENT '天数',
  `is_prepay` tinyint(3) DEFAULT NULL COMMENT '0:否;1:是',
  `forward_proportion` decimal(3,2) DEFAULT NULL COMMENT '期货预付比例',
  `spot_proportion` decimal(3,2) DEFAULT NULL COMMENT '现货预付比例',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_buyerNo_salerNo` (`company_no`,`supplier_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商付款条款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_term`
--

DROP TABLE IF EXISTS `payment_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `payment_no` char(18) NOT NULL COMMENT '付款条款编码',
  `expressed` varchar(100) DEFAULT NULL COMMENT '付款条款描述',
  `credit_day` int(11) DEFAULT NULL COMMENT '信用天数',
  `discount` decimal(10,4) DEFAULT '0.0000' COMMENT '折率、扣率',
  `status` tinyint(3) DEFAULT '0' COMMENT '启用标志 1、启用 0、未启用',
  `create_user` varchar(32) DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_payment_no` (`payment_no`),
  KEY `IDX_payment_term_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='付款条款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `period_balance`
--

DROP TABLE IF EXISTS `period_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period_balance` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编码',
  `order_unit_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '订货单位',
  `store_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '机构编码',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `year` char(4) COLLATE utf8_bin NOT NULL COMMENT '年份',
  `month` char(2) COLLATE utf8_bin NOT NULL COMMENT '月份',
  `opening_qty` int(11) DEFAULT '0' COMMENT '期初数量',
  `opening_balance` decimal(20,4) DEFAULT '0.0000' COMMENT '期初余额',
  `purchase_in_qty` int(11) DEFAULT '0' COMMENT '采购入库数量',
  `purchase_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '采购入库金额',
  `outer_transfer_in_qty` int(11) DEFAULT '0' COMMENT '跨区调入数量',
  `outer_transfer_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '跨区调入金额',
  `inner_transfer_in_qty` int(11) DEFAULT '0' COMMENT '区内调入数量',
  `inner_transfer_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '区内调入金额',
  `purchase_return_qty` int(11) DEFAULT '0' COMMENT '采购退厂数量',
  `purchase_return_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '采购退厂金额',
  `inv_surplus_qty` int(11) DEFAULT '0' COMMENT '盘盈数量',
  `inv_surplus_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '盘盈金额',
  `others_in_qty` int(11) DEFAULT '0' COMMENT '其他入库数量',
  `others_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '其他入库金额',
  `outer_way_qty` int(11) DEFAULT '0' COMMENT '外入在途数量',
  `outer_way_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '外入在途金额',
  `outer_diff_qty` int(11) DEFAULT '0' COMMENT '外在途差异数量',
  `outer_diff_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '外在途差异金额',
  `inner_way_qty` int(11) DEFAULT '0' COMMENT '区内入在途数量',
  `inner_diff_qty` int(11) DEFAULT '0' COMMENT '区内入库差异数量',
  `cost_adjustment_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '差异调整金额',
  `sales_out_qty` int(11) DEFAULT '0' COMMENT '销售出库数量',
  `sales_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '销售出库金额',
  `inner_transfer_out_qty` int(11) DEFAULT '0' COMMENT '区内调出数量',
  `inner_transfer_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '区内调出金额',
  `outer_transfer_out_qty` int(11) DEFAULT '0' COMMENT '跨区调出数量',
  `outer_transfer_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '跨区跳出金额',
  `inventory_loss_qty` int(11) DEFAULT '0' COMMENT '盘亏数量',
  `inventory_loss_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '盘亏金额',
  `others_out_qty` int(11) DEFAULT '0' COMMENT '其他出库数量',
  `others_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '其他出库金额',
  `during_net_qty` int(11) DEFAULT '0' COMMENT '期间净发生数量',
  `during_net_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '期间净发生金额',
  `closing_qty` int(11) DEFAULT '0' COMMENT '期末数量',
  `closing_balance` decimal(20,4) DEFAULT '0.0000' COMMENT '期末余额',
  `unit_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '单位成本',
  `region_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '地区成本价',
  `headquarter_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '总部成本价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_no` (`company_no`,`item_no`,`year`,`month`,`order_unit_no`,`store_no`) USING BTREE,
  KEY `index_search` (`year`,`month`,`company_no`,`brand_no`,`store_no`,`order_unit_no`,`category_no`,`item_no`) USING BTREE,
  KEY `IDX_period_balance_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='期间结存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `period_balance_audit`
--

DROP TABLE IF EXISTS `period_balance_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period_balance_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `company_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司No',
  `year` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '年份',
  `month` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '月份',
  `brand_unit_no` char(18) DEFAULT NULL COMMENT '品牌部编码',
  `brand_unit_name` varchar(50) DEFAULT NULL COMMENT '品牌部名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0 = 运行中 1 = 正常 2 = 失败)',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_period_balance_audit_update_time` (`update_time`),
  KEY `IDX_CYMB` (`company_no`,`year`,`month`,`brand_unit_no`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成成本日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `period_balance_his`
--

DROP TABLE IF EXISTS `period_balance_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `period_balance_his` (
  `id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键ID',
  `company_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司编码',
  `order_unit_no` char(18) NOT NULL COMMENT '订货单位',
  `store_no` char(18) NOT NULL COMMENT '机构编码',
  `brand_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `item_no` char(18) NOT NULL COMMENT '商品编码',
  `item_code` varchar(30) DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `category_no` char(18) DEFAULT NULL COMMENT '大类编码',
  `year` char(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '年份',
  `month` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '月份',
  `opening_qty` int(11) DEFAULT '0' COMMENT '期初数量',
  `opening_balance` decimal(20,4) DEFAULT '0.0000' COMMENT '期初余额',
  `purchase_in_qty` int(11) DEFAULT '0' COMMENT '采购入库数量',
  `purchase_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '采购入库金额',
  `outer_transfer_in_qty` int(11) DEFAULT '0' COMMENT '跨区调入数量',
  `outer_transfer_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '跨区调入金额',
  `inner_transfer_in_qty` int(11) DEFAULT '0' COMMENT '区内调入数量',
  `inner_transfer_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '区内调入金额',
  `purchase_return_qty` int(11) DEFAULT '0' COMMENT '采购退厂数量',
  `purchase_return_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '采购退厂金额',
  `inv_surplus_qty` int(11) DEFAULT '0' COMMENT '盘盈数量',
  `inv_surplus_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '盘盈金额',
  `others_in_qty` int(11) DEFAULT '0' COMMENT '其他入库数量',
  `others_in_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '其他入库金额',
  `outer_way_qty` int(11) DEFAULT '0' COMMENT '外入在途数量',
  `outer_way_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '外入在途金额',
  `outer_diff_qty` int(11) DEFAULT '0' COMMENT '外在途差异数量',
  `outer_diff_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '外在途差异金额',
  `inner_way_qty` int(11) DEFAULT '0' COMMENT '区内入在途数量',
  `inner_diff_qty` int(11) DEFAULT '0' COMMENT '区内入库差异数量',
  `cost_adjustment_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '差异调整金额',
  `sales_out_qty` int(11) DEFAULT '0' COMMENT '销售出库数量',
  `sales_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '销售出库金额',
  `inner_transfer_out_qty` int(11) DEFAULT '0' COMMENT '区内调出数量',
  `inner_transfer_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '区内调出金额',
  `outer_transfer_out_qty` int(11) DEFAULT '0' COMMENT '跨区调出数量',
  `outer_transfer_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '跨区跳出金额',
  `inventory_loss_qty` int(11) DEFAULT '0' COMMENT '盘亏数量',
  `inventory_loss_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '盘亏金额',
  `others_out_qty` int(11) DEFAULT '0' COMMENT '其他出库数量',
  `others_out_amount` decimal(14,4) DEFAULT '0.0000' COMMENT '其他出库金额',
  `during_net_qty` int(11) DEFAULT '0' COMMENT '期间净发生数量',
  `during_net_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '期间净发生金额',
  `closing_qty` int(11) DEFAULT '0' COMMENT '期末数量',
  `closing_balance` decimal(20,4) DEFAULT '0.0000' COMMENT '期末余额',
  `unit_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '单位成本',
  `region_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '地区成本价',
  `headquarter_cost` decimal(14,4) DEFAULT '0.0000' COMMENT '总部成本价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `sharding_flag` char(20) DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_period_balance` (`company_no`,`year`,`month`,`item_no`,`order_unit_no`,`store_no`) USING BTREE,
  KEY `IDX_period_balance_his_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='期间结存历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_warn_message`
--

DROP TABLE IF EXISTS `pre_warn_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_warn_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_code` tinyint(3) DEFAULT NULL,
  `type` tinyint(3) DEFAULT '0' COMMENT '0:待办 1:预警',
  `company_no` char(20) COLLATE utf8_bin DEFAULT NULL,
  `brand_no` char(20) COLLATE utf8_bin DEFAULT NULL,
  `brand_unit_no` char(20) COLLATE utf8_bin DEFAULT NULL,
  `bill_no` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_pre_warn_message_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2845587 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预警信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_warn_template`
--

DROP TABLE IF EXISTS `pre_warn_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_warn_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '节点名',
  `code` tinyint(3) DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL COMMENT '0：待办、1：预警',
  `tab_title` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '标签页标题',
  `module_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名(用于菜单权限控制)',
  `pre_title` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '标题前缀',
  `suf_title` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '标题后缀',
  `balance_type` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '订单类型（请求参数）',
  `status` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '状态（请求参数）',
  `extend_status` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '扩展状态（请求参数）',
  `sql_statement` varchar(1600) COLLATE utf8_bin DEFAULT NULL COMMENT 'SQL语句（插入）',
  `sql_delete_statement` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'SQL语句（删除）',
  `post_url` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '后台数据请求路径',
  `show_url` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '前端请求路径',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_pre_warn_template_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预警模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `price_effective_date`
--

DROP TABLE IF EXISTS `price_effective_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_effective_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `pur_price_eff_date` date DEFAULT NULL COMMENT '采购价生效日期',
  `area_price_eff_date` date DEFAULT NULL COMMENT '地区价生效日期',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编码',
  `brand_unit_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态 1、已启用 0、已停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='价格生效日表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `price_quotation_list`
--

DROP TABLE IF EXISTS `price_quotation_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_quotation_list` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,UUID',
  `organ_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '机构类型,0-全国，1-地区，2-城市,3-店铺',
  `organ_id` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '机构编号',
  `organ_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '机构名称',
  `brand_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '品牌编码',
  `brand_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `category_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `item_flag` tinyint(4) DEFAULT '1' COMMENT '产品依据,1-商品编码，2-尺码',
  `item_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '商品ID',
  `item_code` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `size_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '尺码',
  `suggest_tag_price` decimal(8,2) DEFAULT '0.00' COMMENT '建议牌价',
  `tag_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '牌价',
  `quotation_tactics` tinyint(4) DEFAULT '1' COMMENT '牌价策略,0-全国统一定价，1-地区统一定价',
  `own_price_flag` tinyint(4) DEFAULT '1' COMMENT '是否自定价,0-是，1-否',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部_大区',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_price_quotation_list` (`organ_id`,`item_no`),
  KEY `idx_price_quotation_list` (`brand_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='牌价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pricing_range`
--

DROP TABLE IF EXISTS `pricing_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricing_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `json_str` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'JSON字符串',
  `query_condition` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '查询条件',
  `is_start` tinyint(3) DEFAULT '0' COMMENT '是否启用(0，不启用;1，启用)',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='核价范围表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_price`
--

DROP TABLE IF EXISTS `purchase_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 主键ID',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '货品编号',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '货品编码',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `material_price` decimal(12,2) unsigned DEFAULT '0.00' COMMENT '物料价',
  `factory_price` decimal(12,2) unsigned DEFAULT '0.00' COMMENT '厂进价',
  `effective_date` date DEFAULT NULL COMMENT '生效时间',
  `status` tinyint(3) DEFAULT '2' COMMENT '是否可用（1可用 2不可用）',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_purchase_price` (`item_no`,`supplier_no`,`effective_date`) USING BTREE,
  KEY `IDX_purchase_price_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='采购价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `rand_item_list`
--

DROP TABLE IF EXISTS `rand_item_list`;
/*!50001 DROP VIEW IF EXISTS `rand_item_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `rand_item_list` AS SELECT 
 1 AS `id`,
 1 AS `item_no`,
 1 AS `code`,
 1 AS `name`,
 1 AS `full_name`,
 1 AS `en_name`,
 1 AS `sys_no`,
 1 AS `style_no`,
 1 AS `brand_no`,
 1 AS `shoe_model`,
 1 AS `ingredients`,
 1 AS `mainqdb`,
 1 AS `lining`,
 1 AS `color_no`,
 1 AS `main_color`,
 1 AS `category_no`,
 1 AS `repeatlisting`,
 1 AS `gender`,
 1 AS `heeltype`,
 1 AS `bottomtype`,
 1 AS `size_kind`,
 1 AS `status`,
 1 AS `tag_price`,
 1 AS `suggest_tag_price`,
 1 AS `purchase_tax_price`,
 1 AS `costtaxrate`,
 1 AS `saletaxrate`,
 1 AS `material_price`,
 1 AS `supplier_no`,
 1 AS `supplier_item_no`,
 1 AS `supplier_item_name`,
 1 AS `orderfrom`,
 1 AS `years`,
 1 AS `sell_season`,
 1 AS `purchase_season`,
 1 AS `sale_date`,
 1 AS `search_code`,
 1 AS `style`,
 1 AS `create_user`,
 1 AS `create_time`,
 1 AS `update_user`,
 1 AS `update_time`,
 1 AS `remark`,
 1 AS `category_name`,
 1 AS `brand_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rate_basic`
--

DROP TABLE IF EXISTS `rate_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_basic` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,UUID',
  `concract_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '合同号',
  `zone_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编码',
  `zone_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `organ_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `organ_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '城市名称',
  `mall_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `shop_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `brand_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `rate_type` tinyint(4) DEFAULT NULL COMMENT '扣率类型,1-合同正价扣 2-合同阶梯扣',
  `rate_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码,A B...',
  `rate_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率名称',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '扣率',
  `start_disc` decimal(10,4) DEFAULT '0.0000' COMMENT '起始折>',
  `end_disc` decimal(10,4) DEFAULT '0.0000' COMMENT '终止折<=',
  `settlement_date` date DEFAULT NULL COMMENT '最新结算日',
  `use_flag` tinyint(4) DEFAULT NULL COMMENT '是否使用,0-已使用 1-未使用',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商场结算码',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态,0-编辑,100-完结',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部_大区',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_rate_basic` (`shop_no`,`start_date`,`end_date`),
  KEY `idx_rate_basic_concract_no` (`concract_no`),
  KEY `IDX_rate_basic_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='基础扣率设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate_category`
--

DROP TABLE IF EXISTS `rate_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_category` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,UUID',
  `concract_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '合同号',
  `zone_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编码',
  `zone_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `organ_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `organ_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '城市名称',
  `mall_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `shop_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `brand_no` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `group_no` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '商品组号',
  `group_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品组名称',
  `rate_type` tinyint(4) DEFAULT NULL COMMENT '扣率类型,1-合同正价扣 2-合同阶梯扣',
  `rate_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码,A B...',
  `rate_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率名称',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '扣率',
  `start_disc` decimal(8,4) DEFAULT NULL COMMENT '起始折>',
  `end_disc` decimal(8,4) DEFAULT NULL COMMENT '终止折<=',
  `settlement_date` date DEFAULT NULL COMMENT '最新结算日',
  `use_flag` tinyint(4) DEFAULT NULL COMMENT '是否使用,0-已使用 1-未使用',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商场结算码',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态,0-编辑,100-完结',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部_大区',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_rate_category` (`shop_no`,`start_date`,`end_date`),
  KEY `idx_rate_category_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='品类扣率设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate_expense_operate`
--

DROP TABLE IF EXISTS `rate_expense_operate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_expense_operate` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,UUID',
  `concract_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '合同号',
  `zone_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编码',
  `zone_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `organ_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `organ_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '城市名称',
  `mall_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `shop_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '店铺编码',
  `shop_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `brand_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `settlement_period` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '结算月',
  `end_settlement_period` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '终止结算月',
  `settlement_type` tinyint(4) DEFAULT '1' COMMENT '结算类型,0-保底扣率 1-阶段扣率 2-纯租金 3-最大值(租金、扣率) 4-和值(租金+扣率)',
  `debited_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣费类别',
  `debited_mode` tinyint(4) DEFAULT NULL COMMENT '费用扣取方式 1-票前 2-票后',
  `payment_mode` tinyint(4) DEFAULT NULL COMMENT '费用交款方式 1-账款 2-现价',
  `rental` decimal(20,2) DEFAULT NULL COMMENT '租金',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '扣率',
  `start_amount` decimal(20,2) DEFAULT NULL COMMENT '起始额度',
  `end_amount` decimal(20,2) DEFAULT NULL COMMENT '终止额度',
  `unity_rate_flag` tinyint(4) DEFAULT NULL COMMENT '超额统一扣率 0-统一 1-不统',
  `minimum_flag` tinyint(4) DEFAULT NULL COMMENT '促销计保底 0-计保底 1-不计保底(用于保底扣率类型)',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态,0-未结算，1-已生成,2-已结算',
  `settlement_date` date DEFAULT '2000-01-01' COMMENT '最新结算日',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部_大区',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_rate_expense_operate_shop_no` (`shop_no`),
  KEY `idx_rate_expense_operate_concract_no` (`concract_no`),
  KEY `IDX_rate_expense_operate_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算期扣费设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate_expense_remind`
--

DROP TABLE IF EXISTS `rate_expense_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_expense_remind` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,UUID',
  `concract_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '合同号',
  `zone_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编码',
  `zone_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `organ_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `organ_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '城市名称',
  `mall_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `shop_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '店铺编码',
  `shop_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `brand_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `start_month` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '起始结算月',
  `end_month` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '终止结算月',
  `total_guarantee_amount` decimal(20,2) DEFAULT NULL COMMENT '总保底计划',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态,0-未结算，1-已结算',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部_大区',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_rate_expense_remind_shop_no` (`shop_no`),
  KEY `idx_rate_expense_remind_concract_no` (`concract_no`),
  KEY `IDX_rate_expense_remind_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算提醒';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate_expense_sporadic`
--

DROP TABLE IF EXISTS `rate_expense_sporadic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_expense_sporadic` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,UUID',
  `concract_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '合同号',
  `zone_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编码',
  `zone_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `organ_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市编码',
  `organ_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '城市名称',
  `mall_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `shop_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '店铺编码',
  `shop_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `brand_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码 |隔开',
  `brand_name` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `clause_type` tinyint(4) DEFAULT NULL COMMENT '条款类型',
  `start_date` date NOT NULL COMMENT '生效起始日期',
  `end_date` date NOT NULL COMMENT '生效终止日期',
  `debited_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣费类别 从FAS取',
  `debited_type_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '扣费类别名称',
  `mall_deduction_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商场扣费名称',
  `debited_mode` tinyint(4) DEFAULT NULL COMMENT '费用扣取方式 1-票前 2-票后',
  `payment_mode` tinyint(4) DEFAULT NULL COMMENT '费用交款方式 1-账款 2-现价',
  `debited_rule` tinyint(4) DEFAULT NULL COMMENT '扣费规则 1-月定额 2-费率',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '金额',
  `measurement_unit` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '计量单位',
  `base_pay_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  `base_other` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '其他',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '费率',
  `balance_rate` decimal(8,4) DEFAULT NULL COMMENT '补差费率',
  `settlement_date` date DEFAULT NULL COMMENT '最新结算日',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态,0-未结算，1-已结算',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部_大区',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_rate_expense_sporadic` (`shop_no`,`start_date`,`end_date`),
  KEY `idx_rate_expense_sporadic_concract_no` (`concract_no`),
  KEY `IDX_rate_expense_sporadic_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='其他零星费用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rate_pro`
--

DROP TABLE IF EXISTS `rate_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_pro` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,UUID',
  `activity_no` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '商场(品牌)活动单号',
  `activity_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '活动名称',
  `activity_describe` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '活动描述',
  `launch_type` tinyint(4) DEFAULT '2' COMMENT '活动来源,1-公司活动 2-商场活动',
  `activity_type` tinyint(4) DEFAULT NULL COMMENT '活动类型,1-买换 2-打折 3-其他',
  `activity_bill_type` tinyint(4) DEFAULT '1' COMMENT '单据类型,1-扣率设置单 2-扣率补录单',
  `zone_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '地区编码',
  `zone_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '地区名称',
  `manage_organ_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编码',
  `manage_organ_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `mall_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `shop_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `brand_no` varchar(1500) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(2500) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `start_date` datetime DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime DEFAULT NULL COMMENT '结束日期',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '扣率',
  `rate_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码,A B...',
  `rate_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率名称',
  `basic_rate_flag` tinyint(4) DEFAULT '0' COMMENT '取合同扣标志,0-取合同扣 1-不取合同扣',
  `step_rate_flag` tinyint(4) DEFAULT '1' COMMENT '取促销阶梯扣标志,0-取促销阶梯扣 1-不取促销阶梯扣',
  `debited_mode` tinyint(4) DEFAULT NULL COMMENT '费用扣取方式 1-票前 2-票后',
  `payment_mode` tinyint(4) DEFAULT NULL COMMENT '费用交款方式 1-账款 2-现价',
  `settlement_date` date DEFAULT NULL COMMENT '当前结算日',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '结算码',
  `virtual_flag` tinyint(4) DEFAULT NULL COMMENT '虚实,0-虚数 1-实数',
  `balance_base` tinyint(4) DEFAULT '0' COMMENT '结算基数,0-销售金额 1-牌价金额',
  `properties` tinyint(4) DEFAULT NULL COMMENT '属性,1-满送 2-满减 3-折扣 4-其他',
  `full_value` decimal(8,2) DEFAULT NULL COMMENT '满值',
  `deduction_value` decimal(8,2) DEFAULT NULL COMMENT '送减额',
  `discount` decimal(8,2) DEFAULT NULL COMMENT '折扣',
  `strength` decimal(8,2) DEFAULT NULL COMMENT '力度',
  `pro_no` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '促销单',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态,0-编辑,10-确认 100-已创建',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部_大区',
  `audit_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人姓名',
  `audit_time` datetime DEFAULT NULL COMMENT '确认时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_rate_pro` (`shop_no`,`start_date`,`end_date`),
  KEY `idx_rate_pro_activity_no` (`activity_no`),
  KEY `IDX_rate_pro_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='活动扣率设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '片区ID',
  `region_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '片区编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '片区名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '组织编码(大区)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态(0 = 撤消 1 = 正常)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '检索码',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_region_no` (`region_no`) USING BTREE,
  KEY `IDX_region_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16512 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='片区信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_cost_maintain`
--

DROP TABLE IF EXISTS `region_cost_maintain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_cost_maintain` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键(UUID)',
  `zone_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '经营区域编号',
  `zone_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域名称',
  `item_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `item_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品出厂编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌',
  `brand_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `supplier_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `effective_time` date NOT NULL COMMENT '生效日期',
  `add_rule_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '加价规则编号',
  `add_basis` char(3) COLLATE utf8_bin DEFAULT NULL COMMENT '加价依据,1厂进价,2牌价，3总部成本',
  `add_price` decimal(10,2) DEFAULT NULL COMMENT '加价',
  `add_discount` decimal(10,2) DEFAULT NULL COMMENT '加折',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '折扣率',
  `region_cost` decimal(12,2) DEFAULT '0.00' COMMENT '地区成本',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `is_first` tinyint(3) DEFAULT NULL COMMENT '是否首增(1:是，0:否)',
  `production_cost` decimal(10,2) DEFAULT NULL COMMENT '生产成本',
  `factory_price` decimal(10,2) DEFAULT NULL COMMENT '厂进价',
  `tag_price` decimal(10,2) DEFAULT NULL COMMENT '全国统一牌价',
  `headquarter_cost` decimal(10,2) DEFAULT NULL COMMENT '总部成本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zone_no` (`zone_no`,`item_no`,`effective_time`),
  UNIQUE KEY `UK_ZONE_ITEM_EFF` (`item_no`,`zone_no`,`effective_time`),
  KEY `idx_rule_no` (`add_rule_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地区成本维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_price_rule`
--

DROP TABLE IF EXISTS `region_price_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_price_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `add_rule_no` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '规则编码',
  `zone_no` char(50) COLLATE utf8_bin NOT NULL COMMENT '经营区域编号',
  `zone_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '区域名称',
  `supplier_group_no` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '多选结算供应商组代码',
  `supplier_group_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '多选结算供应商组名称',
  `brand_unit_no` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '品牌部列表，逗号分割的字符列表',
  `brand_unit_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称列表',
  `category_no` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '多选结算大类',
  `category_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '多选结算大类名称',
  `two_level_category_no` varchar(300) COLLATE utf8_bin DEFAULT '' COMMENT '多选二级大类',
  `two_level_category_name` varchar(600) COLLATE utf8_bin DEFAULT '' COMMENT '多选二级大类名称',
  `new_style_flag` tinyint(3) unsigned DEFAULT NULL COMMENT '是否新旧款，0否，1是',
  `style_type` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '新旧款类型',
  `year_code` varchar(360) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `year` varchar(180) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `season` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '季节，A春，B夏，C秋，D冬',
  `season_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '季节名称',
  `effective_time` date NOT NULL COMMENT '生效日期',
  `add_basis` char(3) COLLATE utf8_bin NOT NULL COMMENT '加价依据,2牌价，3总部成本',
  `add_price` decimal(10,2) DEFAULT NULL COMMENT '加价',
  `add_discount` decimal(10,2) DEFAULT NULL COMMENT '加折',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '折扣率',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `add_rule_no` (`add_rule_no`),
  KEY `IDX_region_price_rule_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地区加价规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `register_invoice`
--

DROP TABLE IF EXISTS `register_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register_invoice` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `bill_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '单据编号',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '门店编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '门店名称',
  `assistant_id` char(36) COLLATE utf8_bin NOT NULL COMMENT '营业员主键ID',
  `assistant_no` char(20) COLLATE utf8_bin NOT NULL COMMENT '营业员工号,与HR工号代码一致',
  `assistant_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '营业员姓名',
  `out_date` date NOT NULL COMMENT '销售日期',
  `register_date` date NOT NULL COMMENT '开票登记日期',
  `should_amount` decimal(20,2) DEFAULT NULL COMMENT '应开票金额',
  `actual_amount` decimal(20,2) DEFAULT NULL COMMENT '实际开票金额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态,0-有效 1-无效 默认为0',
  `confirm_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确定,0-未确定 1-已确定 默认为0',
  `invoice_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '实际发票号',
  `order_no` varchar(25) COLLATE utf8_bin DEFAULT NULL COMMENT '销售订单号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人编号',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `audit_time` datetime DEFAULT NULL COMMENT '确定时间',
  `auditor_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '确定人编号',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确定人姓名',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  PRIMARY KEY (`id`),
  KEY `IDX_register_invoice_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='发票登记';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `return_exchange_dtl`
--

DROP TABLE IF EXISTS `return_exchange_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_exchange_dtl` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `business_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '订单编号',
  `ref_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '特卖备货单号',
  `sku_no` char(32) COLLATE utf8_bin NOT NULL COMMENT '商品SKU',
  `item_no` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '商品内码',
  `size_no` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '商品尺码',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `barcode` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品条码',
  `brand_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '所属品牌',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `years` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份(指上市的年份,下拉框选择,值: 2006~2026,默认当年)',
  `region_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '片区编码',
  `region_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '片区名称',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '明细备注',
  `item_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品类型,0-正常 1-赠品 促销标识',
  `tag_price` decimal(20,2) DEFAULT NULL COMMENT '商品牌价',
  `tag_price_nation` decimal(12,2) DEFAULT '0.00' COMMENT '全国统一牌价',
  `sale_price` decimal(20,2) DEFAULT NULL COMMENT '商品现价',
  `disc_price` decimal(20,2) DEFAULT NULL COMMENT '商品折扣价',
  `settle_price` decimal(20,2) DEFAULT NULL COMMENT '商品结算价',
  `reduce_price` decimal(20,2) DEFAULT NULL COMMENT '减价,单价减价',
  `rebate_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡折让金额',
  `score_amount` decimal(20,2) DEFAULT NULL COMMENT '积分兑换金额',
  `qty` int(11) DEFAULT NULL COMMENT '商品数量',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '商品总金额,(结算价-减价)*数量',
  `headquarter_cost` decimal(12,2) DEFAULT '0.00' COMMENT '总部成本',
  `region_cost` decimal(12,2) DEFAULT '0.00' COMMENT '地区成本',
  `unit_cost` decimal(12,4) DEFAULT '0.0000' COMMENT '单位成本',
  `purchase_price` decimal(12,2) DEFAULT '0.00' COMMENT '采购价',
  `material_price` decimal(12,2) DEFAULT '0.00' COMMENT '物料价',
  `factory_price` decimal(12,2) DEFAULT '0.00' COMMENT '厂进价',
  `pref_price` decimal(20,2) DEFAULT NULL COMMENT '促销优惠单价,促销优惠单价',
  `pro_no` varchar(130) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动编号，多个以逗号隔开',
  `pro_name` varchar(310) COLLATE utf8_bin DEFAULT NULL COMMENT '促销活动名称，多个以逗号隔开',
  `special_sell_flag` tinyint(4) DEFAULT '0' COMMENT '是否特卖,0-正常 1-特卖',
  `discount` decimal(10,4) DEFAULT NULL COMMENT '最终扣率,如17.00代表17.00%',
  `discount_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率代码，如A,B',
  `discount_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '扣率名称',
  `discount_type` tinyint(1) DEFAULT NULL COMMENT '扣率类型 ( 1-合同正价扣 2-合同阶梯扣 3-促销扣率)',
  `discount_type_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最终扣率来源名称',
  `discount_source_id` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '最终扣率来源编号',
  `billing_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商场结算码',
  `properties` tinyint(3) DEFAULT NULL COMMENT '属性,1-满送 2-满减 3-折扣 4-其他',
  `virtual_flag` tinyint(3) DEFAULT NULL COMMENT '虚实,0-虚数 1-实数',
  `strength` decimal(8,2) DEFAULT NULL COMMENT '力度',
  `activity_type_name` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '活动类型名称',
  `activity_type` tinyint(3) DEFAULT NULL COMMENT '活动类型',
  `launch_type_name` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '发起方式名称',
  `launch_type` tinyint(3) DEFAULT NULL COMMENT '发起方式,1-商场发起 2-品牌公司发起',
  `pro_end_time` datetime DEFAULT NULL COMMENT '活动结束时间',
  `pro_start_time` datetime DEFAULT NULL COMMENT '活动开始时间',
  `balance_base` tinyint(1) DEFAULT '0' COMMENT '结算基数,0-销售金额 1-牌价金额',
  `vip_discount` decimal(10,4) DEFAULT NULL COMMENT '会员折数',
  `vip_level_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '会员等级名称',
  `vip_level_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '会员等级Code',
  `base_score` int(11) NOT NULL DEFAULT '0' COMMENT '基本积分',
  `pro_score` int(11) NOT NULL DEFAULT '0' COMMENT '整单分摊积分',
  `cost_score` int(11) DEFAULT '0' COMMENT '消费积分',
  `available_flag` tinyint(1) DEFAULT '0' COMMENT '可二次销售,0-可二次销售 1-不可二次销售',
  `item_discount` decimal(10,4) DEFAULT NULL COMMENT '商品折数',
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '退换货原因',
  `reason_class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类名称',
  `reason_class_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类编号',
  `reason_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '原因编码',
  `order_dtl_id` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '原订单明细ID',
  `color_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色编码',
  `color_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '颜色名称',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `size_kind` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '尺码种类',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '类别编码',
  `return_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经退仓,0-未退 1-已退 默认为0-未退',
  `bill_transfer_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '店转货单号,只有跨店销售（本店自提）才有数据',
  `price_change_bill_no` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '变价单单号',
  `return_exchange_num` smallint(4) DEFAULT '0' COMMENT '退换货数量，该条明细退换货数量(只有换货订单才有)',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `specified_discount_flag` tinyint(1) DEFAULT '0' COMMENT '是否指定扣率 0-不指定扣率 1-指定扣率',
  `pickup_status` tinyint(1) DEFAULT '1' COMMENT '明细提货状态, 1-未提 2-已提 3-已提未扣(预留) 4-已提已扣(预留)',
  `take_off_type` tinyint(1) DEFAULT '0' COMMENT '欠客类型,0-正常 1-欠客 2-有实物无库存(预留)',
  `pickup_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '明细提货人',
  `pickup_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '明细提货人编号',
  `pickup_time` datetime DEFAULT NULL COMMENT '明细提货时间。非欠客-收银出库时间；欠客-提货时间',
  `invoice_no` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号(MPS),多个用逗号(,)分隔',
  `actual_amount` decimal(20,2) DEFAULT '0.00' COMMENT '实际销售金额(优惠券价值+结算金额)',
  `real_buy_amount` decimal(20,2) DEFAULT '0.00' COMMENT '券实收金额分摊额(优惠券优惠金额)',
  `surplus_amount` decimal(20,2) DEFAULT '0.00' COMMENT '用券金额(优惠券价值)',
  `rate_discount` decimal(20,4) DEFAULT '0.0000' COMMENT '促销折扣',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  `style_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '款号',
  `change_state` tinyint(4) DEFAULT '0' COMMENT '改价状态：0：正常，1：手动改价，2：申请改价',
  `change_audit_state` tinyint(4) DEFAULT '0' COMMENT '改价审核状态：0：正常，1：未审核，2：已审核',
  `change_state_audit_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '改价审核人',
  `change_state_audit_time` datetime DEFAULT NULL COMMENT '改价审核时间',
  `rate_pro_no` varchar(130) COLLATE utf8_bin DEFAULT NULL COMMENT '并行活动时所使用的扣率的活动编码',
  `rate_pro_name` varchar(130) COLLATE utf8_bin DEFAULT NULL COMMENT '并行活动时所使用的扣率的活动名称',
  `biz_city_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市编号',
  `biz_city_name` char(240) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` char(240) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `zone_code` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编码(有且必须只能输入一位)',
  `zone_name` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `item_style_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '款式编码(体育)',
  `item_series_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '系列编码(体育)',
  `management_area_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理区域编码',
  `management_area_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '管理区域名称',
  `order_taking` tinyint(1) DEFAULT '0' COMMENT '是否已接单,0-正常 1-已接，2-未接',
  `express_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `logistics_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司编号',
  `logistics_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shop_name_from` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '调货(转货)门店',
  `shop_no_from` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '调货(转货)门店编码',
  `shop_name` char(100) COLLATE utf8_bin DEFAULT NULL COMMENT '销售门店',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售门店编码',
  PRIMARY KEY (`id`),
  KEY `idx_business_no` (`business_no`,`category_no`) USING BTREE,
  KEY `IDX_return_exchange_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='退换货单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `return_exchange_main`
--

DROP TABLE IF EXISTS `return_exchange_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_exchange_main` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,主键',
  `fas_bill_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT 'FAS单据类型编号',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司名称',
  `business_no` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '退换货单号,业务编号',
  `ref_bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '门店编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '门店名称',
  `out_date` date NOT NULL COMMENT '退换货日期',
  `old_out_date` date DEFAULT NULL COMMENT '原单号日期',
  `qty` int(11) DEFAULT NULL COMMENT '总商品数量',
  `tag_price_amount` decimal(20,2) DEFAULT NULL COMMENT '本单牌价总金额',
  `sale_price_amount` decimal(20,2) DEFAULT NULL COMMENT '本单现价总金额',
  `disc_price_amount` decimal(20,2) DEFAULT NULL COMMENT '本单折后价总金额',
  `settle_amount` decimal(20,2) DEFAULT NULL COMMENT '本单结算总金额',
  `reduce_amount` decimal(20,2) DEFAULT NULL COMMENT '本单减价总金额,(单商品减价*数量)之和',
  `total_rebate_amount` decimal(20,2) DEFAULT NULL COMMENT '外卡总折让金额 ',
  `pref_amount` decimal(20,2) DEFAULT NULL COMMENT '促销优惠总金额',
  `coupon_amount` decimal(20,2) DEFAULT NULL COMMENT '优惠券总金额',
  `all_amount` decimal(20,2) DEFAULT NULL COMMENT '应收总金额',
  `amount` decimal(20,2) DEFAULT NULL COMMENT '实收总金额,订单应收总金额+优惠券总金额+找零金额',
  `remain_amount` decimal(20,2) DEFAULT NULL COMMENT '订单找零金额',
  `score_amount` decimal(20,2) DEFAULT NULL COMMENT '积分兑换总金额',
  `assistant_name` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员姓名,营业员姓名，多个营业员使用逗号隔开',
  `assistant_id` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员主键ID',
  `assistant_no` varchar(210) COLLATE utf8_bin DEFAULT NULL COMMENT '营业员工号',
  `vip_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '会员卡号',
  `vip_brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '会员所属卡品牌',
  `vip_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '会员姓名',
  `vip_phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '会员手机号',
  `wildcard_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '外卡编号',
  `wildcard_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '外卡名称',
  `wildcard_discount` decimal(10,4) DEFAULT NULL COMMENT '外卡折数',
  `base_score` int(11) NOT NULL DEFAULT '0' COMMENT '基本总积分',
  `pro_score` int(11) NOT NULL DEFAULT '0' COMMENT '整单分摊总积分',
  `cost_score` int(11) DEFAULT '0' COMMENT '消费总积分',
  `business_mode` tinyint(1) NOT NULL DEFAULT '2' COMMENT '业务类别,1-换货 2-退货 默认为2',
  `business_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '业务类型,取原订单的业务类型',
  `order_source` tinyint(1) DEFAULT '0' COMMENT '订单来源,0-PC端 1-PDA端 2-微店 3-订单导入 4-离线PDA端 5-第三方平台 6-O2O商城',
  `daily_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '日结标识,0-未日结 1-已日结 默认为0',
  `daily_datetime` datetime DEFAULT NULL COMMENT '日结时间',
  `balance_no` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '结算单据编号',
  `monthly_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '月结账标识,0-未月结 1-已月结 默认为0',
  `monthly_datetime` datetime DEFAULT NULL COMMENT '月结账时间',
  `old_order_no` varchar(25) COLLATE utf8_bin DEFAULT NULL COMMENT '原订单号',
  `new_order_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '新订单号(换货),业务类型是换货时，由换货产生的新订单单号',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '退换货状态,0-已创建 10-已挂起 11-已取消 20-已审核 30-已收银 40-待配货41-已发货 50-已提货 99-已完结',
  `actual_postage` decimal(20,2) DEFAULT NULL COMMENT '实收运费',
  `express_no` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `logistics_no` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '物流公司编号',
  `take_mode` tinyint(1) DEFAULT NULL COMMENT '提货方式,0-自提 1-快递',
  `market_ticket_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商场小票号',
  `lock_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '锁单标识,0-未锁单 1-已锁单',
  `return_exchange_time` tinyint(3) DEFAULT '0' COMMENT '退换货次数,只有换货订单才有',
  `shop_terminal_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '门店收银终端号',
  `invoice_no` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_amount` decimal(20,2) DEFAULT NULL COMMENT '发票金额',
  `invoice_date` date DEFAULT NULL COMMENT '开票日期',
  `zone_yyyymm` char(8) COLLATE utf8_bin DEFAULT NULL COMMENT '大区年月',
  `create_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人编号',
  `create_user` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人编号',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人姓名',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `adjust_flag` tinyint(1) DEFAULT '0' COMMENT '是否改单，0-未改单，1-日结前改单， 2-日结后改单',
  `adjust_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '改单人',
  `adjust_time` datetime DEFAULT NULL COMMENT '改单日期',
  `adjust_order_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '改单原因',
  `reason_class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类名称',
  `reason_class_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '改单改价分类编号',
  `reason_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '原因编码',
  `responsibility_name` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '改单责任人',
  `responsibility_no` varchar(210) COLLATE utf8_bin DEFAULT NULL COMMENT '改单申请人编码',
  `responsibility_id` varchar(330) COLLATE utf8_bin DEFAULT NULL COMMENT '改单责任人ID',
  `sharding_flag` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段',
  `remain_score` int(11) DEFAULT NULL COMMENT '有效积分',
  `accumulated_score` int(11) DEFAULT NULL COMMENT '累计积分',
  `pay_time` datetime DEFAULT NULL COMMENT '收银时间，只记录第一次收银时间',
  `poundage` decimal(20,0) DEFAULT NULL COMMENT '手续费',
  `actual_return_time` datetime DEFAULT NULL COMMENT '实际退货时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '确认人',
  `place_date` date DEFAULT NULL COMMENT '下单日期',
  `refund_type` tinyint(1) DEFAULT '0' COMMENT '退款类型 0-正常 1-退款',
  `refund_status` tinyint(2) DEFAULT '30' COMMENT '10 申请退款 11 退款成功 默认30',
  `reprint` tinyint(2) DEFAULT '0' COMMENT '重打累计次数，默认为0',
  `adjust_inventory_flag` tinyint(1) DEFAULT '1' COMMENT '是否调整库存, 0-不调整库存 1-调整库存，默认1',
  `platform_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '平台代码',
  `platform_name` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '平台名称',
  `delivery_time` datetime DEFAULT NULL COMMENT '配送时间',
  `delivery_date` date DEFAULT NULL COMMENT '送货日期',
  `invoice_type` tinyint(1) DEFAULT NULL COMMENT '发票类型 1:普通发票 3:不需要发票(O2O)',
  `invoice_unit` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '发票抬头(O2O)',
  `invoice_content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '发票内容(O2O)',
  `is_package_mail_flag` tinyint(1) DEFAULT NULL COMMENT '是否包邮,0-正常 1-不包邮 2-包邮',
  `years` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '销售年份',
  `months` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '销售月份',
  `client_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编号',
  `client_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  PRIMARY KEY (`id`),
  KEY `idx_shop_no` (`shop_no`,`status`,`business_type`) USING BTREE,
  KEY `IDX_return_exchange_main_update_time` (`update_time`) USING BTREE,
  KEY `idx_001` (`shop_no`,`out_date`,`business_type`,`status`),
  KEY `day_report` (`id`,`status`,`out_date`,`business_type`) USING BTREE,
  KEY `company_no` (`company_no`) USING BTREE,
  KEY `year_month` (`years`,`months`),
  KEY `IDX_owe` (`company_no`,`out_date`,`status`,`refund_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='退换货单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule_match_fail`
--

DROP TABLE IF EXISTS `rule_match_fail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_match_fail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品唯一编码',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '地区编码',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '0-失败,1-成功',
  `match_type` tinyint(3) unsigned DEFAULT NULL COMMENT '0-总部匹配，1-地区匹配',
  `fail_reason` tinyint(3) DEFAULT NULL COMMENT '1-厂商组未匹配，其他参考枚举对象',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_rule_match_fail_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28080 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='加价规则匹配失败表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sale_settlement_deduction`
--

DROP TABLE IF EXISTS `sale_settlement_deduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_settlement_deduction` (
  `id` varchar(40) NOT NULL COMMENT '主键ID,UUID',
  `zone_no` varchar(20) DEFAULT NULL COMMENT '大区编码',
  `zone_name` varchar(32) DEFAULT NULL COMMENT '大区名称',
  `organ_no` varchar(20) DEFAULT NULL COMMENT '城市编码',
  `organ_name` varchar(64) DEFAULT NULL COMMENT '城市名称',
  `shop_no` varchar(20) NOT NULL COMMENT '店铺编码',
  `shop_name` varchar(64) DEFAULT NULL COMMENT '店铺名称',
  `brand_no` varchar(20) NOT NULL COMMENT '品牌编码',
  `brand_name` varchar(64) DEFAULT NULL COMMENT '品牌名称',
  `settlement_period` varchar(10) NOT NULL COMMENT '结算期',
  `start_date` date NOT NULL COMMENT '结算起始日期',
  `end_date` date NOT NULL COMMENT '结算终止日期',
  `rate_type` smallint(6) DEFAULT '1' COMMENT '扣率类型,1-合同扣点，2-保底+扣率，3-租金，4-最大值(租金、扣率)，5-租金+扣率',
  `rental` decimal(20,2) DEFAULT NULL COMMENT '租金',
  `rate` decimal(8,4) DEFAULT NULL COMMENT '扣率',
  `base_amount` decimal(20,2) DEFAULT NULL COMMENT '保底额',
  `base_rate` decimal(8,4) DEFAULT NULL COMMENT '保底扣率',
  `exceed_base_rate` decimal(8,4) DEFAULT NULL COMMENT '超保底扣率',
  `status` smallint(6) DEFAULT '0' COMMENT '状态,0-未结算，1-已结算',
  `creator_no` varchar(20) DEFAULT NULL COMMENT '建档人',
  `creator` varchar(32) DEFAULT NULL COMMENT '建档人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `editor_no` varchar(20) DEFAULT NULL COMMENT '最后修改人',
  `editor` varchar(50) DEFAULT NULL COMMENT '最后修改人姓名',
  `edit_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_sale_settlement_deduction_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算期扣费设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saleproxy_balance_relationshop`
--

DROP TABLE IF EXISTS `saleproxy_balance_relationshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saleproxy_balance_relationshop` (
  `id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键(UUID)',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `brand_unit_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '受托代销公司编号',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '受托代销公司名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '委托代销公司编号',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '委托代销公司名称',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_no` (`shop_no`,`brand_unit_no`,`buyer_no`,`saler_no`,`effective_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺代销关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saleproxy_balance_settleprice`
--

DROP TABLE IF EXISTS `saleproxy_balance_settleprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saleproxy_balance_settleprice` (
  `id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键(UUID)',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '受托代销公司编号',
  `buyer_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '受托代销公司名称',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '委托代销公司编号',
  `saler_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '委托代销公司名称',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `brand_unit_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `pricing_base` tinyint(3) DEFAULT '3' COMMENT '定价基数（1牌价 2地区价 3终端销售收入 4终端销售-扣费 5租金）',
  `discount` decimal(8,4) NOT NULL DEFAULT '0.0000' COMMENT '折扣(%)',
  `add_on_price` decimal(8,2) DEFAULT '0.00' COMMENT '加减价',
  `tariff_amount` decimal(20,2) DEFAULT NULL COMMENT '租金',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_no` (`shop_no`,`buyer_no`,`saler_no`,`brand_unit_no`,`effective_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代销结算价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_channel`
--

DROP TABLE IF EXISTS `sales_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销售渠道ID',
  `channel_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '销售渠道编码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '销售渠道名称',
  `parent_id` int(8) NOT NULL COMMENT '上级渠道ID',
  `channel_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '渠道路径',
  `order_no` int(11) DEFAULT '0' COMMENT '序号',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '是否有效,1有效,0无效',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_channel_no` (`channel_no`) USING BTREE,
  KEY `IDX_sales_channel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='销售渠道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `season_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '季节',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `start_time` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '开始时间',
  `end_time` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '结束时间',
  `effective_time` date DEFAULT NULL COMMENT '生效日期',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='季节登记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `self_shop_bank_info`
--

DROP TABLE IF EXISTS `self_shop_bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `self_shop_bank_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `company_name` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `shop_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺账号',
  `deposit_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '存现账号',
  `terminal_number` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `credit_card_bank` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '刷卡行',
  `credit_card_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '刷卡账号',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_self_shop_bank_info_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='独立店铺账户管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `self_shop_deposit_account`
--

DROP TABLE IF EXISTS `self_shop_deposit_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `self_shop_deposit_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `deposit_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '存现账号',
  `bank` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '发卡行',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态0-启用 1-停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_self_shop_deposit_account_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='店铺存现账号设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `self_shop_terminal_account`
--

DROP TABLE IF EXISTS `self_shop_terminal_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `self_shop_terminal_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商场名称',
  `merchants_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商户编码',
  `terminal_number` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '终端号',
  `credit_card_bank` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '刷卡行',
  `credit_card_account` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '终端绑定账号',
  `credit_card_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  `credit_card_rate` decimal(20,5) DEFAULT NULL COMMENT '费率',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态0-启用 1-停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_no` (`shop_no`) USING BTREE,
  KEY `IDX_self_shop_terminal_account_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='店铺终端账号设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_brand_group`
--

DROP TABLE IF EXISTS `settle_brand_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_brand_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌组编码',
  `name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '品牌组名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态（0 = 撤消 1 = 正常）',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `organ_type_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_group_no` (`group_no`),
  KEY `IDX_settle_brand_group_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='品牌组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_brand_group_rel`
--

DROP TABLE IF EXISTS `settle_brand_group_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_brand_group_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '品牌组编码',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编码',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_group_id` (`group_no`,`brand_unit_no`),
  KEY `IDX_settle_brand_group_rel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='品牌组和品牌的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_category`
--

DROP TABLE IF EXISTS `settle_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `settle_category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '分类编码,财务系统手动输入',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '分类名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态（0 = 撤消 1 = 正常）',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `organ_type_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_category_no` (`settle_category_no`),
  KEY `IDX_settle_category_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算大类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_category_dtl`
--

DROP TABLE IF EXISTS `settle_category_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_category_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `settle_category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '分类编码',
  `category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '大类编码',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_category_no` (`settle_category_no`,`category_no`),
  KEY `IDX_settle_category_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算大类明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_method`
--

DROP TABLE IF EXISTS `settle_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `settle_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算方式编码',
  `settle_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '结算方式名称',
  `settle_type` tinyint(3) DEFAULT '1' COMMENT '结算方式类别 1、现金 2、支票 3、汇兑 4、汇票 5、信用证 6、银行呈兑汇票',
  `business_type` tinyint(3) DEFAULT NULL COMMENT '业务类型 1、现金业务 2、银行业务 3、票据业务 ',
  `pay_fees_flag` tinyint(2) DEFAULT NULL COMMENT '是否支付手续费 1、是 2、否',
  `bearer` char(50) COLLATE utf8_bin DEFAULT NULL COMMENT '承担方',
  `payment_mode` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '支付方式',
  `status` tinyint(3) DEFAULT '1' COMMENT '启用标志 1、已启用 0、已停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `'uk_settle_code'` (`settle_code`),
  KEY `IDX_settle_method_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算方法表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_new_style`
--

DROP TABLE IF EXISTS `settle_new_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_new_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `style_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '分类编码',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态（0 = 撤消 1 = 正常）',
  `name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `organ_type_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_style_no` (`style_no`),
  KEY `IDX_settle_new_style_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新旧款';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_new_style_dtl`
--

DROP TABLE IF EXISTS `settle_new_style_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_new_style_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `style_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '新旧款主表分类编码',
  `season_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '季节编码',
  `season_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '季节名称',
  `year_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '年份编码',
  `year` char(4) COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_style_id` (`style_no`,`season_no`,`year`),
  KEY `IDX_settle_new_style_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='新旧款明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_path`
--

DROP TABLE IF EXISTS `settle_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算路径编码',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '结算路径名称',
  `bill_basis` int(11) DEFAULT NULL COMMENT '单据依据',
  `bill_type` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '单据类型(可多选)',
  `return_own_flag` tinyint(3) DEFAULT '0' COMMENT '是否原厂退残(0 : 否 1 : 是)',
  `settle_category_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算分类编码',
  `style_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '新旧款编码',
  `start_date` date DEFAULT NULL COMMENT '启用日期',
  `end_date` date DEFAULT NULL COMMENT '终止日期',
  `audit_status` tinyint(3) DEFAULT '0' COMMENT '审核状态',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态（0 = 撤消 1 = 正常）',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `auditor` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `organ_type_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_path_no` (`path_no`),
  KEY `style_type` (`style_no`),
  KEY `IDX_settle_path_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算路径设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_path_brand_rel`
--

DROP TABLE IF EXISTS `settle_path_brand_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_path_brand_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算路径编码',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编码',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_brand_no` (`path_no`,`brand_unit_no`),
  KEY `IDX_settle_path_brand_rel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算路径和品牌的关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settle_path_dtl`
--

DROP TABLE IF EXISTS `settle_path_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settle_path_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算路径编码',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体编码',
  `company_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体名称',
  `financial_basis` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算依据',
  `financial_basis_text` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '结算依据文本',
  `path_order` int(9) NOT NULL COMMENT '结算次序',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_company_no` (`path_no`,`company_no`),
  KEY `IDX_settle_path_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='结算路径设置明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settlement_body_change_record`
--

DROP TABLE IF EXISTS `settlement_body_change_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settlement_body_change_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `item_code` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `item_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编号',
  `brand_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `stock_type` int(11) DEFAULT NULL COMMENT '存货类型(0:正品,1:次品,2:原残,3:客残)',
  `stock_cost` decimal(12,2) DEFAULT NULL COMMENT '存货成本',
  `change_price` decimal(12,2) DEFAULT NULL COMMENT '变更价格',
  `original_company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '原公司编码',
  `original_company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '原公司名称',
  `original_order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '原订货单位',
  `original_order_unit_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '原订货单位名称',
  `original_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '原机构编码',
  `original_store_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '原机构名称',
  `target_company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '目标公司编码',
  `target_company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '目标公司名称',
  `target_order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '目标订货单位',
  `target_order_unit_name` varchar(240) COLLATE utf8_bin DEFAULT NULL COMMENT '目标订货单位名称',
  `target_store_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '目标机构编码',
  `target_store_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '目标机构名称',
  `change_date` date DEFAULT NULL COMMENT '变更日期',
  `target_price` decimal(20,2) DEFAULT NULL COMMENT '目的金额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `IDX_settlement_body_change_record_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='存货所属主体变更跟踪表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '店铺编码',
  `code` varchar(18) CHARACTER SET utf8 NOT NULL COMMENT '店铺外码',
  `store_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '店铺所属仓库编码',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `search_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '检索码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '组织编号',
  `biz_city_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市编号',
  `sys_no` varchar(10) COLLATE utf8_bin DEFAULT '00' COMMENT '所属业务单元',
  `open_date` date DEFAULT NULL COMMENT '成立日期(店铺正式营业的日期)',
  `close_date` date DEFAULT NULL COMMENT '撤销日期(店铺停止营运的日期)',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '店铺状态( 0:冻结,1:正常,9:撤销)',
  `area` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '卖场面积',
  `area_left` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '仓库面积',
  `area_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总面积',
  `area_unit` varchar(6) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '面积单位(1:㎡)',
  `province_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政省编码',
  `city_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政市编码',
  `county_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政县编码',
  `address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址(填写时不用包含省、市、县)',
  `zip_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `fax` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '传真号',
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `channel_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '销售渠道编码',
  `location` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '品柜形式',
  `employe_amount` int(8) DEFAULT NULL COMMENT '店员配备数(门店必填,指标准的店员配备数量)',
  `pay_type` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '结算方式(门店必填, 1:扣费店 2:租金店 3:不结算)',
  `digits` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '收银位数(门店必填, 0:元 1:角 2:分',
  `startup_time` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '每天营业开始时间',
  `shutdown_time` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '每天营业关闭时间',
  `shop_level` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '门店级别( A、B、C、D、E)',
  `major` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '主营品类(门店必填, 1:男鞋 2:女鞋 3:童鞋 4:综合)',
  `multi` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '店铺细类 单品多品(门店必填,C:多品店 D:单品店)',
  `sale_mode` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺大类 批发零售(门店必填,1:零售；2:批发)',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT 'A0' COMMENT '店铺小类 (销售类型(门店必填, A0:商场店中店 A1:商场独立店 A2:商场\n\n特卖店 A3:商场寄卖店 BJ:独立街边店 BM:MALL B3:独立寄卖店, D0:批发加盟店 D1:批发团购店 D2:批发员购店 D3:批发调货店)',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `region_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '片区编码',
  `cmcdist_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商圈编码',
  `category_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '经营类型（男鞋，女鞋，综合）',
  `shop_classify` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺类别',
  `price_adjust_level` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '调价级别',
  `on_line_flag` tinyint(3) unsigned DEFAULT '1' COMMENT '在线标志:1在线，0离线',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `shop_mode_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺模式编码',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  `corporation_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '法人公司编码',
  `map_flag` tinyint(3) DEFAULT '0' COMMENT 'MAP店标志,1是;0否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_no` (`shop_no`) USING BTREE,
  KEY `idx_store_no` (`store_no`) USING BTREE,
  KEY `IDX_shop_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201619 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门店信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_balance_date`
--

DROP TABLE IF EXISTS `shop_balance_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_balance_date` (
  `id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '主键(UUID)',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结算主体名称',
  `bsgroups_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团编码',
  `bsgroups_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商业集团名称',
  `mall_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商场编码',
  `mall_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '商场名称',
  `shop_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺编码',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺全称',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT 'A0' COMMENT '(销售类型(门店必填, A0:商场店中店 A1:商场独立店 A2:商场特卖店 A3:商场寄卖店 BJ:独立街边店 BM:MALL B3:独立寄卖店, D0:批发加盟店 D1:批发团购店 D2:批发员购店 D3:批发调货店)',
  `month` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `balance_flag` tinyint(3) unsigned DEFAULT '1' COMMENT '否生成结算单(1-未生成，2-已生成)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `bill_already` tinyint(3) DEFAULT '1' COMMENT '是否已开票(1-未开票,2-已开票)',
  `should_bill_date` date DEFAULT NULL COMMENT '应开票日期',
  `income_payments_date` date DEFAULT NULL COMMENT '应回款日期',
  `invoice_should_send_date` date DEFAULT NULL COMMENT '发票应寄送日期',
  `invoice_should_arrive_date` date DEFAULT NULL COMMENT '发票应收到日期',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `deduct_status` tinyint(3) DEFAULT '1' COMMENT '费用生成处理状态 0-不生成、1-生成',
  `brand_deduct_process` tinyint(3) DEFAULT '0' COMMENT '多品牌费用生成处理 0-均摊、1-不均摊、2-按销售分摊',
  `balance_update_process` tinyint(3) DEFAULT '0' COMMENT '结算单是否可修改调整 0-不可以、1-可以',
  PRIMARY KEY (`id`),
  KEY `idx_shop_no` (`shop_no`,`month`,`balance_start_date`,`balance_end_date`) USING BTREE,
  KEY `IDX_shop_balance_date_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商场门店结算期设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_brand`
--

DROP TABLE IF EXISTS `shop_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '门店品牌ID',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌编码',
  `order_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '默认订货单位',
  `brand_flag` tinyint(3) DEFAULT '0' COMMENT '是否主营品牌(1是，0否)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态(1有效，0无效)',
  `organ_no` char(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '经营城市编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_brand` (`shop_no`,`brand_no`,`order_unit_no`) USING BTREE,
  KEY `idx_order_unit_no` (`order_unit_no`) USING BTREE,
  KEY `IDX_shop_brand_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=389577 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺品牌信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_check`
--

DROP TABLE IF EXISTS `shop_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_check` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键ID,uuid生成',
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '店铺编码',
  `shop_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `year` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '检查年',
  `month` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '检查月',
  `check_no` char(18) COLLATE utf8_bin DEFAULT '' COMMENT '检查项编码',
  `check_result` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '结果登记',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_shop_check_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺检查登记';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_check_set`
--

DROP TABLE IF EXISTS `shop_check_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_check_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `check_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺检查项编码',
  `check_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺检查项名称',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态0-启用  1-禁用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_shop_check_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='店铺检查项设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_company`
--

DROP TABLE IF EXISTS `shop_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '店铺编码',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算公司编码',
  `effective_date` date DEFAULT NULL COMMENT '生效日期',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '店铺状态( 0:冻结,1:正常,9:撤销)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_no` (`shop_no`,`company_no`,`effective_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门店公司关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_extension`
--

DROP TABLE IF EXISTS `shop_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_extension` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '扩充属性ID',
  `shop_no` char(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '销售门店编号',
  `brand_no` varchar(20) DEFAULT NULL COMMENT '品牌编码',
  `attribute_no` varchar(20) NOT NULL COMMENT '属性编码',
  `attribute_detail_no` varchar(32) NOT NULL COMMENT '属性明细编码',
  `flag` int(11) DEFAULT NULL COMMENT '属性标志(0 集团属性;1 品牌属性;2 订货单位;3 管理架构;4 经营城市;5 片区; 6 店铺级别;7 营业面积)',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `status` tinyint(3) DEFAULT '1' COMMENT '状态(0 未生效;1 正常;2 作废)',
  PRIMARY KEY (`id`),
  KEY `idx_attribute_detail_no` (`shop_no`,`attribute_no`,`attribute_detail_no`),
  KEY `idx_attribute_no` (`attribute_no`,`attribute_detail_no`),
  KEY `idx_attribute_detail_no1` (`shop_no`,`attribute_detail_no`,`brand_no`,`attribute_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺扩充信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_group`
--

DROP TABLE IF EXISTS `shop_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_group_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '店铺分组编号',
  `shop_group_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺分组名称',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `client_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码（商场和商业集团）',
  `client_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '客户编码（商场和商业集团）',
  `invoice_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '开票名称',
  `template_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '发票模板编码',
  `template_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '发票模板名称',
  `value_date` date DEFAULT NULL COMMENT '生效日',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) DEFAULT '0' COMMENT '0-停用;1-启用',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_shop_group_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='店铺开票规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_group_dtl`
--

DROP TABLE IF EXISTS `shop_group_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_group_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_group_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺分组编号',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编号',
  `shop_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_shop_group_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='店铺分组详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_name_replace`
--

DROP TABLE IF EXISTS `shop_name_replace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_name_replace` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键(UUID)',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编码',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部编号',
  `brand_unit_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `replace_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '替换名称',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段(本部加大区)',
  `replace_no` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺替换编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_shop_brand` (`shop_no`,`brand_unit_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `special_zone_info`
--

DROP TABLE IF EXISTS `special_zone_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_zone_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经营区域ID',
  `zone_no` char(18) NOT NULL COMMENT '经营区域编号',
  `zone_code` char(18) NOT NULL COMMENT '区域编码(有且必须只能输入一位)',
  `name` varchar(10) NOT NULL COMMENT '经营区域名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '区域状态(0 = 撤消 1 = 正常)',
  `sys_no` varchar(10) DEFAULT '00' COMMENT '品牌库编码(00-通用定义 其他则为相应品牌库)',
  `create_user` varchar(32) DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建档时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_special_zone_no` (`zone_no`),
  KEY `IDX_special_zone_info_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特价大区维护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_estimate_apply`
--

DROP TABLE IF EXISTS `st_estimate_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_estimate_apply` (
  `id` int(11) NOT NULL COMMENT '主键',
  `coding_no` int(11) DEFAULT NULL COMMENT '批次号',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编号',
  `zone_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `month` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部',
  `brand_unit_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类',
  `category_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `business_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '业务类型:1-门店销售、2-地区批发、3-跨区调货、4-内购销售、5-其他出库',
  `business_type_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型名称',
  `balance_date` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '结算期(05/21-05/31)',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺小类',
  `retail_type_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺小类名称',
  `cost` decimal(20,2) DEFAULT '0.00' COMMENT '成本金额',
  `invoice_apply_amount` decimal(20,2) DEFAULT '0.00' COMMENT '开票金额',
  `invoice_apply_qty` int(11) DEFAULT NULL COMMENT '开票数量',
  `create_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `category_finance_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类财务编号',
  `category_finance_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '大类财务名称',
  PRIMARY KEY (`id`),
  KEY `IDX_sum_static_update_time` (`update_time`),
  KEY `idx_company_shop_month` (`company_no`,`shop_no`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成本结转表－预估开票';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_sales_sum`
--

DROP TABLE IF EXISTS `st_sales_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sales_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编号',
  `zone_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `province_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '省份编号',
  `province_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '省份名称',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市编号',
  `organ_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市名称',
  `biz_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市编号',
  `biz_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '经营城市名称',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `shop_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编号',
  `shop_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺名称',
  `month` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '月份',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `brand_unit_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部',
  `brand_unit_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌部名称',
  `category_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类',
  `category_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `business_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '业务类型:1-门店销售、2-地区批发、3-跨区调货、4-内购销售、5-其他出库',
  `business_type_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型名称',
  `balance_date` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '结算期(05/21-05/31)',
  `invoice_status` tinyint(3) DEFAULT '1' COMMENT '开票状态:1-开票、0-不开票',
  `retail_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺小类',
  `retail_type_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺小类名称',
  `lma_period_sales_qty` int(11) DEFAULT NULL COMMENT '上月结算期后数量',
  `lma_period_real_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '上月结算期后终端销售收入',
  `lma_period_sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '上月结算期后销售收入',
  `lma_period_sales_cost` decimal(20,2) DEFAULT '0.00' COMMENT '上月结算期后成本金额',
  `lma_period_sales_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '上月结算期后商场折扣金额',
  `lma_period_balance_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '上月结算期后结算收入',
  `tmi_period_sales_qty` int(11) DEFAULT NULL COMMENT '本月结算期内数量',
  `tmi_period_real_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月结算期内终端销售收入',
  `tmi_period_sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月结算期内销售收入',
  `tmi_period_sales_cost` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期内成本金额',
  `tmi_period_sales_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期内商场折扣金额',
  `tmi_period_balance_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月结算期内结算收入',
  `bi_period_sales_qty` int(11) DEFAULT NULL COMMENT '结算期内合计数量',
  `bi_period_real_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '结算期内合计终端销售收入',
  `bi_period_sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '结算期内合计销售收入',
  `bi_period_sales_cost` decimal(20,2) DEFAULT '0.00' COMMENT '结算期内合计成本金额',
  `bi_period_sales_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '结算期内合计商场折扣金额',
  `invoice_apply_date` date DEFAULT NULL COMMENT '结算期内合计开票日期',
  `bi_period_balance_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '销售收入',
  `bi_period_tagamount` decimal(20,4) DEFAULT '0.0000' COMMENT '牌价额',
  `bi_period_contract_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '合同正价扣费',
  `bi_period_cutrate_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '折价加扣扣费',
  `bi_period_promotion_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '促销加扣扣费',
  `bi_period_other_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '其它加扣',
  `bi_period_estimate_adjust` decimal(20,2) DEFAULT '0.00' COMMENT '预估调整',
  `bi_period_mall_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '商场扣额（含调整）',
  `tma_period_sales_qty` int(11) DEFAULT NULL COMMENT '本月结算期后数量',
  `tma_period_real_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月结算期后终端销售收入',
  `tma_period_sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月结算期后销售收入',
  `tma_period_sales_cost` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期后成本金额',
  `tma_period_sales_deduct` decimal(20,2) DEFAULT '0.00' COMMENT '本月结算期后商场折扣金额',
  `tma_period_balance_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月结算期后结算收入',
  `tm_sales_qty` int(11) DEFAULT NULL COMMENT '本月合计数量',
  `tm_period_real_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月合计终端销售收入',
  `tm_sales_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月合计销售收入',
  `tm_sales_cost` decimal(20,2) DEFAULT '0.00' COMMENT '本月合计成本金额',
  `tm_period_balance_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '本月合计结算收入',
  `tm_sales_deduct` decimal(20,4) DEFAULT '0.0000' COMMENT '本月扣费',
  `create_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sharding_flag` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '分库字段：本部+大区',
  `coding_no` int(11) DEFAULT NULL COMMENT '批次号',
  `invoice_apply_amount` decimal(20,2) DEFAULT '0.00' COMMENT '开票金额',
  `invoice_apply_qty` int(11) DEFAULT NULL COMMENT '开票数量',
  `category_finance_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大类财务编号',
  `category_finance_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '大类财务名称',
  PRIMARY KEY (`id`),
  KEY `IDX_sum_static_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='销售汇总静态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_sales_sum_ver`
--

DROP TABLE IF EXISTS `st_sales_sum_ver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sales_sum_ver` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '大区编号',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编号',
  `organ_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '管理城市',
  `business_type` tinyint(1) NOT NULL COMMENT '业务类型',
  `shop_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '店铺编号',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `brand_unit_no` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '品牌部',
  `category_no` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '大类',
  `invoice_status` tinyint(3) DEFAULT '1' COMMENT '开票状态',
  `balace_status` tinyint(3) DEFAULT '1' COMMENT '结算状态',
  `invoice_start_date` date DEFAULT NULL COMMENT '开票日期(开始)',
  `invoice_end_date` date DEFAULT NULL COMMENT '开票日期(结束)',
  `coding_no` int(11) DEFAULT NULL COMMENT '批次号',
  `create_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='销售汇总静态版本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '仓库编码',
  `parent_no` char(18) COLLATE utf8_bin DEFAULT '0' COMMENT '所属主仓库',
  `store_code` varchar(18) CHARACTER SET utf8 NOT NULL COMMENT '机构代号',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '机构简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '机构全称',
  `sys_no` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '所属业务单元',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '机构状态( 0:冻结,1:正常,9:撤销)',
  `area` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '仓库面积',
  `province_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政省编码',
  `city_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政市编码',
  `county_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政县编码',
  `zone_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '经营区域编号',
  `address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址(填写时不用包含省、市、县)',
  `zip_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `fax` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '传真号',
  `store_type` tinyint(3) unsigned NOT NULL DEFAULT '22' COMMENT '机构类型(21:店仓  22:仓库)',
  `storage_type` varchar(20) CHARACTER SET utf8 DEFAULT '1' COMMENT '仓库类别:1城市厂、2中转仓、3工厂仓',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `search_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '检索码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_store_no` (`store_no`) USING BTREE,
  KEY `IDX_store_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=239197 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商ID',
  `code` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '供应商外码',
  `supplier_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '供应商编码',
  `opcode` varchar(8) CHARACTER SET utf8 NOT NULL COMMENT '供应商特征码(必须输入且只能输入2位)',
  `short_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商简称',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商全称',
  `sys_no` varchar(10) COLLATE utf8_bin DEFAULT '00' COMMENT '所属业务单元',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '供应商状态(0 = 撤消 1 = 正常,2待确认,3确认)',
  `biz_type` varchar(20) COLLATE utf8_bin DEFAULT '0' COMMENT '经营性质(0:本厂 1:加工 2:外厂 3:样品)',
  `bank_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行帐号',
  `bank_account_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行账户名',
  `contact_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `tax_registry_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '税务登记号',
  `tax_level` varchar(20) COLLATE utf8_bin DEFAULT '0' COMMENT '纳税级别(0:一般纳税人 1:小规模纳税人)',
  `legal_person` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '法人代表',
  `identity_card` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '营业证号/身份证号',
  `fax` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '传真号',
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `province_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政省编码',
  `city_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政市编码',
  `county_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '行政县编码',
  `address` varchar(240) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `costtaxrate` decimal(4,2) DEFAULT NULL COMMENT '进项税率',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `search_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '检索码',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  `organ_type_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '本部编码',
  `can_order` char(1) COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '是否配码订货(Y 是;N 否)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_supplier_no` (`supplier_no`) USING BTREE,
  KEY `IDX_supplier_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12876 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_group`
--

DROP TABLE IF EXISTS `supplier_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '组代号',
  `group_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '组名称',
  `enable_time` datetime DEFAULT NULL COMMENT '启用日期',
  `disable_time` datetime DEFAULT NULL COMMENT '终止日期',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '是否审核，0未审核，1审核',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `organ_type_no` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '本部编码',
  PRIMARY KEY (`id`),
  KEY `IDX_supplier_group_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商组设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_group_rel`
--

DROP TABLE IF EXISTS `supplier_group_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_group_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '组代号',
  `supplier_no` char(18) CHARACTER SET utf8 NOT NULL COMMENT '供应商编码',
  `supplier_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_no` (`group_no`,`supplier_no`),
  KEY `IDX_supplier_group_rel_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=928 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商组与供应商关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_rate_set`
--

DROP TABLE IF EXISTS `supplier_rate_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_rate_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_no` char(30) COLLATE utf8_bin NOT NULL COMMENT '供应商编号',
  `supplier_name` char(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `tariff_rate` decimal(10,4) DEFAULT NULL COMMENT '关税率',
  `vat_rate` decimal(10,4) DEFAULT NULL COMMENT '增值税率',
  `currency_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '结算币种，关联currency_management表',
  `create_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商税率设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_return_profit`
--

DROP TABLE IF EXISTS `supplier_return_profit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_return_profit` (
  `id` char(32) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编号',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编号',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `bill_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编码',
  `item_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `brand_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '品牌',
  `generate_date` date DEFAULT NULL COMMENT '返利日期',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '返利金额',
  `is_invoiced` tinyint(3) DEFAULT NULL COMMENT '是否开票(0-已开票 1-未开票)',
  `return_type` tinyint(3) DEFAULT NULL COMMENT '是否系统生成(0-系统生成 1-手动新增 2-批量导入)',
  `invoice_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '发票号',
  `invoice_date` date DEFAULT NULL COMMENT '发票日期',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '返利原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商返利表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_tariff_set`
--

DROP TABLE IF EXISTS `supplier_tariff_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_tariff_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '供应商编号',
  `supplier_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `tariff_rate` decimal(10,4) DEFAULT NULL COMMENT '关税率',
  `style_no` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '款号',
  `effective_date` date DEFAULT NULL COMMENT '生效时间',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='供应商款号关税设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_param_set`
--

DROP TABLE IF EXISTS `system_param_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_param_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `business_organ_type` tinyint(4) DEFAULT NULL COMMENT '业务组织控制级别类型 1、大区 2、公司 3、店铺',
  `business_organ_no` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '业务组织编码',
  `business_organ_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '业务组织名称',
  `param_code` char(25) COLLATE utf8_bin DEFAULT NULL COMMENT '参数编码',
  `param_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名称',
  `dtl_value` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '参数值',
  `dtl_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名称',
  `param_obj_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '参数对象编码(备用)',
  `param_description` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '参数描述',
  `control_type` tinyint(3) DEFAULT NULL COMMENT '控制类型 0、不控制 1、全部控制 2、局部控制',
  `status` tinyint(3) DEFAULT NULL COMMENT '状态 1、启用 0、停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_system_param_set_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `to_register`
--

DROP TABLE IF EXISTS `to_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `to_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `supplier_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商编码',
  `supplier_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '供应商名称',
  `payment_date` date DEFAULT NULL COMMENT '拒付日期',
  `payment_amount` decimal(20,2) DEFAULT '0.00' COMMENT '拒付金额',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='拒付登记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_balance_date`
--

DROP TABLE IF EXISTS `transfer_balance_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_balance_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `saler_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '调出公司编码',
  `saler_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '调出公司名称',
  `buyer_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '调入公司编码',
  `buyer_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '调入公司名称',
  `balance_month` char(6) COLLATE utf8_bin DEFAULT NULL COMMENT '结算月份',
  `balance_start_date` date DEFAULT NULL COMMENT '结算起始日期',
  `balance_end_date` date DEFAULT NULL COMMENT '结算终止日期',
  `invoice_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '开票标志 (0-未开票，1-已开票)',
  `balance_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '结算标志 (0-未生成，1-已生成)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime DEFAULT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地区调货结算期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voucher_type`
--

DROP TABLE IF EXISTS `voucher_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vouch_type_code` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '凭证类型编码',
  `vouch_type_name` varchar(60) COLLATE utf8_bin DEFAULT NULL COMMENT '凭证类别名称',
  `short_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '类别简称',
  `show_order` tinyint(3) DEFAULT NULL COMMENT '显示顺序',
  `company_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '公司编码',
  `currency_code` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '默认币种',
  `seal_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '封存标志',
  `glorg_book` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '主体账簿主键',
  `vouch_type` tinyint(3) DEFAULT NULL COMMENT '凭证分类',
  `restrict_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '科目限制标志',
  `print_template` char(20) COLLATE utf8_bin DEFAULT NULL COMMENT '默认打印模板',
  `del_flag` tinyint(3) unsigned DEFAULT '0' COMMENT '删除标志',
  `status` tinyint(3) DEFAULT '0' COMMENT '启用标志 1、已启用 0、已停用',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_vouch_type_code` (`vouch_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='凭证类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wholesale_customer_remaining_dtl`
--

DROP TABLE IF EXISTS `wholesale_customer_remaining_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesale_customer_remaining_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_id` int(11) NOT NULL COMMENT '客户余额主表ID',
  `pre_payment_id` int(11) DEFAULT '0' COMMENT '预收款ID （0：支出 无预收款ID）',
  `type` tinyint(3) DEFAULT '0' COMMENT '收支类型 （0：收入  1：支出）',
  `money` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `remaining_amount` decimal(20,2) DEFAULT '0.00' COMMENT '剩余总金额金额',
  `ref_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `position` bigint(11) DEFAULT NULL COMMENT '排序，用于处理历史数据排序问题',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `bill_type` int(11) DEFAULT '0' COMMENT '单据类型',
  `biz_type` tinyint(3) DEFAULT '0' COMMENT '业务类型',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编码',
  `rebate_amount` decimal(20,2) DEFAULT '0.00' COMMENT '返利金额',
  `frozen_amount` decimal(20,2) DEFAULT '0.00' COMMENT '客户冻结余额',
  `other_price` decimal(12,2) DEFAULT '0.00' COMMENT '其他费用',
  `bill_date` date DEFAULT NULL COMMENT '交易日期',
  PRIMARY KEY (`id`),
  KEY `IDX_wholesale_customer_remaining_dtl_update_time` (`update_time`) USING BTREE,
  KEY `IDEX_BILL_DATE` (`bill_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户余额明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wholesale_customer_remaining_dtl_tmp`
--

DROP TABLE IF EXISTS `wholesale_customer_remaining_dtl_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesale_customer_remaining_dtl_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `main_id` int(11) NOT NULL COMMENT '客户余额主表ID',
  `pre_payment_id` int(11) DEFAULT '0' COMMENT '预收款ID （0：支出 无预收款ID）',
  `type` tinyint(3) DEFAULT '0' COMMENT '收支类型 （0：收入  1：支出）',
  `money` decimal(20,2) DEFAULT '0.00' COMMENT '金额',
  `remaining_amount` decimal(20,2) DEFAULT '0.00' COMMENT '剩余总金额金额',
  `ref_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '相关单号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `position` bigint(11) DEFAULT NULL COMMENT '排序，用于处理历史数据排序问题',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `bill_type` int(11) DEFAULT '0' COMMENT '单据类型',
  `biz_type` tinyint(3) DEFAULT '0' COMMENT '业务类型',
  `bill_no` char(30) COLLATE utf8_bin DEFAULT NULL COMMENT '单据编码',
  `rebate_amount` decimal(20,2) DEFAULT '0.00' COMMENT '返利金额',
  `frozen_amount` decimal(20,2) DEFAULT '0.00' COMMENT '客户冻结余额',
  `other_price` decimal(12,2) DEFAULT '0.00' COMMENT '其他费用',
  PRIMARY KEY (`id`),
  KEY `IDX_wholesale_customer_remaining_dtl_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户余额明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wholesale_customer_remaining_sum`
--

DROP TABLE IF EXISTS `wholesale_customer_remaining_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesale_customer_remaining_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '公司编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '公司名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `remaining_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '客户余额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `frozen_customer_amount` decimal(20,2) DEFAULT '0.00' COMMENT '冻结客户金额',
  PRIMARY KEY (`id`),
  KEY `IDX_wholesale_customer_remaining_sum_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户余额主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wholesale_margin_init`
--

DROP TABLE IF EXISTS `wholesale_margin_init`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesale_margin_init` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算主体编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算主体名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '保证金额度',
  `init_margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '初始保证金额度',
  `init_pre_payment` decimal(12,2) DEFAULT '0.00' COMMENT '初始预收款',
  `pre_order_no` char(18) COLLATE utf8_bin DEFAULT NULL COMMENT '预收订单号',
  `finish_flag` tinyint(3) DEFAULT '0' COMMENT '初始化完成标志（0：未完成 1：已完成）',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_wholesale_margin_init_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户保证金及预收款初始化';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wholesale_prepay_warn`
--

DROP TABLE IF EXISTS `wholesale_prepay_warn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesale_prepay_warn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算主体编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算主体名称',
  `customer_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '客户编码',
  `customer_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '保证金金额',
  `reced_margin_amount` decimal(12,2) DEFAULT '0.00' COMMENT '已收保证金金额',
  `margin_full` tinyint(3) DEFAULT NULL COMMENT '保证金是否足额（0 = 是 1 = 否）',
  `pre_payment` decimal(12,2) DEFAULT '0.00' COMMENT '预收款',
  `pre_order_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '预收订单号',
  `order_amount` decimal(12,2) DEFAULT '0.00' COMMENT '订单金额',
  `send_out_amount` decimal(12,2) DEFAULT '0.00' COMMENT '出库金额',
  `pre_order_full` tinyint(3) DEFAULT NULL COMMENT '订货预收是否足额（0 = 是 1 = 否）',
  `pre_send_out_full` tinyint(3) DEFAULT NULL COMMENT '发货预收是否足额（0 = 是 1 = 否）',
  `pre_payment_profit` decimal(12,2) DEFAULT '0.00' COMMENT '预收款盈余',
  `reversal_amount` decimal(12,2) DEFAULT '0.00' COMMENT '已冲销金额',
  `reversal_over_amount` decimal(12,2) DEFAULT '0.00' COMMENT '可冲销金额',
  `pre_payment_over` decimal(12,2) DEFAULT '0.00' COMMENT '预收款余额',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_wholesale_prepay_warn_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户保证金预收款预警';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wholesale_rece_term`
--

DROP TABLE IF EXISTS `wholesale_rece_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesale_rece_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `term_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '条款编码',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '条款名称',
  `company_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '结算主体编码',
  `company_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '结算主体名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态（0 = 撤消 1 = 正常）',
  `control_type` tinyint(3) DEFAULT '0' COMMENT '控制类型（0 = 批发订单控制 1 = 客户余额控制)',
  `create_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL COMMENT '建档时间',
  `update_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `IDX_wholesale_rece_term_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地区批发收款条款-表头';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wholesale_rece_term_dtl`
--

DROP TABLE IF EXISTS `wholesale_rece_term_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wholesale_rece_term_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `term_no` char(18) COLLATE utf8_bin NOT NULL COMMENT '条款编码',
  `advance_type` tinyint(3) DEFAULT NULL COMMENT '预收类型',
  `advance_scale` int(3) DEFAULT NULL COMMENT '预收比例',
  `control_point` tinyint(3) unsigned DEFAULT '1' COMMENT '控制点(0-订货 1-补货)',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `IDX_wholesale_rece_term_dtl_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='地区批发收款条款-表体';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zone_info`
--

DROP TABLE IF EXISTS `zone_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经营区域ID',
  `zone_no` char(18) NOT NULL COMMENT '经营区域编号',
  `zone_code` char(1) NOT NULL COMMENT '区域编码(有且必须只能输入一位)',
  `name` varchar(10) NOT NULL COMMENT '经营区域名称',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '区域状态(0 = 撤消 1 = 正常)',
  `sys_no` varchar(10) DEFAULT '00' COMMENT '品牌库编码(00-通用定义 其他则为相应品牌库)',
  `create_user` varchar(32) DEFAULT NULL COMMENT '建档人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建档时间',
  `update_user` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `time_seq` bigint(20) DEFAULT NULL COMMENT '时间序列',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_zone_no` (`zone_no`) USING BTREE,
  KEY `IDX_zone_info_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='经营区域信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `company_balance_bill`
--

/*!50001 DROP VIEW IF EXISTS `company_balance_bill`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`retail_fms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `company_balance_bill` AS select concat(`c`.`company_no`,`balt`.`balance_code`,`cbr`.`send_receive_type`,`cbr`.`bill_code`) AS `company_bill_code`,`c`.`company_no` AS `company_no`,`c`.`name` AS `company_name`,1 AS `company_type`,'总部' AS `company_type_name`,`balt`.`balance_no` AS `balance_no`,`balt`.`balance_code` AS `balance_code`,`balt`.`balance_name` AS `balance_name`,`balt`.`part_type` AS `part_type`,(case `balt`.`part_type` when 1 then '总部' when 2 then '地区' end) AS `part_type_name`,`balt`.`business_type` AS `business_type`,(case `balt`.`business_type` when 1 then '采购' when 2 then '销售' end) AS `business_type_name`,`balt`.`is_balance` AS `is_balance`,`bilt`.`bill_code` AS `bill_code`,`bilt`.`bill_name` AS `bill_name`,`bilt`.`transfer_type` AS `transfer_type`,(case `bilt`.`transfer_type` when 1 then '出库' when 2 then '入库' end) AS `transfer_type_name`,`cbr`.`send_receive_type` AS `send_receive_type`,(case `cbr`.`send_receive_type` when 1 then '发货' when 2 then '收货' end) AS `send_receive_type_name`,`cbr`.`is_count` AS `is_count`,`bilt`.`rel_sys` AS `rel_sys`,`bilt`.`table_name` AS `table_name`,`bilt`.`describe` AS `describe`,`cbr`.`create_user` AS `create_user`,`cbr`.`create_time` AS `create_time`,`cbr`.`update_user` AS `update_user`,`cbr`.`update_time` AS `update_time` from (((`company` `c` join `con_company_bill_rel` `cbr` on(((`cbr`.`company_no` = '00001') and (`cbr`.`status` = 1)))) join `con_balance_type` `balt` on(((`cbr`.`balance_no` = `balt`.`balance_no`) and (`balt`.`status` = 1)))) join `con_bill_type` `bilt` on(((`cbr`.`bill_code` = `bilt`.`bill_code`) and (`bilt`.`status` = 1)))) where (`c`.`company_no` in (select `financial_account`.`company_no` from `financial_account` where ((`financial_account`.`group_lead_role` = 1) and (`financial_account`.`status` = 1))) and (`c`.`status` = 1) and (not(exists(select `cbr`.`company_no` from `con_company_bill_rel` `cbr` where (`cbr`.`company_no` = `c`.`company_no`))))) union all select concat(`c`.`company_no`,`balt`.`balance_code`,`cbr`.`send_receive_type`,`cbr`.`bill_code`) AS `company_bill_code`,`c`.`company_no` AS `company_no`,`c`.`name` AS `company_name`,1 AS `company_type`,'总部' AS `company_type_name`,`balt`.`balance_no` AS `balance_no`,`balt`.`balance_code` AS `balance_code`,`balt`.`balance_name` AS `balance_name`,`balt`.`part_type` AS `part_type`,(case `balt`.`part_type` when 1 then '总部' when 2 then '地区' end) AS `part_type_name`,`balt`.`business_type` AS `business_type`,(case `balt`.`business_type` when 1 then '采购' when 2 then '销售' end) AS `business_type_name`,`balt`.`is_balance` AS `is_balance`,`bilt`.`bill_code` AS `bill_code`,`bilt`.`bill_name` AS `bill_name`,`bilt`.`transfer_type` AS `transfer_type`,(case `bilt`.`transfer_type` when 1 then '出库' when 2 then '入库' end) AS `transfer_type_name`,`cbr`.`send_receive_type` AS `send_receive_type`,(case `cbr`.`send_receive_type` when 1 then '发货' when 2 then '收货' end) AS `send_receive_type_name`,`cbr`.`is_count` AS `is_count`,`bilt`.`rel_sys` AS `rel_sys`,`bilt`.`table_name` AS `table_name`,`bilt`.`describe` AS `describe`,`cbr`.`create_user` AS `create_user`,`cbr`.`create_time` AS `create_time`,`cbr`.`update_user` AS `update_user`,`cbr`.`update_time` AS `update_time` from (((`company` `c` join `con_company_bill_rel` `cbr` on(((`cbr`.`company_no` = `c`.`company_no`) and (`cbr`.`status` = 1)))) join `con_balance_type` `balt` on(((`cbr`.`balance_no` = `balt`.`balance_no`) and (`balt`.`status` = 1)))) join `con_bill_type` `bilt` on(((`cbr`.`bill_code` = `bilt`.`bill_code`) and (`bilt`.`status` = 1)))) where (`c`.`company_no` in (select `financial_account`.`company_no` from `financial_account` where ((`financial_account`.`group_lead_role` = 1) and (`financial_account`.`status` = 1))) and (`c`.`status` = 1) and exists(select `cbr`.`company_no` from `con_company_bill_rel` `cbr` where (`cbr`.`company_no` = `c`.`company_no`))) union all select concat(`c`.`company_no`,`balt`.`balance_code`,`cbr`.`send_receive_type`,`cbr`.`bill_code`) AS `company_bill_code`,`c`.`company_no` AS `company_no`,`c`.`name` AS `company_name`,2 AS `company_type`,'地区' AS `company_type_name`,`balt`.`balance_no` AS `balance_no`,`balt`.`balance_code` AS `balance_code`,`balt`.`balance_name` AS `balance_name`,`balt`.`part_type` AS `part_type`,(case `balt`.`part_type` when 1 then '总部' when 2 then '地区' end) AS `part_type_name`,`balt`.`business_type` AS `business_type`,(case `balt`.`business_type` when 1 then '采购' when 2 then '销售' end) AS `business_type_name`,`balt`.`is_balance` AS `is_balance`,`bilt`.`bill_code` AS `bill_code`,`bilt`.`bill_name` AS `bill_name`,`bilt`.`transfer_type` AS `transfer_type`,(case `bilt`.`transfer_type` when 1 then '出库' when 2 then '入库' end) AS `transfer_type_name`,`cbr`.`send_receive_type` AS `send_receive_type`,(case `cbr`.`send_receive_type` when 1 then '发货' when 2 then '收货' end) AS `send_receive_type_name`,`cbr`.`is_count` AS `is_count`,`bilt`.`rel_sys` AS `rel_sys`,`bilt`.`table_name` AS `table_name`,`bilt`.`describe` AS `describe`,`cbr`.`create_user` AS `create_user`,`cbr`.`create_time` AS `create_time`,`cbr`.`update_user` AS `update_user`,`cbr`.`update_time` AS `update_time` from (((`company` `c` join `con_company_bill_rel` `cbr` on(((`cbr`.`company_no` = '00002') and (`cbr`.`status` = 1)))) join `con_balance_type` `balt` on(((`cbr`.`balance_no` = `balt`.`balance_no`) and (`balt`.`status` = 1)))) join `con_bill_type` `bilt` on(((`cbr`.`bill_code` = `bilt`.`bill_code`) and (`bilt`.`status` = 1)))) where ((not(`c`.`company_no` in (select `financial_account`.`company_no` from `financial_account` where ((`financial_account`.`group_lead_role` = 1) and (`financial_account`.`status` = 1))))) and (`c`.`status` = 1) and (not(exists(select `cbr`.`company_no` from `con_company_bill_rel` `cbr` where (`cbr`.`company_no` = `c`.`company_no`))))) union all select concat(`c`.`company_no`,`balt`.`balance_code`,`cbr`.`send_receive_type`,`cbr`.`bill_code`) AS `company_bill_code`,`c`.`company_no` AS `company_no`,`c`.`name` AS `company_name`,2 AS `company_type`,'地区' AS `company_type_name`,`balt`.`balance_no` AS `balance_no`,`balt`.`balance_code` AS `balance_code`,`balt`.`balance_name` AS `balance_name`,`balt`.`part_type` AS `part_type`,(case `balt`.`part_type` when 1 then '总部' when 2 then '地区' end) AS `part_type_name`,`balt`.`business_type` AS `business_type`,(case `balt`.`business_type` when 1 then '采购' when 2 then '销售' end) AS `business_type_name`,`balt`.`is_balance` AS `is_balance`,`bilt`.`bill_code` AS `bill_code`,`bilt`.`bill_name` AS `bill_name`,`bilt`.`transfer_type` AS `transfer_type`,(case `bilt`.`transfer_type` when 1 then '出库' when 2 then '入库' end) AS `transfer_type_name`,`cbr`.`send_receive_type` AS `send_receive_type`,(case `cbr`.`send_receive_type` when 1 then '发货' when 2 then '收货' end) AS `send_receive_type_name`,`cbr`.`is_count` AS `is_count`,`bilt`.`rel_sys` AS `rel_sys`,`bilt`.`table_name` AS `table_name`,`bilt`.`describe` AS `describe`,`cbr`.`create_user` AS `create_user`,`cbr`.`create_time` AS `create_time`,`cbr`.`update_user` AS `update_user`,`cbr`.`update_time` AS `update_time` from (((`company` `c` join `con_company_bill_rel` `cbr` on(((`cbr`.`company_no` = `c`.`company_no`) and (`cbr`.`status` = 1)))) join `con_balance_type` `balt` on(((`cbr`.`balance_no` = `balt`.`balance_no`) and (`balt`.`status` = 1)))) join `con_bill_type` `bilt` on(((`cbr`.`bill_code` = `bilt`.`bill_code`) and (`bilt`.`status` = 1)))) where ((not(`c`.`company_no` in (select `financial_account`.`company_no` from `financial_account` where ((`financial_account`.`group_lead_role` = 1) and (`financial_account`.`status` = 1))))) and (`c`.`status` = 1) and exists(select `cbr`.`company_no` from `con_company_bill_rel` `cbr` where (`cbr`.`company_no` = `c`.`company_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `company_item_price`
--

/*!50001 DROP VIEW IF EXISTS `company_item_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`retail_fms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `company_item_price` AS (select `company`.`company_no` AS `company_no`,`region_cost_maintain`.`zone_no` AS `zone_no`,`region_cost_maintain`.`item_no` AS `item_no`,`region_cost_maintain`.`effective_time` AS `effective_time`,`region_cost_maintain`.`region_cost` AS `region_cost` from (`company` join `region_cost_maintain` on((`company`.`zone_no` = `region_cost_maintain`.`zone_no`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `company_store`
--

/*!50001 DROP VIEW IF EXISTS `company_store`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`retail_fms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `company_store` AS (select `company`.`company_no` AS `company_no`,min(`store`.`store_no`) AS `store_no` from (`company` left join `store` on((`company`.`zone_no` = `store`.`zone_no`))) group by `company`.`company_no`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `item_category_brand`
--

/*!50001 DROP VIEW IF EXISTS `item_category_brand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`retail_fms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `item_category_brand` AS (select `item`.`item_no` AS `item_no`,`item`.`category_no` AS `category_no`,`category`.`name` AS `category_name`,`item`.`brand_no` AS `brand_no`,`brand`.`name` AS `brand_name` from ((`item` left join `category` on((`item`.`category_no` = `category`.`category_no`))) left join `brand` on((`item`.`brand_no` = `brand`.`brand_no`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderunit_company_zone`
--

/*!50001 DROP VIEW IF EXISTS `orderunit_company_zone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`retail_fms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `orderunit_company_zone` AS (select `order_unit`.`order_unit_no` AS `order_unit_no`,`company`.`company_no` AS `company_no`,`company`.`zone_no` AS `zone_no` from (`order_unit` join `company` on((`order_unit`.`company_no` = `company`.`company_no`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rand_item_list`
--

/*!50001 DROP VIEW IF EXISTS `rand_item_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`retail_fms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `rand_item_list` AS (select `item`.`id` AS `id`,`item`.`item_no` AS `item_no`,`item`.`code` AS `code`,`item`.`name` AS `name`,`item`.`full_name` AS `full_name`,`item`.`en_name` AS `en_name`,`item`.`sys_no` AS `sys_no`,`item`.`style_no` AS `style_no`,`item`.`brand_no` AS `brand_no`,`item`.`shoe_model` AS `shoe_model`,`item`.`ingredients` AS `ingredients`,`item`.`mainqdb` AS `mainqdb`,`item`.`lining` AS `lining`,`item`.`color_no` AS `color_no`,`item`.`main_color` AS `main_color`,`item`.`root_category_no` AS `category_no`,`item`.`repeatlisting` AS `repeatlisting`,`item`.`gender` AS `gender`,`item`.`heeltype` AS `heeltype`,`item`.`bottomtype` AS `bottomtype`,`item`.`size_kind` AS `size_kind`,`item`.`status` AS `status`,`item`.`tag_price` AS `tag_price`,`item`.`suggest_tag_price` AS `suggest_tag_price`,`item`.`purchase_tax_price` AS `purchase_tax_price`,`item`.`costtaxrate` AS `costtaxrate`,`item`.`saletaxrate` AS `saletaxrate`,`item`.`material_price` AS `material_price`,`item`.`supplier_no` AS `supplier_no`,`item`.`supplier_item_no` AS `supplier_item_no`,`item`.`supplier_item_name` AS `supplier_item_name`,`item`.`orderfrom` AS `orderfrom`,`item`.`years` AS `years`,`item`.`sell_season` AS `sell_season`,`item`.`purchase_season` AS `purchase_season`,`item`.`sale_date` AS `sale_date`,`item`.`search_code` AS `search_code`,`item`.`style` AS `style`,`item`.`create_user` AS `create_user`,`item`.`create_time` AS `create_time`,`item`.`update_user` AS `update_user`,`item`.`update_time` AS `update_time`,`item`.`remark` AS `remark`,`category`.`name` AS `category_name`,`brand`.`name` AS `brand_name` from ((`item` left join `category` on((`item`.`root_category_no` = `category`.`category_no`))) left join `brand` on((`item`.`brand_no` = `brand`.`brand_no`))) order by rand() limit 300) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-29 10:04:22
