package chn.bhmc.dms.sal.orc.web;


import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orc.service.NotAssignedOrderService;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSaveVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderVO;
import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;



/**
 * 미배정 주문조회
 *
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.10         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orc/orderPlacement")
public class NotAssignedOrderController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 모델 패키지 서비스
     */
    @Resource(name="notAssignedOrderService")
    NotAssignedOrderService notAssignedOrderService;

    /**
     * BTO 주문조회 서비스
     */
    @Resource(name="btoSearchOrderService")
    BtoSearchOrderService btoSearchOrderService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 미배정오더조회 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectNotAssignedOrderMain.do", method = RequestMethod.GET)
    public String selectNotAssignedOrderMain(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, LocaleContextHolder.getLocale().getLanguage()));

        //담보유형
        model.addAttribute("mortgageTp", commonCodeService.selectCommonCodesByCmmGrpCd("SAL204", null, LocaleContextHolder.getLocale().getLanguage()));

        //주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //요청상태
        model.addAttribute("adjStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL226", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/orc/orderPlacement/selectNotAssignedOrderMain";
    }


    /**
     * 미배정 주문조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderVO
     * @return
     */
    @RequestMapping(value = "/selectNotAssignedOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotAssignedOrder(@RequestBody NotAssignedOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(notAssignedOrderService.selectNotAssignedOrderCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(notAssignedOrderService.selectNotAssignedOrder(searchVO));  //Result, Search
        }

        return result;
    }

    /**
     * 미배정 주문조회 합산금 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectNotAssignedOrderSum.do", method = RequestMethod.POST)
    @ResponseBody
    public NotAssignedOrderVO selectNotAssignedOrderSum(@RequestBody NotAssignedOrderSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return notAssignedOrderService.selectNotAssignedOrderSumSearch(searchVO);
    }

    @RequestMapping(value = "/updateNotAssignedOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStockStates(@RequestBody NotAssignedOrderSaveVO saveVO) throws Exception {
        notAssignedOrderService.updateNotAssignedOrder(saveVO);
        return true;
    }

    /**
     * 일괄변경 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectNotAssignedOrderPopup.do", method = RequestMethod.GET)
    public String selectStockStateAllChangePopup(Model model) throws Exception{

        //String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 담보유형 SAL204
        //model.addAttribute("mortgageTp", commonCodeService.selectCommonCodesByCmmGrpCd("SAL204", null, langCd));

        return "/sal/orc/orderPlacement/selectNotAssignedOrderPopup";
    }

    /**
     * 미배정 취소신청
     **/
    @RequestMapping(value = "/notAssignedOrderCancelAsk.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean notAssignedOrderCancelAsk(@RequestBody NotAssignedOrderSaveVO saveVO) throws Exception {
        for(NotAssignedOrderVO vo : saveVO.getInsertList()){
            vo.setAdjStatCd("A");       //취소신청
            notAssignedOrderService.orderCancelPlanChk(vo);
            notAssignedOrderService.notAssignedOrderCancelAsk(vo);
        }
        return true;
    }

    /**
     * 미배정 취소신청
     **/
    @RequestMapping(value = "/notAssignedOrderCancelRemove.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean notAssignedOrderCancelRemove(@RequestBody NotAssignedOrderSaveVO saveVO) throws Exception {
        for(NotAssignedOrderVO vo : saveVO.getInsertList()){
            vo.setAdjStatCd("C");       //취소신청 요청을 취소.
            notAssignedOrderService.orderCancelPlanChk(vo);
            notAssignedOrderService.notAssignedOrderCancelAsk(vo);
        }
        return true;
    }

    /**
     * 미배정 오더 취소내역 조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectNotAssignedOrderCancelMain.do", method = RequestMethod.GET)
    public String selectNotAssignedOrderCancelMain(Model model) throws Exception{

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);
        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, LocaleContextHolder.getLocale().getLanguage()));

        //주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //요청상태
        model.addAttribute("adjStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL226", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/orc/orderPlacement/selectNotAssignedOrderCancelMain";
    }

    /**
     * 미배정 주문 취소 내역목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotAssignedOrderVO
     * @return
     */
    @RequestMapping(value = "/selectNotAssignedOrderCancelInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotAssignedOrderCancelInfo(@RequestBody NotAssignedOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(notAssignedOrderService.selectNotAssignedOrderCancelSearchCnt(searchVO));  //Result, Row Count

        if(result.getTotal() != 0){
            result.setData(notAssignedOrderService.selectNotAssignedOrderCancelSearch(searchVO));  //Result, Search
        }

        return result;
    }



}