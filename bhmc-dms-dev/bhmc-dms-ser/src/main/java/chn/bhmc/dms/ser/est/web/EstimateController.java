package chn.bhmc.dms.ser.est.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.est.service.EstimateDetailService;
import chn.bhmc.dms.ser.est.service.EstimateService;
import chn.bhmc.dms.ser.est.vo.EstimateSaveVO;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;
import chn.bhmc.dms.ser.est.vo.EstimateVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class EstimateController extends HController{


    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="estimateService")
    EstimateService estimateService;

    @Resource(name="estimateDetailService")
    EstimateDetailService estimateDetailService;

    @Autowired
    RepairOrderService repairOrderService;

    @Autowired
    RateManageService rateManageService;

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
     * 견적 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/est/estimate/selectEstimateManageMain.do", method = RequestMethod.GET)
    public String selectEstimateManageMain(Model model
            ,@RequestParam(value="roDocNo", defaultValue="") String roDocNo
            ,@RequestParam(value="estDocNo", defaultValue="") String estDocNo
            ,@RequestParam(value="ltsModelCd", defaultValue="") String ltsModelCd
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo
            ,HttpServletRequest request) throws Exception {

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
        //견적상태코드
        model.addAttribute("estStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER400", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //부품수령상태
        model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 공통코드 : 블루멤버쉽등급
        model.addAttribute("bmMemberGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        //공통코드 : 고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        //고객전화표시여부
        model.addAttribute("custTelYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER065", null, langCd));
        //부품판매가격유형
        model.addAttribute("partPrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        //견적제로
        model.addAttribute("demicalPointCutCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER064", null, langCd));
        //임률코드 정보
        RateManageSearchVO searchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(searchVO));

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "ET");
        model.addAttribute("roDocNo", roDocNo);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("estDocNo", estDocNo);
        model.addAttribute("vinNo", vinNo);
        if(!StringUtil.nullConvert(ltsModelCd).equals(""))
        ltsModelCd = ltsModelCd.replaceAll("&#42;", "*");
        model.addAttribute("ltsModelCd", ltsModelCd);
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        model.addAttribute("vatCd", vatInfoVO.getVatApplyRate());

        return "/ser/est/estimate/selectEstimateManageMain";

    }

    /**
    *
    * 견적서 정보 조회
    *
    * @param searchVO - 견적서 정보 조회
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/ser/est/estimate/selectEstimateManageMains.do", method=RequestMethod.POST)
    @ResponseBody
    public EstimateVO selectEstimateManageMains(@RequestBody EstimateSearchVO searchVO)throws Exception{

        return estimateService.selectEstimateManageByKey(searchVO);
    }


    /**
    *
    * 견적서 항목 정보를 등록한다.
    *
    * @param saveVO - 견적서 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    @RequestMapping(value="/ser/est/estimate/mulitEstimates.do",method=RequestMethod.POST)
    @ResponseBody
    public String mulitEstimates(@Validated @RequestBody EstimateSaveVO saveVO)throws Exception{

        String estDocNo = estimateService.mulitEstimates(saveVO);

        return estDocNo;
    }

    /**
    *
    * 견적서 항목 정보를 취소한다.
    *
    * @param saveVO - 견적서 항목 취소 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    @RequestMapping(value="/ser/est/estimate/cancelEstimate.do",method=RequestMethod.POST)
    @ResponseBody
    public boolean cancelEstimate(@Validated @RequestBody EstimateVO estimateVO)throws Exception{

        estimateService.cancelEstimate(estimateVO);

        return true;
    }

    /**
     *
     * 견적서 출력시간 저장
     *
     * @param saveVO - 견적서 출력시간 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    @RequestMapping(value="/ser/est/estimate/updateEstimatePrint.do",method=RequestMethod.POST)
    @ResponseBody
    public boolean updateEstimatePrint(@Validated @RequestBody EstimateVO estimateVO)throws Exception{

        estimateService.updateEstimatePrint(estimateVO);

        return true;
    }

    /**
     * 견적디테일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 EstimateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/est/estimate/selectEstimateDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculateDetails(@RequestBody EstimateSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(estimateDetailService.selectEstimateDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(estimateDetailService.selectEstimateDetailsByCondition(searchVO));
        }

        return result;

     }

    /**
     *
     * 견적인쇄 팝업 화면 메인
     *
     * @param model
     * @return 견적인쇄 팝업 화면
     * @throws Exception
     */
    @RequestMapping(value="/ser/est/estimate/selectEstimatePrintPopup.do")
    public String selectEstimatePrintPopup(Model model)throws Exception{

        return "/ser/est/estimate/selectEstimatePrintPopup";

    }

    /**
     *
     * 견적취소 팝업 화면 메인
     *
     * @param model
     * @return 견적인쇄 팝업 화면
     * @throws Exception
     */
    @RequestMapping(value="/ser/est/estimate/selectEstimateCancelPopup.do")
    public String selectEstimateCancelPopup(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : 견적취소코드
        model.addAttribute("estCancelList", commonCodeService.selectCommonCodesByCmmGrpCd("SER401", null, langCd));

        return "/ser/est/estimate/selectEstimateCancelPopup";

    }
}
