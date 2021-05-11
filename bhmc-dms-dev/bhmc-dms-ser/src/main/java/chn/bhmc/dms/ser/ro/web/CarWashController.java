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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarWashController.java
 * @Description : 세차관리 컨트롤러
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
public class CarWashController extends HController {

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
     * 세차관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/carWash/selectCarWashMain.do", method = RequestMethod.GET)
    public String selectQtTestMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //진행상태
        model.addAttribute("progressStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
        //세차상태
        model.addAttribute("carWashStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));
        //공통코드 : 세차취소코드
        model.addAttribute("carWashCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER058", null, langCd));
        model.addAttribute("sPreChkToDt", sysDate);
        model.addAttribute("sPreChkFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        return "/ser/ro/carWash/selectCarWashMain";

    }

    /**
     * 세차관리 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/carWash/insertCarWash.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertProcesss(@Validated @RequestBody List<WorkProcessVO> list) throws Exception{
        workProcessService.insertWorkProcesss(list);
        return true;

    }

     /**
     * 세차관리 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/ro/carWash/insertCarWashs.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> insertProcesss(@Validated @RequestBody WorkProcessVO vo) throws Exception{
        Map<String, String> result = new HashMap<String, String>();
        result.put("resultStat",workProcessService.insertWorkProcess(vo));
        return result;

    }

    /**
     * 세차관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/carWash/selectCarWashList.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectCarWashListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectCarWashListByCondition(searchVO));
        }

        return result;

     }

    /**
     * 세차취소 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/ro/carWash/selectCarWashCancelPopup.do", method = RequestMethod.GET)
    public String selectReservationCancelPopup(Model model) throws Exception {

        // 공통코드 : 세차취소코드
        model.addAttribute("carWashCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER058", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/ro/carWash/selectCarWashCancelPopup";
    }

}
