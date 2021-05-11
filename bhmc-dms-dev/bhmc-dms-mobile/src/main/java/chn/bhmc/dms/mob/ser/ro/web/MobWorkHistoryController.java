package chn.bhmc.dms.mob.ser.ro.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkAssignService;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobWorkHistoryController.java
 * @Description : RO작업이력 현황
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
public class MobWorkHistoryController extends HController {

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
     * RO작업이력 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workHistory/__selectWorkHistoryMain.do", method = RequestMethod.GET)
    public String __selectWorkHistoryMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

       //RO유형
       model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
       //RO상태
       model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
       //품질검사
       model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
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

       model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

     //부품수령상태
       model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));

       return "/mob/ser/ro/workHistory/selectWorkHistoryMain";

    }

    @RequestMapping(value="/mob/ser/ro/workHistory/selectWorkHistoryMain.do", method = RequestMethod.GET)
    public String selectWorkHistoryMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

       //RO유형
       model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
       //RO상태
       model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
       //품질검사
       model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
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

       model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

     //부품수령상태
       model.addAttribute("partRcvCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER037", null, langCd));

       model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/ro/workHistory/baseJsp/selectWorkHistoryMain.jsp");
       model.addAttribute("fromWhere", "selectWorkHistoryMain");
       model.addAttribute("laborsTemplate", "subTemplate2-a");
       model.addAttribute("partsTemplate", "subTemplate3-b");

       return "/ZnewMob/templatesNewMob/mobTemplateA";

    }

    /**
     * RO작업이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workHistory/selectWorkHistoryList.do", method = RequestMethod.GET)
    public String selectWorkHistoryList(Model model) throws Exception {
       return "/mob/ser/ro/workHistory/selectWorkHistoryList";
    }


    /**
     * RO작업이력 부품정보 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workHistory/selectWorkHistoryItemList.do", method = RequestMethod.GET)
    public String selectWorkHistoryItemList(Model model) throws Exception {
       return "/mob/ser/ro/workHistory/selectWorkHistoryItemList";
    }

    /**
     * RO작업이력 작업정보 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/workHistory/selectWorkHistoryWorkList.do", method = RequestMethod.GET)
    public String selectWorkHistoryWorkList(Model model) throws Exception {
       return "/mob/ser/ro/workHistory/selectWorkHistoryWorkList";
    }

}
