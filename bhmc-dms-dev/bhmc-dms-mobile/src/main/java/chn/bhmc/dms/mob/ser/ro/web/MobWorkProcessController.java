package chn.bhmc.dms.mob.ser.ro.web;

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
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobWorkProcessController.java
 * @Description : 진행관리현황
 * @author JongHee Lim
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobWorkProcessController extends HController {

    /**
     * RO접수 서비스
     */
    @Autowired
    RepairOrderService repairOrderService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Resource(name="workProcessService")
    WorkProcessService workProcessService;


    /**
     * 진행관리현황 메인
     */
    @RequestMapping(value="/mob/ser/ro/workProcess/__selectWorkProcessMain.do", method = RequestMethod.GET)
    public String __selectWorkProcessMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String oneMonthDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("oneMonthDtBf",       oneMonthDtBf);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //진행상태
        model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
        //세차상태
        model.addAttribute("carWashStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));
        //공통코드 : 품질검사
        model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
        //model.addAttribute("qtTestStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER052", null, langCd));
        //페인트상태
        model.addAttribute("paintStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER053", null, langCd));
        //수리상태
        model.addAttribute("rpirStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //중지원인
        model.addAttribute("pauseStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER054", null, langCd));
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

       return "/mob/ser/ro/workProcess/selectWorkProcessMain";

    }

    @RequestMapping(value="/mob/ser/ro/workProcess/selectWorkProcessMain.do", method = RequestMethod.GET)
    public String selectWorkProcessMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String oneMonthDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("oneMonthDtBf",       oneMonthDtBf);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //진행상태
        model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
        //세차상태
        model.addAttribute("carWashStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));
        //공통코드 : 품질검사
        model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
        //페인트상태
        model.addAttribute("paintStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER053", null, langCd));
        //수리상태
        model.addAttribute("rpirStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //중지원인
        model.addAttribute("pauseStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER054", null, langCd));
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/ro/workProcess/baseJsp/selectWorkProcessMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";

    }

    /**
     * 진행관리현황 목록
     */
    @RequestMapping(value="/mob/ser/ro/workProcess/selectWorkProcessList.do", method = RequestMethod.GET)
    public String selectWorkProcessList(Model model) throws Exception {
       return "/mob/ser/ro/workProcess/selectWorkProcessList";

    }


    /**
     * 정비내역 목록
     */
    @RequestMapping(value="/mob/ser/ro/workProcess/selectWorkProcessSubList.do", method = RequestMethod.GET)
    public String selectWorkProcessSubList(Model model) throws Exception {
       return "/mob/ser/ro/workProcess/selectWorkProcessSubList";

    }

    /**
     * 정비내역 목록 [조회]
     */
    //@RequestMapping(value = "/mob/ser/ro/workProcess/selectWorkProcesss.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/ser/ro/workProcess/selectWorkProcessSubLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorkProcesss(@RequestBody WorkProcessSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(workProcessService.selectWorkProcessByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(workProcessService.selectWorkProcessByCondition(searchVO));
        }

        return result;

    }





}
