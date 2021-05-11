package chn.bhmc.dms.mob.ser.ro.web;

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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkAssignService;
import chn.bhmc.dms.ser.ro.vo.WorkAssignSaveVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobWaWorkAssignController.java
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
public class MobWaWorkAssignController extends HController {

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





    @RequestMapping(value="/mob/waSer/ro/workAssign/selectWaWorkAssignMain.do", method = RequestMethod.GET)
    public String selectWaWorkAssignMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //String sysDate     = DateUtil.getDate(dateFormat);
        //String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        //model.addAttribute("toDt",            sysDate);
        //model.addAttribute("sevenDtBf",       sevenDtBf);

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

       return "/mob/waSer/ro/workAssign/selectWaWorkAssignMain";

    }




    /**
     * 작업배정 정보를 등록한다.
     * @param saveVO - 작업배정 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/waSer/ro/workAssign/insertWorkAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    //public boolean insertWorkAssigns(@Validated @RequestBody MobWorkAssignSaveVO saveVO) throws Exception{
    public boolean insertWorkAssigns(@RequestBody WorkAssignSaveVO saveVO) throws Exception{
        workAssignService.multiWorkAssigns(saveVO);
        return true;
    }

    @RequestMapping(value="/mob/waSer/ro/workAssign/selectWaWorkAssignRoDetailPopup.do", method = RequestMethod.GET)
    public String selectWaWorkAssignRoDetailPopup(Model model) throws Exception {
        // 공통코드 : 배정상태
        model.addAttribute("allocStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER043", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/mob/waSer/ro/workAssign/selectWaWorkAssignRoDetailPopup";
    }


    @RequestMapping(value = "/mob/waSer/ro/workAssign/deleteWorkAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteWorkAssign(@RequestBody WorkAssignVO vo) throws Exception{
        workAssignService.deleteWorkAssign(vo);
        return true;

    }

}

