package chn.bhmc.dms.ser.kanban.web;

import javax.annotation.Resource;

import able.com.web.HController;

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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;

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
public class KanbanController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="repairOrderService")
    RepairOrderService repairOrderService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 작업진도관리 일반수리 칸반 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/kanban/selectWorkProcessKanbanMain.do", method = RequestMethod.GET)
    public String selectWorkProcessMain(Model model) throws Exception {

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
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);

        return "/ser/kanban/selectWorkProcessKanbanMain";
    }

    /**
     * 작업진도관리 페인트 상세 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/kanban/selectPaintStatKanbanMain.do", method = RequestMethod.GET)
    public String selectPaintStatKanbanMain(Model model) throws Exception {
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
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/kanban/selectPaintStatKanbanMain";

    }

    /**
     * 작업진도관리 페인트 칸반 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/kanban/selectPaintKanbanMain.do", method = RequestMethod.GET)
    public String selectPaintKanbanMain(Model model) throws Exception {

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
        // 공통코드 : 고객대기방식유형
        model.addAttribute("custWaitMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER032", null, langCd));
        // 공통코드 : 고품처리유형
        model.addAttribute("atqProcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER033", null, langCd));
        // 공통코드 : 차량세차유형
        model.addAttribute("carWashTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER034", null, langCd));
        // 공통코드 : 차량시승요청유형
        model.addAttribute("carDriveReqTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER035", null, langCd));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysDate", sysDate);
        return "/ser/kanban/selectPaintKanbanMain";

    }

    /**
     * 작업진도 칸반 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/kanban/selectWorkProcessKanbanList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectWorkProcessKanbanList(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setData(repairOrderService.selectWorkProcessKanban(searchVO));

        return result;

    }

    /**
     * 작업진도 칸반 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/kanban/selectPaintStatKanbanList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPaintStatKanbanList(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setData(repairOrderService.selectPaintKanban(searchVO));

        return result;

    }

    /**
     * 작업진도 품질 및 세처 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/kanban/selectCarWashKanbanList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCarWashKanbanList(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        SearchResult result = new SearchResult();
        result.setData(repairOrderService.selectCarWashKanban(searchVO));

        return result;

    }
}
