package chn.bhmc.dms.ser.ro.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.ro.service.WorkPauseService;
import chn.bhmc.dms.ser.ro.vo.WorkPauseSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkPauseVO;
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
public class WorkPauseController extends HController {


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

    /**
     * 작업중지 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/workPause/selectWorkPauseMain.do", method = RequestMethod.GET)
    public String selectWorkPauseMain(Model model
            ,@RequestParam(value="wrkEndDt") Date wrkEndDt) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //RO상태
        model.addAttribute("roStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //품질검사
        model.addAttribute("qtTestList", commonCodeService.selectCommonCodesByCmmGrpCd("SER040", null, langCd));
        //수리상태
        model.addAttribute("rpirStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        // 공통코드 : 페인트색상조정
        model.addAttribute("paintColorCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER041", null, langCd));
        // 공통코드 : 페인트유형
        model.addAttribute("paintTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER042", null, langCd));

        return "/ser/ro/workPause/selectWorkPauseMain";

    }

    /**
     * 작업중지 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/ro/workPause/selectWorkPauses.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorkPauses(@RequestBody WorkPauseSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(workPauseService.selectWorkPauseByCondition(searchVO));

        return result;

    }

    /**
     * 작업중지 이력 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/ro/workPause/selectWorkPauseHist.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorkPauseHist(@RequestBody WorkPauseSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(workPauseService.selectWorkPauseHistByCondition(searchVO));

        return result;

    }

    /**
     * 작업중지 정보를 등록한다.
     * @param saveVO - 작업중지 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/workPause/insertWorkPauses.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertWorkPauses(@RequestBody List<WorkPauseVO> list) throws Exception{
        workPauseService.insertWorkPauses(list);
        return true;

    }

     /**
     * 작업중지 정보를 삭제한다.
     * @param saveVO - 작업중지 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/workPause/deleteWorkPauses.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteWorkPauses(@Validated @RequestBody List<WorkPauseVO> list) throws Exception{
        //workPauseService.deleteWorkPauses(list);
        return true;

    }

     /**
     * 작업중지 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/ro/workPause/selectWorkPausePopup.do", method = RequestMethod.GET)
    public String selectWorkPausePopup(Model model) throws Exception {

        //테크니션
        model.addAttribute("techManCdList", techManFnMasterService.selectTechManFnMasterByCondition(new TechManFnMasterSearchVO()));
        //소조
        model.addAttribute("workGrpCdList", workGroupManageService.selectWorkGroupMastersByCondition(new WorkGroupManageSearchVO()));
        //bay
        model.addAttribute("bayCdList", bayManageService.selectBayMastersByCondition(new BayManageSearchVO()));

        return "/ser/ro/workPause/selectWorkPausePopup";
    }

}
