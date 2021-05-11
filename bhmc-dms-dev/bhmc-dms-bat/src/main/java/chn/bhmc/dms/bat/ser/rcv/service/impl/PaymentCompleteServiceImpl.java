package chn.bhmc.dms.bat.ser.rcv.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

import able.com.service.HService;
import chn.bhmc.dms.bat.ser.rcv.service.PaymentCompleteService;
import chn.bhmc.dms.bat.ser.rcv.service.dao.PaymentCompleteDAO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayCalculateSearchVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayCalculateVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayCouponList;
import chn.bhmc.dms.bat.ser.rcv.vo.HttpUtil;
import chn.bhmc.dms.bat.ser.rcv.vo.PayData;
import chn.bhmc.dms.bat.ser.rcv.vo.PaymentCompleteVO;
import chn.bhmc.dms.cmm.pay.service.AggregatePaymentLogService;
import chn.bhmc.dms.cmm.pay.service.CouponDetailsService;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;
import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;
import net.sf.json.JSONArray;
import chn.bhmc.dms.bat.ser.rcv.vo.PayQueryTrade;
import chn.bhmc.dms.bat.ser.rcv.vo.PayQueryTradeResult;
import chn.bhmc.dms.bat.ser.rcv.vo.PayRepairOrderVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayResponseDataForPayQuery;
import chn.bhmc.dms.bat.ser.rcv.vo.PayServiceReceiveDetailVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayServiceReceiveSaveVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayServiceReceiveSearchVO;
import chn.bhmc.dms.bat.ser.rcv.vo.PayServiceReceiveVO;

@Service("paymentCompleteService")
public class PaymentCompleteServiceImpl extends HService implements PaymentCompleteService {

	@Resource(name = "paymentCompleteDAO")
	PaymentCompleteDAO paymentCompleteDAO;

	// 聚合日志
	@Resource(name = "aggregatePaymentLogService")
	AggregatePaymentLogService aggregatePaymentLogService;
	
	//优惠券明细日志
	@Resource(name = "couponDetailsService")
	CouponDetailsService couponDetailsService;

	/*@Override
	public void finish() throws Exception {
		// TODO Auto-generated method stub
		PaymentCompleteVO paymentCompleteVO1 = new PaymentCompleteVO();
		paymentCompleteVO1.setTradeId("0");
		List<PaymentCompleteVO> selectByParams = paymentCompleteDAO.selectByParams(paymentCompleteVO1);
		if (selectByParams.size() > 0) {
			for (PaymentCompleteVO paymentCompleteVO : selectByParams) {
				PayQueryTrade queryTrade = new PayQueryTrade();
				queryTrade.setTradeId(paymentCompleteVO.getTradeId());
				List<PayQueryTrade> queryTrades = new ArrayList<>();
				queryTrades.add(queryTrade);
				PayQueryTradeResult queryTradeResult = new PayQueryTradeResult();
				queryTradeResult.setTradeIds(queryTrades);
				queryTradeResult.setDlrcd(paymentCompleteVO.getDlrCd());
				HttpUtil httpUtil = new HttpUtil();
				net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(queryTradeResult);
				String param = jsonArray.toString();
				Properties ret = PropertiesLoaderUtils
						.loadProperties(new ClassPathResource("/config/common.properties"));
				Map<String, Object> map = httpUtil.sendPost(ret.getProperty("queryTradeUrl"), param, false);
				if (map.get("status").equals("200")) {
					Object object = map.get("response");
					net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
					PayResponseDataForPayQuery responseDataForPayQuery = (PayResponseDataForPayQuery) net.sf.json.JSONObject
							.toBean(jsonObject, PayResponseDataForPayQuery.class);
					if (responseDataForPayQuery != null) {
						if (responseDataForPayQuery.getCode() == 91200) {
							// 91200-请求成功，其它为不成功 
							net.sf.json.JSONObject jsonData = net.sf.json.JSONObject
									.fromObject(responseDataForPayQuery.getData().get(0));
							PayData data1 = (PayData) net.sf.json.JSONObject.toBean(jsonData, PayData.class);
							PayCouponList couponList = null;
							if (data1.getCouponList() != null) {
								net.sf.json.JSONObject couponListData = net.sf.json.JSONObject
										.fromObject(data1.getCouponList().get(0));
								couponList = (PayCouponList) net.sf.json.JSONObject.toBean(couponListData, PayCouponList.class);
							}
							if (data1.getGateReturnType().equals("S")) {
								// S:下单成功E:查询失败
								// 10451001 ：等待支付 10451004 ：交易成功 10451005 ：交易失败
								if (data1.getTradeStatus().equals("10451004")) {
									System.out.println("data1.getTradeStatus() = 10451004" +paymentCompleteVO.getRcvDocNo() +"交易成功");
									// 新增数据并改值
									PayServiceReceiveDetailVO serviceReceiveDetailVO = new PayServiceReceiveDetailVO();
									serviceReceiveDetailVO.setTradeId(paymentCompleteVO.getTradeId());
									serviceReceiveDetailVO.setCalcAmt(paymentCompleteVO.getCalcAmt());// 结算金额
									serviceReceiveDetailVO.setCalcDocNo(paymentCompleteVO.getCalcDocNo());// 服务结算号码
									serviceReceiveDetailVO.setNpayAmt(0d);// 欠款金额
									serviceReceiveDetailVO.setPaymMthCd("26");// 付款方法代码
									//serviceReceiveDetailVO.setPaymPrid("01");// 付款期限
									//serviceReceiveDetailVO.setPaymTp("01");// 付款类型   20191114 取消
									serviceReceiveDetailVO.setPaymYn("N");// 是否退款
									serviceReceiveDetailVO.setRcptDt(new Date());// 发票日期 前台页面取当前时间20191114
									serviceReceiveDetailVO
											.setRcvAmt(Double.parseDouble(paymentCompleteVO.getPaymAmt()));// 收款金额
									serviceReceiveDetailVO.setRcvCpltDt(new Date());// 收款完成日期
									serviceReceiveDetailVO.setRcvDocNo(paymentCompleteVO.getRcvDocNo());// 收款登记号码
									serviceReceiveDetailVO.setRcvRemark("系统定时完成");// 付款备注
									serviceReceiveDetailVO.setRcvStatCd("F");// 收款状态代码  20191115 前台页面的是否付款完成由此显示（sql进行判断了）
									serviceReceiveDetailVO.setRcvSubDocNo(paymentCompleteVO.getRcvSubDocNo());// 收款子文件编号
									serviceReceiveDetailVO.setRoDocNo(paymentCompleteVO.getRoDocNo());// 维修委托号码
									serviceReceiveDetailVO.setSerParDstinCd("SER");
									serviceReceiveDetailVO.setPayYn("Y");// 标识----需修改为Y防止再次查询到数据
									serviceReceiveDetailVO.setDlrCd(paymentCompleteVO.getDlrCd());
									serviceReceiveDetailVO.setRegUsrId(paymentCompleteVO.getRegUsrId());
									//20191113 add 优惠金额 实收金额
									if (couponList != null) {
										//优惠金额=订单金额orderAmount-实收金额payAmount
										double orderAmount = Double.parseDouble(data1.getOrderAmount());
										double payAmount = Double.parseDouble(data1.getPayAmount());
										double discountAmt = orderAmount - payAmount;
										System.out.println("优惠金额"+discountAmt+"=订单金额:"+payAmount+"实收金额:"+discountAmt);
										serviceReceiveDetailVO.setDiscountAmt(discountAmt);
										serviceReceiveDetailVO.setReceivedAmt(Double.parseDouble(data1.getPayAmount()));
									}else {
										//没使用优惠券
										serviceReceiveDetailVO.setDiscountAmt(0);
										serviceReceiveDetailVO.setReceivedAmt(Double.parseDouble(paymentCompleteVO.getPaymAmt()));
									}
									
									PayServiceReceiveSaveVO serviceReceiveSaveVO = new PayServiceReceiveSaveVO();
									serviceReceiveSaveVO.setServiceReceiveDetailVO(serviceReceiveDetailVO);
									this.multiServiceReceiveDetail(serviceReceiveSaveVO);
									// log
									AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
									aggregatePaymentLogVO.setTriggerPage("定时任务");
									aggregatePaymentLogVO.setTradeId(paymentCompleteVO.getTradeId());
									aggregatePaymentLogVO.setAmount(paymentCompleteVO.getPaymAmt());
									aggregatePaymentLogVO.setStatus("2");
									aggregatePaymentLogVO.setBusinessNumber(paymentCompleteVO.getRcvDocNo());
									aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
									System.out.println("执行insertLog");
								}
							}
						}
					}
				}
			}
		}

	}*/
	
	
	//201912/12  by wushibin  请求订单状态 由多次发送请求改为发送一次请求
	@Override
	public void finish() throws Exception {
		// TODO Auto-generated method stub
		PaymentCompleteVO paymentCompleteVO1 = new PaymentCompleteVO();
		paymentCompleteVO1.setTradeId("0");
		List<PaymentCompleteVO> selectByParams = paymentCompleteDAO.selectByParams(paymentCompleteVO1);
		if (selectByParams.size() > 0) {
			PayQueryTradeResult queryTradeResult = new PayQueryTradeResult();
			List<PayQueryTrade> queryTrades = new ArrayList<PayQueryTrade>();
			for (PaymentCompleteVO paymentCompleteVO : selectByParams) {
				PayQueryTrade queryTrade = new PayQueryTrade();
				queryTrade.setTradeId(paymentCompleteVO.getTradeId());
				queryTrades.add(queryTrade);
			}
			queryTradeResult.setDlrcd(selectByParams.get(0).getDlrCd());
			queryTradeResult.setTradeIds(queryTrades);
			//发送一次请求返回多个结果集
			HttpUtil httpUtil = new HttpUtil();
			net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(queryTradeResult);
			String param = jsonArray.toString();
			Properties ret = PropertiesLoaderUtils
					.loadProperties(new ClassPathResource("/config/common.properties"));
			Map<String, Object> map = httpUtil.sendPost(ret.getProperty("queryTradeUrl"), param, false);
			if (map.get("status").equals("200")) {
				Object object = map.get("response");
				if(isObjectNotEmpty(object)) {//20200403 聚合支付返回null 判断防止dms端报错
					//System.out.println("object"+JSONObject.toJSONString(object));
					net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
					PayResponseDataForPayQuery responseDataForPayQuery = (PayResponseDataForPayQuery) net.sf.json.JSONObject
							.toBean(jsonObject, PayResponseDataForPayQuery.class);
					if (responseDataForPayQuery != null) {
						if (responseDataForPayQuery.getCode() == 91200) {
							// 91200-请求成功，其它为不成功 
							List<PayData> data = JSONArray.toList(JSONArray.fromObject(responseDataForPayQuery.getData()),PayData.class);
							for (PayData payData : data) {
								PayCouponList couponList = null;
								if (payData.getCouponList() != null) {
									net.sf.json.JSONObject couponListData = net.sf.json.JSONObject
											.fromObject(payData.getCouponList().get(0));
									couponList = (PayCouponList) net.sf.json.JSONObject.toBean(couponListData, PayCouponList.class);
								}
								if (payData.getGateReturnType().equals("S")) {
									// S:下单成功E:查询失败
									// 10451001 ：等待支付 10451004 ：交易成功 10451005 ：交易失败
									if (payData.getTradeStatus().equals("10451004")) {
										PaymentCompleteVO paymentCompleteVO = new PaymentCompleteVO();
										paymentCompleteVO.setTradeId(payData.getTradeId());
										List<PaymentCompleteVO> selectInfoByTradeId = paymentCompleteDAO.selectInfoByTradeId(paymentCompleteVO);
										if (selectInfoByTradeId.size()>0) {
											PaymentCompleteVO paymentCompleteVO2 = selectInfoByTradeId.get(0);
											System.out.println("data1.getTradeStatus() = 10451004" +paymentCompleteVO2.getRcvDocNo() +"交易成功");
											// 新增数据并改值
											PayServiceReceiveDetailVO serviceReceiveDetailVO = new PayServiceReceiveDetailVO();
											serviceReceiveDetailVO.setTradeId(paymentCompleteVO2.getTradeId());
											serviceReceiveDetailVO.setCalcAmt(paymentCompleteVO2.getCalcAmt());// 结算金额
											serviceReceiveDetailVO.setCalcDocNo(paymentCompleteVO2.getCalcDocNo());// 服务结算号码
											serviceReceiveDetailVO.setNpayAmt(0d);// 欠款金额
											serviceReceiveDetailVO.setPaymMthCd("26");// 付款方法代码
											//serviceReceiveDetailVO.setPaymPrid("01");// 付款期限
											//serviceReceiveDetailVO.setPaymTp("01");// 付款类型   20191114 取消
											serviceReceiveDetailVO.setPaymYn("N");// 是否退款
											serviceReceiveDetailVO.setRcptDt(new Date());// 发票日期 前台页面取当前时间20191114
											serviceReceiveDetailVO
													.setRcvAmt(Double.parseDouble(paymentCompleteVO2.getPaymAmt()));// 收款金额
											serviceReceiveDetailVO.setRcvCpltDt(new Date());// 收款完成日期
											serviceReceiveDetailVO.setRcvDocNo(paymentCompleteVO2.getRcvDocNo());// 收款登记号码
											serviceReceiveDetailVO.setRcvRemark("系统定时完成");// 付款备注
											serviceReceiveDetailVO.setRcvStatCd("F");// 收款状态代码  20191115 前台页面的是否付款完成由此显示（sql进行判断了）
											serviceReceiveDetailVO.setRcvSubDocNo(paymentCompleteVO2.getRcvSubDocNo());// 收款子文件编号
											serviceReceiveDetailVO.setRoDocNo(paymentCompleteVO2.getRoDocNo());// 维修委托号码
											serviceReceiveDetailVO.setSerParDstinCd("SER");
											serviceReceiveDetailVO.setPayYn("Y");// 标识----需修改为Y防止再次查询到数据
											serviceReceiveDetailVO.setDlrCd(paymentCompleteVO2.getDlrCd());
											serviceReceiveDetailVO.setRegUsrId(paymentCompleteVO2.getRegUsrId());
											//20191113 add 优惠金额 实收金额
											if (couponList != null) {
												//优惠金额=订单金额orderAmount-实收金额payAmount
												double orderAmount = Double.parseDouble(payData.getOrderAmount());
												double payAmount = Double.parseDouble(payData.getPayAmount());
												double discountAmt = orderAmount - payAmount;
												System.out.println("优惠金额"+discountAmt+"=订单金额:"+orderAmount+"实收金额:"+payAmount);
												serviceReceiveDetailVO.setDiscountAmt(discountAmt);
												serviceReceiveDetailVO.setReceivedAmt(Double.parseDouble(payData.getPayAmount()));
												//优惠券明细记录日志
												CouponDetailsVO couponDetailsVO = new CouponDetailsVO();
												couponDetailsVO.setCouponCode(couponList.getCouponCode());//优惠卷卡号
												couponDetailsVO.setCouponName(couponList.getCouponName());//卡卷名称
												couponDetailsVO.setCouponState(couponList.getCouponState());//状态
												couponDetailsVO.setTradeId(payData.getTradeId());//平台交易流水号
												couponDetailsVO.setRoDocNo(paymentCompleteVO2.getRoDocNo());//维修委托单号
												couponDetailsVO.setCalcDocNo(paymentCompleteVO2.getCalcDocNo());//结算单号
												couponDetailsVO.setPaymentNo(paymentCompleteVO2.getRcvDocNo());//收款编号
												couponDetailsVO.setEffectiveDate(couponList.getUseBeginDate());//有效期开始日期
												couponDetailsVO.setExpiryDate(couponList.getUseBeginDate());//有效期结束日期
												couponDetailsVO.setCouponType(couponList.getCouponType());//卡卷类型
												couponDetailsVO.setCouponChannelCode(couponList.getCouponChannelCode());//优惠卷渠道
												couponDetailsVO.setCouponAmount(couponList.getCouponAmount());//优惠卷面值
												couponDetailsVO.setPayAmount(String.valueOf(discountAmt));//实际抵扣金额
												couponDetailsVO.setCardVolumeCollectionTime(couponList.getReceiveTime());//卡卷领取时间
												couponDetailsVO.setCouponUsageTime(new Date());//优惠券使用时间
												couponDetailsService.insertLog(couponDetailsVO);
											}else {
												//没使用优惠券
												serviceReceiveDetailVO.setDiscountAmt(0);
												serviceReceiveDetailVO.setReceivedAmt(Double.parseDouble(paymentCompleteVO2.getPaymAmt()));
											}
											
											PayServiceReceiveSaveVO serviceReceiveSaveVO = new PayServiceReceiveSaveVO();
											serviceReceiveSaveVO.setServiceReceiveDetailVO(serviceReceiveDetailVO);
											this.multiServiceReceiveDetail(serviceReceiveSaveVO);
											// log
											AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
											aggregatePaymentLogVO.setTriggerPage("定时任务");
											aggregatePaymentLogVO.setTradeId(paymentCompleteVO2.getTradeId());
											aggregatePaymentLogVO.setAmount(paymentCompleteVO2.getPaymAmt());
											aggregatePaymentLogVO.setStatus("2");
											aggregatePaymentLogVO.setBusinessNumber(paymentCompleteVO2.getRcvDocNo());
											aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
											System.out.println("执行insertLog");
										}
									}
								}
							}
						}
					}
				}else {
					System.out.println("聚合支付返回object"+JSONObject.toJSONString(object));
				}
				
			}
		}
	}
	
	
	

	public void multiServiceReceiveDetail(PayServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception {
		// String userId = LoginUtil.getUserId();
		// String dlrCd = LoginUtil.getDlrCd();
		String userId = serviceReceiveSaveVO.getServiceReceiveDetailVO().getRegUsrId();
		String dlrCd = serviceReceiveSaveVO.getServiceReceiveDetailVO().getDlrCd();
		String tradeId = serviceReceiveSaveVO.getServiceReceiveDetailVO().getTradeId();
		System.out.println("userId" + userId);
		System.out.println("dlrCd" + dlrCd);
		System.out.println("tradeId" + tradeId);
		
		/*
		 * String useTp = "03"; // 정비 : 03 / 부품 : 04 String pointCd = "06";
		 */

		PayServiceReceiveDetailVO rcvVO = serviceReceiveSaveVO.getServiceReceiveDetailVO();
		rcvVO.setRegUsrId(userId);
		rcvVO.setUpdtUsrId(userId);
		rcvVO.setDlrCd(dlrCd);

		PayServiceReceiveSearchVO searchVO = new PayServiceReceiveSearchVO();
		searchVO.setsRcvDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvDocNo());
		searchVO.setsRcvSubDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvSubDocNo());
		searchVO.setsDlrCd(dlrCd);

		// 수납시 정산상태 체크
		PayCalculateSearchVO calculateSearchVO = new PayCalculateSearchVO();
		calculateSearchVO.setsDlrCd(dlrCd);
		calculateSearchVO.setsCalcDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getCalcDocNo());
		calculateSearchVO.setsRoDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());
		PayCalculateVO calculateVO = paymentCompleteDAO.selectCalculateByKey(calculateSearchVO);
		if (calculateVO == null || !calculateVO.getCalcStatCd().equals("00")) {
			return;
		}

		// 수납중복 체크추가 - 20171023
		List<PayServiceReceiveDetailVO> serviceReceiveDetailList = paymentCompleteDAO
				.selectServiceReceiveDetailsByCondition(searchVO);
		if (serviceReceiveDetailList != null && serviceReceiveDetailList.size() > 0) {
			
			BigDecimal bPaymAmt = new BigDecimal(String.valueOf(serviceReceiveDetailList.get(0).getPaymAmt()));
			BigDecimal bRcvAmt = new BigDecimal(String.valueOf(serviceReceiveDetailList.get(0).getRcvAmt()));
			BigDecimal bNpayAmt = bPaymAmt.subtract(bRcvAmt);
			BigDecimal gRcvAmt = new BigDecimal(String.valueOf(rcvVO.getRcvAmt()));
			if (bNpayAmt.subtract(gRcvAmt).doubleValue() < 0) {
				throw processException("sal.info.payAmtChek");
			} else if (bNpayAmt.subtract(gRcvAmt).doubleValue() == 0) {
				rcvVO.setNpayAmt(0.00);
				rcvVO.setRcvStatCd("F");
			} else {
				rcvVO.setNpayAmt(bNpayAmt.subtract(gRcvAmt).doubleValue());
			}
		}
		System.out.println("执行updateServiceReceiveDetail");
		// 수납 상세 수정
		rcvVO.setGotoUrl("0");
		rcvVO.setTradeId("0");
		paymentCompleteDAO.updateServiceReceiveDetail(rcvVO);

		// 수납 이력 저장
		System.out.println("执行insertServiceReceiveHistory");
		rcvVO.setTradeId(tradeId);
		paymentCompleteDAO.insertServiceReceiveHistory(rcvVO);

		// 전체 수납 완료 여부
		PayServiceReceiveDetailVO serviceReceiveDetailVO = paymentCompleteDAO.selectServiceReceiveConfimByKey(searchVO);
		boolean rcvStat = false;

		if (serviceReceiveDetailVO.getRcvTotCnt() == serviceReceiveDetailVO.getPaymCnt()) {
			System.out.println("serviceReceiveDetailVO.getRcvTotCnt() == serviceReceiveDetailVO.getPaymCnt()");
			rcvStat = true;
		}

		if (rcvStat) {
			// 수납상태 업데이트
			PayServiceReceiveVO serviceReceiveVO = new PayServiceReceiveVO();
			serviceReceiveVO.setRcvDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvDocNo());
			serviceReceiveVO.setRcvStatCd(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvStatCd());
			serviceReceiveVO.setDlrCd(dlrCd);
			serviceReceiveVO.setUpdtUsrId(userId);
			System.out.println("执行updateServiceReceive");
			paymentCompleteDAO.updateServiceReceive(serviceReceiveVO);

			// RO 완료 처리
			if (!serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo().equals("")) {
				PayRepairOrderVO repairOrderVO = new PayRepairOrderVO();
				repairOrderVO.setDlrCd(serviceReceiveSaveVO.getServiceReceiveDetailVO().getDlrCd());
				repairOrderVO.setRoDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());
				repairOrderVO.setRoStatCd("05");
				repairOrderVO.setUpdtUsrId(userId);
				System.out.println("执行updateRepairOrder");
				paymentCompleteDAO.updateRepairOrder(repairOrderVO);
			}
		} else {
			// 수납상태 업데이트
			PayServiceReceiveVO serviceReceiveVO = new PayServiceReceiveVO();
			serviceReceiveVO.setRcvDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvDocNo());
			serviceReceiveVO.setRcvStatCd("02");
			serviceReceiveVO.setDlrCd(dlrCd);
			serviceReceiveVO.setUpdtUsrId(userId);
			System.out.println("执行updateServiceReceive");
			paymentCompleteDAO.updateServiceReceive(serviceReceiveVO);
		}
		System.out.println("执行end");
	}
	
	public static Boolean isObjectNotEmpty(Object obj) {
		String str = ObjectUtils.toString(obj, "");
		return StringUtils.isNotBlank(str);
	}
}
