package chn.bhmc.dms.ser.ro.web;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkAssignService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : QtTestController.java
 * @Description : 품질검사관리 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 7. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 4.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class QtTestController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="workProcessService")
    WorkProcessService workProcessService;

    @Resource(name="workAssignService")
    WorkAssignService workAssignService;

    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 품질검사 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/qtTest/selectQtTestMain.do", method = RequestMethod.GET)
    public String selectWorkProcessMain(Model model
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

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
        //공통코드 : 품질검사
        model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 공통코드 : 리워크원인
        model.addAttribute("rwrkCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER055", null, langCd));

        model.addAttribute("sRoToDt", sysDate);
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat));

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("vinNo", vinNo);
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        return "/ser/ro/qtTest/selectQtTestMain";

    }


    /**
     * 리워크팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectReworkPopup.do", method = RequestMethod.GET)
    public String selectReworkPopup(Model model) throws Exception {
        //리워크리스트
        model.addAttribute("rwrkCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER055", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/ro/workProcess/selectReworkPopup";

    }



    /**
     * 품질검사 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/qtTest/insertQtTest.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertProcesss(@Validated @RequestBody List<WorkProcessVO> list) throws Exception{
        workProcessService.insertWorkProcesss(list);
        return true;

    }

    /**
     * REWORK 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/qtTest/insertRework.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertRework(@Validated @RequestBody WorkAssignVO vo) throws Exception{
        vo.setDlrCd(LoginUtil.getDlrCd());
        workAssignService.updateWorkAssign(vo);
        RepairOrderVO repairOrderVO = new RepairOrderVO();
        repairOrderVO.setDlrCd(LoginUtil.getDlrCd());
        repairOrderVO.setRoDocNo(vo.getRoDocNo());
        repairOrderVO.setRoGrpNo(vo.getRoGrpNo());
        repairOrderVO.setRwrkCd(vo.getRwrkCd());
        repairOrderVO.setRwrkRemark(vo.getRwrkRemark());
        repairOrderVO.setExpcDlDt(vo.getExpcDlDt());
        repairOrderService.updateRepairOrder(repairOrderVO);
        return true;

    }

     /**
     * 품질검사 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/qtTest/insertQtTests.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> insertProcesss(@Validated @RequestBody WorkProcessVO vo) throws Exception{
        Map<String, String> result = new HashMap<String, String>();
        result.put("resultStat",workProcessService.insertWorkProcess(vo));
        return result;

    }

}
