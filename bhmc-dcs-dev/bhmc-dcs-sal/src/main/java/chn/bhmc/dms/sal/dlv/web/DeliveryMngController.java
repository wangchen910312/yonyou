package chn.bhmc.dms.sal.dlv.web;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.dlv.service.DeliveryMngService;
import chn.bhmc.dms.sal.dlv.vo.DeliverySaveVO;
import chn.bhmc.dms.sal.dlv.vo.DeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.DeliveryVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;



/**
 * VehicleSpec 고객인도관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 3. 10
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.19           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dlv/vehicleDelivery")
public class DeliveryMngController extends HController {

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 고객인도 서비스
     */
    @Resource(name="deliveryMngService")
    DeliveryMngService deliveryMngService;


    /**
     * bay관리 - 서비스(정비)
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
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;

    /**
     * 고객인도관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDeliveryMngMain.do", method = RequestMethod.GET)
    public String selectAssignMngMain(Model model,
            @RequestParam(value="contNo", required = false, defaultValue="") String contNo
    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //간반차트에서 이동시 필요.
        model.addAttribute("contNo", contNo);           // 계약번호로 조회

        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String nowMonth = DateUtil.getDate("MM");
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String sysYyyyMm = (DateUtil.getDate("yyyyMMdd")).substring(0, 6);

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nowMonth", nowMonth);
        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("sysYyyyMm", sysYyyyMm);

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //계약상태 공통코드 목록
        model.addAttribute("contractStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));
        //Log Channer(유통채널) 공통코드 목록
        model.addAttribute("dstbChnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL018", null, langCd));
        //소매유형 공통코드 목록
        model.addAttribute("retlTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL130", null, langCd));
        //판매취소사유 공통코드 목록
        model.addAttribute("cancReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL129", null, langCd));
        //강제판매처리신청사유
        model.addAttribute("fceSaleReqReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL153", null, langCd));
        //심사여부 SAL131
        model.addAttribute("approveYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL131", null, langCd));
        //강제판매처리신청상태 SAL154
        model.addAttribute("reqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL154", null, langCd));
        //오더유형 SAL138
        model.addAttribute("ordTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));
        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 주요인증문서유형(证件类型） mathDocTp (CRM024)
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //조건기간구분 SAL061
        model.addAttribute("searchDtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL061", null, langCd));


        //서비스고문
        BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo("C01");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("serviceAdList", bayManageService.selectBayDetailsByCondition(searchVO));


        return "/sal/dlv/vehicleDelivery/selectDeliveryMngMain";
    }


    /**
     * 고객인도관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectDeliveryMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeliveryMng(@RequestBody DeliverySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        result.setTotal(deliveryMngService.selectDeliveryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(deliveryMngService.selectDeliveryByCondition(searchVO));
        }

        return result;
    }


    /**
     * 인도처리 팝업창 OPEN
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectDeliveryPopup.do", method = RequestMethod.GET)
    public String selectDeliveryPopup(@RequestParam(value="vinNo1") String vinNo1, @RequestParam(value="vinNo2") String vinNo2, @RequestParam(value="dlrCd") String dlrCd, Model model) throws Exception {

        DeliveryVO deliveryVO = new DeliveryVO();
        deliveryVO.setVinNo1(vinNo1);
        deliveryVO.setVinNo2(vinNo2);
        deliveryVO.setDlrCd(dlrCd);

        List<DeliveryVO> excptYnList = deliveryMngService.selectExcptApproveYn(deliveryVO);
        if(excptYnList.size() > 0){
            model.addAttribute("excptDelivery", excptYnList.get(0));
        }

        //서비스고문
        BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo("C01");
        searchVO.setsDlrCd(dlrCd);
        model.addAttribute("serviceAdList", bayManageService.selectBayDetailsByCondition(searchVO));

        //강제판매처리신청사유
        model.addAttribute("fceReqReasonList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL153", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/dlv/vehicleDelivery/selectDeliveryPopup";
    }



    /**
     * 고객인도-고객인도팝업 -> 고객인도 이벤트
     * @param <DeliveryVO>
     * @param DeliveryVO deliveryVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/vehicleDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean vehicleDelivery(@RequestBody DeliveryVO deliveryVO) throws Exception {

        deliveryVO.setUpdtUsrId(LoginUtil.getUserId());
        deliveryVO.setDlrCd(LoginUtil.getDlrCd());
        deliveryMngService.updateVehicleDelivery(deliveryVO);

        return true;
    }



    /**
     * 고객인도-고객인도팝업 -> 이상출고처리 이벤트
     * @param <DeliveryVO>
     * @param DeliveryVO deliveryVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/exceptionDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean exceptionDelivery(@RequestBody DeliveryVO deliveryVO) throws Exception {

        deliveryVO.setRegUsrId(LoginUtil.getUserId());
        deliveryVO.setDlrCd(LoginUtil.getDlrCd());
        deliveryMngService.insertExceptionDelivery(deliveryVO);

        return true;
    }




    /**
     * 강제판매신청정보를 가져온다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectExcpDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExcpDelivery(@RequestBody DeliverySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        result.setTotal(deliveryMngService.selectExcpDeliveryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(deliveryMngService.selectExcpDeliveryByCondition(searchVO));
        }

        return result;
    }



    /**
     * 고객인도 - 인도취소
     * @param <DeliveryVO>
     * @param DeliveryVO deliveryVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/cancelDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelDelivery(@RequestBody DeliveryVO deliveryVO) throws Exception {

        deliveryVO.setRegUsrId(LoginUtil.getUserId());
        deliveryVO.setDlrCd(LoginUtil.getDlrCd());
        deliveryMngService.cancelDelivery(deliveryVO);


        return true;
    }



    /**
     * 이상출고시  첨부파일추가
     */
    @RequestMapping(value = "/updateAddFile.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean udpateAddFile(@RequestBody DeliveryVO deliveryVO) throws Exception {

        deliveryMngService.updateAddFile(deliveryVO);


        return true;
    }

    /**
     * 출고신청심사(신규) Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDeliveryJudgeMain.do", method = RequestMethod.GET)
    public String selectDeliveryJudgeMain(Model model) throws Exception {

        return "/sal/dlv/vehicleDelivery/selectDeliveryJudgeMain";
    }


    /**
     * 전략출고심사 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTacticsDeliveryApproveMain.do", method = RequestMethod.GET)
    public String selectTacticsDeliveryApproveMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //전략출고심사상태 SAL190
        model.addAttribute("approveDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL190", null, langCd));

        DealerVO dealerVO;
        DealerSearchVO searchVO = new DealerSearchVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        dealerVO = salesCommonService.selectDealerInfo(searchVO);
        model.addAttribute("dealerVO", dealerVO);

        model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));

        return "/sal/dlv/vehicleDelivery/selectTacticsDeliveryApproveMain";
    }

    /**
     * 전략출고심사 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectTacticsDeliveryReq.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTacticsDeliveryReq(@RequestBody DeliverySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(deliveryMngService.selectTacticsDeliveryReqCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(deliveryMngService.selectTacticsDeliveryReq(searchVO));
        }

        return result;
    }

    // 통과
    @RequestMapping(value = "/confirmDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmDelivery(@Validated @RequestBody DeliverySaveVO saveVO) throws Exception {
        for(DeliveryVO vo : saveVO.getList()){
            deliveryMngService.confirmDelivery(vo);
        }
        return true;
    }

    // 거절
    @RequestMapping(value = "/rejectDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean rejectDelivery(@Validated @RequestBody DeliverySaveVO saveVO) throws Exception {
        for(DeliveryVO vo : saveVO.getList()){
            deliveryMngService.rejectDelivery(vo);
        }
        return true;
    }

}
