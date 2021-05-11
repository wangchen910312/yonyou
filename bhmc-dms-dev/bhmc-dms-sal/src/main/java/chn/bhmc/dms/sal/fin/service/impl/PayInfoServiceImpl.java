package chn.bhmc.dms.sal.fin.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.quartz.JobExecutionException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.pay.service.AggregatePaymentLogService;
import chn.bhmc.dms.cmm.pay.service.CouponDetailsService;
import chn.bhmc.dms.cmm.pay.vo.AggregatePaymentLogVO;
import chn.bhmc.dms.cmm.pay.vo.CouponDetailsVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.sal.fin.service.PayInfoService;
import chn.bhmc.dms.sal.fin.service.dao.PayInfoDAO;
import chn.bhmc.dms.sal.fin.vo.CancelTrans;
import chn.bhmc.dms.sal.fin.vo.Data;
import chn.bhmc.dms.sal.fin.vo.PayInfoDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoVO;
import chn.bhmc.dms.sal.fin.vo.ResponseData;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.ser.cal.service.util.HttpUtil;

/**
 * 수납관리 서비스
 *
 * @ClassName   : PayInfoServiceImpl
 * @Description : 수납관리
 * @author
 * @since 2017. 1. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("payInfoService")
public class PayInfoServiceImpl extends HService implements PayInfoService, JxlsSupport{
	
	//聚合日志
    @Resource(name="aggregatePaymentLogService")
    AggregatePaymentLogService aggregatePaymentLogService;
    
    //优惠券明细日志
  	@Resource(name = "couponDetailsService")
  	CouponDetailsService couponDetailsService;

    /**
     * 계약 DAO 선언
     */
    @Resource(name="payInfoDAO")
    PayInfoDAO payInfoDAO;

    /**
     * 보험서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * 딜러포인트 서비스
     */
    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;



    /**
     * 수납관리 header목록을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectPayInfosByConditionCnt(PayInfoSearchVO searchVO) throws Exception{
        return payInfoDAO.selectPayInfosByConditionCnt(searchVO);
    }
    @Override
    public List<PayInfoVO> selectPayInfosByCondition(PayInfoSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return payInfoDAO.selectPayInfosByCondition(searchVO);
    }

    /**
     * 수납관리 detail목록을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectPayInfoDetailsByConditionCnt(PayInfoSearchVO searchVO) throws Exception{

        if( StringUtils.isEmpty(searchVO.getsFinDocNo()) ){
            // [목록]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.title.list", null, LocaleContextHolder.getLocale())});
        };

        return payInfoDAO.selectPayInfoDetailsByConditionCnt(searchVO);
    }
    @Override
    public List<PayInfoDetailVO> selectPayInfoDetailsByCondition(PayInfoSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if( StringUtils.isEmpty(searchVO.getsFinDocNo()) ){
            // [목록]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.title.list", null, LocaleContextHolder.getLocale())});
        };

        return payInfoDAO.selectPayInfoDetailsByCondition(searchVO);
    }


    /**
     * 수납관리 HEADER 정보 생성한다.
     */
    @Override
    public int insertPayInfoHeader(PayInfoVO saveVO) throws Exception{

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }

        if( StringUtils.isEmpty(saveVO.getJobTp()) ){
            // 관련업무 유형을 넣어주세요.
            throw processException("sal.info.docTpMsg");
        }

        if( StringUtils.isEmpty(saveVO.getJobContractNo()) ){
            // 관련업무 문서번호를 넣어주세요.
            throw processException("sal.info.docNoMsg");
        }

        if( StringUtils.isEmpty(saveVO.getPaymentTp()) ){
            saveVO.setPaymentTp("01");      // 지불상태:01-미결
        }

        saveVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        return payInfoDAO.insertPayInfoHeader(saveVO);
    }
    /**
     * 수납관리 HEADER 정보 생성한다.
     */
    @Override
    public int updatePayInfoHeader(PayInfoVO saveVO) throws Exception{
        return payInfoDAO.updatePayInfoHeader(saveVO);
    }

    /**
     * 수납Header 정보를 생성/수정한다.
     * @return
     * @throws Exception
     */
    @Override
    public int multiPayInfoHeader(PayInfoVO saveVO) throws Exception{

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }

        if( StringUtils.isEmpty(saveVO.getJobTp()) ){
            // 관련업무 유형을 넣어주세요.
            throw processException("sal.info.docTpMsg");
        }

        if( StringUtils.isEmpty(saveVO.getJobContractNo()) ){
            // 관련업무 문서번호를 넣어주세요.
            throw processException("sal.info.docNoMsg");
        }

        PayInfoSearchVO searchVO = new PayInfoSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsJobTp(saveVO.getJobTp());
        searchVO.setsJobContractNo(saveVO.getJobContractNo());

        List<PayInfoVO> infoList = payInfoDAO.selectPayInfosByCondition(searchVO);

        if(infoList != null && infoList.size() > 0){
            PayInfoVO payVO = infoList.get(0);
            saveVO.setFinDocNo(payVO.getFinDocNo());

            // 지불상태:01-미결, 02-수납완료
            if ("02".equals(payVO.getPaymentTp())) {
                if (saveVO.getRealPayAmt() != payVO.getRealPayAmt()) {
                    saveVO.setCompYn("N");
                    saveVO.setCompDt(null);
                    saveVO.setPaymentTp("01");
                }
            }
            updatePayInfoHeader(saveVO);

            PayInfoDetailVO dVO = new PayInfoDetailVO();
            dVO.setDlrCd(payVO.getDlrCd());
            dVO.setFinDocNo(payVO.getFinDocNo());
            dVO.setUpdtUsrId(LoginUtil.getUserId());
            // 최종정산금액 UPDATE
            payInfoDAO.updatePayInfoTotHeader(dVO);

        }else{
            insertPayInfoHeader(saveVO);        // 생성
        }

        return 1;
    }


    /**
     * 수납 입금을 환불한다.
     */
    @Override
    public ResponseData saveReFundPayInfo(BaseSaveVO<PayInfoDetailVO> detailVO ) throws Exception{
        String dlrCd = ""
             , finDocNo = "";
        ArrayList<Integer> seqList = new ArrayList<Integer>();

       /* for(PayInfoDetailVO vo : detailVO.getInsertList() ){
            if( StringUtils.isEmpty(vo.getDlrCd()) ){
                vo.setDlrCd(LoginUtil.getDlrCd());
            }
            if( StringUtils.isEmpty(vo.getFinDocNo()) ){
                // 관련업무 문서번호를 넣어주세요.
                throw processException("sal.info.docNoMsg");
            }

            dlrCd = vo.getDlrCd();
            finDocNo = vo.getFinDocNo();
            seqList.add(vo.getSeq());
        }*/
        
        //20190829 聚合支付类型的退款登记 start
        ArrayList<Integer> useCashList = new ArrayList<Integer>(); //20200304 使用现金来取消聚合支付
        ResponseData returnData = new ResponseData();
        returnData.setCode(1111111);
        for(PayInfoDetailVO vo : detailVO.getInsertList() ){
        	
        	if( StringUtils.isEmpty(vo.getFinDocNo()) ){
                // 관련업무 문서번호를 넣어주세요.
                throw processException("sal.info.docNoMsg");
            }
        	
        	//值13生产测试不一致需最后确定
        	if (("13").equals(vo.getRctTp()) && vo.getTradeId()!=null) {
        		//20200304 判断isUserCash是否为Y 如果是放到一个list里 下方进行判断修改支付方式为现金然后不走聚合接口进行退款
        		if (vo.getIsUserCash().equals("Y")) {
        			useCashList.add(vo.getSeq());
				}else {
					BigDecimal data1 = new BigDecimal(vo.getPayAmt());
					if (data1.compareTo(BigDecimal.ZERO) > 0) {
						//发送退款到服务
						CancelTrans cancelTrans = new CancelTrans();
						cancelTrans.setTradeId(vo.getTradeId());
						//cancelTrans.setOrderAmount(vo.getPayAmt()+"");
						cancelTrans.setOrderAmount(vo.getReceivedAmt()+"");//20191112 修改退款金额为实收金额才能退款
						cancelTrans.setDlrcd(LoginUtil.getDlrCd());
						HttpUtil httpUtil = new HttpUtil();
						net.sf.json.JSONObject jsonArray = net.sf.json.JSONObject.fromObject(cancelTrans);
						String param = jsonArray.toString();
						Properties ret = PropertiesLoaderUtils.loadProperties(new ClassPathResource("/config/common.properties"));
						System.out.println("cancelTransUrl" + ret.getProperty("cancelTransUrl"));
						Map<String, Object> map = httpUtil.sendPost(ret.getProperty("cancelTransUrl"), param, false);
						if (map.get("status").equals("200")) {
							Object object = map.get("response");
							net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(object);
							ResponseData responseData = (ResponseData) net.sf.json.JSONObject.toBean(jsonObject, ResponseData.class);
							if (responseData != null) {
								if (responseData.getCode() == 91200) {
									//91200-请求成功，其它为不成功 */
									net.sf.json.JSONObject jsonData = net.sf.json.JSONObject.fromObject(responseData.getData());
									Data returnDate = (Data)net.sf.json.JSONObject.toBean(jsonData, Data.class);
									if (returnDate.getGateReturnType().equals("S")) {
										//code 为91200时非空 S:交易成功D:退款处理中E:查询失败
										//log
										AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
										aggregatePaymentLogVO.setTriggerPage("销售-财务管理-收款管理");		
										aggregatePaymentLogVO.setTradeId(vo.getTradeId());
										//aggregatePaymentLogVO.setAmount(vo.getPayAmt()+"");
										aggregatePaymentLogVO.setAmount(vo.getReceivedAmt()+"");
										aggregatePaymentLogVO.setStatus("3");
										aggregatePaymentLogVO.setBusinessNumber(vo.getFinDocNo());
										aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
										//优惠券添加一条已退款日志记录 2019/12/13
										if (vo.getDiscountAmt()!=0) {
											//优惠金额不为0说明使用了优惠券
											CouponDetailsVO couponDetailsVO = new CouponDetailsVO();
											couponDetailsVO.setTradeId(vo.getTradeId());
											List<CouponDetailsVO> selectInfoByParams = couponDetailsService.selectInfoByParams(couponDetailsVO);
											if (selectInfoByParams.size()>0) {
												CouponDetailsVO couponDetailsVO2 = selectInfoByParams.get(0);
												couponDetailsVO2.setCouponState("已退款");
												couponDetailsService.insertLog(couponDetailsVO2);
											}
										}
									}else if (returnDate.getGateReturnType().equals("D")) {
										returnData.setCode(7777777);
										returnData.setMessage(returnDate.getGateReturnMessage());
										return returnData;
									}else if (returnDate.getGateReturnType().equals("E")) {
										if(("该订单状态已全部退款").equals(returnDate.getGateReturnMessage())) {
											//log 20191113  add 需要添加日志进去
											AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
											aggregatePaymentLogVO.setTriggerPage("销售-财务管理-收款管理");		
											aggregatePaymentLogVO.setTradeId(vo.getTradeId());
											aggregatePaymentLogVO.setAmount(vo.getReceivedAmt()+"");
											aggregatePaymentLogVO.setStatus("3");
											aggregatePaymentLogVO.setBusinessNumber(vo.getFinDocNo());
											aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
											//优惠券添加一条已退款日志记录 2019/12/13
											if (vo.getDiscountAmt()!=0) {
												//优惠金额不为0说明使用了优惠券
												CouponDetailsVO couponDetailsVO = new CouponDetailsVO();
												couponDetailsVO.setTradeId(vo.getTradeId());
												List<CouponDetailsVO> selectInfoByParams = couponDetailsService.selectInfoByParams(couponDetailsVO);
												if (selectInfoByParams.size()>0) {
													CouponDetailsVO couponDetailsVO2 = selectInfoByParams.get(0);
													couponDetailsVO2.setCouponState("已退款");
													couponDetailsService.insertLog(couponDetailsVO2);
												}
											}
										}else {
											returnData.setCode(6666666);
											returnData.setMessage(returnDate.getGateReturnMessage());
											return returnData;
										}
									}
								}else {
									returnData.setCode(5555555);
									returnData.setMessage(responseData.getMessage());
									return returnData;
								}
							}else {
								returnData.setCode(3333333);
								return returnData;
							}
						}else {
							returnData.setCode(4444444);
							return returnData;
						}
					}
				}
        		
			}
            if( StringUtils.isEmpty(vo.getDlrCd()) ){
                vo.setDlrCd(LoginUtil.getDlrCd());
            }
            

            dlrCd = vo.getDlrCd();
            finDocNo = vo.getFinDocNo();
            seqList.add(vo.getSeq());
        }
        //20190829 聚合支付类型的退款登记 end

        PayInfoSearchVO searchVO = new PayInfoSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsFinDocNo(finDocNo);
        searchVO.setsSeqList(seqList);
        PayInfoVO infoVO = payInfoDAO.selectPayInfosByCondition(searchVO).get(0);
        for(PayInfoDetailVO payVO : payInfoDAO.selectPayInfoDetailsByCondition(searchVO)){
            if("01".equals( payVO.getColTp() )){

                if("G".equals(infoVO.getJobTp()) && "10".equals(payVO.getRctTp()) ){
                    cancelUsePoint(payVO);      //포인트 사용취소
                }else{

                    // 용품 포인트 적립안함. : 용품판매관리 화면에서 적립/적립취소하기로 함.
                    if(!"G".equals(infoVO.getJobTp())){
                        cancelPoint(payVO);     // 포인트 적립취소
                    }
                }
                //20200304 修改聚合支付类型退款的支付方式为现金 wushibin start
                
                if (useCashList.isEmpty()) {
				}else {
					if (useCashList.contains(payVO.getSeq())) {
						payVO.setRctTp("01");
					}
				}
                //20200304 by wushibin end 
                //修改收款管理页面退款时间 by wushibin start
                payVO.setRctDt(new Date());
                //by wushibin end
                
                payVO.setUpdtUsrId(LoginUtil.getUserId());
                payVO.setRegUsrId(LoginUtil.getUserId());
                payVO.setColTp("03"); // 환불
                payInfoDAO.reFundPayInfo(payVO);
            }else{
                // 입금만 환불이 가능합니다.
                throw processException("sal.info.saveReFundMsg");
            }
        }

        // 정산금액 및 수납완료 여부 update
        updatePayInfoStat(dlrCd, finDocNo);

        return returnData;
    }


    /**
     * 수납 취소한다.
     **/
    @Override
    public int cancelPayInfo(PayInfoVO cancelVO) throws Exception{

        for(PayInfoDetailVO payVO : payInfoDAO.selectCancelPayInfoSerch(cancelVO)){
            if( StringUtils.isEmpty(payVO.getDlrCd()) ){
                payVO.setDlrCd(LoginUtil.getDlrCd());
            }
            if( StringUtils.isEmpty(payVO.getFinDocNo()) ){
                // 관련업무 문서번호를 넣어주세요.
                throw processException("sal.info.docNoMsg");
            }

            if("G".equals(cancelVO.getJobTp()) && "10".equals(payVO.getRctTp()) ){
                cancelUsePoint(payVO);  //포인트 사용취소
            }else{

                // 용품 포인트 적립안함. : 용품판매관리 화면에서 적립/적립취소하기로 함.
                if(!"G".equals(cancelVO.getJobTp())){
                    cancelPoint(payVO);     // 포인트 적립취소
                }
            }

            payVO.setUpdtUsrId(LoginUtil.getUserId());
            payVO.setRegUsrId(LoginUtil.getUserId());
            payVO.setColTp("03"); // 환불
            payInfoDAO.reFundPayInfo(payVO);
        }

        // 정산금액 및 수납완료 여부 update
        updatePayInfoStat(cancelVO.getDlrCd(), cancelVO.getFinDocNo());

        return 1;
    }

    /**
     * 수납처리한다.
     **/
    @Override
    public int savePayInfo(PayInfoDetailVO saveVO) throws Exception{

        if( StringUtils.isEmpty(saveVO.getFinDocNo()) ){
            // [목록]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.title.list", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if( StringUtils.isEmpty(saveVO.getRegUsrId()) ){
            saveVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        }
        if( StringUtils.isEmpty(saveVO.getUpdtUsrId()) ){
            saveVO.setUpdtUsrId(LoginUtil.getUserId());     // 수정자
        }

        // [금액]을(를) 확인하여 주세요.
        if( !"02".equals(saveVO.getPaymentTp()) && saveVO.getPayAmt() <= 0 ){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.amt", null, LocaleContextHolder.getLocale())});
        }

        if(saveVO.getPayAmt() >= 0){
            payInfoDAO.insertPayInfoDetail(saveVO);
        }
        
        //聚合支付完成log记录 strat
        if (("13").equals(saveVO.getRctTp())) {
        	AggregatePaymentLogVO aggregatePaymentLogVO = new AggregatePaymentLogVO();
    		aggregatePaymentLogVO.setTriggerPage("销售-财务管理-收款管理");		
    		aggregatePaymentLogVO.setTradeId(saveVO.getTradeId());
    		aggregatePaymentLogVO.setAmount(saveVO.getReceivedAmt()+"");
    		aggregatePaymentLogVO.setStatus("2");
    		aggregatePaymentLogVO.setBusinessNumber(saveVO.getJobContractNo());
    		aggregatePaymentLogService.insertLog(aggregatePaymentLogVO);
		}
		//end
        

        // 용품 포인트(10) 사용
        if("G".equals(saveVO.getJobTp()) && "10".equals(saveVO.getRctTp()) ){
            MembershipPointHisVO membershipPointHisVO = new MembershipPointHisVO();
            membershipPointHisVO.setUseTp("02");                            //사용처
            membershipPointHisVO.setUseNum(saveVO.getJobContractNo());      //송장번호
            membershipPointHisVO.setSrcSub1(saveVO.getFinDocNo());          //수납번호
            membershipPointHisVO.setSrcSub2(saveVO.getSeq()+"");          //seq
            membershipPointHisVO.setDlrCd(LoginUtil.getDlrCd());
            membershipPointHisVO.setMembershipNo(saveVO.getMembershipNo());
            membershipPointHisVO.setCardNo(saveVO.getMembershipCardNo());   // 카드번호
            membershipPointHisVO.setPointCd("07");                          // 产品(악세사리)  CRM802
            membershipPointHisVO.setOccrPointVal(saveVO.getPointVal());     // 발생 포인트
            membershipPointHisVO.setOccrPointCost(saveVO.getPayAmt());      // 해당포인트 사용금액
            membershipPointHisSupportService.selectCallPointInterface(membershipPointHisVO);
        }else{

            // 용품 포인트 적립안함. : 용품판매관리 화면에서 적립/적립취소하기로 함.
            if(!"G".equals(saveVO.getJobTp())){
                pointSave(saveVO);  //포인트 적립
            }
        }

        if("01".equals(saveVO.getPaymentTp())){
            saveVO.setCompYn("N");      // 미납
        }
        else if("02".equals(saveVO.getPaymentTp())){
            saveVO.setCompYn("Y");      // 수납
        }

        payInfoDAO.updatePayInfoTotHeader(saveVO);

        return 1;
    }

    /**
     * CRM 포인트로 교환한 용품의 수납처리를 한다.
     */
    @Override
    public int saveCrmGoodsPointPayInfo(PayInfoDetailVO saveVO) throws Exception{
        if( StringUtils.isEmpty(saveVO.getFinDocNo()) ){
            // [목록]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.title.list", null, LocaleContextHolder.getLocale())});
        };

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if( StringUtils.isEmpty(saveVO.getRegUsrId()) ){
            saveVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        }
        if( StringUtils.isEmpty(saveVO.getUpdtUsrId()) ){
            saveVO.setUpdtUsrId(LoginUtil.getUserId());     // 수정자
        }

        payInfoDAO.insertPayInfoDetail(saveVO);

        if("02".equals(saveVO.getPaymentTp())){
            saveVO.setCompYn("Y");      // 수납
        }else{
            saveVO.setCompYn("N");      // 미납
        }

        payInfoDAO.updatePayInfoTotHeader(saveVO);

        return 1;
    }


    /**
     * 수납정산상태를 변경한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @Override
    public int changePayInfo(PayInfoDetailVO saveVO) throws Exception{
        if(StringUtils.isEmpty(saveVO.getFinDocNo())){
            // 관련업무 문서번호를 넣어주세요.
            throw processException("sal.info.docNoMsg");
        }

        if(StringUtils.isBlank(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }

        if("01".equals(saveVO.getPaymentTp())){
            saveVO.setCompYn("N");
        }else if("02".equals(saveVO.getPaymentTp())){
            saveVO.setCompYn("Y");
        }

        payInfoDAO.updatePayInfoTotHeader(saveVO);
        return 1;
    }

    /**
     * 딜러코드, 수납문서 번호로 정산여부, 정산금액 재정비
     * @return
     * @throws Exception
     */
    private int updatePayInfoStat(String dlrCd, String finDocNo) throws Exception{
        PayInfoDetailVO dVO = new PayInfoDetailVO();
        dVO.setDlrCd(dlrCd);
        dVO.setFinDocNo(finDocNo);
        dVO.setUpdtUsrId(LoginUtil.getUserId());
        dVO.setRegUsrId(LoginUtil.getUserId());
        // 최종정산금액 UPDATE
        payInfoDAO.updatePayInfoTotHeader(dVO);

        PayInfoSearchVO searchVO = new PayInfoSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsFinDocNo(finDocNo);
        List<PayInfoVO> infoList = payInfoDAO.selectPayInfosByCondition(searchVO);
        PayInfoVO infoVO = infoList.get(0);

        // 전액 포인트 치환인 수납건 or  미수금 존재하는 경우.
        if( infoVO.getRecvAmt() > 0 || infoVO.getRealPayAmt() == 0.0){
            dVO.setPaymentTp("01");
            dVO.setCompYn("N");
            payInfoDAO.updatePayInfoTotHeader(dVO);
        }
        return 1;
    }

    /**
     * 수납을 지운다. (예약판매, 보험)
     **/
    @Override
    public int deltePayinfoDetail(PayInfoVO vo) throws Exception{
        if(StringUtils.isBlank(vo.getDlrCd())){
            vo.setDlrCd(LoginUtil.getDlrCd());
        }
        return payInfoDAO.deltePayinfoDetail(vo);
    }
    @Override
    public int deltePayinfoHeader(PayInfoVO vo) throws Exception{
        if(StringUtils.isBlank(vo.getDlrCd())){
            vo.setDlrCd(LoginUtil.getDlrCd());
        }
        return payInfoDAO.deltePayinfoHeader(vo);
    }


    /**
     * 포인트 적립
     */
    private int pointSave(PayInfoDetailVO saveVO) throws Exception{
        PayInfoSearchVO searchVO = new PayInfoSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsFinDocNo(saveVO.getFinDocNo());
        List<PayInfoVO> payList = payInfoDAO.selectPayInfosByCondition(searchVO);
        PayInfoVO payVO = payList.get(0);

        MembershipPointHisVO pointVO = new MembershipPointHisVO();
        pointVO.setMembershipNo(saveVO.getMembershipNo());
        //pointVO.setCustNo(payVO.getCustNo());
        pointVO.setUseTp("02");                     //사용처
        pointVO.setUseNum(payVO.getJobContractNo());//송장번호
        pointVO.setSrcSub1(saveVO.getFinDocNo());   //수납번호
        pointVO.setSrcSub2(""+saveVO.getSeq());     //수납seq

        // 계약적립
        if("C".equals(saveVO.getJobTp())){
            pointVO.setSrcSub3("RCPT_AMTS_RATE");
        }
        // 용품적립
        if("G".equals(saveVO.getJobTp())){
            pointVO.setSrcSub3("GOODS_RATE");
        }
        // 보험적립
        if("I".equals(saveVO.getJobTp())){
            IncJoinInfoSearchVO serchIncVO = new IncJoinInfoSearchVO();
            serchIncVO.setsDlrCd(payVO.getDlrCd());
            serchIncVO.setsIncNo(payVO.getJobContractNo());
            List<IncJoinInfoVO> incList = incJoinInfoService.selectIncJoinInfoByCondition(serchIncVO);
            IncJoinInfoVO incVO = incList.get(0);
            if("01".equals(incVO.getIncCs())){
                pointVO.setSrcSub3("INSURANCE_NEW_RATE");           // 신보험 : 01
            }else{
                pointVO.setSrcSub3("INSURANCE_EXTENDED_RATE");      // 속보험 : 02
            }
        }
        pointVO.setOccrPointVal(saveVO.getPayAmt());
        membershipPointHisSupportService.selectCallPointSaveInterface(pointVO);
        return 1;
    }

    /**
     * 포인트 적립 취소
     */
    private int cancelPoint(PayInfoDetailVO cancelVO) throws Exception{
        PayInfoSearchVO searchVO = new PayInfoSearchVO();
        searchVO.setsDlrCd(cancelVO.getDlrCd());
        searchVO.setsFinDocNo(cancelVO.getFinDocNo());
        List<PayInfoVO> payList = payInfoDAO.selectPayInfosByCondition(searchVO);
        PayInfoVO payVO = payList.get(0);

        MembershipPointHisSearchVO mSearchVO = new MembershipPointHisSearchVO();
        mSearchVO.setsMembershipNo(cancelVO.getMembershipNo());
        mSearchVO.setsDlrCd(cancelVO.getDlrCd());
        mSearchVO.setsUseTp("02");      //사용처
        mSearchVO.setsUseNum(payVO.getJobContractNo()); //송장번호
        mSearchVO.setsSrcSub1(cancelVO.getFinDocNo());  // 수납 문서번호
        mSearchVO.setsSrcSub2(""+cancelVO.getSeq());    // SEQ

        // 계약적립 취소
        if("C".equals(payVO.getJobTp())){
            mSearchVO.setsSrcSub3("RCPT_AMTS_RATE");
        }
        // 용품적립 취소
        if("G".equals(payVO.getJobTp())){
            mSearchVO.setsSrcSub3("GOODS_RATE");
        }
        // 보험적립 취소
        if("I".equals(payVO.getJobTp())){
            IncJoinInfoSearchVO serchIncVO = new IncJoinInfoSearchVO();
            serchIncVO.setsDlrCd(payVO.getDlrCd());
            serchIncVO.setsIncNo(payVO.getJobContractNo());
            List<IncJoinInfoVO> incList = incJoinInfoService.selectIncJoinInfoByCondition(serchIncVO);
            IncJoinInfoVO incVO = incList.get(0);
            if("01".equals(incVO.getIncCs())){
                mSearchVO.setsSrcSub3("INSURANCE_NEW_RATE");           // 신보험 : 01
            }else{
                mSearchVO.setsSrcSub3("INSURANCE_EXTENDED_RATE");      // 속보험 : 02
            }
        }
        membershipPointHisSupportService.cancelMembershipChargeInterface(mSearchVO);
        return 1;
    }

    /**
     * 포인트 사용 취소
     * @param cancelVO
     * @return
     * @throws Exception
     */
    private int cancelUsePoint(PayInfoDetailVO cancelVO) throws Exception{
        PayInfoSearchVO searchVO = new PayInfoSearchVO();
        searchVO.setsDlrCd(cancelVO.getDlrCd());
        searchVO.setsFinDocNo(cancelVO.getFinDocNo());
        List<PayInfoVO> payList = payInfoDAO.selectPayInfosByCondition(searchVO);
        PayInfoVO payVO = payList.get(0);

        if( "G".equals(payVO.getJobTp()) && "10".equals(cancelVO.getRctTp()) ){
            MembershipPointHisSearchVO mSearchVO = new MembershipPointHisSearchVO();
            mSearchVO.setsMembershipNo(cancelVO.getMembershipNo());
            mSearchVO.setsDlrCd(cancelVO.getDlrCd());
            mSearchVO.setsUseTp("02");                      //사용처
            mSearchVO.setsUseNum(payVO.getJobContractNo()); //송장번호
            mSearchVO.setsSrcSub1(cancelVO.getFinDocNo());  // 수납 문서번호
            mSearchVO.setsSrcSub2(""+cancelVO.getSeq());    // SEQ
            membershipPointHisSupportService.cancelMembershipChargeInterface(mSearchVO);
        }
        return 1;
    }

    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        PayInfoSearchVO searchVO = new PayInfoSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if (StringUtils.isNotEmpty((String)params.get("sRctFromDt"))) {
            searchVO.setsRctFromDt(DateUtil.convertToDate((String)params.get("sRctFromDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sRctToDt"))) {
            searchVO.setsRctToDt(DateUtil.convertToDate((String)params.get("sRctToDt")));
        }

        if (StringUtils.isNotEmpty((String)params.get("sCompFromDt"))) {
            searchVO.setsCompFromDt(DateUtil.convertToDate((String)params.get("sCompFromDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sCompToDt"))) {
            searchVO.setsCompToDt(DateUtil.convertToDate((String)params.get("sCompToDt")));
        }

        List<PayInfoVO> list = selectPayInfosByCondition(searchVO);

        context.putVar("items", list);
    }

    /**
     * 수납관리 header 상세정보를 조회한다.
     * @param searchVO
     * @return PayInfoVO
     * @throws Exception
     */
    @Override
    public PayInfoVO selectPayInfosByKey(PayInfoSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return payInfoDAO.selectPayInfosByKey(searchVO);
    }

    /**
     * 완성차의 기동차 영수증조회한다.
     * @param searchVO
     * @return PayInfoVO
     * @throws Exception
     */
    @Override
    public PayInfoVO selectReceiptSearchByKey (PayInfoSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return payInfoDAO.selectReceiptSearchByKey(searchVO);
    }
}