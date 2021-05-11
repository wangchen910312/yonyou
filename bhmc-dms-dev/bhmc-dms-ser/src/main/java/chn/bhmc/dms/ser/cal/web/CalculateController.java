package chn.bhmc.dms.ser.cal.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.exception.BizException;
import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;
import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cal.service.CalculateDetailService;
import chn.bhmc.dms.ser.cal.service.CalculateService;
import chn.bhmc.dms.ser.cal.service.model.ResponseData;
import chn.bhmc.dms.ser.cal.vo.CalculateCardInfoVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSaveVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;
import chn.bhmc.dms.ser.svi.service.*;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateController.java
 * @Description : 정산 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class CalculateController extends HController {

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Autowired
    CalculateService calculateService;

    @Autowired
    CalculateDetailService calculateDetailService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 서비스 설정 관리 Service
     */
    @Resource(name="serviceSettingService")
    ServiceSettingService serviceSettingService;
    
    /**
     * FMS 蓝缤接口 贾明 2020-4-6  
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 정산 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateMain.do", method = RequestMethod.GET)
    public String selectBayManageMain(Model model,HttpServletRequest request
            ,@RequestParam(value="calcDocNo", defaultValue="") String calcDocNo
            ,@RequestParam(value="roDocNo", defaultValue="") String roDocNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        Device device = DeviceUtils.getCurrentDevice(request);

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //부품수령상태
        model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));
        //聚合支付 根据经销商选择显示 20190829
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
        //할인구분
        model.addAttribute("dsDistCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        // 공통코드 : 블루멤버쉽등급
        model.addAttribute("bmMemberGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //공통코드 : 고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //할인대상구분
        model.addAttribute("dcPermTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER922", null, langCd));
        //소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        //정산절사
        model.addAttribute("wonUnitCutCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER063", null, langCd));
        //정산제로
        model.addAttribute("demicalPointCutCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER064", null, langCd));
        //고객전화표시여부
        model.addAttribute("custTelYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER065", null, langCd));
        //BM쿠폰유형
        model.addAttribute("bmCupnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER073", null, langCd));
        //부품판매가격유형
        model.addAttribute("partPrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        //인쇄리포트명
        model.addAttribute("rptNm", serviceSettingService.getRptNm(2)); //pageNo (1:RO문서, 2:정비정산서)

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "CA");
        model.addAttribute("calcDocNo", calcDocNo);
        model.addAttribute("roDocNo", roDocNo);
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        model.addAttribute("vatCd", vatInfoVO.getVatApplyRate());

        return "/ser/cal/calculate/selectCalculateMain";

    }
    
   
    /**
     * 粉丝对接新需求，售后服务结算功能验证卡券信息 SAL248 接口从粉丝系统获取信息 
     * SAL248 接口，通过 店代码，蓝缤卡券号码 获取相应信息 贾明
     */
	@RequestMapping(value = "/ser/cal/calculate/selectCardCouponInfoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCardCouponInfoSearch(@RequestBody CalculateSearchVO searchVO) throws Exception {
		SearchResult result = new SearchResult();
		if(StringUtil.isEmpty(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
    	
        try{
            //调用接口
            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("SAL248"); //DMS获取FMS售后卡券信息
            camelClient.setSender(LoginUtil.getDlrCd());
            camelClient.setReceiver("FMS");

            Map<String, Object> message = new HashMap<String, Object>();
	            message.put("card_id", searchVO.getsLanBinCardNo());   // 蓝缤卡券号码
	            message.put("dealer_id", searchVO.getsDlrCd());//店代码
             
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            List<CalculateCardInfoVO> roIfList = new ArrayList<CalculateCardInfoVO>();
            if (receiveData.getFooter().getIfResult().equals("Z")) {
            	roIfList = receiveData.readMessages(CalculateCardInfoVO.class);
            	result.setData(roIfList);
            }
             
        } catch(Exception e) {
           throw new BizException(e.getMessage());
        }
        
        return result;
    }


    /**
     * 정산을 등록/수정/취소한다.
     * @param saveVO - 정산 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/cal/calculate/multiCalculate.do", method = RequestMethod.POST)
    public @ResponseBody HashMap<String, String> multiCalculate(@Validated @RequestBody CalculateSaveVO calculateSaveVO, BindingResult bindingResult) throws Exception {

        HashMap<String, String> result = calculateService.multiCalculate(calculateSaveVO);

        return result;

    }

    /**
     * 정산접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateByKey.do",  method = RequestMethod.POST)
    public @ResponseBody CalculateVO selectRepairOrderByKey(@RequestBody CalculateSearchVO searchVO) throws Exception {

        //String dlrCd = LoginUtil.getDlrCd();
        //searchVO.setsDlrCd(dlrCd);

        CalculateVO resultVO = calculateService.selectCalculateByKey(searchVO);

        if(resultVO == null){
            resultVO = new CalculateVO();
        }
        return resultVO;
    }

    /**
     * 정산부품접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculatePartByKey.do",  method = RequestMethod.POST)
    public @ResponseBody CalculateVO selectCalculatePartByKey(@RequestBody CalculateSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        CalculateVO resultVO = calculateService.selectCalculatePartByKey(searchVO);

        if(resultVO == null){
            resultVO = new CalculateVO();
        }
        return resultVO;
    }

    /**
     * 정산접수 헤더 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculates.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculates(@RequestBody CalculateSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(calculateService.selectCalculateByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(calculateService.selectCalculateByCondition(searchVO));
        }

        return result;

    }

    /**
     * 정산접수 현황  헤더 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculatesList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculatesList(@RequestBody CalculateSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(calculateService.selectCalculateListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(calculateService.selectCalculateListByCondition(searchVO));
        }

        return result;

    }

    /**
     * 정산접수 현황 헤더 목록 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateStatusCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrderListByConditionCnt(@RequestBody CalculateSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(calculateService.selectCalculateListByConditionCnt(searchVO));
        return result;

    }

    /**
     * 정산디테일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculateDetails(@RequestBody CalculateSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(calculateDetailService.selectCalculateDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(calculateDetailService.selectCalculateDetailsByCondition(searchVO));
        }

        return result;

     }

    /**
     * 정산 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateStatusMain.do", method = RequestMethod.GET)
    public String selectCalculateStatusMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //공통코드 : RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 공통코드 : 자체정의RO유형
        model.addAttribute("dlrRoTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER044", null, langCd));

        model.addAttribute("sCalcToDt", sysDate);
        model.addAttribute("sCalcFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat) );

        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "CA");
        return "/ser/cal/calculate/selectCalculateStatusMain";

    }

    /**
     * 정산을 등록/수정/취소한다.
     * @param saveVO - 정산 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/cal/calculate/multiCalculateDetail.do", method = RequestMethod.POST)
    public @ResponseBody String multiCalculateDetail(@Validated @RequestBody CalculateSaveVO calculateSaveVO, BindingResult bindingResult) throws Exception {

       calculateDetailService.multiCalculateDetail(calculateSaveVO.getCalculateDetailSaveVO(), calculateSaveVO.getCalculateVO());

       return "OK";
    }

    /**
     * 정산 취소 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateCancelMain.do", method = RequestMethod.GET)
    public String selectCalculateCancelMain(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, LocaleContextHolder.getLocale().getLanguage()));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("sCalcToDt", sysDate);
        model.addAttribute("sCalcFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        return "/ser/cal/calculate/selectCalculateCancelMain";

    }

    /**
     * 정산을 취소한다.
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/multiCalculateCancel.do", method = RequestMethod.POST)
    public @ResponseBody ResponseData multiCalculateCancel(@Validated @RequestBody List<CalculateVO> cancelVO, BindingResult bindingResult) throws Exception {

    	return calculateService.multiCalculateCancel(cancelVO);

        //return "OK";   by wushibin 修改返回类型  string ---》 ResponseData
        
    }
    
    /**
     * 结算取消 卡券进行反核销 操作 贾明 2020-6-3 
     * @param calculateVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cal/calculate/cancelBillingCouponAntiWriteOff.do", method = RequestMethod.POST)
    public @ResponseBody String cancelBillingCouponAntiWriteOff(@RequestBody CalculateVO calculateVO)throws Exception {
    	String  restVal = calculateService.cancelBillingCouponAntiWriteOff(calculateVO);
    	return restVal;
    }
    /**
     * 정산을 출력시간 저장 한다.
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/updateCalculatePrint.do", method = RequestMethod.POST)
    public @ResponseBody String updateCalculatePrint(@Validated @RequestBody CalculateVO calculateVO, BindingResult bindingResult) throws Exception {

        calculateService.updateCalculatePrint(calculateVO);

        return "OK";
    }


    /**
     * 정산 분리팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculatePopup.do", method = RequestMethod.GET)
    public String selectCalculatePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);

        return "/ser/cal/calculate/selectCalculatePopup";

    }

    /**
     * 정산 취소 팝업
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateCancelPopup.do", method = RequestMethod.GET)
    public String selectCalculateCancelPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //정산취소 사유
        model.addAttribute("calcCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER025", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);

        return "/ser/cal/calculate/selectCalculateCancelPopup";

    }

    /**
     * 정산 분리팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateTotAmtPopup.do", method = RequestMethod.GET)
    public String selectCalculateTotAmtPopup(Model model) throws Exception {

        return "/ser/cal/calculate/selectCalculateTotAmtPopup";

    }

    /**
     * 정산디테일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateAmt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculateAmt(@RequestBody CalculateSearchVO searchVO) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        SearchResult result = new SearchResult();
        result.setData(calculateService.selectCalculateAmtByCondition(searchVO));
        return result;
    }

    /**
     * 서비스인도알람
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/serDlAlramCall.do", method = RequestMethod.POST)
    public @ResponseBody String serDlAlramCall(@RequestBody CalculateVO calculateVO) throws Exception {

        calculateService.serDlAlramCall(calculateVO);

        return "OK";
    }
}
