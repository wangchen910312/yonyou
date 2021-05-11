package chn.bhmc.dms.sal.dlv.web;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.dlv.service.ChargingPileService;
import chn.bhmc.dms.sal.dlv.service.ContDeliveryCancMngService;
import chn.bhmc.dms.sal.dlv.vo.ChargingPileVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySaveVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.ser.svi.service.BayManageService;



/**
 * 출고관리 - 출고취소
 *
 * @author Kim yewon
 * @since 2016.10.24
 * @version 1.0
* @see <pre> *  == 개정이력(Modification Information) ==
 *
 *     수정일                 수정자                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.10.24           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dlv/contDeliveryCanc")
public class ContDeliveryCancController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 고객인도 서비스
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;


    /**
     * Customer Information Management Service
     * CRM PAPRT
     */
    @Resource(name = "customerInfoService")
    CustomerInfoService customerInfoService;



    /**
     * 계약출고관리 서비스
     */
    @Resource(name="contDeliveryCancMngService")
    ContDeliveryCancMngService contDeliveryCancMngService;


    /**
     * 마감시간관리 관리 서비스
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;
    
    /**
     * 充电桩申请列表service
     */
    @Resource(name="chargingPileService")
    ChargingPileService chargingPileService;


    /**
     * 출고관리 - 출고취소관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContDeliveryCancMain.do", method = RequestMethod.GET)
    public String selectContDeliveryCancMain(Model model) throws Exception {

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String nowMonth = DateUtil.getDate("MM");
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String sysYyyyMm = (DateUtil.getDate("yyyyMMdd")).substring(0, 6);

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nowMonth", nowMonth);
        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("sysYyyyMm", sysYyyyMm);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());


        model.addAttribute("retlTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL130", null, langCd));
        //판매취소사유 공통코드 목록
        model.addAttribute("cancReasonCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL129", null, langCd));
        //심사여부 SAL189
        model.addAttribute("reqStatCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL189", null, langCd));


        return "/sal/dlv/contDeliveryCanc/selectContDeliveryCancMain";
    }





    /**
     * 출고관리 - 출고취소 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContDeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectContDeliveryCanc.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContDeliveryCanc(@RequestBody ContDeliverySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        result.setTotal(contDeliveryCancMngService.selectContDeliveryCancByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contDeliveryCancMngService.selectContDeliveryCancByCondition(searchVO));
        }

        return result;
    }




    /**
     * 고객출고
     * @param saveVO - 수정 목록을 포함하는 ConfirmWearingVehicleSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/contDeliveryCanc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean contDeliveryCanc(@Validated @RequestBody ContDeliverySaveVO saveVO) throws Exception {
        contDeliveryCancMngService.contDeliveryCanc(saveVO);
    	return true;
    }

    /**
     * 원샷통제여부
     */
    @RequestMapping(value = "/selectOneShotChkSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectASOrdRefOrdQtyChkSearch(@RequestBody ContDeliverySearchVO searchVO) throws Exception {

        DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();

        deadLineVO.setsCtrlGrpCd("Y");
        deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());
        deadLineVO.setsCtrlTargCd("Y01");

        return deadlineCtrlMngService.selectOneShotCheck(deadLineVO);
    }
    
    
    
    /**
     * 安装充电桩申请页面跳转
     * @return
     */
    @RequestMapping(value = "/selectChargingPileMain.do", method = RequestMethod.GET)
    public String selectChargingPileMain(Model model) throws Exception {

    	String langCd = LocaleContextHolder.getLocale().getLanguage();

    	 String sysDate = DateUtil.getDate("yyyy-MM-dd");
    	 //获得当月第一天
//         String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
         
         //获取前两月的第一天
         SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
         Calendar calLastMonthFirstDay=Calendar.getInstance();//获取当前日期 
         calLastMonthFirstDay.add(Calendar.MONTH, -2);//从当前日期向前加两个月
         calLastMonthFirstDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,该日期既为前两月第一天 
         String oneDay = format.format(calLastMonthFirstDay.getTime());//格式化日期为字符串
         
         model.addAttribute("toDay", sysDate);
         model.addAttribute("oneDay", oneDay); 
         model.addAttribute("sysDate", sysDate);
    	model.addAttribute("isNeed", commonCodeService.selectCommonCodesByCmmGrpCd("COM074", null, langCd));
		model.addAttribute("state", commonCodeService.selectCommonCodesByCmmGrpCd("COM075", null, langCd));
		model.addAttribute("carState", commonCodeService.selectCommonCodesByCmmGrpCd("COM084", null, langCd));
		model.addAttribute("status", commonCodeService.selectCommonCodesByCmmGrpCd("COM085", null, langCd));

        return "/sal/dlv/contDeliveryCanc/selectChargingPileMain";
    }
    
    
    /**
     * 安装充电桩申请列表查询
     * @return
     */
    @RequestMapping(value = "/selectChargingPileList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectChargingPileList(@RequestBody ChargingPileVO chargingPileVO) throws Exception {
    	chargingPileVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();
        List<ChargingPileVO> list = chargingPileService.selectChargingPileList(chargingPileVO);
        result.setData(list);
        result.setTotal(chargingPileService.selectChargingPileTotal(chargingPileVO));
        return result;
    }
    /*修改充电桩信息跳转*/
    @RequestMapping(value = "/updateChargingPileMain.do", method = RequestMethod.GET)
    public String updateChargingPileMain(Model model) throws Exception {
    	String langCd = LocaleContextHolder.getLocale().getLanguage();
    	//修改充电桩跳转查询当前信息回显
    	model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM074", null, langCd));
    	model.addAttribute("provinceList", commonCodeService.selectProvinceList());
    	model.addAttribute("cityList", commonCodeService.selectCityList());
    	model.addAttribute("areaList", commonCodeService.selectAreaList());
        return "/sal/dlv/contDeliveryCanc/updateChargingPileMain";
    }
    
    
    /**
     * 修改充电桩申请
     * @return
     */
    @RequestMapping(value = "/updateChargingPile.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateChargingPile(@RequestBody ChargingPileVO chargingPileVO) throws Exception {
        
    	chargingPileVO.setDlrCd(LoginUtil.getDlrCd());
    	chargingPileService.updateChargingPile(chargingPileVO);
        return "SUCCESS";
    }
}
