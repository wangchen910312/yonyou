package chn.bhmc.dms.ser.res.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.res.service.RescueService;
import chn.bhmc.dms.ser.res.vo.RescueSaveVO;
import chn.bhmc.dms.ser.res.vo.RescueSearchVO;
import chn.bhmc.dms.ser.res.vo.RescueVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RescueController.java
 * @Description : 구원서비스 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class RescueController extends HController {
    /**
     * 구원서비스 서비스
     */
    @Autowired
    RescueService rescueService;

    /**
     * BAY관리 마스터 서비스
     */
    @Autowired
    BayManageService bayManageService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
     * 임률코드 마스터 서비스
     */
    @Autowired
    RateManageService rateManageService;

    /**
     * 서비스운영 마스터 서비스
     */
    @Autowired
    ServiceSettingService serviceSettingService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 구원서비스 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/res/rescue/selectRescueMain.do", method = RequestMethod.GET)
    public String selectRescueMain(Model model
            ,@RequestParam(value="rescDocNo", defaultValue="") String rescDocNo
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo
                                    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 구원방식
        model.addAttribute("rescMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER110", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
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
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //부품수령상태
        model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
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
        //임률코드 정보
        RateManageSearchVO searchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(searchVO));
        // 서비스운영관리 정보(칸반)
        ServiceSettingSearchVO serSetSearchVO = new ServiceSettingSearchVO();
        model.addAttribute("serSetInfo", serviceSettingService.selectServiceSettingByKey(serSetSearchVO));

        model.addAttribute("rescDocNo",  rescDocNo );
        model.addAttribute("vinNo",  vinNo);


        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "RES");

        return "/ser/res/rescue/selectRescueMain";

    }

    /**
     * 구원서비스 리스트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/res/rescue/selectRescueListMain.do", method = RequestMethod.GET)
    public String selectRescueListMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 구원방식유형
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER110", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
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
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));

        model.addAttribute("preFixId", "RES");

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/ser/res/rescue/selectRescueListMain";

    }

    /**
     * 구원서비스 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return
     */
    @RequestMapping(value="/ser/res/rescue/selectRescueByKey.do",  method = RequestMethod.POST)
    public @ResponseBody RescueVO selectRescueByKey(@RequestBody RescueSearchVO searchVO) throws Exception {
        RescueVO vo = rescueService.selectRescueByKey(searchVO);
        return vo;

     }


    /**
     * 예약,부품,공임을 등록/수정/취소한다.
     * @param saveVO - 구원서비스 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/res/rescue/multiRescue.do", method = RequestMethod.POST)
    public @ResponseBody String multiRescue(@RequestBody RescueSaveVO rescueSaveVO) throws Exception {
        String resvDocNo = rescueService.multiRescue(rescueSaveVO);

        return resvDocNo;

    }

    /**
     * 구원서비스 헤더 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return
     */
    @RequestMapping(value="/ser/res/rescue/selectRescues.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRescues(@RequestBody RescueSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(rescueService.selectRescueByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(rescueService.selectRescueByCondition(searchVO));
        }

        return result;

    }

    /**
     * 구원서비스 헤더현황 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return
     */
    @RequestMapping(value="/ser/res/rescue/selectRescuesList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRescuesList(@RequestBody RescueSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();

        result.setTotal(rescueService.selectRescueListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(rescueService.selectRescueListByCondition(searchVO));
        }

        return result;

    }

    /**
     * 구원서비스 취소 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/res/rescue/selectRescueCancelPopup.do", method = RequestMethod.GET)
    public String selectReservationCancelPopup(Model model) throws Exception {

        // 공통코드 : 예약구분
        model.addAttribute("resvCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER014", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/res/rescue/selectRescueCancelPopup";
    }

     /**
     * 예약을 등록/수정/취소한다.
     * @param saveVO - 예약접수 등록/수정/취소 목록을 포함하는 ReservationReceiptVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/res/rescue/updateRescue.do", method = RequestMethod.POST)
    public @ResponseBody String updateReservationReceipt(@RequestBody RescueVO rescueVO) throws Exception {

        rescueService.updateRescue(rescueVO);

        return "OK";

    }


}