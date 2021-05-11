package chn.bhmc.dms.mob.crm.cmm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerMemoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.CallInfoService;
import chn.bhmc.dms.crm.cmm.service.CarLineInfoService;
import chn.bhmc.dms.crm.cmm.service.SmsMessageService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;
import chn.bhmc.dms.crm.cmm.vo.SmsMessageVO;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;





/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobCrmCommonController.java
 * @Description : CRM 공통 컨트롤러
 * @author
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobCrmCommonController extends HController{

    /**
     * Customer Information Management Service
     */
    @Resource(name = "customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * Customer Information Management Service
     */
    @Resource(name="carLineInfoService")
    CarLineInfoService carLineInfoService;

    /**
     * Call Information Management Service
     */
    @Resource(name="callInfoService")
    CallInfoService callInfoService;

    /**
     * Address Information Management Service
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * 메시지템플릿 관리 서비스
     */
    @Resource(name="messageTemplateService")
    MessageTemplateService messageTemplateService;

    /**
     * 메시지 저장 서비스
     */
    @Resource(name="smsMessageService")
    SmsMessageService smsMessageService;



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
     * 계약품의현황 서비스
     */
    @Resource(name = "vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * 영업 스케줄 관리 서비스
     */
    @Resource(name="salesActiveMgmtService")
    SalesActiveMgmtService salesActiveMgmtService;

    /**
     * 메시지이력 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name = "customerMemoService")
    CustomerMemoService customerMemoService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;


    /**
     * 관심차종 선택 팝업 메인
     * @return
     */
    @RequestMapping(value = "/mob/cmm/crm/commonPopup/selectIntrCarLinePopup.do", method = RequestMethod.GET)
    public String selectIntrCarListPopup(Model model) throws Exception  {
        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        return "/mob/cmm/crm/commonPopup/selectIntrCarLinePopup";
    }


    /**
     * 관심차종 정보를 저장 한다.
     * @param carLineInfoVO - 관심차량정보
     * @return
     */
    @RequestMapping(value = "/mob/crm/cmm/carLineInfo/multiCarLineInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCarLineInfo(@RequestBody BaseSaveVO<CarLineInfoVO> saveVO)throws Exception {

        carLineInfoService.multiCarLine(saveVO);
        return true;
    }

    /**WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
     * 관심차종 정보를 조회 한다.
     * @param carLineInfoSearchVO - 관심차종
     * @return
     */
    @RequestMapping(value = "/mob/crm/cmm/carLineInfo/selectCarLineInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCarLineInfo(@RequestBody CarLineInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(carLineInfoService.selectCarLineInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carLineInfoService.selectCarLineInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 콜 정보를 저장 한다.
     * @param callInfoVO - 콜
     * @return
     */
    @RequestMapping(value = "/mob/crm/cmm/callInfo/insertCallInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertCallInfo(@RequestBody CallInfoVO saveVO)throws Exception {
        callInfoService.insertCallInfo(saveVO);
        return true;
    }

    /**
     * 콜 정보를 조회한다.
     * @param callInfoVO - 콜
     * @return
     */
    @RequestMapping(value = "/mob/crm/cmm/callInfo/selectCallInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallInfo(@RequestBody CallInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(callInfoService.selectCallInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callInfoService.selectCallInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 주소 정보를 저장 한다.
     * @param addressInfoVO - 주소
     * @return
     */
    @RequestMapping(value = "/mob/crm/cmm/addressInfo/multiAddressInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiAddressInfo(@RequestBody BaseSaveVO<AddressInfoVO> saveVO)throws Exception {

        addressInfoService.multiAddressInfo(saveVO);
        return true;
    }

    /**
     * 주소 정보를 조회 한다.
     * @param addressInfoSearchVO - 주소
     * @return
     */
    @RequestMapping(value = "/mob/crm/cmm/addressInfo/selectAddressInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAddressInfo(@RequestBody AddressInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(addressInfoService.selectAddressInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(addressInfoService.selectAddressInfoByCondition(searchVO));
        }

        return result;
    }


    /**
     * 메시지(SMS, EMAIL, WeChat) 정보를 저장 한다. // 접촉유형 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
     * @param MessageVO - 메시지 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mob/crm/cmm/customerInfo/sendSmsMessage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean sendSmsMessage(@Validated @RequestBody SmsMessageVO smsMessageVO)throws Exception {

        smsMessageService.smsMessageSend(smsMessageVO);
        return true;
    }


    /**
     * 고객조회 팝업 화면을 출력한다.
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/mob/crm/cif/customerInfo/customerPopupListMain.do", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject customerPopupListMain(HttpServletRequest request) throws Exception {
        CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        String sHpNo = request.getParameter("sHpNo");
        String dlrCd = request.getParameter("dlrCd");
        //String userId = request.getParameter("userId");

        searchVO.setsHpNo(sHpNo);
        searchVO.setsDlrCd(dlrCd);

        result.setTotal(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));

        Map<String, Object> map = new HashMap<String, Object>();
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        JSONObject jsonObject = new JSONObject();

        if (result.getTotal() != 0) {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
/*            if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
                searchVO.setsDlrCd(mobLoginVO.getDlrCd());
            }
            if (StringUtils.isEmpty(searchVO.getsPltCd())) {
                searchVO.setsPltCd(mobLoginVO.getPltCd());
            }
*/
            //result.setData(customerInfoService.selectCustomerInfoByCondition(searchVO));

            List<CustomerInfoVO> customerInfoVO = new ArrayList<CustomerInfoVO>();
            customerInfoVO = (List<CustomerInfoVO>)customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO);

            //custNo, custNm, custTp, custCd, hpNo, telNo
            for(int i=0; i<result.getTotal(); i++){
                map = new HashMap<String, Object>();

                map.put("custNo", customerInfoVO.get(i).getCustNo());
                map.put("custNm", customerInfoVO.get(i).getCustNm());
                map.put("custTp", customerInfoVO.get(i).getCustTp());
                map.put("custCd", customerInfoVO.get(i).getCustCd());
                map.put("hpNo", customerInfoVO.get(i).getHpNo());
                map.put("telNo", customerInfoVO.get(i).getTelNo());

                resultList.add(map);
               // jsonObject.putAll(map);
            }

            result.setData(resultList);
        }

        jsonObject.put("data", resultList);
        jsonObject.put("total", result.getTotal());


        return jsonObject;
    }

    /**
     * 고객정보 팝업 화면을 출력한다.
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/mob/crm/cif/customerInfo/customerPopupInfoMain.do", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject customerPopupInfoSearch(HttpServletRequest request) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        String sCustNo = request.getParameter("sCustNo");
        String dlrCd = request.getParameter("dlrCd");
//        String userId = request.getParameter("userId");

        CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
        searchVO.setsCustNo(sCustNo);
        searchVO.setsDlrCd(dlrCd);


        //기본정보
        SearchResult result = new SearchResult();
        /*if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(mobLoginVOgetDlrCd());
        }*/

        Map<String, Object> map0 = new HashMap<String, Object>();
        List<Map<String, Object>> resultList0 = new ArrayList<Map<String, Object>>();
        JSONObject json = new JSONObject();

        result.setTotal(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            List<CustomerInfoVO> customerInfoVO = new ArrayList<CustomerInfoVO>();
            customerInfoVO = (List<CustomerInfoVO>)customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO);

            map0.put("custNo", customerInfoVO.get(0).getCustNo());
            map0.put("custNm", customerInfoVO.get(0).getCustNm());
            map0.put("custTp", customerInfoVO.get(0).getCustTp());
            map0.put("custCd", customerInfoVO.get(0).getCustCd());
            map0.put("telNo", customerInfoVO.get(0).getTelNo());
            map0.put("hpNo", customerInfoVO.get(0).getHpNo());

            resultList0.add(map0);

            result.setData(resultList0);

            map.put("customerInfo", result.getData());
        }

        //보유차량
        VehicleMasterSearchVO vehicleMasterSearchVO = new VehicleMasterSearchVO();
        vehicleMasterSearchVO.setsDlrCd(searchVO.getsDlrCd());
        vehicleMasterSearchVO.setsCustNo(searchVO.getsCustNo());

        SearchResult vehicleResult = new SearchResult();

        int vehicleCnt;
        vehicleCnt = vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(vehicleMasterSearchVO);

        Map<String, Object> map1 = new HashMap<String, Object>();
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();

        if (vehicleCnt > 0 ) {
            List<VehicleCustomerInfoVO> vehicleCustomerInfoVO = new ArrayList<VehicleCustomerInfoVO>();
            vehicleCustomerInfoVO = (List<VehicleCustomerInfoVO>)vehicleMasterService.selectVehicleCustomerInfoByCondition(vehicleMasterSearchVO);

            // carlineNm, carRegNo
            if(vehicleCustomerInfoVO.size() != 0){
                for(int i=0; i<vehicleCustomerInfoVO.size(); i++){
                    map1 = new HashMap<String, Object>();

                    map1.put("carlineNm", vehicleCustomerInfoVO.get(i).getCarlineNm());
                    map1.put("carRegNo", vehicleCustomerInfoVO.get(i).getCarRegNo());

                    resultList.add(map1);

                    if((i+1) == vehicleCnt){
                        break;
                    }
                }
            }
            vehicleResult.setData(resultList);
        }
        map.put("vehicleInfo", vehicleResult.getData());


        //활동이력
        SalesActiveSearchVO activeVO = new SalesActiveSearchVO();
        SearchResult activeResult = new SearchResult();

        int activeCnt = 0;
        activeCnt = salesActiveMgmtService.selectSalesActiveMgmtsByConditionCnt(activeVO);
        activeResult.setTotal(activeCnt);

        Map<String, Object> map2 = new HashMap<String, Object>();
        List<Map<String, Object>> resultList1 = new ArrayList<Map<String, Object>>();

        if(activeResult.getTotal() != 0){
            List<SalesActiveVO> SalesActiveVO = new ArrayList<SalesActiveVO>();
            SalesActiveVO = (List<SalesActiveVO>)salesActiveMgmtService.selectSalesActiveMgmtsByCondition(activeVO);

            //activeCont, regDt
            if(activeCnt > 0){
                for(int i=0; i<5; i++){
                    map2 = new HashMap<String, Object>();

                    map2.put("activeCont", SalesActiveVO.get(i).getActiveCont());
                    map2.put("regDt", SalesActiveVO.get(i).getRegDt());

                    resultList1.add(map2);

                    if((i+1) == activeCnt){
                        break;
                    }
                }
            }

            activeResult.setData(resultList1);

        }
        map.put("activeInfo", activeResult.getData());


        //메시지이력
        CustomerMemoSearchVO memoVO = new CustomerMemoSearchVO();
        SearchResult memoResult = new SearchResult();

        memoVO.setsCustNo(sCustNo);
        //memoVO.setsRegUsrId(mobLoginVO.getUserId());
        memoVO.setsRegUsrId(mobLoginVO.getUserId());

        int memoCnt = 0;
        memoCnt = customerMemoService.selectCustomerMemoByConditionCnt(memoVO);
        memoResult.setTotal(memoCnt);

        Map<String, Object> map3 = new HashMap<String, Object>();
        List<Map<String, Object>> resultList11 = new ArrayList<Map<String, Object>>();

        if(memoCnt > 0){
            List<CustomerMemoVO> customerMemoVO = new ArrayList<CustomerMemoVO>();
            customerMemoVO = (List<CustomerMemoVO>)customerMemoService.selectCustomerMemoByCondition(memoVO);

          //activeCont, regDt
            for(int i=0; i<5; i++){
                map3 = new HashMap<String, Object>();

                map3.put("memoCont", customerMemoVO.get(i).getMemoCont());
                map3.put("memoTp", customerMemoVO.get(i).getMemoTp());
                map3.put("regDt", customerMemoVO.get(i).getRegDt());

                resultList11.add(map3);

                if((i+1) == memoCnt){
                    break;
                }
            }
            memoResult.setData(resultList11);
        }
        map.put("memonInfo", memoResult.getData());

        json.putAll(map);

        return json;
    }
}
