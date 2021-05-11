package chn.bhmc.dms.ser.rcv.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.cal.service.dao.CalculateDAO;
import chn.bhmc.dms.ser.cal.service.model.Data;
import chn.bhmc.dms.ser.cal.service.model.ResponseData;
import chn.bhmc.dms.ser.cal.service.util.HttpUtil;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;
import chn.bhmc.dms.cmm.pay.service.AggregatePaymentLogService;
import chn.bhmc.dms.cmm.pay.service.CouponDetailsService;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;
import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustChargeMgmtService;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistVO;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveDetailService;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveService;
import chn.bhmc.dms.ser.rcv.service.dao.ServiceReceiveDetailDAO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSaveVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.svi.service.CampaignVinManageService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDetailServiceImpl.java
 * @Description : 수납 디테일 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("serviceReceiveDetailService")
public class ServiceReceiveDetailServiceImpl extends HService implements ServiceReceiveDetailService {
	
	//聚合日志
    @Resource(name="aggregatePaymentLogService")
    AggregatePaymentLogService aggregatePaymentLogService;
    
    //优惠券明细日志
  	@Resource(name = "couponDetailsService")
  	CouponDetailsService couponDetailsService;

    /**
     * 수납 디테일 DAO
     */
    @Resource(name="serviceReceiveDetailDAO")
    ServiceReceiveDetailDAO serviceReceiveDetailDAO;

    /**
     * 수납서비스
     */
    @Resource(name="serviceReceiveService")
    ServiceReceiveService serviceReceiveService;

    /**
     * 정산 DAO
     */
    @Resource(name="calculateDAO")
    CalculateDAO calculateDAO;

    /**
     * RO 서비스
     */
    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    @Resource(name="campaignVinManageService")
    CampaignVinManageService campaignVinManageService;

    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    @Resource(name="custChargeMgmtService")
    CustChargeMgmtService custChargeMgmtService;


    /**
     * 조회 조건에 해당하는 디테일 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public int selectServiceReceiveDetailsByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return serviceReceiveDetailDAO.selectServiceReceiveDetailsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 디테일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsByCondition(ServiceReceiveSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return serviceReceiveDetailDAO.selectServiceReceiveDetailsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 디테일 이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public int selectServiceReceiveDetailsHistByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return serviceReceiveDetailDAO.selectServiceReceiveDetailsHistByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 디테일이력을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsHistByCondition(ServiceReceiveSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return serviceReceiveDetailDAO.selectServiceReceiveDetailsHistByCondition(searchVO);
    }

    /**
     * 수납 디테일을 등록/수정/삭제한다.
     * @param serviceReceiveDetailSaveVO - 디테일정보를 포함하는 ServiceReceiveDetailVO
     * @return
     */
    public void multiServiceReceiveDetail(ServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String useTp = "03";    // 정비 : 03 / 부품 : 04
        String pointCd = "06";

        ServiceReceiveDetailVO rcvVO = serviceReceiveSaveVO.getServiceReceiveDetailVO();
        rcvVO.setRegUsrId(userId);
        rcvVO.setUpdtUsrId(userId);
        rcvVO.setDlrCd(dlrCd);

        ServiceReceiveSearchVO searchVO = new ServiceReceiveSearchVO();
        searchVO.setsRcvDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvDocNo());
        searchVO.setsRcvSubDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvSubDocNo());
        searchVO.setsDlrCd(dlrCd);

        // 수납시 정산상태 체크
        CalculateSearchVO calculateSearchVO = new CalculateSearchVO();
        calculateSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        calculateSearchVO.setsCalcDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getCalcDocNo());
        calculateSearchVO.setsRoDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());

        CalculateVO calculateVO = calculateDAO.selectCalculateByKey(calculateSearchVO);
        if(calculateVO == null || !calculateVO.getCalcStatCd().equals("00")){
            throw processException("par.info.checkStatus");
        }

        // 수납중복 체크추가 - 20171023
        List<ServiceReceiveDetailVO> serviceReceiveDetailList = serviceReceiveDetailDAO.selectServiceReceiveDetailsByCondition(searchVO);
        if(serviceReceiveDetailList != null && serviceReceiveDetailList.size() > 0){
            BigDecimal bPaymAmt = new BigDecimal(String.valueOf(serviceReceiveDetailList.get(0).getPaymAmt()));
            BigDecimal bRcvAmt = new BigDecimal(String.valueOf(serviceReceiveDetailList.get(0).getRcvAmt()));
            BigDecimal bNpayAmt = bPaymAmt.subtract(bRcvAmt);
            BigDecimal gRcvAmt = new BigDecimal(String.valueOf(rcvVO.getRcvAmt()));
            if(bNpayAmt.subtract(gRcvAmt).doubleValue() < 0){
                throw processException("sal.info.payAmtChek");
            }else if(bNpayAmt.subtract(gRcvAmt).doubleValue() == 0){
                rcvVO.setNpayAmt(0.00);
                rcvVO.setRcvStatCd("F");
            }else{
                rcvVO.setNpayAmt(bNpayAmt.subtract(gRcvAmt).doubleValue());
            }
        }

        //聚合支付修改订单状态 start
        if(rcvVO.getPaymMthCd() !=null && ("26").equals(rcvVO.getPaymMthCd())) {
        	rcvVO.setPayYn("Y");
        	//log
        	AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
			aggregatePaymentLogVO.setTriggerPage("售后-结算收款-服务收款");		
			aggregatePaymentLogVO.setTradeId(rcvVO.getTradeId());
			aggregatePaymentLogVO.setAmount(String.valueOf(rcvVO.getRcvAmt()));
			aggregatePaymentLogVO.setStatus("2");
			aggregatePaymentLogVO.setBusinessNumber(rcvVO.getRcvDocNo());
			aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
        }
        //end
        
        //수납 상세 수정
        serviceReceiveDetailDAO.updateServiceReceiveDetail(rcvVO);

        //수납 이력 저장
        serviceReceiveDetailDAO.insertServiceReceiveHistory(rcvVO);

        // 부품수납시 상태 업데이트
        if(rcvVO.getSerParDstinCd().equals("PAR")){
            useTp = "04";
            pointCd = "20";
            rcvVO.setOrdStatCd("05");
            serviceReceiveDetailDAO.modifyPartsSaleOrdStat(serviceReceiveSaveVO.getServiceReceiveDetailVO());
        }

        // 전체 수납 완료 여부
        ServiceReceiveDetailVO serviceReceiveDetailVO =  selectServiceReceiveConfimByKey(searchVO);
        boolean rcvStat = false;

        if(serviceReceiveDetailVO.getRcvTotCnt() == serviceReceiveDetailVO.getPaymCnt()){
            rcvStat = true;
        }

        if(rcvStat){
            //수납상태 업데이트
            ServiceReceiveVO serviceReceiveVO = new ServiceReceiveVO();
            serviceReceiveVO.setRcvDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvDocNo());
            serviceReceiveVO.setRcvStatCd(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvStatCd());
            serviceReceiveVO.setDlrCd(dlrCd);
            serviceReceiveService.updateServiceReceive(serviceReceiveVO);

            // RO 완료 처리
            if(!serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo().equals("")){
                RepairOrderVO repairOrderVO = new RepairOrderVO();
                repairOrderVO.setDlrCd(serviceReceiveSaveVO.getServiceReceiveDetailVO().getDlrCd());
                repairOrderVO.setRoDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());
                repairOrderVO.setRoStatCd("05");
                repairOrderService.updateRepairOrder(repairOrderVO);
            }

            //캠페인 사용 이력 등록
            /*CampaignSearchVO campaignSearchVO = new CampaignSearchVO();
            campaignSearchVO.setsDlrCd(dlrCd);
            campaignSearchVO.setsRoDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());
            int campaignCnt = campaignVinManageService.selectCampaignUsedInfosCnt(campaignSearchVO);
            if( campaignCnt == 0){
                campaignVinManageService.insertUsedCamapaignInfo(campaignSearchVO);
            }*/
        } else {
            //수납상태 업데이트
            ServiceReceiveVO serviceReceiveVO = new ServiceReceiveVO();
            serviceReceiveVO.setRcvDocNo(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRcvDocNo());
            serviceReceiveVO.setRcvStatCd("02");
            serviceReceiveVO.setDlrCd(dlrCd);
            serviceReceiveService.updateServiceReceive(serviceReceiveVO);
        }

        // 선불충전 카드를 사용할경우에만
        Double occrPintVal = serviceReceiveSaveVO.getCardPointHisVO().getOccrPointVal();
        if(occrPintVal == null)occrPintVal = 0.00;

        if(!StringUtil.isEmpty(serviceReceiveSaveVO.getCardPointHisVO().getCardNo()) && occrPintVal > 0) {   // 멤버쉽ID가 있을경우
            serviceReceiveSaveVO.getCardPointHisVO().setPointCd(pointCd);
            serviceReceiveSaveVO.getCardPointHisVO().setDlrCd(dlrCd);
            serviceReceiveSaveVO.getCardPointHisVO().setUseTp(useTp);   // 정비 : 03 / 부품 : 04
            serviceReceiveSaveVO.getCardPointHisVO().setUseNum(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());
            serviceReceiveSaveVO.getCardPointHisVO().setRealTotAmt(rcvVO.getCalcAmt());
            String memberShipResult = membershipPointHisSupportService.insertRechargeAmtProc(serviceReceiveSaveVO.getCardPointHisVO());

            if(memberShipResult.equals("01")){
                throw processException("global.err.dcsIfErrMsg", new String[] {});
            }
        }

        // 포인트적립
        if(rcvVO.getPaymTp().equals("04") && rcvVO.getPaymPrid().equals("01") && !StringUtil.isEmpty(serviceReceiveSaveVO.getDlrPointAccuVO().getMembershipNo())) {
            serviceReceiveSaveVO.getDlrPointAccuVO().setUseTp(useTp);        // 정비 : 03 / 부품 : 04
            serviceReceiveSaveVO.getDlrPointAccuVO().setUseNum(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());
            membershipPointHisSupportService.selectCallPointSaveInterface(serviceReceiveSaveVO.getDlrPointAccuVO());
        }

        if(rcvVO.getPaymTp().equals("04") && rcvVO.getPaymMthCd().equals("03")) {   // 고객선불금사용
            CustChargeHistVO custChargeHistVO = new CustChargeHistVO();
            custChargeHistVO = serviceReceiveSaveVO.getCustChargeHistVO();
            custChargeHistVO.setDlrCd(dlrCd);
            custChargeHistVO.setRegUsrId(userId);
            custChargeMgmtService.insertCustChargeHist(custChargeHistVO);
        }

    }


    /**
     * 수납 일괄 환불 한다.
     * @param serviceReceiveDetailSaveVO - 환불정보를 포함하는 ServiceReceiveDetailVO
     * @return
     */
    @Override
	public ResponseData updateRefundReceiveDetail(ServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception {

		String userId = LoginUtil.getUserId();
		String dlrCd = LoginUtil.getDlrCd();
		String useTp = "03";

		// 20190903 聚合支付类型的退款登记 start
		ResponseData returnData = new ResponseData();
        returnData.setCode(1111111);
		for (ServiceReceiveDetailVO detailVO : serviceReceiveSaveVO.getServiceReceiveDetailListVO()) {
			String cancelTradeId = detailVO.getTradeId();
			if (("26").equals(detailVO.getPaymMthCd()) && cancelTradeId != null) {
				//20200305 by wushibin 聚合支付类型的退款是否使用现金退款方式
				if (("Y").equals(detailVO.getIsUseCash())) {
					//使用现金退款
				}else {
					BigDecimal data1 = new BigDecimal(detailVO.getRcvAmt());
					if (data1.compareTo(BigDecimal.ZERO) > 0) {
						// 发送退款到服务
						chn.bhmc.dms.ser.cal.service.model.CancelTrans cancelTrans = new chn.bhmc.dms.ser.cal.service.model.CancelTrans();
						cancelTrans.setTradeId(cancelTradeId);
						cancelTrans.setOrderAmount(detailVO.getReceivedAmt() + "");
						cancelTrans.setDlrcd(LoginUtil.getDlrCd());
						HttpUtil httpUtil = new HttpUtil();
						net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(cancelTrans);
						String param = jsonArray.toString();
						Properties ret = PropertiesLoaderUtils.loadProperties(new ClassPathResource("/config/common.properties"));
						System.out.println("cancelTransUrl"+ret.getProperty("cancelTransUrl"));
						Map<String, Object> map = httpUtil.sendPost(ret.getProperty("cancelTransUrl"), param, false);
						if (map.get("status").equals("200")) {
							Object object = map.get("response");
							net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
							ResponseData responseData = (ResponseData) net.sf.json.JSONObject.toBean(jsonObject,
									ResponseData.class);
							if (responseData != null) {
								if (responseData.getCode() == 91200) {
									// 91200-请求成功，其它为不成功 */
									net.sf.json.JSONObject jsonData = net.sf.json.JSONObject
											.fromObject(responseData.getData());
									Data returnDate = (Data) net.sf.json.JSONObject.toBean(jsonData, Data.class);
									if (returnDate.getGateReturnType().equals("S")) {
										// code 为91200时非空 S:交易成功D:退款处理中E:查询失败
										// log
										AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
										aggregatePaymentLogVO.setTriggerPage("售后-结算收款-服务收款");
										aggregatePaymentLogVO.setTradeId(cancelTradeId);
										aggregatePaymentLogVO.setAmount(detailVO.getReceivedAmt() + "");
										aggregatePaymentLogVO.setStatus("3");
										aggregatePaymentLogVO.setBusinessNumber(detailVO.getRcvSubDocNo());
										aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
										//优惠券添加一条已退款日志记录 2019/12/13
										if (detailVO.getDiscountAmt()!=0) {
											//优惠金额不为0说明使用了优惠券
											CouponDetailsVO couponDetailsVO = new CouponDetailsVO();
											couponDetailsVO.setTradeId(detailVO.getTradeId());
											List<CouponDetailsVO> selectInfoByParams = couponDetailsService.selectInfoByParams(couponDetailsVO);
											if (selectInfoByParams.size()>0) {
												CouponDetailsVO couponDetailsVO2 = selectInfoByParams.get(0);
												couponDetailsVO2.setCouponState("已退款");
												couponDetailsService.insertLog(couponDetailsVO2);
											}
										}
									} else if (returnDate.getGateReturnType().equals("D")) {
										returnData.setCode(7777777);
										returnData.setMessage(returnDate.getGateReturnMessage());
										return returnData;
									} else if (returnDate.getGateReturnType().equals("E")) {
										if (("该订单状态已全部退款").equals(returnDate.getGateReturnMessage())) {
											//20191113 log
											AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
											aggregatePaymentLogVO.setTriggerPage("售后-结算收款-服务收款");
											aggregatePaymentLogVO.setTradeId(cancelTradeId);
											aggregatePaymentLogVO.setAmount(detailVO.getReceivedAmt() + "");
											aggregatePaymentLogVO.setStatus("3");
											aggregatePaymentLogVO.setBusinessNumber(detailVO.getRcvSubDocNo());
											aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
											//优惠券添加一条已退款日志记录 2019/12/13
											if (detailVO.getDiscountAmt()!=0) {
												//优惠金额不为0说明使用了优惠券
												CouponDetailsVO couponDetailsVO = new CouponDetailsVO();
												couponDetailsVO.setTradeId(detailVO.getTradeId());
												List<CouponDetailsVO> selectInfoByParams = couponDetailsService.selectInfoByParams(couponDetailsVO);
												if (selectInfoByParams.size()>0) {
													CouponDetailsVO couponDetailsVO2 = selectInfoByParams.get(0);
													couponDetailsVO2.setCouponState("已退款");
													couponDetailsService.insertLog(couponDetailsVO2);
												}
											}
										} else {
											returnData.setCode(6666666);
											returnData.setMessage(returnDate.getGateReturnMessage());
											return returnData;
										}
									}
								} else {
									returnData.setCode(5555555);
									returnData.setMessage(responseData.getMessage());
									return returnData;
								}
							}else {
								returnData.setCode(3333333);
								return returnData;
							}
						} else {
							returnData.setCode(4444444);
							return returnData;
						}
					}
				}
			}
			// end
		}
		
		
		// 수납 환불
		for (ServiceReceiveDetailVO detailVO : serviceReceiveSaveVO.getServiceReceiveDetailListVO()) {
			detailVO.setUpdtUsrId(userId);
			detailVO.setDlrCd(dlrCd);
			detailVO.setRegUsrId(userId);

			// 聚合支付 by wushibin start 防止修改父表中的订单id
			detailVO.setTradeId(null);
			//end

			//20200305 by wushibin 聚合支付类型的退款选择现金退款方式
			if(detailVO.getIsUseCash()!=null) {
				if (detailVO.getIsUseCash().equals("Y")) {
					detailVO.setPaymMthCd("01");
				}
			}
			//by wushibin end
			
			serviceReceiveDetailDAO.updateServiceReceiveDetail(detailVO);
			serviceReceiveDetailDAO.updateServiceReceiveHistory(detailVO); // 환불여부 업데이트
			serviceReceiveDetailDAO.insertServiceReceiveHistory(detailVO); // 수납 이력 저장

            ServiceReceiveVO serviceReceiveVO = new ServiceReceiveVO();
            serviceReceiveVO.setRcvDocNo(detailVO.getRcvDocNo());
            serviceReceiveVO.setRcvStatCd("O");
            serviceReceiveVO.setDlrCd(dlrCd);

            serviceReceiveService.updateServiceReceive(serviceReceiveVO);

            // RO 완료 취소 처리
            if(!detailVO.getRoDocNo().equals("")){
                RepairOrderVO repairOrderVO = new RepairOrderVO();
                repairOrderVO.setDlrCd(detailVO.getDlrCd());
                repairOrderVO.setRoDocNo(detailVO.getRoDocNo());
                repairOrderVO.setRoStatCd("00");
                repairOrderService.updateRepairOrder(repairOrderVO);
            }

        }

        // 부품수납시 상태 업데이트
        if(serviceReceiveSaveVO.getServiceReceiveDetailListVO().get(0).getSerParDstinCd().equals("PAR")){
            useTp = "04";
            ServiceReceiveSearchVO searchVO = new ServiceReceiveSearchVO();
            searchVO.setsDlrCd(dlrCd);
            searchVO.setsRcvDocNo(serviceReceiveSaveVO.getServiceReceiveDetailListVO().get(0).getRcvDocNo());
            searchVO.setsRcvSubDocNo(serviceReceiveSaveVO.getServiceReceiveDetailListVO().get(0).getRcvSubDocNo());
            searchVO.setsPaymYn("N");
            int cnt = serviceReceiveDetailDAO.selectServiceReceiveDetailsHistByConditionCnt(searchVO);

            if(cnt <= 0){
                ServiceReceiveDetailVO detailVO = new ServiceReceiveDetailVO();
                detailVO.setDlrCd(dlrCd);
                detailVO.setUpdtUsrId(userId);
                detailVO.setRoDocNo(serviceReceiveSaveVO.getServiceReceiveDetailListVO().get(0).getRoDocNo());
                detailVO.setOrdStatCd("04");
                serviceReceiveDetailDAO.modifyPartsSaleOrdStat(detailVO);
            }

        }

        //포인트적립 취소
        for(MembershipPointHisVO memberPointVO : serviceReceiveSaveVO.getDlrPointAccuListVO()){
            MembershipPointHisSearchVO hisSearchVO = new MembershipPointHisSearchVO();
            hisSearchVO.setsDlrCd(dlrCd);
            hisSearchVO.setsUseTp(useTp);        // 정비 : 03 / 부품 : 04
            hisSearchVO.setsUseNum(serviceReceiveSaveVO.getServiceReceiveDetailListVO().get(0).getRoDocNo());
            hisSearchVO.setsSrcSub1(memberPointVO.getSrcSub1()); //수납번호
            hisSearchVO.setsSrcSub2(memberPointVO.getSrcSub2()); //라인번호
            hisSearchVO.setsSrcSub3(memberPointVO.getSrcSub3()); //적립유형
            membershipPointHisSupportService.cancelMembershipChargeInterface(hisSearchVO);
        }


        // 선불충전 카드를 사용한경우에만
        for(MembershipPointHisVO cardPointVO : serviceReceiveSaveVO.getCardPointHisListVO()){

			MembershipPointHisSearchVO membershipPointHisSearchVO = new MembershipPointHisSearchVO();
			membershipPointHisSearchVO.setsDlrCd(dlrCd);
			membershipPointHisSearchVO.setsUseTp(useTp); // 정비 : 03 / 부품 : 04
			membershipPointHisSearchVO
					.setsUseNum(serviceReceiveSaveVO.getServiceReceiveDetailListVO().get(0).getRoDocNo());
			membershipPointHisSearchVO.setsSrcSub1(cardPointVO.getSrcSub1()); // 수납번호
			membershipPointHisSearchVO.setsSrcSub2(cardPointVO.getSrcSub2()); // 라인번호
			MembershipPointHisVO membershipPointHisVO = membershipPointHisSupportService
					.cancelMembershipChargeInterface(membershipPointHisSearchVO);

            if(StringUtil.nullConvert(membershipPointHisVO.getIsResult()).equals("99")){
                throw processException("global.err.dcsIfErrMsg", new String[] {membershipPointHisVO.getResultMsg()});
            }
        }

		// 고객선불금 취소
		for (CustChargeHistVO custHistVO : serviceReceiveSaveVO.getCustChargeHistListVO()) {
			custHistVO.setDlrCd(dlrCd);
			custHistVO.setRegUsrId(userId);
			custChargeMgmtService.insertCustChargeHist(custHistVO);
		}
		return returnData;

    }

    public void deleteServiceReceiveDetail(ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception {
        serviceReceiveDetailVO.setDlrCd(LoginUtil.getDlrCd());
        serviceReceiveDetailDAO.deleteServiceReceiveDetail(serviceReceiveDetailVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.ServiceReceiveDetailService#insertServiceReceiveDetail(chn.bhmc.dms.ser.ro.vo.ServiceReceiveDetailVO)
     */
    public void insertServiceReceiveDetail(ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception {
        serviceReceiveDetailVO.setDlrCd(LoginUtil.getDlrCd());
        serviceReceiveDetailDAO.insertServiceReceiveDetail(serviceReceiveDetailVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.ServiceReceiveDetailService#updateServiceReceiveDetail(chn.bhmc.dms.ser.ro.vo.ServiceReceiveDetailVO)
     */
    public void updateServiceReceiveDetail(ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception {
        serviceReceiveDetailVO.setDlrCd(LoginUtil.getDlrCd());
        serviceReceiveDetailDAO.updateServiceReceiveDetail(serviceReceiveDetailVO);
    }

    /**
     * 수납 수납완료 여부를 조회 한다.
     * @param resvDocNo
     * @return
     */
    public ServiceReceiveDetailVO selectServiceReceiveConfimByKey(ServiceReceiveSearchVO searchVO) throws Exception{
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return serviceReceiveDetailDAO.selectServiceReceiveConfimByKey(searchVO);
    }

    /**
     * 수납통계를 조회한다
     * @param resvDocNo
     * @return
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveStats(ServiceReceiveSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return serviceReceiveDetailDAO.selectServiceReceiveStats(searchVO);
    }

	@Override
	public List<ServiceReceiveDetailVO> selectTradeId(ServiceReceiveSearchVO searchVO) throws Exception {
		return serviceReceiveDetailDAO.selectTradeId(searchVO);
	}

	//修改订单id
	@Override
	public void updateTrade(ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception {
		 String userId = LoginUtil.getUserId();
	     String dlrCd = LoginUtil.getDlrCd();
	     serviceReceiveDetailVO.setUpdtUsrId(userId);
	     serviceReceiveDetailVO.setDlrCd(dlrCd);
		serviceReceiveDetailDAO.updateTradeId(serviceReceiveDetailVO);
		
	}
}