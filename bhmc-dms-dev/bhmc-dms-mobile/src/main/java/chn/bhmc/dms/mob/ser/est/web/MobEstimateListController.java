package chn.bhmc.dms.mob.ser.est.web;

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
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.est.service.EstimateService;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobEstimateListController.java
 * @Description : 견적현황 Controller
 * @author JongHee Lim
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     JongHee Lim     최초 생성
 * </pre>
 */
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobEstimateListController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author JongHee Lim
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobEstimateListController extends HController {

    @Autowired
    EstimateService estimateService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 견적현황 메인
     */
    @RequestMapping(value="/mob/ser/est/estimate/__selectEstimateListMain.do", method=RequestMethod.GET)
    public String __selectEstimateListMain(Model model)throws Exception{

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        String oneMonthDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("oneMonthDtBf",       oneMonthDtBf);


        model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //견적상태코드
        model.addAttribute("estStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER400", null, langCd));

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        return "/mob/ser/est/estimate/selectEstimateListMain";
    }

    @RequestMapping(value="/mob/ser/est/estimate/selectEstimateListMain.do", method=RequestMethod.GET)
    public String selectEstimateListMain(Model model)throws Exception{

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat);
        String oneMonthDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("oneMonthDtBf",       oneMonthDtBf);


        model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), "yyyy-MM-dd") );

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //견적상태코드
        model.addAttribute("estStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER400", null, langCd));

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/est/estimate/baseJsp/selectEstimateListMain.jsp");
        model.addAttribute("fromWhere", "selectEstimateListMain");
        model.addAttribute("laborsTemplate", "subTemplate2");
        model.addAttribute("partsTemplate", "subTemplate3");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }



    /**
     * 견적현황 목록
     */
    @RequestMapping(value="/mob/ser/est/estimate/selectEstimateListList.do",method=RequestMethod.GET)
    public String selectEstimateListList(Model model)throws Exception{
        return "/mob/ser/est/estimate/selectEstimateListList";
    }

    /**
     *
     * 견적현황 목록 [조회]
     */
    @RequestMapping(value="/mob/ser/est/estimate/selectEstimateListLists.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectEstimateListMains(@RequestBody EstimateSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(estimateService.selectEstimateListByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;
    }


    /**
     * 견적서 공임 목록
     */
    @RequestMapping(value="/mob/ser/est/estimate/selectEstimateListWorkList.do",method=RequestMethod.GET)
    public String selectEstimateListWorkList(Model model)throws Exception{
        return "/mob/ser/est/estimate/selectEstimateListWorkList";
    }

    /**
     * 견적서 부품 목록
     */
    @RequestMapping(value="/mob/ser/est/estimate/selectEstimateListItemList.do",method=RequestMethod.GET)
    public String selectEstimateListItemList(Model model)throws Exception{
        return "/mob/ser/est/estimate/selectEstimateListItemList";
    }

}
