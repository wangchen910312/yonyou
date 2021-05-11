package chn.bhmc.dms.mob.api.repair.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.service.RepairCommonCodeService;
import chn.bhmc.dms.mob.api.repair.service.RepairLtsModelMappingService;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkProcessVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

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
@Api("维修-洗车管理")
@RequestMapping(value = "/api/repair/CarWashApi")
public class CarWashApi extends HController {

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
    
    
    @Autowired
    RepairLtsModelMappingService RepairLtsModelMappingService;

    @Autowired
    RepairCommonCodeService RepairCommonCodeService;

    /**
     * 세차관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/selectCarWashMain.do", method = RequestMethod.GET)
    @ApiOperation("洗车管理页面加载")
    @ResponseBody
    public BaseJSON selectCarWashMain(Model model) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        //진행상태
        model.addAttribute("progressStatList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER050", null, langCd));
        //세차상태
        model.addAttribute("carWashStatList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER051", null, langCd));
        //공통코드 : 세차취소코드
        model.addAttribute("carWashCancCdList", RepairCommonCodeService.selectCommonCodesByCmmGrpCd("SER058", null, langCd));
        model.addAttribute("sPreChkToDt", sysDate);
        model.addAttribute("sPreChkFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        baseJSON.setResult(model);
        baseJSON.setResultCode(0);
        return baseJSON;

    }

    /**
     * 세차관리 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/insertCarWash.do", method = RequestMethod.POST)
    @ApiOperation("洗车批量新增")
    @ResponseBody
    public BaseJSON insertProcesss(@Validated @RequestBody List<WorkProcessVO> list) throws Exception{
    	BaseJSON baseJSON = new BaseJSON();
    	workProcessService.insertWorkProcesss(list);
        baseJSON.setResult(true);
        baseJSON.setResultCode(0);
        return baseJSON;

    }

     /**
     * 세차관리 정보를 등록한다.
     * @param saveVO - 작업진도 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/insertCarWashs.do", method = RequestMethod.POST)
    @ApiOperation("洗车新增")
    @ResponseBody
    public BaseJSON insertProcesss(@Validated @RequestBody WorkProcessVO vo) throws Exception{
    	BaseJSON baseJSON = new BaseJSON();
        Map<String, String> result = new HashMap<String, String>();
        result.put("resultStat",workProcessService.insertWorkProcess(vo));
        baseJSON.setResult(result);
        baseJSON.setResultCode(0);
        return baseJSON;

    }

    /**
     * 세차관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/selectCarWashList.do",  method = RequestMethod.POST)
    @ApiOperation("洗车列表加载")
    @ResponseBody
    public BaseJSON selectCarWashList(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectCarWashListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectCarWashListByCondition(searchVO));
        }
        baseJSON.setResult(result);
        baseJSON.setResultCode(0);
        return baseJSON;

     }

    /**
     * 세차취소 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCarWashCancelPopup.do", method = RequestMethod.GET)
    @ApiOperation("取消洗车加载")
    @ResponseBody
    public BaseJSON selectReservationCancelPopup(Model model) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        // 공통코드 : 세차취소코드
        model.addAttribute("carWashCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER058", null, LocaleContextHolder.getLocale().getLanguage()));
        baseJSON.setResult(model);
        baseJSON.setResultCode(0);
        return baseJSON;
    }

}
