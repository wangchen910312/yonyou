--配件常用表结构
--PT_0431T	装箱单头信息
--PT_0432T	装箱单配件信息
--PT_0201T	配件主信息
--PT_0211T	客户信息
--CM_0103T	中心信息
--PT_0422T	采购订单配件信息
--PT_0502T	配件要请配件信息
--PT_0301T	现库存信息
--PT_0302T	配件预约信息
--PT_0511T	配件出库头信息
--PT_0512T	配件出库配件信息
--PT_0411T	采购要请信息
--PT_0501T	配件要请头信息
--PT_0214T	配件销售价格主信息
--PT_0208T	成本价
--PT_0224T	LOCATION STORAGE ITEM 主信息 类似配件的货位情况表
--PT_0231T	PACKAGE DETAIL
--SE_0300T	维修委托管理--工单/委托单管理
--CM_0801T	用户信息
--CM_3401T	部门表
--PT_0312T	收付文件配件信息---出入库记录明细表
--PT_0422I  采购订单配件信息 通信表
--PT_0421I  采购订单头信息  通信表
--CM_0101T  经销商信息
--PT_0422T  采购订单配件信息
--PT_0421T  采购订单头信息
--PT_0621T  外采入库的时候会插入数据（没有装箱单）-有入库单的主数据
--PT_0622T  外采入库的时候会插入数据（明细）
--PT_0218I  bmp配件价格的历史记录表  与PT_0214I相似
--PT_0214I  BMP LIST PRICE--BMP采购价的接口表
--PT_0910T  配件运营数据月份表
--PT_0435I  DCS的装箱单历史表--接口表（DCS没有装箱单和订单业务表）
--pt_0521T -----配件销售（退货）表
--PT_0522T -----配件销售配件信息
--PT_0102T 入库类型 
--PT_0311T  操作时间STMT_PROC_DT

---常用字段
--STRGE_CD--仓库代码
--LOC_CD--货位代码
--ITEM_CD --配件编号
--ITEM_NM --配件名称
--MVT_TP--出入库类型编号
--MVT_TP_NM--出入库类型名称