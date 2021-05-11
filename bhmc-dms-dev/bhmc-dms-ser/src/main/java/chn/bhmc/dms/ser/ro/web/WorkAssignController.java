package chn.bhmc.dms.ser.ro.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.WorkAssignService;
import chn.bhmc.dms.ser.ro.vo.WorkAssignSaveVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.TechManFnMasterService;
import chn.bhmc.dms.ser.svi.service.WorkGroupManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.WorkGroupManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkAssignController.java
 * @Description : 작업배정 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class WorkAssignController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="workAssignService")
    WorkAssignService workAssignService;

    /**
     * 테크멘 기능관리 마스터 서비스
     */
    @Resource(name="techManFnMasterService")
    TechManFnMasterService techManFnMasterService;

    @Autowired
    WorkGroupManageService workGroupManageService;

    @Autowired
    BayManageService bayManageService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 작업배정 메인 화면을 출력한다. //태블릿 분기 khs
     * @return
     */
    @RequestMapping(value="/ser/ro/workAssign/selectWorkAssignMain.do", method = RequestMethod.GET)
    public String selectWorkAssignMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        Device device = DeviceUtils.getCurrentDevice(request);
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 공통코드 : 배정상태
        model.addAttribute("allocStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER043", null, langCd));
        //수리상태
        model.addAttribute("rpirStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
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
        model.addAttribute("sRoToDt", sysDate);
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //if (device.isTablet()) {
       	if (device.isTablet()||device.isMobile()) {
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
           //진행상태
            //bay
           model.addAttribute("bayCdList", bayManageService.selectBayMastersByCondition(new BayManageSearchVO()));
           model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
           //return "/mob/waSer/ro/workAssign/selectWaWorkAssignMain";
           return "/ser/ro/workAssign/selectWorkAssignMain";
        }else{
            return "/ser/ro/workAssign/selectWorkAssignMain";
        }

    }

    /**
     * 작업배정 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/ro/workAssign/selectWorkAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorkAssigns(@RequestBody WorkAssignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(workAssignService.selectWorkAssignByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(workAssignService.selectWorkAssignByCondition(searchVO));
        }

        return result;

    }

    /**
     * 작업배정 정보를 등록한다.
     * @param saveVO - 작업배정 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/workAssign/insertWorkAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertWorkAssigns(@RequestBody WorkAssignSaveVO saveVO) throws Exception{
        workAssignService.multiWorkAssigns(saveVO);
        return true;

    }

    /**
     * 작업배정을 취소한다.
     * @param saveVO - 작업배정 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/workAssign/cancelWorkAssigns.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateWorkAssigns(@RequestBody List<WorkAssignVO> list) throws Exception{
        workAssignService.cancelWorkAssign(list);
        return true;

    }

     /**
     * 작업배정 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/ro/workAssign/selectWorkAssignPopup.do", method = RequestMethod.GET)
    public String selectWorkAssignPopup(Model model
            ,@RequestParam(value="planHm") double planHm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        //테크니션
        model.addAttribute("techManCdList", techManFnMasterService.selectTechManFnMasterByCondition(new TechManFnMasterSearchVO()));
        //소조
        model.addAttribute("workGrpCdList", workGroupManageService.selectWorkGroupMastersByCondition(new WorkGroupManageSearchVO()));
        //bay
        model.addAttribute("bayCdList", bayManageService.selectBayMastersByCondition(new BayManageSearchVO()));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //수리상태
        model.addAttribute("rpirStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        int calHm = (int)(60 * planHm);

        model.addAttribute("sysDate", DateUtil.getDate(dateFormat + " HH:mm:ss"));
        model.addAttribute("myDate", DateUtil.getDate(dateFormat + " HH:mm:ss", Calendar.MINUTE,calHm));
        model.addAttribute("planHm", planHm);

        return "/ser/ro/workAssign/selectWorkAssignPopup";
    }

}
