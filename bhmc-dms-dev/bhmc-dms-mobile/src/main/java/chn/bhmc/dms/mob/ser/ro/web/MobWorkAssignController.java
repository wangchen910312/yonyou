package chn.bhmc.dms.mob.ser.ro.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import chn.bhmc.dms.ser.ro.service.WorkAssignService;
import chn.bhmc.dms.ser.ro.vo.WorkAssignSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobWorkAssignController.java
 * @Description : RO작업배정현황
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
public class MobWorkAssignController extends HController {

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

    @Resource(name="workAssignService")
    WorkAssignService workAssignService;

    /**
     * 작업배정 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workAssign/__selectWorkAssignMain.do", method = RequestMethod.GET)
    public String __selectWorkAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String thirtyDtBf  = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("thirtyDtBf", thirtyDtBf);

       //RO유형
       model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
       //RO상태
       model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
       //품질검사
       model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
       //수리상태
       model.addAttribute("rpirStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
       // 공통코드 : 고객대기방식유형
       model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
       // 공통코드 : 고품처리유형
       model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
       // 공통코드 : 차량세차유형
       model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
       // 공통코드 : 차량시승요청유형
       model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

       //진행상태
       model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));

       // 공통코드 : 배정상태
       model.addAttribute("allocStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER043", null, langCd));

       return "/mob/ser/ro/workAssign/selectWorkAssignMain";

    }


    /**
     * 작업배정 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workAssign/selectWorkAssignMain.do", method = RequestMethod.GET)
    public String selectWorkAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String thirtyDtBf  = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("thirtyDtBf", thirtyDtBf);

       //RO유형
       model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
       //RO상태
       model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
       //품질검사
       model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
       //수리상태
       model.addAttribute("rpirStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
       // 공통코드 : 고객대기방식유형
       model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
       // 공통코드 : 고품처리유형
       model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
       // 공통코드 : 차량세차유형
       model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
       // 공통코드 : 차량시승요청유형
       model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
       //진행상태
       model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
       // 공통코드 : 배정상태
       model.addAttribute("allocStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER043", null, langCd));

       model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/ro/workAssign/baseJsp/selectWorkAssignMain.jsp");
       return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 작업배정 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workAssign/selectWorkAssignList.do", method = RequestMethod.GET)
    public String selectWorkAssignList(Model model) throws Exception {
       return "/mob/ser/ro/workAssign/selectWorkAssignList";

    }


    /**
     * 작업배정  - 정비내역 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workAssign/selectWorkAssignSubList.do", method = RequestMethod.GET)
    public String selectWorkAssignSubList(Model model) throws Exception {
       return "/mob/ser/ro/workAssign/selectWorkAssignSubList";

    }

    /**
     * 작업배정 리스트
     * @param
     * @return SearchResult
     */
    //@RequestMapping(value = "/mob/ser/ro/workAssign/selectWorkAssigns.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/ser/ro/workAssign/selectWorkAssignSubLists.do", method = RequestMethod.POST)

    @ResponseBody
    public SearchResult selectWorkAssigns(@RequestBody WorkAssignSearchVO searchVO) throws Exception {
        /*
        SearchResult result = new SearchResult();
        result.setTotal(workAssignService.selectWorkAssignByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(workAssignService.selectWorkAssignByCondition(searchVO));
        }
        return result;
        */

        SearchResult result = new SearchResult();
        List<WorkAssignVO> list = workAssignService.selectWorkAssignByCondition(searchVO);

        result.setData(list);
        result.setTotal(list.size());

        return result;

    }


}

