package chn.bhmc.dms.ser.cal.web;

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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cal.service.CalculateService;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;

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

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 정산접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculateByKey.do",  method = RequestMethod.POST)
    public @ResponseBody CalculateVO selectRepairOrderByKey(@RequestBody CalculateSearchVO searchVO) throws Exception {

//        String dlrCd = LoginUtil.getDlrCd();
//        searchVO.setsDlrCd(dlrCd);

        CalculateVO resultVO = calculateService.selectCalculateByKey(searchVO);

        if(resultVO == null){
            resultVO = new CalculateVO();
        }
        return resultVO;
    }

    /**
     * 정산접수 현황  헤더 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cal/calculate/selectCalculatesList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectCalculatesList(@RequestBody CalculateSearchVO searchVO) throws Exception {

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
//        String dlrCd = LoginUtil.getDlrCd();
//        searchVO.setsDlrCd(dlrCd);
        SearchResult result = new SearchResult();
        result.setData(calculateService.selectCalculateAmtByCondition(searchVO));
        return result;
    }
}
