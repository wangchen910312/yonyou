package chn.bhmc.dms.ser.cal.service.impl;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.pay.service.AggregatePaymentLogService;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsAndCopnRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCouponRapVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cal.service.CalculateDetailService;
import chn.bhmc.dms.ser.cal.service.CalculateService;
import chn.bhmc.dms.ser.cal.service.dao.CalculateDAO;
import chn.bhmc.dms.ser.cal.service.dao.CalculateDetailDAO;
import chn.bhmc.dms.ser.cal.service.model.CancelOrder;
import chn.bhmc.dms.ser.cal.service.model.Data;
import chn.bhmc.dms.ser.cal.service.model.RequestPayJson;
import chn.bhmc.dms.ser.cal.service.model.ResponseData;
import chn.bhmc.dms.ser.cal.service.util.HttpUtil;
import chn.bhmc.dms.ser.cal.vo.CalculateCardInfoVO;
import chn.bhmc.dms.ser.cal.vo.CalculateDetailVO;
import chn.bhmc.dms.ser.cal.vo.CalculateFmsCardVO;
import chn.bhmc.dms.ser.cal.vo.CalculatePartsSaleOrdVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSaveVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.LbrSuggestVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;
import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveDetailService;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveService;
import chn.bhmc.dms.ser.rcv.service.impl.RcvSubDocNoIdGenStrategy;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveVO;
import chn.bhmc.dms.ser.ro.service.PreCheckService;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.PreCheckVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.svi.service.CampaignVinManageService;
import chn.bhmc.dms.ser.svi.service.DcMasterService;
import chn.bhmc.dms.ser.svi.vo.CampaignDetailVO;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;
import chn.bhmc.dms.ser.wac.service.ClaimRequestService;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSearchVO;

@Service("calculateService")
public class CalculateServiceImpl extends HService implements CalculateService  , JxlsSupport{
	
	
	//聚合日志
    @Resource(name="aggregatePaymentLogService")
    AggregatePaymentLogService aggregatePaymentLogService;

    /**
     * 정산 DAO
     */
    @Resource(name="calculateDAO")
    CalculateDAO calculateDAO;

    /**
     * 정산디테일 Service
     */
    @Resource(name="calculateDetailService")
    CalculateDetailService calculateDetailService;

    /**
     * 수납 Service
     */
    @Resource(name="serviceReceiveService")
    ServiceReceiveService serviceReceiveService;
    /**
     * 수납 Service
     */
    @Resource(name="serviceReceiveDetailService")
    ServiceReceiveDetailService serviceReceiveDetailService;

    /**
     * 수납 Service
     */
    @Resource(name="serviceReceiveDocNoIdgenService")
    TableIdGenService serviceReceiveDocNoIdgenService;

    /**
     * 부품공통 Service
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    /**
     * 공임공통 Service
     */
    @Resource(name="serviceLaborService")
    ServiceLaborService serviceLaborService;


    @Resource(name="calcDocNoIdGenService")
    TableIdGenService calcDocNoIdGenService;

    @Resource(name="calcSubDocNoIdGenService")
    TableIdGenService calcSubDocNoIdGenService;

    @Resource(name="rcvSubDocNoIdGenService")
    TableIdGenService rcvSubDocNoIdGenService;

    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     * 차량마스터 서비스
     */
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
     * 고객마스터 서비스
     */
    @Autowired
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 블루멤버스 서비스
     */
    @Autowired
    BlueMembershipJoinSupportService blueMembershipJoinSupportService;

    /**
     * 딜러멤버스 서비스
     */
    @Autowired
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     *
     */
    @Autowired
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * RO 서비스
     */
    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     * 사전점검 서비스
     */
    @Resource(name="preCheckService")
    PreCheckService preCheckService;

    /**
     * 정산 서비스
     */
    @Resource(name="calculateDetailDAO")
    CalculateDetailDAO calculateDetailDAO;

    /**
     * 클레임 서비스
     */
    @Resource(name="claimRequestService")
    ClaimRequestService claimRequestService;

    /**
     * 할인관리 서비스
     */
    @Resource(name="dcMasterService")
    DcMasterService dcMasterService;

    /**
     * 딜러할인쿠폰 서비스
     */
    @Resource(name="customerCouponMgmtService")
    CustomerCouponMgmtService customerCouponMgmtService;
    
    /**
     * 调用inf
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 메세지 알림 서비스
     */
    @Autowired
    NotificationMessageService notificationMessageService;

    @Resource(name="campaignVinManageService")
    CampaignVinManageService campaignVinManageService;

	private CalculateVO readMessage;
    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCalculateByConditionCnt(CalculateSearchVO searchVO) throws Exception {

        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return calculateDAO.selectCalculateByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CalculateVO> selectCalculateByCondition(CalculateSearchVO searchVO) throws Exception {

        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        List<CalculateVO> resvList = calculateDAO.selectCalculateByCondition(searchVO);

        return resvList;
    }
    /*
     *
     * {@inheritDoc}
     */
    @Override
    public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO) throws Exception {
        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return calculateDAO.selectCalculateListByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CalculateVO> selectCalculateListByCondition(CalculateSearchVO searchVO) throws Exception {

        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        List<CalculateVO> resvList = calculateDAO.selectCalculateListByCondition(searchVO);

        return resvList;
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public HashMap<String, String> multiCalculate(CalculateSaveVO calculateSaveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        CalculateVO calVO = calculateSaveVO.getCalculateVO();
        String calcDocNo = calVO.getCalcDocNo();
        String roDocNo = calVO.getRoDocNo();
        String rcvDocNo = calVO.getRcvDocNo();
        String calcStatCd = calVO.getCalcStatCd();
        String calcSubDocNo = "";
        String rcvSubDocNo = "";
        String serParDstinCd = calVO.getSerParDstinCd();
        if(serParDstinCd==null) serParDstinCd = "";
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(new Date().getTime());

        RepairOrderVO repairOrderVO = new RepairOrderVO();

        if(!serParDstinCd.equals("PAR")){   // 정비정산일때

            // 상태체크로직
            RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
            repairOrderSearchVO.setsDlrCd(dlrCd);
            repairOrderSearchVO.setsRoDocNo(roDocNo);
            RepairOrderVO checkRepairOrderVO = repairOrderService.selectRepairOrderByKey(repairOrderSearchVO);
            if(checkRepairOrderVO.getGoodwillYn().equals("N")){
                if(!StringUtil.nullConvert(checkRepairOrderVO.getWrkStatCd()).equals("05") ||      // 작업진도상태(05:정비완료)
                   !StringUtil.nullConvert(checkRepairOrderVO.getDlStatCd()).equals("02")){        // 인도체크상태(02:인도확인)
                    throw processException("par.info.checkStatus");
                }
            } else {
                if(!StringUtil.nullConvert(checkRepairOrderVO.getRoStatCd()).equals("01") &&       // 위탁확인
                    !StringUtil.nullConvert(checkRepairOrderVO.getRoStatCd()).equals("04")){       // 정산확인
                    throw processException("par.info.checkStatus");
                }
            }

            if(!StringUtil.isEmpty(calcDocNo)) {

                CalculateSearchVO searchVO = new CalculateSearchVO();
                searchVO.setsDlrCd(dlrCd);
                searchVO.setsCalcDocNo(calcDocNo);
                int cnt = calculateDAO.selectCalculateByConditionCnt(searchVO);
                if(cnt == 0){
                    throw processException("ser.info.noCalcData");
                }

                searchVO.setsCalcStatCd("07");
                cnt = calculateDAO.selectCalculateByConditionCnt(searchVO);
                if(cnt > 0){
                    throw processException("ser.info.noCalcData");
                }

                calVO.setUpdtUsrId(userId);
                calVO.setDlrCd(dlrCd);

                // 정산확정일경우
                if(StringUtil.nullConvert(calVO.getCalcStatCd()).equals("00")){
                    calVO.setCalcCompUsrId(LoginUtil.getUserId());
                    calVO.setCalcCompUsrNm(LoginUtil.getUserNm());
                }
                
              //updateby tjx 将修改的卡券信息写入结算信息se_0500t表中  start
                CalculateVO fmsCardNoJoinVO = calculateSaveVO.getFmsCardNoJoinVO();
                if(null != fmsCardNoJoinVO){
            		calVO.setCardNo(fmsCardNoJoinVO.getCardNo());
            		calVO.setCardNm(fmsCardNoJoinVO.getCardNm());
            		calVO.setCardTp(fmsCardNoJoinVO.getCardTp());
            		calVO.setCardDeno(fmsCardNoJoinVO.getCardDeno());
            		calVO.setClaimAmo(fmsCardNoJoinVO.getClaimAmo());
            		calVO.setCardAdjust(fmsCardNoJoinVO.getCardAdjust());
            		calVO.setCupnChangeAmt(fmsCardNoJoinVO.getCupnChangeAmt());
            		calVO.setCardUseNoti(fmsCardNoJoinVO.getCardUseNoti());
            		calVO.setExpirationDate(fmsCardNoJoinVO.getExpirationDate());
                }
                
                calculateDAO.updateCalculate(calVO); //修改se_0500t

                repairOrderVO.setDlrCd(calVO.getDlrCd());
                repairOrderVO.setRoDocNo(calVO.getRoDocNo());
                repairOrderVO.setRoStatCd(calVO.getCalcStatCd());

            } else {

                CalculateSearchVO searchVO = new CalculateSearchVO();
                searchVO.setsDlrCd(dlrCd);
                searchVO.setsRoDocNo(roDocNo);
                searchVO.setsCalcCancYn("N");
                int cnt = calculateDAO.selectCalculateByConditionCnt(searchVO);
                if(cnt > 0){
                    // 이미 등록 된 RO번호 입니다.
                    throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("ser.lbl.roDocNo", null, LocaleContextHolder.getLocale())});
                }

                /**
                 * 정산번호(키생성)
                 */
                calcDocNo = calcDocNoIdGenService.getNextStringId();

                calVO.setRegUsrId(userId);
                calVO.setCalcDocNo(calcDocNo);
                calVO.setDlrCd(dlrCd);
                
                //updateby tjx 将卡券信息写入结算信息se_0500t表中  start
                CalculateVO fmsCardNoJoinVO = calculateSaveVO.getFmsCardNoJoinVO();
                if(null != fmsCardNoJoinVO){
            		calVO.setCardNo(fmsCardNoJoinVO.getCardNo());
            		calVO.setCardNm(fmsCardNoJoinVO.getCardNm());
            		calVO.setCardTp(fmsCardNoJoinVO.getCardTp());
            		calVO.setCardDeno(fmsCardNoJoinVO.getCardDeno());
            		calVO.setClaimAmo(fmsCardNoJoinVO.getClaimAmo());
            		calVO.setCardAdjust(fmsCardNoJoinVO.getCardAdjust());
            		calVO.setCupnChangeAmt(fmsCardNoJoinVO.getCupnChangeAmt());
            		calVO.setCardUseNoti(fmsCardNoJoinVO.getCardUseNoti());
            		calVO.setExpirationDate(fmsCardNoJoinVO.getExpirationDate());
                }
                //updateby tjx 将卡券信息写入结算信息se_0500t表中  end
                
                calculateDAO.insertCalculate(calVO);  //insert se_0500t

                // RO 완료 처리
                repairOrderVO.setDlrCd(calVO.getDlrCd());
                repairOrderVO.setRoDocNo(calVO.getRoDocNo());
                repairOrderVO.setRoStatCd(calVO.getCalcStatCd());
                repairOrderVO.setRoEndDt(calendar.getTime());
            }

            log.info("calcStatCd : " + calVO.getCalcStatCd());
            log.info("calcDocNo : " + calVO.getCalcDocNo());
            log.info("roStatCd : " + calVO.getRoStatCd());
            log.info("roDocNo : " + calVO.getRoDocNo());

            ServiceCmmVO serviceCmmVO = new ServiceCmmVO();
            serviceCmmVO.setPreFixId("RO");
            serviceCmmVO.setDocNo(calVO.getRoDocNo());
            serviceCmmVO.setDelStatCd(calVO.getCalcStatCd());

            // 부품 추가/수정/삭제
            servicePartService.udpateServiceParts(calculateSaveVO.getServicePartListVO(), serviceCmmVO);

            // 공임 추가/수정/삭제
            serviceLaborService.updateServiceLabor(calculateSaveVO.getServiceLaborListVO(), serviceCmmVO);

            CalculateDetailVO partVO = new CalculateDetailVO();
            partVO.setCalcDocNo(calVO.getCalcDocNo());
            partVO.setRcvDocNo(calVO.getRcvDocNo());
            partVO.setRoDocNo(roDocNo);
            calculateDetailDAO.deleteCalculateDetail(partVO);

            for(CalculateDetailVO calculateDetailVO : calculateSaveVO.getCalculateDetailSaveVO()){
                /**
                 * 정산하위번호(키생성)
                 */
                synchronized (calcSubDocNoIdGenService) {
                    ((CalcSubDocNoIdGenStrategy)calcSubDocNoIdGenService.getStrategy()).setCalcDocNo(calVO.getCalcDocNo());
                    calcSubDocNo = calcSubDocNoIdGenService.getNextStringId();
                }
                
                calculateDetailVO.setRegUsrId(userId);
                calculateDetailVO.setDlrCd(dlrCd);
                calculateDetailVO.setCalcDocNo(calVO.getCalcDocNo());
                calculateDetailVO.setCalcSubDocNo(calcSubDocNo);
                calculateDetailDAO.insertCalculateDetail(calculateDetailVO);

            }

            List<CustDemandVO> custDemandList = calculateSaveVO.getCustDemandListVO();
            TrobleDescVO trobleDescVO = calculateSaveVO.getTrobleDescVO();
            List<EtcIssueVO> etcIssueList = calculateSaveVO.getEtcIssueListVO();
            List<LbrSuggestVO> lbrSuggestList = calculateSaveVO.getLbrSuggestListVO();

            // 정산확정일경우(서비스수납)
            if(StringUtil.nullConvert(calVO.getCalcStatCd()).equals("00")){

                CalculateSearchVO searchVO = new CalculateSearchVO();
                searchVO.setsDlrCd(dlrCd);
                searchVO.setsRoDocNo(roDocNo);
                int cnt = calculateDAO.selectServiceReceiveByCalcCnt(searchVO);
                if(cnt > 0){
                    // 이미 등록 된 정산번호 입니다.
                    throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("global.lbl.calcNo", null, LocaleContextHolder.getLocale())});
                }

                rcvDocNo = serviceReceiveDocNoIdgenService.getNextStringId();
                calVO.setRcvDocNo(rcvDocNo);
                calVO.setRegUsrId(userId);
                calculateDAO.insertServiceReceiveByCalc(calVO);

                calculateDetailDAO.deleteServiceReceiveDetailByCalc(partVO);

                for(CalculateDetailVO calculateDetailVO : calculateSaveVO.getCalculateDetailSaveVO()){
                    /**
                     * 수납하위번호(키생성)
                     */
                    synchronized (rcvSubDocNoIdGenService) {
                        ((RcvSubDocNoIdGenStrategy)rcvSubDocNoIdGenService.getStrategy()).setRcvDocNo(calVO.getRcvDocNo());
                        rcvSubDocNo = rcvSubDocNoIdGenService.getNextStringId();
                    }

                    // by wushibin 聚合支付下单 start
                    /**
                     * 点击“完成”后，后台触发调用POS下单接口，
                     * 支付服务器会返回一个二维码的URL，
                     * 系统将该URL保存到数据库中，在打印结算单的时候，显示在最下方。
                     */
                    if(calculateDetailVO.getPaymMthCd()!=null) {
                    	if (calculateDetailVO.getPaymMthCd().equals("26")) {
    						// 发送请求到支付服务层
    						RequestPayJson payJson = new RequestPayJson();
    						payJson.setAmount(String.valueOf(calculateDetailVO.getPaymAmt()));// 金额 （必传）
    						payJson.setOperator(LoginUtil.getUserNm());
    						payJson.setMotormasterName(calVO.getCarOwnerNm());
    						payJson.setPlateNumber(calVO.getCarRegNo());//20190918 add
    						payJson.setIsQrcode("1");// 是否生成二维码 0/1
    						payJson.setDlrcd(LoginUtil.getDlrCd());
    						HttpUtil httpUtil = new HttpUtil();
    						net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(payJson);
    						String param = jsonArray.toString();
    						Properties ret = PropertiesLoaderUtils.loadProperties(new ClassPathResource("/config/common.properties"));
    						System.out.println("posUrl"+ret.getProperty("posUrl"));
    						Map<String, Object> map = httpUtil.sendPost(ret.getProperty("posUrl"), param, false);
    						// 网络异常状态不处理不影响页面操作
    						if (map.get("status").equals("200")) {
    							Object object = map.get("response");
    							net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
    							ResponseData responseData = (ResponseData) net.sf.json.JSONObject.toBean(jsonObject,
    									ResponseData.class);
    							if (responseData != null) {
    								if (responseData.getCode() == 91200) {
    									// 91200-请求成功，其它为不成功
    									net.sf.json.JSONObject jsonData = net.sf.json.JSONObject
    											.fromObject(responseData.getData());
    									Data data = (Data) net.sf.json.JSONObject.toBean(jsonData, Data.class);
    									if (data.getGateReturnType().equals("S")) {
    										// S:下单成功E:查询失败
    										calculateDetailVO.setGotoUrl(data.getGotoUrl());
    										calculateDetailVO.setTradeId(data.getTradeId());
    										calculateDetailVO.setPayYn("N");
    										
    										//log
    										AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
    										aggregatePaymentLogVO.setTriggerPage("售后-结算收款-服务结算");		
    										aggregatePaymentLogVO.setTradeId(data.getTradeId());
    										aggregatePaymentLogVO.setAmount(String.valueOf(calculateDetailVO.getPaymAmt()));
    										aggregatePaymentLogVO.setStatus("0");
    										aggregatePaymentLogVO.setBusinessNumber(calcDocNo);
    										aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
    										
    									}else {
    										throw processException("global.info.empty", new String[] { data.getGateReturnMessage()+"，POS下单失败"});
    									}
    								}else {
    									throw processException("global.info.empty", new String[] {responseData.getMessage()+"，POS下单失败"});
    								}
    							}
    						}else {
    							throw processException("global.info.empty", new String[] { "聚合支付服务异常，POS下单失败"});
    						}
    					}
                    }
                    // by wushibin 聚合支付下单 end
                    calculateDetailVO.setRcvDocNo(calVO.getRcvDocNo());
                    calculateDetailVO.setRcvSubDocNo(rcvSubDocNo);
                    calculateDetailDAO.insertServiceReceiveDetailByCalc(calculateDetailVO);
                }

                /** 차량마스터 update
                 *  VehicleMasterVO   -->  VehicleMasterSaveVO 바뀜.   09.29 kim yewon
                 * **/
                VehicleMasterSaveVO masterSaveVO = new VehicleMasterSaveVO();
                VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

                vehicleMasterVO.setCarId(calVO.getCarId());
                vehicleMasterVO.setCarRunDistVal(Integer.toString(calVO.getGiRunDistVal()));
                vehicleMasterVO.setExpcChkDt(calVO.getExpcChkDt());
                vehicleMasterVO.setExpcChkRunDistVal(calVO.getExpcChkRunDistVal());
                vehicleMasterVO.setUpdtUsrId(userId);

                masterSaveVO.setVehicleMasterVO(vehicleMasterVO);
                vehicleMasterService.saveVehicleMasterMain(masterSaveVO);

                VehOfCustInfoVO vehOfCustInfoVO = new VehOfCustInfoVO();
                vehOfCustInfoVO.setCarId(calVO.getCarId());
                vehOfCustInfoService.vinMasterChangeCall(vehOfCustInfoVO);
                
                
                if(!StringUtil.nullConvert(calVO.getPdiYn()).equals("Y")){ //PDI 제외

                    /** 고객마스터 update **/
                  //crm 요청 : 주요연락방식 / 주요연락시간 사용하지 않음.
                    /*
                    CustomerInfoVO customerInfoVO = new CustomerInfoVO();
                    customerInfoVO.setCommandTp("ASSIGN");
                    customerInfoVO.setCustNo(calVO.getDriverId());
                    customerInfoVO.setCustNm(calVO.getDriverNm());
                    customerInfoVO.setPrefContactMthCd(calVO.getMainCtnoTp());
                    customerInfoVO.setPrefContactTimeCd(calVO.getMainCtnoDtTp());
                    customerInfoVO.setDlrCd(dlrCd);
                    customerInfoVO.setUpdtUsrId(userId);
                    customerInfoOutBoundService.updateCustomer(customerInfoVO);
                   */
                    // 딜러할인쿠폰을 사용할경우에만
                    if(!StringUtils.isEmpty(calVO.getEtcDcCd())){
                        CustPublishInfoVO custPublishInfoVO = new CustPublishInfoVO();
                        custPublishInfoVO.setPubliNo(calVO.getEtcDcCd());
                        custPublishInfoVO.setUseYn("Y");
                        custPublishInfoVO.setChkUsrId(LoginUtil.getUserId());
                        custPublishInfoVO.setUsedDt(calendar.getTime());
                        custPublishInfoVO.setUseTp("03");
                        custPublishInfoVO.setUseNum(roDocNo);
                        customerCouponMgmtService.updateCustCouponPublish(custPublishInfoVO);
                    }

                    // 딜러포인트를 사용할경우에만
                    Double occrPointVal = calculateSaveVO.getMembershipPointHisVO().getOccrPointVal();
                    if(occrPointVal == null )occrPointVal = 0.00;

                    if(occrPointVal > 0){
                        calculateSaveVO.getMembershipPointHisVO().setRealTotAmt(calVO.getLastCalcTotAmt());
                        MembershipPointHisVO membershipVO = membershipPointHisSupportService.selectCallPointInterface(calculateSaveVO.getMembershipPointHisVO());
                        if(!membershipVO.getIsResult()){
                            throw processException("global.err.dcsIfErrMsg", new String[] {membershipVO.getResultMsg(), ""});
                        }
                    }
                    /** 20200608 蓝缤接口暂停使用
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    // bm포인트를 사용하였는데 인터페이스 이력이 없어서 찍은 로그...
                    log.info("RoDocNo : " + calculateSaveVO.getCalculateVO().getRoDocNo());
                    log.info("BlueMembershipNo : " + calculateSaveVO.getBlueMembershipJoinVO().getBlueMembershipNo());
                    log.info("ConsumePoints : " + calculateSaveVO.getBlueMembershipJoinVO().getConsumePoints());
                    log.info("ComsumeType : " + calculateSaveVO.getBlueMembershipJoinVO().getConsumeType());
                    log.info("BmCupnNo : " + calculateSaveVO.getBlueMembershipJoinVO().getCardNo());
                    log.info("BmPointTotAmt : " + calculateSaveVO.getCalculateVO().getBmPointTotAmt());
                    String imsiBM = "";
                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    // 멤버쉽ID가 있을경우 블루멤버스
                    if(!StringUtil.isEmpty(calculateSaveVO.getBlueMembershipJoinVO().getBlueMembershipNo())){
                        // 블루멤버스 쿠폰을 사용할경우    512
                        if(!StringUtil.isEmpty(calculateSaveVO.getBlueMembershipJoinVO().getCardNo())){
                            imsiBM = "bluemembership updateUseCardAndAddConsume";
                            BlueMembershipIfConsAndCopnRapVO receiveData = blueMembershipJoinSupportService.updateUseCardAndAddConsume(calculateSaveVO.getBlueMembershipJoinVO());
                            if(!receiveData.getIsSuccess()){
                                throw processException("par.lbl.ifErrMsgParam", new String[] { receiveData.getMessage() });
                            }
                        }else{
                            imsiBM = "bluemembership insertAddMembersConsume";   //506
                            BlueMembershipIfConsumeRapVO receiveData = blueMembershipJoinSupportService.insertAddMembersConsume(calculateSaveVO.getBlueMembershipJoinVO());
                            if (!receiveData.getIsSuccess()) {
                                throw processException("par.lbl.ifErrMsgParam", new String[] { receiveData.getMessage() });
                            }
                        }
                    }else{
                        if(!StringUtil.isEmpty(calculateSaveVO.getBlueMembershipJoinVO().getCardNo())){  //509
                            BlueMembershipIfCouponRapVO couponVO = blueMembershipJoinSupportService.updateUserAwardCustomCardInfo(calculateSaveVO.getBlueMembershipJoinVO());
                            if(!couponVO.getIsSuccess()){
                                throw processException("par.lbl.ifErrMsgParam", new String[] { couponVO.getMessage() });
                            }
                        }
                    }

                    // bm포인트를 사용하였는데 인터페이스 이력이 없어서 찍은 로그...
                    log.info("imsiBM : " + imsiBM);
                     **/
                }
                
               //updateBy tjx 服务结算点击完成进行fms粉丝卡券信息核销    start
                CalculateVO calculateVO = calculateSaveVO.getCalculateVO();
                calculateVO.setDlrCd(LoginUtil.getDlrCd());
                if(null != calculateVO.getCalcDocNo()){
                	CalculateFmsCardVO fmsvinCardInfo = selectFmsCardInfoById(calculateVO);
                	if( "Y" != fmsvinCardInfo.getCouponWrite()){
                		if(StringUtils.isNotEmpty(fmsvinCardInfo.getLanBinCardNo())){
                		    boolean result  =  false;
                		    CamelClient camelClient = camelClientFactory.createCamelClient();
                	        camelClient.setIfId("SAL250"); //
                	        camelClient.setSender(LoginUtil.getDlrCd());
                	        camelClient.setReceiver("FMS");
                	        
                	        Map<String, Object> message = new HashMap<String, Object>();
            	            message.put("card_id", fmsvinCardInfo.getLanBinCardNo());   // 蓝缤卡券号码
            	            message.put("dealer_id",LoginUtil.getDlrCd());//店代码
            	            message.put("order_id",fmsvinCardInfo.getRoDocNo());//维修委托单号
            	            message.put("vin",fmsvinCardInfo.getVinNo());//车架号，如果有值就传没有就不传 非唯一
            	            message.put("write_of_type","售后");
            	            
            	            // message add
                	        camelClient.addSendMessage(message);
                	        
            	            chn.bhmc.dms.core.support.camel.Data receiveData = camelClient.sendRequest();
                	        result  =  (receiveData.getFooter().getIfResult().equals("Z")) ? true : false;
                	        log.info("SAL250 executeCamelClent result " + result + " / IfResult"+receiveData.getFooter().getIfResult());
                	        log.info("SAL250 executeCamelClent result核销 " + result + " / IfResult"+receiveData);
                	        List<CalculateCardInfoVO> roIfList = new ArrayList<CalculateCardInfoVO>();
                	        if(!receiveData.getFooter().getIfResult().equals("Z")){
                	        	throw processException("sal.err.couponVerificationUnsuccessful");
                	        }
                	        if (receiveData.getFooter().getIfResult().equals("Z")) {
                	        	roIfList = receiveData.readMessages(CalculateCardInfoVO.class);
                	        	log.info("SAL250 服务结算核销接口记录信息1 " + roIfList.get(0).getCode() + " / END");
                	        	log.info("SAL250 服务结算核销接口记录信息2 " + roIfList.get(0).getMsg() + "  / END");
                	        	log.info("SAL250 服务结算核销接口记录信息3 " + receiveData.getBody().getJsonMessage() + " / END");
                	        	if("0".equals(roIfList.get(0).getCode())){
                	        		//修改卡券核销为"已核销"
                        			fmsvinCardInfo.setCouponWrite("Y");
                        			calculateDAO.UpdateCouponWrite(fmsvinCardInfo);
                	        	}else {
                	        		 throw processException("global.err.dcsIfErrMsg", new String[] { roIfList.get(0).getCode(), roIfList.get(0).getMsg() });
                	        		//throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
                	        		//throw processException("sal.err.couponVerificationUnsuccessful");
                	        	}
                	        	
                	        }
            	         
                		}
                	}
            		
                }
                
               //updateBy tjx 服务结算点击完成进行fms粉丝卡券信息核销    end
                
                //사전점검 상태 업데이트
                PreCheckVO preCheckVO = new PreCheckVO();
                preCheckVO.setDiagDocNo(calVO.getDiagDocNo());
                preCheckVO.setDiagStatCd("F");
                preCheckService.updatePreCheck(preCheckVO);

                //캠페인 사용 이력 등록
                CampaignSearchVO campaignSearchVO = new CampaignSearchVO();
                campaignSearchVO.setsDlrCd(dlrCd);
                campaignSearchVO.setsRoDocNo(calculateSaveVO.getCalculateVO().getRoDocNo());
                campaignSearchVO.setsVinNo(calculateSaveVO.getCalculateVO().getVinNo());
                //添加录入人
                campaignSearchVO.setsRegUseId(LoginUtil.getUserId());
                
                int campaignCnt = campaignVinManageService.selectCampaignUsedInfosCnt(campaignSearchVO);
                if( campaignCnt == 0){
                    campaignVinManageService.insertUsedCamapaignInfo(campaignSearchVO);
                }

                //처음보양여부 판단
                int freeRoCnt = campaignVinManageService.selectFreeRoCnt(campaignSearchVO);
                int freeRoYnCnt = campaignVinManageService.selectFreeRoYnCnt(campaignSearchVO);
                if(freeRoCnt > 0){
                    if(freeRoYnCnt > 0){
                        repairOrderVO.setFreeRoYn("N");
                    } else {
                        repairOrderVO.setFreeRoYn("Y");
                    }
                }
            }

            repairOrderService.updateRepairOrder(repairOrderVO);

            //고객요구사항 추가/수정/삭제
            serviceCommonService.multiCustDemand(custDemandList, roDocNo, "RO");
            //고장서술 추가/수정/삭제
            serviceCommonService.multiTrobleDesc(trobleDescVO, roDocNo);
            //기타사항 추가/수정/삭제
            serviceCommonService.multiEtcIssue(etcIssueList, roDocNo, "RO");
            //수리건의 추가/삭제
            serviceCommonService.multiLbrSuggest(lbrSuggestList, roDocNo, "RO");

        } else {
            int resultCnt          = 0;
            if(!StringUtil.isEmpty(calcDocNo)) {

                calVO.setUpdtUsrId(userId);
                calVO.setDlrCd(dlrCd);

                //  정산확정일경우
                if(StringUtil.nullConvert(calVO.getCalcStatCd()).equals("00")){
                    calVO.setCalcDt(calendar.getTime());
                    calVO.setCalcCompUsrId(LoginUtil.getUserId());
                    calVO.setCalcCompUsrNm(LoginUtil.getUserNm());
                }
                calculateDAO.updateCalculate(calVO);

            } else {
                /**
                 * 정산번호(키생성)
                 */
                calcDocNo = calcDocNoIdGenService.getNextStringId();

                calVO.setRegUsrId(userId);
                calVO.setCalcDocNo(calcDocNo);
                calVO.setDlrCd(dlrCd);
                calculateDAO.insertCalculate(calVO);
            }

            CalculateDetailVO partVO = new CalculateDetailVO();
            partVO.setCalcDocNo(calVO.getCalcDocNo());
            //partVO.setRcvDocNo(calVO.getRcvDocNo());
            partVO.setRoDocNo(calVO.getRoDocNo());
            calculateDetailDAO.deleteCalculateDetail(partVO);
            //calculateDetailDAO.deleteServiceReceiveDetailByCalc(partVO);

            for(CalculateDetailVO calculateDetailVO : calculateSaveVO.getCalculateDetailSaveVO()){
                /**
                 * 정산하위번호(키생성)
                 */
                synchronized (calcSubDocNoIdGenService) {
                    ((CalcSubDocNoIdGenStrategy)calcSubDocNoIdGenService.getStrategy()).setCalcDocNo(calVO.getCalcDocNo());
                    calcSubDocNo = calcSubDocNoIdGenService.getNextStringId();
                }

                calculateDetailVO.setRegUsrId(userId);
                calculateDetailVO.setDlrCd(dlrCd);
                calculateDetailVO.setCalcDocNo(calVO.getCalcDocNo());
                calculateDetailVO.setCalcSubDocNo(calcSubDocNo);
                calculateDetailDAO.insertCalculateDetail(calculateDetailVO);

            }


            //  정산확정일경우(부품정산확정)
            if(StringUtil.nullConvert(calVO.getCalcStatCd()).equals("00")){
                CalculateVO sRcvVO;
                CalculateSearchVO sCalculateSearchVO = new CalculateSearchVO();
                rcvDocNo = serviceReceiveDocNoIdgenService.getNextStringId();
                calVO.setRcvDocNo(rcvDocNo);
                calVO.setRegUsrId(userId);
                calculateDAO.insertServiceReceiveByCalc(calVO);

                sCalculateSearchVO.setsRoDocNo(partVO.getRoDocNo());
                sRcvVO = calculateDAO.selectRcvOnlyByKey(sCalculateSearchVO);

                if(sRcvVO != null){
                    calculateDetailDAO.deleteServiceReceiveDetailByCalc(partVO);
                }

                for(CalculateDetailVO calculateDetailVO : calculateSaveVO.getCalculateDetailSaveVO()){
                    /**
                     * 수납하위번호(키생성)
                     */
                    synchronized (rcvSubDocNoIdGenService) {
                        ((RcvSubDocNoIdGenStrategy)rcvSubDocNoIdGenService.getStrategy()).setRcvDocNo(calVO.getRcvDocNo());
                        rcvSubDocNo = rcvSubDocNoIdGenService.getNextStringId();
                    }

                    calculateDetailVO.setRcvDocNo(calVO.getRcvDocNo());
                    calculateDetailVO.setRcvSubDocNo(rcvSubDocNo);
                    calculateDetailDAO.insertServiceReceiveDetailByCalc(calculateDetailVO);
                }

                // 멤버쉽ID가 있을경우 블루멤버스
                /*
                if(!StringUtil.isEmpty(calculateSaveVO.getBlueMembershipJoinVO().getBlueMembershipNo())){
                    //if( calVO.getPointTotAmt() > 0 ){
                    BlueMembershipIfConsumeRapVO receiveData = blueMembershipJoinSupportService.insertAddMembersConsume(calculateSaveVO.getBlueMembershipJoinVO());

                    if (!receiveData.getIsSuccess()) {
                        throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getMessage(), receiveData.getErrors() });
                    }
                    //}

                }
                */

                // 딜러포인트를 사용할경우에만
                Double occrPointVal = calculateSaveVO.getMembershipPointHisVO().getOccrPointVal();
                if(occrPointVal == null )occrPointVal = 0.00;

                if(occrPointVal > 0){
                    // TODO 20170409 이인문 수정
                    calculateSaveVO.getMembershipPointHisVO().setUseTp("04");// 정비 : 03 / 부품 : 04
                    calculateSaveVO.getMembershipPointHisVO().setUseNum(roDocNo);

                    MembershipPointHisVO membershipVO = membershipPointHisSupportService.selectCallPointInterface(calculateSaveVO.getMembershipPointHisVO());

                    if(!membershipVO.getIsResult()){
                        throw processException("global.err.dcsIfErrMsg", new String[] {});
                    }
                }

                /*
                // 블루멤버스 쿠폰을 사용할경우에만
                if(calVO.getEtcBmPointUseAmt() != null && calVO.getEtcBmPointUseAmt() > 0){
                    blueMembershipJoinSupportService.updateUserAwardCustomCardInfo(calculateSaveVO.getBlueMembershipJoinVO());
                }
                */

                //딜러할인쿠폰을 사용할경우에만
                if(!StringUtils.isEmpty(calVO.getEtcDcCd())){
                    CustPublishInfoVO custPublishInfoVO = new CustPublishInfoVO();
                    custPublishInfoVO.setPubliNo(calVO.getEtcDcCd());
                    custPublishInfoVO.setUseYn("Y");
                    custPublishInfoVO.setChkUsrId(LoginUtil.getUserId());
                    custPublishInfoVO.setUsedDt(calendar.getTime());
                    custPublishInfoVO.setUseTp("04");
                    custPublishInfoVO.setUseNum(roDocNo);
                    customerCouponMgmtService.updateCustCouponPublish(custPublishInfoVO);
                }
            }

            for(ServicePartVO servicePartVO : calculateSaveVO.getServicePartListVO()){
                if(servicePartVO.getDcRate() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.dcRate", null, LocaleContextHolder.getLocale())});
                }

                servicePartVO.setDlrCd(dlrCd);
                servicePartVO.setUpdtUsrId(userId);
                servicePartVO.setPurcOrdNo(calVO.getRoDocNo());

                resultCnt = calculateDAO.updatePartsSaleOrdItemDcRate(servicePartVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{servicePartVO.getItemCd()});
                }

            }

            CalculatePartsSaleOrdVO partsSaleOrdVO = new CalculatePartsSaleOrdVO();
            partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleOrdVO.setParSaleOrdNo(calVO.getRoDocNo());
            partsSaleOrdVO.setCalcDocNo(calVO.getCalcDocNo());
            if("04".equals(calVO.getCalcStatCd())){
                partsSaleOrdVO.setOrdStatCd("02");
            }else if("00".equals(calVO.getCalcStatCd())){
                partsSaleOrdVO.setOrdStatCd("04");
            }
            calculateDAO.updateCalculateInfo(partsSaleOrdVO);
        }

        HashMap<String, String> result = new HashMap<String, String>();
        result.put("roDocNo", roDocNo);
        result.put("calcDocNo", calcDocNo);
        result.put("rcvDocNo", rcvDocNo);
        result.put("calcStatCd", calcStatCd);

        return result;
    }

    /*
     * {@inheritDoc}
     */
    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception {
    	String dlrCd = LoginUtil.getDlrCd();
        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("") || searchVO.getsDlrCd().equals(dlrCd)){
            searchVO.setsDlrCd(dlrCd);
            return calculateDAO.selectCalculateByKey(searchVO);
        }
        //服务历史查询
        Map<String, Object> message = new HashMap<String, Object>();
        List<CalculateVO> calculateList = new ArrayList<>();
        message.put("I_DLR_CD", searchVO.getsDlrCd());
        message.put("I_RO_DOC_NO",searchVO.getsRoDocNo());
        chn.bhmc.dms.core.support.camel.Data receiveData = serviceCommonService.executeCamelClentSearchResult(message, "SER118");
        if("Z".equals(receiveData.getFooter().getIfResult())) {
        	calculateList = receiveData.readMessages(CalculateVO.class);
        	if(calculateList.size() > 0) {
        		CalculateVO calculateVO = calculateList.get(0);
        		return calculateVO;
        	}
        }
        return null;
    }

    /*
     * @see chn.bhmc.dms.ser.cal.service.CalculateService#selectCalculateParByKey(chn.bhmc.dms.ser.cal.vo.CalculateSearchVO)
     */
    @Override
    public CalculateVO selectCalculatePartByKey(CalculateSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // TODO Auto-generated method stub
        return calculateDAO.selectCalculatePartByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String updateCalculate(CalculateVO calculateVO) throws Exception {
        calculateVO.setUpdtUsrId(LoginUtil.getUserId());

        calculateDAO.updateCalculate(calculateVO);
        return calculateVO.getRoDocNo();
    }


    /**
     * 정산 출력 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void updateCalculatePrint(CalculateVO calculateVO)throws Exception{

        calculateVO.setDlrCd(LoginUtil.getDlrCd());

        calculateDAO.updateCalculatePrint(calculateVO);
    }

    /**
     * 정산를 취소한다.
     * @param calculateVO - 정산정보를 포함하는 CalculateVO
     * @return
     */
    public ResponseData  multiCalculateCancel(List<CalculateVO> cancelVO) throws Exception {

        CalculateDetailVO calDetailVO = new CalculateDetailVO();
        ServiceReceiveSearchVO searchVO = new ServiceReceiveSearchVO();
        String serParDstinCd;

        // 聚合支付取消订单 by wushibin start
        ResponseData returnData = new ResponseData();
        returnData.setCode(1111111);
        for(CalculateVO calVO : cancelVO){
            calVO.setDlrCd(LoginUtil.getDlrCd());
            serParDstinCd = calVO.getSerParDstinCd();

			
			// SE_0560T RCV_DOC_NO DLR_CD PAYM_MTH_CD
			ServiceReceiveSearchVO searchVO3 = new ServiceReceiveSearchVO();
			searchVO3.setsDlrCd(LoginUtil.getDlrCd());
			searchVO3.setsCalcDocNo(calVO.getCalcDocNo());
			searchVO3.setPaymMthCd("26");// 生产环境需改变
			List<ServiceReceiveDetailVO> selectServiceReceiveDetailsByCondition = serviceReceiveDetailService
					.selectTradeId(searchVO3);
			if (selectServiceReceiveDetailsByCondition.size() > 0) {
				for (ServiceReceiveDetailVO serviceReceiveDetailVO : selectServiceReceiveDetailsByCondition) {
					if (serviceReceiveDetailVO.getTradeId() != null && serviceReceiveDetailVO.getGotoUrl() != null && !("0").equals(serviceReceiveDetailVO.getTradeId())) {
						CancelOrder cancelOrder = new CancelOrder();
						cancelOrder.setTradeId(serviceReceiveDetailVO.getTradeId());
						cancelOrder.setDlrcd(LoginUtil.getDlrCd());
						HttpUtil httpUtil = new HttpUtil();
						net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(cancelOrder);
						String param = jsonArray.toString();
						Properties ret = PropertiesLoaderUtils.loadProperties(new ClassPathResource("/config/common.properties"));
						System.out.println("cancelOrderUrl"+ret.getProperty("cancelOrderUrl"));
						Map<String, Object> map = httpUtil.sendPost(ret.getProperty("cancelOrderUrl"), param, false);
						System.out.println("POST_status=" + map.get("status"));
						if (map.get("status").equals("200")) {
							Object object = map.get("response");
							net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
							ResponseData resDataCancelOrder = (ResponseData) net.sf.json.JSONObject.toBean(jsonObject,
									ResponseData.class);
							if (resDataCancelOrder != null) {
								if (resDataCancelOrder.getCode() == 91200) {
									// 91200-请求成功，其它为不成功 */ 取消支付订单成功
									// log
									AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
									aggregatePaymentLogVO.setTriggerPage("售后-结算收款-结算取消");
									aggregatePaymentLogVO.setTradeId(serviceReceiveDetailVO.getTradeId());
									aggregatePaymentLogVO.setAmount(serviceReceiveDetailVO.getPaymAmt() + "");
									aggregatePaymentLogVO.setStatus("1");
									aggregatePaymentLogVO.setBusinessNumber(calVO.getCalcDocNo());
									aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
								} else {
									returnData.setCode(5555555);
									returnData.setMessage(resDataCancelOrder.getMessage());
									return returnData;
								}
							} else {
								// 实体转换失败
								returnData.setCode(3333333);
								return returnData;
							}
						} else {
							// 服务异常
							returnData.setCode(4444444);
							return returnData;
						}
					}
				}
			}
            //end

            CalculateSearchVO calculateSearchVO = new CalculateSearchVO();
            calculateSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            calculateSearchVO.setsCalcDocNo(calVO.getCalcDocNo());

            CalculateVO calculateVO = calculateDAO.selectCalculateByKey(calculateSearchVO);

            //전체 수납 완료 여부
            ServiceReceiveSearchVO receiveDetailVO = new ServiceReceiveSearchVO();
            receiveDetailVO.setsRoDocNo(calculateVO.getRoDocNo());
            receiveDetailVO.setsDlrCd(LoginUtil.getDlrCd());
            calDetailVO.setCalcDocNo(calculateVO.getCalcDocNo());

            if(calculateVO.getCalcStatCd().equals("00")){
                ServiceReceiveVO serviceReceiveVO =  serviceReceiveService.selectServiceReceiveByKey(receiveDetailVO);
                if(!serviceReceiveVO.getRcvStatCd().equals("O")){
                    String[] msgList = new String[2];
                    msgList[0] = messageSource.getMessage("ser.btn.receiveEnd", null, LocaleContextHolder.getLocale());
                    msgList[1] = messageSource.getMessage("ser.lbl.rcvDocNo", null, LocaleContextHolder.getLocale());
                    throw processException("global.info.stInfo", msgList);
                }
                searchVO.setsRoDocNo(calVO.getRoDocNo());
                ServiceReceiveVO srVO = serviceReceiveService.selectServiceReceiveByKey(searchVO);
                calDetailVO.setRcvDocNo(srVO.getRcvDocNo());

                //수납 상세 정보 삭제
                calculateDetailService.deleteServiceReceiveDetailByCalc(calDetailVO);

                calculateDetailService.deleteServiceReceiveHistDetailByCalc(calDetailVO);
                //수납 헤더 정보 삭제
                calculateDAO.deleteServiceReceiveByCalc(calVO);

                calVO.setCalcCancId(LoginUtil.getUserId());
                //정산 헤더
                calculateDAO.cancelCalculate(calVO);
                // 정산취소정보를 인서트
                calculateDAO.insertCancelCalculate(calVO);

                //PDI 건 제외
                if(!StringUtil.nullConvert(calVO.getPdiYn()).equals("Y")){
                    // 기타할인취소
                    if(!StringUtils.isEmpty(calVO.getEtcDcCd())){
                        CustPublishInfoVO custPublishInfoVO = new CustPublishInfoVO();
                        custPublishInfoVO.setPubliNo(calVO.getEtcDcCd());
                        custPublishInfoVO.setUseYn("N");
                        custPublishInfoVO.setChkUsrId("");
                        custPublishInfoVO.setUseTp("");
                        custPublishInfoVO.setUseNum("");
                        customerCouponMgmtService.updateCustCouponPublish(custPublishInfoVO);
                    }

                    // 딜러포인트 취소
                    MembershipPointHisSearchVO mphSearchVO = new MembershipPointHisSearchVO();
                    mphSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    if(!serParDstinCd.equals("PAR")){
                        mphSearchVO.setsUseTp("03");        // 정비 : 03 / 부품 : 04
                    }else{
                        mphSearchVO.setsUseTp("04");        // 정비 : 03 / 부품 : 04
                    }
                    mphSearchVO.setsUseNum(calVO.getRoDocNo());
                    mphSearchVO.setsSrcSub1(calVO.getCalcDocNo());
                    membershipPointHisSupportService.cancelMembershipChargeInterface(mphSearchVO);
                }
            } else {
                calculateSearchVO.setsRoDocNo(calVO.getRoDocNo());
                CalculateVO ccVO = calculateDAO.selectRcvOnlyByKey(calculateSearchVO);

                if(ccVO != null){
                    CalculateDetailVO cdVO = new CalculateDetailVO();
                    cdVO.setRcvDocNo(ccVO.getRcvDocNo());
                    cdVO.setDlrCd(LoginUtil.getDlrCd());
                    //수납 상세 정보 삭제
                    calculateDetailService.deleteServiceReceiveDetailByCalc(cdVO);
                    //수납 헤더 정보 삭제
                    calculateDAO.deleteServiceReceiveByCalc(calVO);
                }

                //정산 상세정보 삭제
                calculateDetailService.deleteCalculateDetail(calDetailVO);
                //정산헤더 정보 삭제
                calculateDAO.deleteCalculate(calVO);
            }

            if(!serParDstinCd.equals("PAR")){
                ClaimReqSearchVO claimSearchVO = new ClaimReqSearchVO();
                claimSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                claimSearchVO.setsRoDocNo(calVO.getRoDocNo());
                claimSearchVO.setsCancelYn("N");

                int claimCnt = claimRequestService.selectClaimRequestForClaimByConditionCnt(claimSearchVO);

                if(claimCnt > 0){
                    throw processException("ser.info.thisClaimDoc", new String[] {});
                }

                //사전점검 상태 업데이트
                PreCheckVO preCheckVO = new PreCheckVO();
                preCheckVO.setDiagDocNo(calVO.getDiagDocNo());
                preCheckVO.setDiagStatCd("O");
                preCheckService.updatePreCheck(preCheckVO);

                //캠페인 사용 이력 삭제
                
                TabInfoSearchVO tabInfoSearchVO = new TabInfoSearchVO();
                tabInfoSearchVO.setsDlrCd(calVO.getDlrCd());
                tabInfoSearchVO.setsPreFixId("RO");
                tabInfoSearchVO.setsDocNo(calVO.getRoDocNo());
                tabInfoSearchVO.setsCrYn("Y");

                int laborCnt = serviceLaborService.selectServiceLaborsByConditionCnt(tabInfoSearchVO);

                if(laborCnt > 0){
                    List<ServiceLaborVO> laborList = serviceLaborService.selectServiceLaborsByCondition(tabInfoSearchVO);
                    for(ServiceLaborVO laborVO : laborList){
                        CampaignDetailVO campaignDetailVO = new CampaignDetailVO();
                        campaignDetailVO.setDlrCd(calVO.getDlrCd());
                        campaignDetailVO.setVinNo(calVO.getVinNo());
                        campaignDetailVO.setCrNo(laborVO.getCrNo());
                        campaignDetailVO.setLbrCd(laborVO.getLbrCd());
                        //加入修改者id
                        campaignDetailVO.setRegUseId(LoginUtil.getUserId());
                        campaignVinManageService.deleteUsedCamapaignInfo(campaignDetailVO);
                    }
                }

                RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
                repairOrderSearchVO.setsDlrCd(calVO.getDlrCd());
                repairOrderSearchVO.setsRoDocNo(calVO.getRoDocNo());

                RepairOrderVO repairOrderVO = new RepairOrderVO();
                repairOrderVO.setDlrCd(calVO.getDlrCd());
                repairOrderVO.setRoDocNo(calVO.getRoDocNo());
                repairOrderVO.setCarId(calVO.getCarId());

                RepairOrderVO checkGoodwillVO = repairOrderService.selectRepairOrderByKey(repairOrderSearchVO);
                checkGoodwillVO.setDlrCd(calVO.getDlrCd());
                checkGoodwillVO.setRoDocNo(calVO.getRoDocNo());

                // RO 완료 처리
                if(StringUtil.nullConvert(checkGoodwillVO.getGoodwillYn()).equals("Y")){
                    repairOrderVO.setRoStatCd("01");
                }else{
                    repairOrderVO.setRoStatCd("03");
                }

                //처음보양여부 업데이트
                CampaignSearchVO campaignSearchVO = new CampaignSearchVO();
                campaignSearchVO.setsDlrCd(calVO.getDlrCd());
                campaignSearchVO.setsVinNo(calVO.getVinNo());
                campaignSearchVO.setsRoDocNo(calVO.getRoDocNo());
                int freeRoCnt = campaignVinManageService.selectFreeRoCnt(campaignSearchVO);
                if(freeRoCnt > 0){
                    RepairOrderVO checkRepairOrderVO = repairOrderService.selectRepairOrderByKey(repairOrderSearchVO);
                    if(StringUtil.nullConvert(checkRepairOrderVO.getFreeRoYn()).equals("Y")){
                        repairOrderVO.setFreeRoYn("N");
                    }
                }

                repairOrderService.updateRepairOrder(repairOrderVO);

            }else{//부품 정산 취소인 경우.
                CalculatePartsSaleOrdVO partsSaleOrdVO = new CalculatePartsSaleOrdVO();
                partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleOrdVO.setParSaleOrdNo(calVO.getRoDocNo());
                partsSaleOrdVO.setCalcDocNo("");
                partsSaleOrdVO.setOrdStatCd("02");
                calculateDAO.updateCalculateInfo(partsSaleOrdVO);

                calculateDAO.updatePartsSaleOrdItemDcRateCancel(partsSaleOrdVO);

                calculateDAO.updateReturnPartsSaleOrdItemDcRateCancel(partsSaleOrdVO);
            }
        }
		return returnData;
    }

    public CalculateVO selectRcvOnlyByKey(CalculateSearchVO searchVO) throws Exception {
        return calculateDAO.selectRcvOnlyByKey(searchVO);
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();

        CalculateSearchVO searchVO = new CalculateSearchVO();
        searchVO.setsDlrCd(dlrCd);
        if(!StringUtils.isBlank(params.get("sCalcFromDt").toString())){
            String sCalcFromDt = params.get("sCalcFromDt").toString();
            Date dCalcFromDt = DateUtil.convertToDate(sCalcFromDt);
            searchVO.setsCalcFromDt(dCalcFromDt);
        }
        if(!StringUtils.isBlank(params.get("sCalcToDt").toString())){
            String sCalcToDt = params.get("sCalcToDt").toString();
            Date dCalcToDt = DateUtil.convertToDate(sCalcToDt);
            searchVO.setsCalcToDt(dCalcToDt);
        }
        if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
            String sRoFromDt = params.get("sRoFromDt").toString();
            Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
            searchVO.setsRoFromDt(dRoFromDt);
        }
        if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
            String sRoToDt = params.get("sRoToDt").toString();
            Date dRoToDt = DateUtil.convertToDate(sRoToDt);
            searchVO.setsRoToDt(dRoToDt);
        }

        if(!StringUtils.isBlank(params.get("sRoTpList").toString())){
            String[] result = params.get("sRoTpList").toString().split(",");
            List<String> sRoTpList = new ArrayList<String>();
            for(int i=0;i<result.length;i++){
                sRoTpList.add(i, result[i]);
            }
            searchVO.setsRoTpList(sRoTpList);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<CalculateVO> list = selectCalculateListByCondition(searchVO);
        context.putVar("items", list);

    }

    /**
     * 조회 조건에 해당하는 정산토탈금액을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateAmtByCondition(CalculateSearchVO searchVO)throws Exception {
        if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return calculateDAO.selectCalculateAmtByCondition(searchVO);
    }

    /**
     * 서비스인도알람,SMS
     * @param calculateVO - 수정할 정보가 담긴 CalculateVO
     * @return
     */
    public void serDlAlramCall(CalculateVO calculateVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();

        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setUsrId(calculateVO.getCarOwnerId());
        targetVO.setUsrNm(calculateVO.getCarOwnerNm());
        targetVO.setMesgTmplTpList("S");
        targetVO.setHpNo(calculateVO.getDriverHpNo());
        targetUsers.add(targetVO);

        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "SER-0007";

        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("carRegNo", calculateVO.getCarRegNo());
        context.getVelocityContext().put("roDocNo", calculateVO.getRoDocNo());
        context.getVelocityContext().put("custNo", calculateVO.getCarOwnerId());
        context.getVelocityContext().put("saNm", calculateVO.getSaNm());
        context.setCustNo(calculateVO.getCarOwnerId());

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }
    public CalculateFmsCardVO selectFmsCardInfoById(CalculateVO calculateVO) {
    	return calculateDAO.selectFmsCardInfoById(calculateVO);
    }
    @Override
	public String cancelBillingCouponAntiWriteOff(CalculateVO calculateVO) throws Exception {
		    String dlrCd = LoginUtil.getDlrCd();
		    calculateVO.setDlrCd(dlrCd);
		     boolean result  =  false;
		     String reVal = "";
		     CamelClient camelClient = camelClientFactory.createCamelClient();
		     camelClient.setIfId("SAL249"); // 售后卡券反核销接口（DMS->FMS）
		     camelClient.setSender(LoginUtil.getDlrCd());
		     camelClient.setReceiver("FMS");
		     Map<String, Object> message = new HashMap<String, Object>();
		         message.put("card_id", calculateVO.getLanBinCardNo()); // 蓝缤卡券号码
		         message.put("dealer_id",LoginUtil.getDlrCd());//店代码
		         message.put("order_id",calculateVO.getRoDocNo());//维修委托单号
		         message.put("vin",calculateVO.getVinNo());//车架号，如果有值就传没有就不传 非唯一
		         message.put("write_of_type","售后");
		         camelClient.addSendMessage(message);
		         chn.bhmc.dms.core.support.camel.Data receiveData = camelClient.sendRequest();
		     result  =  (receiveData.getFooter().getIfResult().equals("Z")) ? true : false;
		     log.info("executeCamelClent SAL249  结算取消反核销 " + result + " / IfResult"+receiveData.getFooter().getIfResult());
		     log.info("SexecuteCamelClent SAL249 结算取消反核销 " + result + " / IfResult"+receiveData);
		     List<CalculateCardInfoVO> roIfList = new ArrayList<CalculateCardInfoVO>();
		     if(!receiveData.getFooter().getIfResult().equals("Z")){
		         throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
		     }
		     if (receiveData.getFooter().getIfResult().equals("Z")) {
		     	roIfList = receiveData.readMessages(CalculateCardInfoVO.class);
		     	log.info("SAL249  结算取消 反核销接口记录信息1 " + roIfList.get(0).getCode() + " / END");
		     	log.info("SAL249  结算取消 反核销记录信息2 " + roIfList.get(0).getMsg() + "  / END");
		     	log.info("SAL249 结算取消  反核销记录信息3 " + receiveData.getBody().getJsonMessage() + " / END");
		     	if(!"0".equals(roIfList.get(0).getCode())){
		     		reVal = "F"; //代表失败
		     		String msg = roIfList.get(0).getCode()+ "" + roIfList.get(0).getMsg();
			         throw processException("ser.error.cardAntiWriteOffFail", new String[] {msg});
		     	}
		     	if("0".equals(roIfList.get(0).getCode())){
		     		reVal = "S"; //代表成功
		     	}
		     	if("S".equals(reVal)){
		     		calculateDAO.updateCalculateCardInfo(calculateVO);
		     	}
		     }
		return reVal;
	}
}