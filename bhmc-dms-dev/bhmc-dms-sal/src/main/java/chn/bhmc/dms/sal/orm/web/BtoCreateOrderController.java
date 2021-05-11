package chn.bhmc.dms.sal.orm.web;


import java.util.Calendar;
import java.util.Date;

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

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSaveVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderVO;
import chn.bhmc.dms.sal.trm.service.FundStatusService;
import chn.bhmc.dms.sal.trm.vo.FundStatusSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 * BTO 주문생성(C.R.U.D)
 *
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orm/btoCreateOrder")
public class BtoCreateOrderController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * BTO 서비스
     */
    @Resource(name="btoCreateOrderService")
    BtoCreateOrderService btoCreateOrderService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 자금현황 서비스
     */
    @Resource(name="fundStatusService")
    FundStatusService fundStatusService;

    /**
     * 판매고문 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;


    /**
     * Bto Create Order Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectBtoCreateOrderMain.do", method = RequestMethod.GET)
    public String selectBtoCreateOrderMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //String sysDate = DateUtil.getDate("yyyy-MM-dd");
        //String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");

        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), systemConfigInfoService.selectStrValueByKey("dateFormat"));

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));

        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoCreateOrderService.selectWeekRemark(searchVO));

        //지불방식
        model.addAttribute("paymentCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL140", null, langCd));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //상태
        model.addAttribute("ordStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));

        //판매고문
        //model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        model.addAttribute("saleEmpDSInfo", crmCommonService.selectMngScIdListByCondition());

        //인터페이스상태
        model.addAttribute("interfaceStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL186", null, langCd));

        return "/sal/orm/btoCreateOrder/btoCreateOrderMain";
    }

    /**
     * 전략오더를 제외한 모든 오더 OCN조회
     */
    @RequestMapping(value = "/selectBtoOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoOcn(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception{

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(btoCreateOrderService.selectBtoOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoCreateOrderService.selectBtoOcnListsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 전략오더 OCN조회
     */
    @RequestMapping(value = "/selectStrOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStrOcn(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception{
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(btoCreateOrderService.selectStrOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoCreateOrderService.selectStrOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/selectBtoExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoExtColor(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(btoCreateOrderService.selectBtoExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoCreateOrderService.selectBtoExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectBtoIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoIntColor(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(btoCreateOrderService.selectBtoIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoCreateOrderService.selectBtoIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 주문주차 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOrdWeekRemark.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrdWeekRemark(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(btoCreateOrderService.selectWeekRemark(searchVO));
        return result;
    }

    /**
     * 납기예시일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPfpExamDt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPfpExamDt(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(btoCreateOrderService.selectPfpExamDt(searchVO));
        return result;
    }

    /**
     * 참조수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOrdRefQty.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRefOrdQty(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(btoCreateOrderService.selectRefOrdQty(searchVO));
        return result;
    }

    /**
     * 주문등급 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectOrdGradeCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrdGradeCd(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(btoCreateOrderService.selectOrdGradeCd(searchVO));
        return result;
    }

    /**
     * Financial Products Management 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBtoCreateOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoCreateOrder(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(btoCreateOrderService.selectBtoCreateOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            int totalCnt = (int)result.getTotal();

            searchVO.setsTotalCnt(totalCnt);

            result.setData(btoCreateOrderService.selectBtoCreateOrderByCondition(searchVO));
        }

        return result;
    }

    /**
     * 주문 우선순위 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderVO
     * @return
     */
    @RequestMapping(value = "/selectOrdProrCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOrdProrCd(@RequestBody BtoCreateOrderVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(btoCreateOrderService.selectOrdProrCd(searchVO));
        return result;
    }

    /**
     * BTO 주문을 삭제 한다.
     * @param saveVO - 삭제 목록을 포함하는 VehicleSettlementOrderSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/deleteBtoCreateOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteBtoCreateOrder(@Validated @RequestBody BtoCreateOrderSaveVO saveVO) throws Exception {
        btoCreateOrderService.delBtoCreateOrder(saveVO);

        return true;
    }

    /**
     * BTO 주문을 등록 및 수정 한다.
     * @param saveVO - 등록/수정 목록을 포함하는 BtoCreateOrderSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/saveBtoCreateOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveBtoCreateOrder(@Validated @RequestBody BtoCreateOrderSaveVO saveVO) throws Exception {
        btoCreateOrderService.saveBtoCreateOrder(saveVO);
        return true;
    }

    /**
     * Bto Create Order Popup 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectBtoCreateOrderPopup.do", method = RequestMethod.GET)
    public String selectBtoCreateOrderPopup(Model model) throws Exception {

        //하치장
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/orm/btoCreateOrder/btoCreateOrderPopup";
    }

    /**
     * 주문금액 팝업을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBtoCreateOrderAmtPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoCreateOrderAmtPopup(@RequestBody BtoCreateOrderVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(btoCreateOrderService.selectBtoCreateOrderAmtPopup(searchVO));
        return result;
    }

    /**
     * 주문금액 확인
     */
    @RequestMapping(value = "/selectBtoCreateOrderPreAmtSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBtoCreateOrderPreAmtSearch() throws Exception {

        // 자금현황의 EAI 호출. : 현재일기준 데이터
        FundStatusSearchVO searchVO = new FundStatusSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsYy( DateUtil.getDate("yyyy") );
        searchVO.setsMm( DateUtil.getDate("MM") );

        SearchResult result = new SearchResult();
        result.setData(fundStatusService.selectNowDayFundStatusEaiSearch(searchVO));
        return result;
    }

    /**
     * 주문유형 : 전략오더 일경우 참고수량 조회
     */
    @RequestMapping(value = "/selectASOrdRefOrdQtyChkSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectASOrdRefOrdQtyChkSearch(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderService.selectASOrdRefOrdQtyChkSearch(searchVO);
    }

    /**
     * 전략오더 차관조회 차관적용 버젼 N1
     */
    @RequestMapping(value = "/selectStrN1BlockModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlockNewCarLooksModelListByCondition(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception{
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();

        result.setData(btoCreateOrderService.selectBlockNewCarLooksModelListByCondition(searchVO));

        return result;
    }

    /**
     * 전략오더 OCN조회 차관적용 버젼 N1
     */
    @RequestMapping(value = "/selectStrN1BlockOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectN1BlockNewCarLooksOcnListByCondition(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception{
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();

        result.setData(btoCreateOrderService.selectN1BlockNewCarLooksOcnListByCondition(searchVO));

        return result;
    }

    /**
     * 전략오더 OCN조회 차관적용 버젼 AD
     */
    @RequestMapping(value = "/selectStrADBlockOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectADBlockNewCarLooksOcnListByCondition(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception{
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();

        result.setData(btoCreateOrderService.selectADBlockNewCarLooksOcnListByCondition(searchVO));

        return result;
    }
}
