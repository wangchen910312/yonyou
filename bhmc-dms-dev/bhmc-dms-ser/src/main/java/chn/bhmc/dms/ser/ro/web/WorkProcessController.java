package chn.bhmc.dms.ser.ro.web;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSaveVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkProcessController.java
 * @Description : 작업진도관리 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class WorkProcessController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="workProcessService")
    WorkProcessService workProcessService;

    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 작업진도관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectWorkProcessMain.do", method = RequestMethod.GET)
    public String selectWorkProcessMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        Device device = DeviceUtils.getCurrentDevice(request);

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
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        model.addAttribute("sRoToDt", sysDate);
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

        return "/ser/ro/workProcess/selectWorkProcessMain";

    }

    /**
     * 작업진도관리 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectWorkProcessListMain.do", method = RequestMethod.GET)
    public String selectWorkProcessListMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        Device device = DeviceUtils.getCurrentDevice(request);

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //진행상태
        model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
        //페인트상태
        model.addAttribute("paintStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER053", null, langCd));

        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        // 사용여부
        model.addAttribute("useYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 품질검사
        model.addAttribute("qtTestMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));

        model.addAttribute("sRoToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

        return "/ser/ro/workProcess/selectWorkProcessListMain";
    }

    /**
     * 작업중지 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectPauseCausePopup.do", method = RequestMethod.GET)
    public String selectPauseCausePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //중지원인
        model.addAttribute("pauseStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER054", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        return "/ser/ro/workProcess/selectPauseCausePopup";

    }

    /**
     * 작업재개 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectWorkRestartPopup.do", method = RequestMethod.GET)
    public String selectWorkRestartPopup(Model model) throws Exception {

        return "/ser/ro/workProcess/selectWorkRestartPopup";

    }

    /**
     * 작업진도 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/workProcess/insertWorkProcesss.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertWorkProcesss(@RequestBody List<WorkProcessVO> list) throws Exception{
        workProcessService.insertWorkProcesss(list);
        return true;

    }

    /**
     * 작업진도 정보를 중지한다.
     * @param saveVO - 작업진도 중지 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/workProcess/updatePauseWorkProcesss.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updatePauseWorkProcess(@Validated @RequestBody WorkProcessSaveVO saveVO) throws Exception{

        workProcessService.updatePauseWorkProcess(saveVO);
        return true;

    }

     /**
     * 작업진도 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/workProcess/insertWorkProcess.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> insertWorkProcess(@Validated @RequestBody WorkProcessVO vo) throws Exception{
        Map<String, String> result = new HashMap<String, String>();
        result.put("resultStat",workProcessService.insertWorkProcess(vo));
        return result;

    }

    /**
     * 작업배정 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/ro/workProcess/selectWorkProcesss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorkAssigns(@RequestBody WorkProcessSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(workProcessService.selectWorkProcessByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(workProcessService.selectWorkProcessByCondition(searchVO));
        }

        return result;

    }

    /**
     * 서비스진척보드 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectWorkProcessBoard.do", method = RequestMethod.GET)
    public String selectWorkProcessBoard(Model model
            ,@RequestParam(value="dlrCd", defaultValue="") String dlrCd) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("dlrCd", dlrCd);

        return "/ser/ro/workProcess/selectWorkProcessBoard";

    }

    /**
     * 서비스진척보드 리스트를 가져온다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectWorkProcessBoardList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorkProcessBoardList(@RequestBody WorkProcessSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(workProcessService.selectWorkProcessBoardListByCondition(searchVO));
        return result;
    }
    
    /**
     * 服务进度看版 贾明 查询事件 SQL2020-6-28
     * @return
     */
    @RequestMapping(value="/ser/ro/workProcess/selectServiceProgressList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceProgressList(@RequestBody WorkProcessSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(workProcessService.selectServiceProgressListByCondition(searchVO));
        return result;
    }

    /**
     * 수리조작기록을 조회한다.
     * @return
     */
    @RequestMapping(value = "/ser/ro/workProcess/selectRpirHisReturns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRpirHisReturns(@RequestBody WorkProcessSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(workProcessService.selectRepairHistory(searchVO));

        return result;
    }
    
    /**
     * 查询工位是否维护了通道地址（粉丝平台使用）
     * @param bayNo
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/workProcess/selectFlagForExistChanel.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> selectFlagForExistChanel(@RequestBody String bayNo) throws Exception {
    	Map<String, String> result = new HashMap<String, String>();
    	result.put("flag", workProcessService.selectFlagForExistChanel(bayNo));
    	return result;
    }
}
