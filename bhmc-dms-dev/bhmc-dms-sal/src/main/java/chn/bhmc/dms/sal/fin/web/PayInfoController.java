package chn.bhmc.dms.sal.fin.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.pay.service.AggregatePaymentLogService;
import chn.bhmc.dms.cmm.pay.service.CouponDetailsService;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;
import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.sal.fin.service.PayInfoService;
import chn.bhmc.dms.sal.fin.vo.CancelOrder;
import chn.bhmc.dms.sal.fin.vo.CouponList;
import chn.bhmc.dms.sal.fin.vo.Data;
import chn.bhmc.dms.sal.fin.vo.PayInfoDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoVO;
import chn.bhmc.dms.sal.fin.vo.QueryTrade;
import chn.bhmc.dms.sal.fin.vo.QueryTradeResult;
import chn.bhmc.dms.sal.fin.vo.RequestPayJson;
import chn.bhmc.dms.sal.fin.vo.RequestVO;
import chn.bhmc.dms.sal.fin.vo.ResponseData;
import chn.bhmc.dms.sal.fin.vo.ResponseDataForPayQuery;
import chn.bhmc.dms.ser.cal.service.util.HttpUtil;
import javassist.expr.NewArray;

/**
 * 수납관리
 *
 * @author Kim Jin Suk
 * @since 2017. 1. 07
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.07           Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/fin/payInfo")
public class PayInfoController extends HController {

	// 聚合日志
	@Resource(name = "aggregatePaymentLogService")
	AggregatePaymentLogService aggregatePaymentLogService;
	
	//优惠券明细日志
	@Resource(name = "couponDetailsService")
	CouponDetailsService couponDetailsService;

	/**
	 * 수납관리 서비스
	 */
	@Resource(name = "payInfoService")
	PayInfoService payInfoService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 멤버십 포인트
     **/
    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;
    
    /**
     * 수납관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPayInfoMain.do", method = RequestMethod.GET)
    public String selectPayInfoMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);
        
        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);
        
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);
        model.addAttribute("threeMonthDay", threeMonthBf);
        
        // 수납유형 : SAL011
        //model.addAttribute("rectTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL011", null, langCd));
        // 여부(Y/N) COM020
        //model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 지불방식 : SAL172
        //model.addAttribute("paymentCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL172", null, langCd));
        
        // 수납상태 : SAL173
        model.addAttribute("paymentTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL173", null, langCd));
        
        // 관련업무 : SAL174
        model.addAttribute("jobTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL174", null, langCd));
        
        return "/sal/fin/payInfo/selectPayInfoMain";
    }

    
    /**
     * 수납관리 헤더목록 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPayInfoMainSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPayInfoMainSearch(@RequestBody PayInfoSearchVO searchVO) throws Exception{
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
        
       SearchResult result = new SearchResult();
       result.setTotal(payInfoService.selectPayInfosByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(payInfoService.selectPayInfosByCondition(searchVO));
       }
        return result;
    }

    /**
     * 수납관리 디테일목록 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPayInfoDetailSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPayInfoDetailSearch(@RequestBody PayInfoSearchVO searchVO) throws Exception{
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
        
       SearchResult result = new SearchResult();
       result.setTotal(payInfoService.selectPayInfoDetailsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(payInfoService.selectPayInfoDetailsByCondition(searchVO));
       }
        return result;
    }
    
    /**
     * 수납관리 팝업
     */
    @RequestMapping(value = "/selectPayInfoPopup.do", method = RequestMethod.GET)
    public String selectPayInfoPopup(Model model) throws Exception{
        
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);
        
        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        
        model.addAttribute("toTime", DateUtil.getDate("HH:mm"));
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDate);
        
        // 업무유형 SAL174
        model.addAttribute("jobTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL174", null, langCd));
        
        // 수납상태 SAL173
        model.addAttribute("paymentTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL173", null, langCd));

		// 지불방식 SAL172
		// model.addAttribute("paymentCdDS",
		// commonCodeService.selectCommonCodesByCmmGrpCd("SAL172", null, langCd));
		// 聚合支付 根据经销商选择显示 20190829
		model.addAttribute("paymentCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL172", "Y", langCd));

		// 은행 SAL179
		model.addAttribute("bankTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL179", null, langCd));

		// 정산유형 SAL194
		model.addAttribute("payTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL194", null, langCd));

		return "/sal/fin/payInfo/selectPayInfoPopup";
	}

	/**
	 * 개별 환불처리를 한다.
	 */
	@RequestMapping(value = "/saveReFundPayInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData saveReFundPayInfo(@RequestBody BaseSaveVO<PayInfoDetailVO> payInfoVO) throws Exception {
		return payInfoService.saveReFundPayInfo(payInfoVO);
	}

	/**
	 * 수납취소를 한다.
	 **/
	@RequestMapping(value = "/cancelPayInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public int cancelPayInfo(@RequestBody PayInfoVO payInfoVO) throws Exception {
		return payInfoService.cancelPayInfo(payInfoVO);
	}

	/**
	 * 수납처리를 한다.
	 */
	@RequestMapping(value = "/savePayInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public int savePayInfo(@RequestBody PayInfoDetailVO saveVO) throws Exception {
		return payInfoService.savePayInfo(saveVO);
	}

	/**
	 * 정산상태를 변경한다.
	 **/
	@RequestMapping(value = "/changePayInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public int changePayInfo(@RequestBody PayInfoDetailVO saveVO) throws Exception {
		return payInfoService.changePayInfo(saveVO);
	}

	/**
	 * 포인트 조회
	 */
	@RequestMapping(value = "/selectPoint.do", method = RequestMethod.POST)
	@ResponseBody
	public MembershipVO selectPoint(@RequestBody MembershipSearchVO searchVO) throws Exception {
		return membershipSupportService.selectMembershipInfoByKey(searchVO);
	}

	/**
	 * 완성차의 기동차영수증조회
	 */
	@RequestMapping(value = "/selectReceiptSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public PayInfoVO selectReceiptSearch(@RequestBody PayInfoSearchVO searchVO) throws Exception {
		return payInfoService.selectReceiptSearchByKey(searchVO);
	}

	/**
	 * 售-财务管理-收款管理页面 聚合支付jsp + POS下单
	 */
	@RequestMapping(value = "/selectPayInfo.do", method = RequestMethod.GET)
	public String selectPayInfo(Model model) throws Exception {
		return "/sal/fin/payInfo/selectPayInfo";
	}

	/**
	 * 售后-结算收款-服务收款页面 聚合支付jsp + POS下单
	 */
	@RequestMapping(value = "/selectPayInfo1.do", method = RequestMethod.GET)
	public String selectPayInfo1(Model model) throws Exception {
		return "/ser/cmm/popup/selectPayInfo1";
	}

	/**
	 * POS下单
	 */
	@RequestMapping(value = "/posOrder.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData posOrder(@RequestBody RequestPayJson model) throws Exception {
		String triggerPage = model.getTriggerPage();
		String businessNumber = model.getBusinessNumber();
		ResponseData responseData1 = new ResponseData();

		// 发送请求到微服务
		RequestPayJson payJson = new RequestPayJson();
		payJson.setAmount(model.getAmount());// 金额 （必传）
		payJson.setIsQrcode(model.getIsQrcode());// 是否生成二维码
		// 20190902 需要客户名称和下单人
		payJson.setOperator(LoginUtil.getUserNm());
		payJson.setMotormasterName(model.getMotormasterName());
		payJson.setPlateNumber(model.getPlateNumber());//20191029 add 车牌号
		payJson.setDlrcd(LoginUtil.getDlrCd());
		HttpUtil httpUtil = new HttpUtil();
		net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(payJson);
		String param = jsonArray.toString();
		Properties ret = PropertiesLoaderUtils.loadProperties(new ClassPathResource("/config/common.properties"));
		System.out.println("posUrl"+ret.getProperty("posUrl"));
		Map<String, Object> map = httpUtil.sendPost(ret.getProperty("posUrl"), param, false);
		if (map.get("status").equals("200")) {
			Object object = map.get("response");
			net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
			ResponseData responseData = (ResponseData) net.sf.json.JSONObject.toBean(jsonObject, ResponseData.class);
			if (responseData != null) {
				if (responseData.getCode() == 91200) {
					// 91200-请求成功，其它为不成功
					net.sf.json.JSONObject jsonData = net.sf.json.JSONObject.fromObject(responseData.getData());
					Data data = (Data) net.sf.json.JSONObject.toBean(jsonData, Data.class);
					if (data.getGateReturnType().equals("S")) {
						// S:下单成功E:查询失败
						responseData1.setCode(9120001);
						responseData1.setData(data);
						// log
						AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
						aggregatePaymentLogVO.setTriggerPage(triggerPage);
						aggregatePaymentLogVO.setTradeId(data.getTradeId());
						aggregatePaymentLogVO.setAmount(model.getAmount());
						aggregatePaymentLogVO.setStatus("0");
						aggregatePaymentLogVO.setBusinessNumber(businessNumber);
						aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
						return responseData1;
					} else {
						responseData1.setCode(9120002);
						responseData1.setMessage(data.getGateReturnMessage());
						return responseData1;
					}
				} else {
					// 请求失败
					return responseData;
				}
			} else {
				// 对象转换失败
				responseData1.setCode(9120003);
				return responseData1;
			}
		} else {
			// 服务网络异常
			responseData1.setCode(000000);
			return responseData1;
		}
	}

	/**
	 * 订单状态查询
	 */
	@RequestMapping(value = "/queryTradeResult.do", method = RequestMethod.POST)
	@ResponseBody
	public Data queryTradeResult(@RequestBody Data request) throws Exception {
		Data data = new Data();
		data.setGateReturnType("E");
		// 发送请求到微服务
		QueryTrade queryTrade = new QueryTrade();
		queryTrade.setTradeId(request.getTradeId());
		List<QueryTrade> queryTrades = new ArrayList<>();
		queryTrades.add(queryTrade);
		QueryTradeResult queryTradeResult = new QueryTradeResult();
		queryTradeResult.setTradeIds(queryTrades);
		queryTradeResult.setDlrcd(LoginUtil.getDlrCd());
		HttpUtil httpUtil = new HttpUtil();
		net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(queryTradeResult);
		String param = jsonArray.toString();
		Properties ret = PropertiesLoaderUtils.loadProperties(new ClassPathResource("/config/common.properties"));
		System.out.println("queryTradeUrl"+ret.getProperty("queryTradeUrl"));
		Map<String, Object> map = httpUtil.sendPost(ret.getProperty("queryTradeUrl"), param, false);
		if (map.get("status").equals("200")) {
			Object object = map.get("response");
			net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
			ResponseDataForPayQuery responseDataForPayQuery = (ResponseDataForPayQuery) net.sf.json.JSONObject
					.toBean(jsonObject, ResponseDataForPayQuery.class);
			if (responseDataForPayQuery != null) {
				if (responseDataForPayQuery.getCode() == 91200) {
					// 91200-请求成功，其它为不成功 */
					net.sf.json.JSONObject jsonData = net.sf.json.JSONObject
							.fromObject(responseDataForPayQuery.getData().get(0));
					Data data1 = (Data) net.sf.json.JSONObject.toBean(jsonData, Data.class);
					CouponList couponList = null;
					if (data1.getCouponList() != null) {
						net.sf.json.JSONObject couponListData = net.sf.json.JSONObject
								.fromObject(data1.getCouponList().get(0));
						couponList = (CouponList) net.sf.json.JSONObject.toBean(couponListData, CouponList.class);
					}
					if (data1.getGateReturnType().equals("S")) {
						// S:下单成功E:查询失败
						data.setGateReturnType("S");
						// 10451001 ：等待支付 10451004 ：交易成功 10451005 ：交易失败
						data.setTradeStatus(data1.getTradeStatus());
						data.setPayAmount(data1.getPayAmount());
						data.setOrderAmount(data1.getOrderAmount());
						if (couponList != null) {
							List<CouponList> couponLists = new ArrayList<>();
							couponLists.add(couponList);
							data.setCouponList(couponLists);
							//201912/13 by wushibin add 优惠券明细log增加
							CouponDetailsVO couponDetailsVO = new CouponDetailsVO();
							couponDetailsVO.setCouponCode(couponList.getCouponCode());//优惠卷卡号
							couponDetailsVO.setCouponName(couponList.getCouponName());//卡卷名称
							couponDetailsVO.setCouponState(couponList.getCouponState());//状态
							couponDetailsVO.setTradeId(request.getTradeId());//平台交易流水号
							couponDetailsVO.setRoDocNo(request.getGateReturnMessage());//维修委托单号
							couponDetailsVO.setCalcDocNo(request.getGotoUrl());//结算单号
							couponDetailsVO.setPaymentNo(request.getGateReturnType());//收款编号
							couponDetailsVO.setEffectiveDate(couponList.getUseBeginDate());//有效期开始日期
							couponDetailsVO.setExpiryDate(couponList.getUseBeginDate());//有效期结束日期
							couponDetailsVO.setCouponType(couponList.getCouponType());//卡卷类型
							couponDetailsVO.setCouponChannelCode(couponList.getCouponChannelCode());//优惠卷渠道
							couponDetailsVO.setCouponAmount(couponList.getCouponAmount());//优惠卷面值
							double orderAmount = Double.parseDouble(data1.getOrderAmount());
							double payAmount = Double.parseDouble(data1.getPayAmount());
							double discountAmt = orderAmount - payAmount;
							couponDetailsVO.setPayAmount(String.valueOf(discountAmt));//实际抵扣金额
							couponDetailsVO.setCardVolumeCollectionTime(couponList.getReceiveTime());//卡卷领取时间
							couponDetailsVO.setCouponUsageTime(new Date());//优惠券使用时间
							couponDetailsService.insertLog(couponDetailsVO);
						}
					}
				}
			}
		}
		return data;
	}


	/**
	 * 取消支付
	 */
	@RequestMapping(value = "/cancel.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseData cancel(@RequestBody RequestVO request) throws Exception {
		String triggerPage = request.getTriggerPage();
		String businessNumber = request.getBusinessNumber();
		ResponseData responseData1 = new ResponseData();
		// 1.取消支付
		CancelOrder cancelOrder = new CancelOrder();
		cancelOrder.setTradeId(request.getTradeId());
		cancelOrder.setDlrcd(LoginUtil.getDlrCd());
		HttpUtil httpUtil = new HttpUtil();
		net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(cancelOrder);
		String param = jsonArray.toString();
		Properties ret = PropertiesLoaderUtils.loadProperties(new ClassPathResource("/config/common.properties"));
		System.out.println("cancelOrderUrl"+ret.getProperty("cancelOrderUrl"));
		Map<String, Object> map = httpUtil.sendPost(ret.getProperty("cancelOrderUrl"), param, false);
		if (map.get("status").equals("200")) {
			Object object = map.get("response");
			net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
			ResponseData responseData = (ResponseData) net.sf.json.JSONObject.toBean(jsonObject, ResponseData.class);
			if (responseData != null) {
				if (responseData.getCode() == 91200) {
					// 91200-请求成功，其它为不成功 */
					net.sf.json.JSONObject jsonData = net.sf.json.JSONObject.fromObject(responseData.getData());
					Data data = (Data) net.sf.json.JSONObject.toBean(jsonData, Data.class);
					if (data.getGateReturnType().equals("S")) {
						// 取消支付订单成功
						responseData1.setCode(9120001);
						responseData1.setMessage(data.getGateReturnMessage());
						// log
						AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
						aggregatePaymentLogVO.setTriggerPage(triggerPage);
						aggregatePaymentLogVO.setTradeId(request.getTradeId());
						aggregatePaymentLogVO.setStatus("1");
						aggregatePaymentLogVO.setAmount(request.getAmount());
						aggregatePaymentLogVO.setBusinessNumber(businessNumber);
						aggregatePaymentLogVO.setNote1(request.getNote1());
						aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
						return responseData1;
					} else {
						// E:查询失败
						responseData1.setCode(9120002);
						responseData1.setMessage(data.getGateReturnMessage());
						return responseData1;
					}
				} else {
					// 请求失败
					responseData1.setCode(77777);
					responseData1.setMessage(responseData.getMessage());
					return responseData1;
				}
			} else {
				// 对象转换失败
				responseData1.setCode(9120003);
				return responseData1;
			}
		} else {
			// 服务网络异常
			responseData1.setCode(9120004);
			return responseData1;
		}
	}

}
