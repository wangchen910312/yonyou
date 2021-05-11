package chn.bhmc.dms.mob.ser.cal.web;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.cal.service.CalculateDetailService;
import chn.bhmc.dms.ser.cal.service.CalculateService;
import chn.bhmc.dms.ser.cal.vo.CalculateSaveVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobCalculateController.java
 * @Description : 정산 컨트롤러
 * @author JongHee Lim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobCalculateController extends HController {

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Autowired
    CalculateService calculateService;

    @Autowired
    CalculateDetailService calculateDetailService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 정산 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/cal/calculate/__selectCalculateMain.do", method = RequestMethod.GET)
    public String __selectBayManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //String sysDate = DateUtil.getDate("yyyy-MM-dd");

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        // RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));


        //model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        //model.addAttribute("sysDate", sysDate);
        model.addAttribute("preFixId", "CA");
        return "/mob/ser/cal/calculate/selectCalculateMain";

    }

    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateMain.do", method = RequestMethod.GET)
    public String selectBayManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //String sysDate = DateUtil.getDate("yyyy-MM-dd");

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        // RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        model.addAttribute("preFixId", "CA");

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/cal/calculate/baseJsp/selectCalculateMain.jsp");
        model.addAttribute("fromWhere", "selectCalculateMain");
        model.addAttribute("laborsTemplate", "subTemplate2");
        model.addAttribute("partsTemplate", "subTemplate3");

        return "/ZnewMob/templatesNewMob/mobTemplateA";

    }


    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateList.do", method = RequestMethod.GET)
    public String selectBayManageList(Model model) throws Exception {
        return "/mob/ser/cal/calculate/selectCalculateList";
    }

    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateSubList1.do", method = RequestMethod.GET)
    public String selectBayManageSubList1(Model model) throws Exception {
        return "/mob/ser/cal/calculate/selectCalculateSubList1";
    }

    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateSubList2.do", method = RequestMethod.GET)
    public String selectBayManageSubList2(Model model) throws Exception {
        return "/mob/ser/cal/calculate/selectCalculateSubList2";
    }

    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateSubList3.do", method = RequestMethod.GET)
    public String selectBayManageSubList3(Model model) throws Exception {
        return "/mob/ser/cal/calculate/selectCalculateSubList3";
    }

    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateSubList4.do", method = RequestMethod.GET)
    public String selectBayManageSubList4(Model model) throws Exception {
        return "/mob/ser/cal/calculate/selectCalculateSubList4";
    }





    /**
     * 정산을 등록/수정/취소한다.
     * @param saveVO - 정산 등록/수정/취소 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/ser/cal/calculate/multiCalculate.do", method = RequestMethod.POST)
    public @ResponseBody HashMap<String, String> multiCalculate(@Validated @RequestBody CalculateSaveVO calculateSaveVO, BindingResult bindingResult) throws Exception {

        HashMap<String, String> result = calculateService.multiCalculate(calculateSaveVO);

        return result;

    }

    /**
     * 정산접수 상세 데이터 존재여부 체크
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateExistByKey.do",  method = RequestMethod.POST)
    public @ResponseBody Boolean selectRepairOrderExistByKey(@RequestBody CalculateSearchVO searchVO) throws Exception {

        CalculateVO result = calculateService.selectCalculateByKey(searchVO);
        return result == null ? false : true;

     }

    /**
     * 정산접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateByKey.do",  method = RequestMethod.POST)
    public @ResponseBody CalculateVO selectRepairOrderByKey(@RequestBody CalculateSearchVO searchVO) throws Exception {

        return calculateService.selectCalculateByKey(searchVO);

     }

    /**
     * 정산디테일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/cal/calculate/selectCalculateDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculateDetails(@RequestBody CalculateSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(calculateDetailService.selectCalculateDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(calculateDetailService.selectCalculateDetailsByCondition(searchVO));
        }

        return result;

     }

}
