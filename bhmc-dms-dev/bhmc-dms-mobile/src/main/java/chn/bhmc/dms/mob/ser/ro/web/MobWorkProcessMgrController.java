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

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.ser.svi.service.LaborCodeManageService;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.vo.LaborCodeSearchVO;

import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;

import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;


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
public class MobWorkProcessMgrController extends HController {

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

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 공임 팝업 서비스
     */
    @Autowired
    LaborCodeManageService laborCodeManageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Resource(name="workProcessService")
    WorkProcessService workProcessService;


    /**
     * 진행관리현황 메인
     */
    @RequestMapping(value="/mob/ser/ro/workProcess/__selectWorkProcessMgrMain.do", method = RequestMethod.GET)
    public String __selectWorkProcessMgrMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //진행상태
        model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
        //세차상태
        model.addAttribute("carWashStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));
        //품질검사상태
        model.addAttribute("qtTestStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER052", null, langCd));
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
        // 공통코드 : 사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //공통코드 : 품질검사
        model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

        return "/mob/ser/ro/workProcess/selectWorkProcessMgrMain";
    }

    /**
     * 진행관리현황 메인
     */
    @RequestMapping(value="/mob/ser/ro/workProcess/selectWorkProcessMgrMain.do", method = RequestMethod.GET)
    public String selectWorkProcessMgrMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //진행상태
        model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
        //세차상태
        model.addAttribute("carWashStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));
        //품질검사상태
        model.addAttribute("qtTestStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER052", null, langCd));
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
        // 공통코드 : 사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //공통코드 : 품질검사
        model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/ro/workProcess/baseJsp/selectWorkProcessMgrMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 진행관리현황 목록
     */
    @RequestMapping(value="/mob/ser/ro/workProcess/selectWorkProcessMgrList.do", method = RequestMethod.GET)
    public String selectWorkProcessMgrList(Model model) throws Exception {
       return "/mob/ser/ro/workProcess/selectWorkProcessMgrList";
    }


    /**
     * 정비내역 목록
     */
    @RequestMapping(value="/mob/ser/ro/workProcess/selectWorkProcessMgrSubList.do", method = RequestMethod.GET)
    public String selectWorkProcessSubMgrList(Model model) throws Exception {
       return "/mob/ser/ro/workProcess/selectWorkProcessMgrSubList";
    }


    /**
     * 정비중지를 클릭시 팝업을 띄운다
     * @return
     */
    @RequestMapping(value = "/mob/ser/ro/workProcess/selectPauseCausePopup.do", method = RequestMethod.GET)
    public String selectPauseCausePopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //중지원인
        model.addAttribute("pauseStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER054", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        // 구분코드
        model.addAttribute("distTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER950", null, langCd));

        //브랜드 목록
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelList", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/ser/ro/workProcess/baseJsp/selectPauseCausePopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }


    /**
    *
    * 정비진도 (정비중지) 이동경로
    *
    * @param model
    * @return 공임코드 목록 데이터
    * @throws Exception
    */


    @RequestMapping(value = "/mob/ser/ro/workProcess/selectLaborCodePopups.do", method = RequestMethod.GET)
    public String selectLaborCodePopups(Model model) throws Exception {
        return "/mob/ser/ro/workProcess/selectLaborCodePopup";
    }

    @RequestMapping(value = "/mob/ser/ro/workProcess/selectPauseCausePopupList.do", method = RequestMethod.GET)
    public String selectPauseCausePopupList(Model model) throws Exception {
        return "/mob/ser/ro/workProcess/selectPauseCausePopupList";
    }


}