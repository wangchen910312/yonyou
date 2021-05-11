package chn.bhmc.dms.ser.est.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.est.service.EstimateService;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateListController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Controller
public class EstimateListController extends HController{

    @Autowired
    EstimateService estimateService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Autowired
    CommonCodeService commonCodeService;

    @Autowired
    RateManageService rateManageService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @RequestMapping(value="/ser/est/estimate/selectEstimateListMain.do",method=RequestMethod.GET)
    public String selectEstimateListMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

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

        model.addAttribute("sToDt", sysDate);
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        //임률코드 정보
        RateManageSearchVO searchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(searchVO));

        model.addAttribute("preFixId", "ET");
        model.addAttribute("preFixTp", "ETSTATUS");
        LtsModelSearchVO ltsSearchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(ltsSearchVO));

        return "/ser/est/estimate/selectEstimateListMain";
    }

    /**
     *
     * 견적서 정보 리스트 조회
     *
     * @param searchVO - 견적서 정보 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/est/estimate/selectEstimateListMains.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectEstimateListMains(@RequestBody EstimateSearchVO searchVO)throws Exception{

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setTotal(estimateService.selectEstimateListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(estimateService.selectEstimateListByCondition(searchVO));
        }
        return result;
    }

    /**
     * 견적서 정보 리스트 건수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return
     */
    @RequestMapping(value="/ser/est/estimate/selectEstimateListCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectEstimateListCnt(@RequestBody EstimateSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(estimateService.selectEstimateListByConditionCnt(searchVO));
        return result;
    }

}
