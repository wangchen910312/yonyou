package chn.bhmc.dms.ser.delivery.web;

import java.util.Calendar;
import java.util.Date;

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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.ro.service.WorkPauseService;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.TechManFnMasterService;
import chn.bhmc.dms.ser.svi.service.WorkGroupManageService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkPauseController.java
 * @Description : 작업중지 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class DeliveryCheckController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="workPauseService")
    WorkPauseService workPauseService;

    /**
     * 테크멘 기능관리 마스터 서비스
     */
    @Resource(name="techManFnMasterService")
    TechManFnMasterService techManFnMasterService;

    @Autowired
    WorkGroupManageService workGroupManageService;

    @Autowired
    BayManageService bayManageService;

    @Autowired
    ServicePartService servicePartService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 작업중지 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/deliveryCheck/selectDeliveryCheckMain.do", method = RequestMethod.GET)
    public String selectWorkPauseMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        Device device = DeviceUtils.getCurrentDevice(request);

        //isTablet
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
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
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));;
        // 공통코드 : 인도상태
        model.addAttribute("dlStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER057", null, langCd));
        //RO 완료여부
        model.addAttribute("roEndYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER990", null, langCd));

        model.addAttribute("sRoToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        return "/ser/deliveryCheck/selectDeliveryCheckMain";

    }

    /**
     * 인도체크 취소팝업 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/deliveryCheck/selectDeliveryCheckCancelPopup.do", method = RequestMethod.GET)
    public String selectDeliveryCheckCancelPopup(Model model) throws Exception {

        return "/ser/deliveryCheck/selectDeliveryCheckCancelPopup";
    }

    /**
     * 출고되지 않은 부품 확인
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/deliveryCheck/partGiQtyCheck.do",  method = RequestMethod.POST)
    public @ResponseBody boolean selectRepairOrders(@RequestBody TabInfoSearchVO searchVO) throws Exception {

        boolean result = servicePartService.partGiQtyCheck(searchVO);

        return result;

    }
}
