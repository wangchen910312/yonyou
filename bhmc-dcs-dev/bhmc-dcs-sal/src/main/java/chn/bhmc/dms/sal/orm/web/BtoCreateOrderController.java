package chn.bhmc.dms.sal.orm.web;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSaveVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

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
     * Bto Create Order Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectBtoCreateOrderMain.do", method = RequestMethod.GET)
    public String selectBtoCreateOrderMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));

        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoCreateOrderService.selectWeekRemark(searchVO));

        //지불방식
        model.addAttribute("paymentCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL140", null, langCd));

        //운송딜러
        CommonCodeVO cmmCdVO = new CommonCodeVO();
        cmmCdVO.setCmmCd(LoginUtil.getUserId());
        cmmCdVO.setCmmCdNm(LoginUtil.getUserNm());

        ArrayList<CommonCodeVO> arrList = new ArrayList<CommonCodeVO>();
        arrList.add(cmmCdVO);
        List<CommonCodeVO> list = arrList;
        model.addAttribute("trsfDlrCdInfo", list);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //상태
        model.addAttribute("ordStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));

        model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        // 판매고문
        model.addAttribute("salesRgstDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));

        //인터페이스상태
        model.addAttribute("interfaceStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL186", null, langCd));

        return "/sal/orm/btoCreateOrder/btoCreateOrderMain";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
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
     * 주문유형 : 전략오더 일경우 참고수량 조회
     */
    @RequestMapping(value = "/selectASOrdRefOrdQtyChkSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectASOrdRefOrdQtyChkSearch(@RequestBody BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderService.selectASOrdRefOrdQtyChkSearch(searchVO);
    }
}
