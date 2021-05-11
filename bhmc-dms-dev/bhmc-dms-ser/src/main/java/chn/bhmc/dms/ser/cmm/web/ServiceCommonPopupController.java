package chn.bhmc.dms.ser.cmm.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.ser.ro.vo.DcsCampaignOfVinVO;

import chn.bhmc.dms.ser.ro.vo.DcsCampaignOfVinSearchVO;

import chn.bhmc.dms.ser.ro.service.DcsVehicleCampaginInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.par.pmm.vo.AbcClassSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoSearchVO;
import chn.bhmc.dms.ser.rev.service.PartReservationService;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.rev.vo.PartReservationSearchVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.ser.ro.service.PreCheckService;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkProcessService;
import chn.bhmc.dms.ser.ro.vo.PreCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.svi.service.CampaignVinManageService;
import chn.bhmc.dms.ser.svi.service.CcdCodeManageService;
import chn.bhmc.dms.ser.svi.service.LaborCodeManageService;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.NcdCodeManageService;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;
import chn.bhmc.dms.ser.svi.vo.CcdCodeManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.LaborCodeSearchVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeSearchVO;
import chn.bhmc.dms.ser.wac.service.ClaimRequestService;
import chn.bhmc.dms.ser.wac.service.PwaApproveService;
import chn.bhmc.dms.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnRequestService;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoAlarmVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonPopupController.java
 * @Description : 서비스 팝업 컨트롤러
 * @author Kwon Ki Hyun
 * @since 2016. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class ServiceCommonPopupController extends HController{


    /**
     * 공임 팝업 서비스
     */
    @Autowired
    DcsVehicleCampaginInfoService dcsVehicleCampaginInfoService;

    /**
     * 공임 팝업 서비스
     */
    @Autowired
    LaborCodeManageService laborCodeManageService;

    /**
     * 현상코드 서비스
     */
    @Autowired
    NcdCodeManageService ncdCodeManageService;

    /**
     * 원인코드 서비스
     */
    @Autowired
    CcdCodeManageService ccdCodeManageServie;

    /**
     * 고객조회팝업 서비스
     */
    @Autowired
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * 예약 서비스
     */
    @Autowired
    ReservationReceiptService reservationReceiptService;

    /**
     * RO 서비스
     */
    @Autowired
    RepairOrderService repairOrderService;

    /**
     * PWA 승인 서비스
     */
    @Autowired
    PwaApproveService pwaApproveService;

     /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 캠페인 팝업
     */
    @Autowired
    CampaignVinManageService campaignVinManageService;

    /**
     * 사전검점
     */
    @Autowired
    PreCheckService preCheckService;

    /**
     * 부품예약
     */
    @Autowired
    PartReservationService partReservationService;

    /**
     * 삼보정보 서비스
     */
    @Autowired
    SanbaoInfoService sanbaoInfoService;

    /**
     * 삼포 반품승인 서비스
     */
    @Autowired
    SanbaoReturnRequestService sanbaoReturnRequestService;

    /**
     * 작업진도관리 서비스
     */
    @Autowired
    WorkProcessService workProcessService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Autowired
    ClaimRequestService claimRequestService;

    @Autowired
    CarInfoService carInfoService;

    @Autowired
    MembershipSupportService membershipSupportService;

    @Autowired
    BlueMembershipJoinSupportService blueMembershipJoinSupportService;

    @Autowired
    VehicleMasterService vehicleMasterService;

    @Autowired
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
    *
    * 공임코드관리 공임 조회 팝업 화면 메인
    *
    * @param model
    * @return 공임코드조회 화면
    * @throws Exception
    */
    @RequestMapping(value="/ser/cmm/popup/selectLaborCodePopup.do")
    public String selectLaborCodePopup(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 구분코드
        model.addAttribute("distTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER950", null, langCd));

        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        // 공임코드유형
        model.addAttribute("lbrCdTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER038", null, langCd));

        //브랜드 목록
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        return "/ser/cmm/popup/selectLaborCodePopup";
    }

    /**
     *
     * 공임코드관리 공임 조회 팝업
     *
     * @param model
     * @return 공임코드 목록 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/laborManage/selectLaborCodePopups.do")
    @ResponseBody
    public SearchResult selectLaborCodePopups(@RequestBody LaborCodeSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(laborCodeManageService.selectLaborCodePopUpByConditionCnt(searchVO));

        if(result.getTotal() !=0){
            result.setData(laborCodeManageService.selectLaborCodePopUpByCondition(searchVO));
        }

        return result;
    }


    /**
     *
     * 현상코드 팝업을 메인한다.
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectNcdCcdCodePopup.do" , method=RequestMethod.GET)
    public String selectNcdCodePopup(Model model)throws Exception{

        //SER092 현상코드분류

        CommonCodeSearchVO commCdSearchVO = new CommonCodeSearchVO();

           // PWA 상태코드
        commCdSearchVO.setsCmmGrpCd("SER092");
        model.addAttribute("levelDstinDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER092", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/ser/cmm/popup/selectNcdCcdCodePopup";
    }

    /**
     *
     * 현상코드 팝업 대분류 목록을 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ncCode/selectNcdCodeLclsPopups.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNcdCodeLclsPopups(@RequestBody NcdCodeSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();
        result.setTotal(ncdCodeManageService.selectNcdCodeByConditionCnt(searchVO));

        if(result.getTotal() !=0 ){
          result.setData(ncdCodeManageService.selectNcdLclsMapByKey(searchVO));
        }else{
          result.setData(ncdCodeManageService.selectNcdLclsByKey(searchVO));
        }

        return result;
    }

    /**
     *
     * 현상코드 중분류 팝업 목록을 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ncCode/selectNcdCodeMclsPopups.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNcdCodeMclsPopups(@RequestBody NcdCodeSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(ncdCodeManageService.selectNcdCodeByConditionCnt(searchVO));


        if(result.getTotal() !=0 ){
          result.setData(ncdCodeManageService.selectNcdMCodeByKey(searchVO));
        }else {
            result.setData(ncdCodeManageService.selectNcdMclsByKey(searchVO));
        }

        return result;
    }

    /**
     *
     * 현상코드 소분류 팝업 목록을 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ncCode/selectNcdCodeSclsPopups.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNcdCodeSclsPopups(@RequestBody NcdCodeSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(ncdCodeManageService.selectNcdCodeByConditionCnt(searchVO));


        if(result.getTotal() !=0 ){
            result.setData(ncdCodeManageService.selectNcdSclsMapByKey(searchVO));
        }else{
            result.setData(ncdCodeManageService.selectNcdSclsByKey(searchVO));
        }

        return result;
    }


    /**
     *
     * 원인코드 팝업 목록을 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/ncCode/selectCcdCodePopups.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCcdCodePopups(@RequestBody CcdCodeManageSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(ccdCodeManageServie.selectCcdCodeByKey(searchVO));

        return result;
    }

    /**
     *
     * 보험관리 팝업 화면
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/cmm/popup/selectInsurancePopup.do" , method = RequestMethod.GET)
    public String selectInsurancePopup(Model model) throws Exception{


        model.addAttribute("dlrCd",LoginUtil.getDlrCd());

        return "/ser/cmm/popup/selectInsurancePopup";
    }

    /**
     *
     * 보험관리 팝업 화면
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/cmm/popup/selectInsuSearchPopup.do" , method = RequestMethod.GET)
    public String selectInsuSearchPopup(Model model) throws Exception{

         String langCd = LocaleContextHolder.getLocale().getLanguage();
        //보험코드
        model.addAttribute("insuList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));

        return "/ser/cmm/popup/selectInsuSearchPopup";
    }


    /**
     * 테크니션 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectTechManFnPopup.do", method = RequestMethod.GET)
    public String selectTechManFnPopup(Model model
            ,@RequestParam(value="wrkTp", defaultValue="") String wrkTp) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //기능유형 목록
        model.addAttribute("fnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER940", null, langCd));
        //업무구분
        model.addAttribute("wrkTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER056", null, langCd));
        model.addAttribute("wrkTp", wrkTp);
        return "/ser/svi/techManFnMaster/selectTechManFnPopup";
    }

    /**
     * 테크니션/소조 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectTechManTabPopup.do", method = RequestMethod.GET)
    public String selectTechManTabPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //기능유형 목록
        model.addAttribute("fnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER940", null, langCd));
        //업무구분
        model.addAttribute("wrkTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER056", null, langCd));
        return "/ser/svi/bayManage/selectTechManTabPopup";
    }

    /**
     * Bay 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectBayManagePopup.do", method = RequestMethod.GET)
    public String selectBayManagePopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : BAY구분
        model.addAttribute("bayTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        //사용여부
        model.addAttribute("userYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //bay 상태
        model.addAttribute("bayStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER096", null, langCd));

        return "/ser/svi/bayManage/selectBayManagePopup";
    }

    /**
     * Bay 추가 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectBayManageRegPopup.do", method = RequestMethod.GET)
    public String selectBayManageRegPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : 수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : BAY 세부구분
        model.addAttribute("bayGrpTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER903", null, langCd));
        //사용여부
        model.addAttribute("userYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //bay 상태
        model.addAttribute("bayStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER096", null, langCd));

        return "/ser/svi/bayManage/selectBayManageRegPopup";
    }

    /**
     * 반/조관리 추가 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectWorkGroupRegPopup.do", method = RequestMethod.GET)
    public String selectWorkGroupRegPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 반조상태코드
        model.addAttribute("wkgrpStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SER096", null, langCd));

        // 공통코드 : 수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        return "/ser/svi/workGroupManage/selectworkGroupRegPopup";
    }

    /**
     * 할인관리 추가 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectdcMasterRegPopup.do", method = RequestMethod.GET)
    public String selectdcMasterRegPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
        //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //할인구분
        model.addAttribute("dcDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        //할인대상구분
        model.addAttribute("dcPermTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER922", null, langCd));

        return "/ser/svi/dcMaster/selectdcMasterRegPopup";
    }

    /**
     * 기타사항관리 추가 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectetcIssueRegPopup.do", method = RequestMethod.GET)
    public String selectetcIssueRegPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : 수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : BAY 세부구분
        model.addAttribute("bayGrpTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER903", null, langCd));
        //사용여부
        model.addAttribute("userYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //bay 상태
        model.addAttribute("bayStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER096", null, langCd));

        return "/ser/svi/etcIssue/selectetcIssueRegPopup";
    }

    /**
     * 테크니션 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectTechManSearchPopup.do", method = RequestMethod.GET)
    public String selectTechManSearchPopup(Model model) throws Exception {

        return "/ser/cmm/popup/selectTechManSearchPopup";
    }

     /**
     * 서비스 공통용 고객차량 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectVehOfCustInfoPopup.do", method = RequestMethod.GET)
    public String selectVehOfCustInfoPopup(Model model) throws Exception {

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/ser/cmm/popup/selectVehOfCustInfoPopup";
    }

    /**
     *
     * 고객 통합 정보(차량마스터, 고객정보, 차량소유주)를 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectSanbaoVehOfCustInfo.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoVehOfCustInfo(@RequestBody VehOfCustInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(vehOfCustInfoService.selectSanbaoVehOfCustInfoByConditionCnt(searchVO));
        if(result.getTotal() != 0 ){
            result.setData(vehOfCustInfoService.selectSanbaoVehOfCustInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     *
     * 고객 통합 정보(차량마스터, 고객정보, 차량소유주)를 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectVehOfCustInfo.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehOfCustInfo(@RequestBody VehOfCustInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        if(StringUtil.isNullToString(searchVO.getsPreFixId()).equals("CH")){
            result.setTotal(vehOfCustInfoService.selectVehInfoByConditionCnt(searchVO));
            if(result.getTotal() != 0 ){
                result.setData(vehOfCustInfoService.selectVehInfoByCondition(searchVO));
            }
        } else {
            result.setTotal(vehOfCustInfoService.selectVehOfCustInfoByConditionCnt(searchVO));
            if(result.getTotal() != 0 ){
                result.setData(vehOfCustInfoService.selectVehOfCustInfoByCondition(searchVO));
            }
        }
        return result;
    }

   /**
     *
     * 고객 통합 정보(차량마스터, 고객정보, 차량소유주)를 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehOfCustInfoByKey(@RequestBody VehOfCustInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(vehOfCustInfoService.selectVehOfCustInfoByKey(searchVO));
        result.setTotal(result.getData().size());

        return result;
    }

    /**
     *
     * 삼포 고객 통합 정보(차량마스터, 고객정보, 차량소유주)를 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectSanbaoVehOfCustInfoByKey.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoVehOfCustInfoByKey(@RequestBody VehOfCustInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(vehOfCustInfoService.selectSanbaoVehOfCustInfoByKey(searchVO));
        result.setTotal(result.getData().size());

        return result;
    }

    /**
     * 서비스 공통용 RO 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectRepairOrderSearchPopup.do", method = RequestMethod.GET)
    public String selectRepairOrderPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));

        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        model.addAttribute("sRoToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sRoFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        model.addAttribute("preFixId", "ROHISTDMS");
        return "/ser/cmm/popup/selectRepairOrderSearchPopup";
    }

    /**
     * 서비스 공통용 RO이력 팝업 화면을 출력한다.(DCS->DMS)
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectRepairOrderHistorySearchPopup.do", method = RequestMethod.GET)
    public String selectRepairOrderSearchPopupHistory(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        model.addAttribute("preFixId", "ROHISTDCS");
        return "/ser/cmm/popup/selectRepairOrderSearchPopupHistory";
    }

    /**
     * 클레임  RO 정보  팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectRepairOrderForClaimSearchPopup.do", method = RequestMethod.GET)
    public String selectRepairOrderForClaimSearchPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));


        return "/ser/cmm/popup/selectRepairOrderForClaimSearchPopup";
    }

    /**
     * 서비스 공통용 방문서비스 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectVisitServicePopup.do", method = RequestMethod.GET)
    public String selectVsitServicePopup(Model model) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/ser/cmm/popup/selectVisitServicePopup";
    }

    /**
     * 서비스 공통용 Delivery 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectDeliveryServicePopup.do", method = RequestMethod.GET)
    public String selectDeliveryServicePopup(Model model) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/ser/cmm/popup/selectDeliveryServicePopup";
    }

    /**
    * LTS MODEL 데이터 조회한다.
    * Statements
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    @RequestMapping(value="/ser/cmm/popup/selectLtsModelInfos.do" , method=RequestMethod.POST)
    @ResponseBody
    public LtsModelMappingVO selectLtsModelInfos(@RequestBody LtsModelSearchVO searchVO)throws Exception{

       return vehOfCustInfoService.selectLtsModelInfosByCondition(searchVO);
    }

    /**
     * 서비스 공통용 작업패키지 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectWorkPackagePopup.do", method = RequestMethod.GET)
    public String selectWorkPakagePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        //브랜드 목록
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        return "/ser/cmm/popup/selectWorkPackagePopup";
    }


    /**
     * 예약 정보를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectReserveInfos.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReservationReceipt(@RequestBody ReservationReceiptSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(reservationReceiptService.selectReservationReceiptByCondition(searchVO));

        result.setTotal(result.getData().size());

        return result;
    }

    /**
    *
    * 캠페인 팝업 화면 메인
    *
    * @param model
    * @return 공임코드조회 화면
    * @throws Exception
    */
    @RequestMapping(value="/ser/cmm/popup/selectCampaignPopup.do")
    public String selectCampaignPopup(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        //브랜드 목록
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        return "/ser/cmm/popup/selectCampaignPopup";

    }

    /**
     *  캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignLbrInfoPopup.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignLbrInfoPopup(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(campaignVinManageService.selectCampaignLbrInfoPopup(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     *  딜러 캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignDlrLbrInfoPopup.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignDlrLbrInfoPopup(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(campaignVinManageService.selectCampaignDlrLbrInfoPopup(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignPartInfoPopup.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignPartInfoPopup(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(campaignVinManageService.selectCampaignPartInfoPopup(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 딜러 캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보
     */
    @RequestMapping(value="/ser/svi/campaign/selectCampaignDlrPartInfoPopup.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCampaignDlrPartInfoPopup(@RequestBody CampaignSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(campaignVinManageService.selectCampaignDlrPartInfoPopup(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 서비스 공통용  : 다건의  당일 예약 정보 목록  팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectVehOfReseveInfoPopup.do", method = RequestMethod.GET)
    public String selectVehOfReseveInfoPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));

        return "/ser/cmm/popup/selectVehOfReseveInfoPopup";
    }

    /**
     * 서비스 공통용 : 다건의 당일 차량점검 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectVehOfPreCheckInfos.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehOfPreCheckInfos(@RequestBody PreCheckSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        if(searchVO.getsPreFixId().equals("PRE")){

            PartReservationSearchVO parResvSearchVO = new PartReservationSearchVO();
            result.setTotal(partReservationService.selectPartReservationByConditionCnt(parResvSearchVO));

            if(result.getTotal() != 0){
                result.setData(partReservationService.selectPartReservationByCondition(parResvSearchVO));
            }

        } else {

            if(searchVO.getsPreFixId().equals("RE")){
                VehOfReseveInfoSearchVO revSearchVO = new VehOfReseveInfoSearchVO();
                revSearchVO.setsVinNo(searchVO.getsVinNo());
                revSearchVO.setsSerResvStartDt(searchVO.getsSerResvStartDt());

                result.setData(vehOfCustInfoService.selectVehOfReseveInfoByCondition(revSearchVO)); //예약화면
                result.setTotal(result.getData().size());
            }else{
                searchVO.setsPopupYn("Y");

                result.setData(preCheckService.selectVehOfPreCheckInfoByCondition(searchVO));
                result.setTotal(result.getData().size());

            }

        }

        return result;

    }

    /**
     * 서비스 공통용 취소  팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectCancelPopup.do", method = RequestMethod.GET)
    public String selectCancelPopup(Model model) throws Exception {

        return "/ser/cmm/popup/selectCancelPopup";
    }

    /**
     * 서비스 공통용  : 다건의  당일 부품예약 정보 목록  팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectVehOfPartReserveInfoPopup.do", method = RequestMethod.GET)
    public String selectVehOfPartReseveInfoPopup(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/ser/cmm/popup/selectVehOfPartReserveInfoPopup";
    }

    /**
     * 고객정보를 등록/수정 한다.
     * @param saveVO - 고객정보 등록/수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/cmm/vehOfCustInfo/multiVehOfCustInfo.do", method = RequestMethod.POST)
    public @ResponseBody Map<String,String> multiVehOfCustInfo(@Validated @RequestBody VehOfCustInfoVO vehOfCustInfoVO, BindingResult bindingResult) throws Exception {
        return vehOfCustInfoService.multiVehOfCustInfo(vehOfCustInfoVO);

    }

    /**
     * PWA 승인조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectPwaApproveSearchPopup.do", method = RequestMethod.GET)
    public String selectPwaApproveSearchPopup(Model model) throws Exception {

       // PWA 유형코드
       model.addAttribute("pwaTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER100", null, LocaleContextHolder.getLocale().getLanguage()));

       return "/ser/cmm/popup/selectPwaApproveSearchPopup";
    }

     /**
     * 승인된 PWA 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return 승인된 PWA 정보 목록 데이터
     */
    @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveSearchPopups.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPwaApproveSearchPopups(@RequestBody PwaSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(pwaApproveService.selectPwaApproveClaimByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 이전 RO 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectPreRepairOrderSearchPopup.do", method = RequestMethod.GET)
    public String selectPreRepairOrderSearchPopup(Model model) throws Exception {

        return "/ser/cmm/popup/selectPreRepairOrderSearchPopup";
    }

    /**
     * 이전  RO 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return 이전  RO 정보 목록 데이터
     */
    @RequestMapping(value="/ser/ro/repairOrder/selectPreRepairOrder.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreRepairOrder(@RequestBody RepairOrderSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(repairOrderService.selectPreRepairOrderByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 고객요청사항 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectCustDemandPopup.do", method = RequestMethod.GET)
    public String selectCustDemandPopup(Model model) throws Exception {

        return "/ser/cmm/popup/selectCustDemandPopup";
    }

    /**
     * 삼보알람 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectSanbaoAlarmPopup.do", method = RequestMethod.GET)
    public String selectSanbaoAlarmPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        /** 부품그룹 코드 **/
        model.addAttribute("itemGrpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER209", null, langCd));

        return "/ser/cmm/popup/selectSanbaoAlarmPopup";
    }

    /**
     *
     * 삼보알람 정보
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectSanbaoAlarmInfoByKey.do" , method = RequestMethod.POST)
    @ResponseBody
    public SanbaoAlarmVO selectSanbaoAlarmInfoByKey(@RequestBody SanbaoSearchVO searchVO)throws Exception{

        return sanbaoInfoService.selectSanbaoAlarmInfoByKey(searchVO);

    }

    /**
     *
     * 삼보알람 동일하자 정보
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectSanbaoItems.do" , method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoAlarmItems(@RequestBody SanbaoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(sanbaoInfoService.selectSanbaoItemsByCondition(searchVO));

        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 고객정보 등록/변경 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectCustInfoRegPopup.do", method = RequestMethod.GET)
    public String selectCustInfoRegPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        //소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        //공통코드 : 고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //메인연락방식
        model.addAttribute("prefContactMthCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));

        return "/ser/cmm/popup/selectCustInfoRegPopup";
    }



    /**
     * DCS 켐페인 사용 이 조회 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectCampaignInfoOfDcsPopup.do", method = RequestMethod.GET)
    public String selectCampaignInfoOfDcsPopup(Model model) throws Exception {

        return "/ser/cmm/popup/selectCampaignInfoOfDcsPopup";
    }

    /**
     * DCS 켐페인 사용 이력 조회 data Searching
     * @param VehOfCustInfoSearchVO - 조회 조건을 포함하는 vehOfCustInfoSearchVO
     * @return
     */
    @RequestMapping(value="/ser/cmm/vehOfCampaginInfo/selectDcsVehicleCampaginInfo.do", method = RequestMethod.POST)
    public @ResponseBody List<DcsCampaignOfVinVO> selectDcsVehicleCampaginInfo(@RequestBody DcsCampaignOfVinSearchVO searchVO)throws Exception{

        List<DcsCampaignOfVinVO> result = dcsVehicleCampaginInfoService.dcsVehicleCampaginInfo(searchVO);

        return result;
    }


    /**
     * 삼포 기술자문 조회 팝업
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectSanbaoTechApproveSearchPopup.do", method = RequestMethod.GET)
    public String selectSanbaoTechApproveSearchPopup(Model model) throws Exception {


        return "/ser/cmm/popup/selectSanbaoTechApproveSearchPopup";
    }

    /**
     * 클레임 반송 원인 조회 팝업
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectClaimRequestReturnPopup.do", method = RequestMethod.GET)
    public String selectClaimRequestReturnPopup(Model model) throws Exception {

        //클레임 상태
        model.addAttribute("claimStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER090", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/ser/cmm/popup/selectClaimRequestReturnPopup";
    }

    /**
     * 클레임 반송 원인 조회 팝업
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectClaimRequestReturns.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimRequestReturns(@RequestBody ClaimReqSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(claimRequestService.selectClaimRequestReturnByCondition(searchVO));

        return result;
    }

    /**
     * 할인정보 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectDcRatePopup.do", method = RequestMethod.GET)
    public String selectDcRatePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
        //할인권한구분
        model.addAttribute("dcPermTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER922", null, langCd));
        //할인구분
        model.addAttribute("dsDistCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/ser/cmm/popup/selectDcRatePopup";
    }

    /**
     *
     * 삼포반품 승인 조회 팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectSanbaoReturnApprovePopup.do",method=RequestMethod.GET)
    public String selectSanbaoReturnApproveMain(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 공통코드 : 반품구분
        model.addAttribute("returnTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER212", null, langCd));

        // 공통코드 : 상태
        model.addAttribute("returnStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER213", null, langCd));

        // 공통코드 : 신청구분
        model.addAttribute("reqDstinTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER217", null, langCd));

        return "/ser/cmm/popup/selectSanbaoReturnApprovePopup";
    }

    /**
     * 삼포 반품승인 조회 팝업
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectSanbaoReturnApprovePopups.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoReturnApprovePopups(@RequestBody SanbaoReturnSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(sanbaoReturnRequestService.selectSanbaoReturnApproveByConditionCnt(searchVO));
        if(result.getTotal() != 0)
            result.setData(sanbaoReturnRequestService.selectSanbaoReturnApproveByCondition(searchVO));

        return result;
    }

    /**
     * 서비스 공통용 : 딜러회원 정보 조회
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectDealerMemberShipInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public MembershipVO selectDealerMemberShipInfo(@RequestBody MembershipSearchVO searchVO)throws Exception{

        MembershipVO result = membershipSupportService.selectMembershipInfoByKey(searchVO);

        if(result == null){
            result = new MembershipVO();
        }

        return result;

    }

    /**
     * 멤버십 가입정보를 조회한다
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectMembershipJoinInfo.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipJoinInfo(@RequestBody MembershipSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(result.getTotal());
        result.setData(membershipSupportService.selectMembershipJoinCondition(searchVO));

        return result;
    }

    /**
     * 서비스 공통용 : 블루멤버스회원 정보 조회
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectBuleMemeberInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfInfoRapVO selectBuleMemeberInfo(@RequestBody BlueMembershipJoinVO searchVO)throws Exception{

        BlueMembershipIfInfoRapVO result = blueMembershipJoinSupportService.selectMemberUserIntegralInfo(searchVO);

        return result;

    }

    /**
     * 서비스 공통용 : 블루멤버스회원 정보 조회
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    @SuppressWarnings("null")
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectBuleMemeberInfoList.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBuleMemeberInfoList(@RequestBody BlueMembershipJoinVO searchVO)throws Exception{

        BlueMembershipIfInfoRapVO bmInfoRapVO = blueMembershipJoinSupportService.selectMemberUserIntegralInfo(searchVO);

        SearchResult result = new SearchResult();

        List<BlueMembershipIfInfoVO> bmInfoList= null;

        bmInfoList.add(0, bmInfoRapVO.getData());
        result.setTotal(1);
        result.setData(bmInfoList);

        return result;
   }

    /**
     * 서비스 공통용 : 블루멤버스 포인트 사용
     * @param vehOfCustInfoVO - 조회 조건을 포함하는 VehOfCustInfoVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/updateBuleMemeberInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public int updateBuleMemeberInfo(@RequestBody BlueMembershipJoinVO blueMemberSaveVO, BindingResult bindingResult)throws Exception{

        blueMembershipJoinSupportService.insertAddMembersConsume(blueMemberSaveVO);

        return 1;
    }

    /**
     * 서비스 공통용 : 차량정보 수정
     * @param vehOfCustInfoVO - 조회 조건을 포함하는 VehOfCustInfoVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/updateVinMasterInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public int updateVinMasterInfo(@RequestBody VehOfCustInfoVO vehOfCustInfoVO)throws Exception{

        /** 차량마스터 update
         *  VehicleMasterVO   -->  VehicleMasterSaveVO 바뀜.   09.29 kim yewon
         * **/
        VehicleMasterSaveVO masterSaveVO = new VehicleMasterSaveVO();
        VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

        vehicleMasterVO.setCarId(vehOfCustInfoVO.getCarId());
        vehicleMasterVO.setCarRegNo(vehOfCustInfoVO.getCarRegNo());
        vehicleMasterVO.setCarBrandCd(vehOfCustInfoVO.getCarBrandCd());
        vehicleMasterVO.setCarRunDistVal(vehOfCustInfoVO.getCarRunDistVal());
        vehicleMasterVO.setCarDispQty(vehOfCustInfoVO.getCarDispQty());
        vehicleMasterVO.setManufactYyMmDt(vehOfCustInfoVO.getManufactYyMmDt());
        //vehicleMasterVO.setModelNm(modelNm);

        vehicleMasterVO.setUpdtUsrId(LoginUtil.getUserId());

        masterSaveVO.setVehicleMasterVO(vehicleMasterVO);
        vehicleMasterService.saveVehicleMasterMain(masterSaveVO);

        return 1;
    }

    /**
     * 할인정보 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectShareStockGiItemPopup.do", method = RequestMethod.GET)
    public String selectShareStockGiItemPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // ABC Class 공통코드정보 조회.
        AbcClassSearchVO abcClassSearchVO = new AbcClassSearchVO();
        abcClassSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        abcClassSearchVO.setsUseYn("Y");

        model.addAttribute("abcIndList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        model.addAttribute("prcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));

        return "/par/cmm/selectShareStockGiItemPopup";
    }

    /**
     *
     * 기타사항 팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectEtcIssuePopup.do",method=RequestMethod.GET)
    public String selectEtcIssuePopup(Model model)throws Exception{

        return "/ser/cmm/popup/selectEtcIssuePopup";
    }

    /**
     * DCS Vehicle data Searching
     * @param VehOfCustInfoSearchVO - 조회 조건을 포함하는 vehOfCustInfoSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectDcsVehicleInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcsVehicleInfo(@RequestBody VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(vehOfCustInfoService.verifyDcsVinMasterInfo(vehOfCustInfoSearchVO));

        return result;
    }

    /**
     * DCS Vehicle data Save
     * @param VehOfCustInfoSearchVO - 조회 조건을 포함하는 vehOfCustInfoSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/insertDcsVehicleInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public String insertDcsVehicleInfo(@RequestBody VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception{

        VehicleMasterSearchVO searchVO = new VehicleMasterSearchVO();
        //searchVO.setsDlrCd("A07AA");
        searchVO.setsVinNo(vehOfCustInfoSearchVO.getsVinNo());

        List<VehicleMasterVO> vehicleMasterList = vehicleMasterService.selectDcsVehicleInfoGathering(searchVO);

        String vinNo = "";
        for(VehicleMasterVO vehicleMasterVO : vehicleMasterList){
            vinNo = vehicleMasterVO.getVinNo();
        }

        return vinNo;
    }

    /**
     * 서비스 공통용 : 타사차량등록
     * @param saveVO - 조회 조건을 포함하는 VehicleMasterVO
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/saveNewCar.do", method=RequestMethod.POST)
    @ResponseBody
    public String saveNewCar(@RequestBody VehOfCustInfoVO vehOfCustInfoVO, BindingResult bindingResult)throws Exception{

        VehicleMasterVO saveVO = new VehicleMasterVO();
        saveVO.setCarId(vehOfCustInfoVO.getCarId());
        saveVO.setVinNo(vehOfCustInfoVO.getVinNo());
        saveVO.setCarBrandCd(vehOfCustInfoVO.getCarBrandCd());
        saveVO.setManufactYyMmDt(vehOfCustInfoVO.getManufactYyMmDt().replaceAll("-", ""));
        saveVO.setDlrCd(LoginUtil.getDlrCd());
        saveVO.setCarRegNo(vehOfCustInfoVO.getCarRegNo());
        saveVO.setTemp1(vehOfCustInfoVO.getModelNm());
        saveVO.setCarRunDistVal(vehOfCustInfoVO.getCarRunDistVal());
        saveVO.setCarStatCd("70");
        saveVO.setCarDispQty(vehOfCustInfoVO.getCarDispQty());
        saveVO.setOrdDlrCd(LoginUtil.getDlrCd());

        String carId = vehicleMasterService.saveNewCar(saveVO);

        return carId;
    }


    /**
     *
     * 사전점검 이미지  팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectImgBrowsePopup.do",method=RequestMethod.GET)
    public String selectPreChkImgPopup(Model model)throws Exception{

        return "/ser/cmm/popup/selectImgBrowsePopup";
    }

    /**
     *
     * 수납 지급 팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectServiceReceivePopup.do",method=RequestMethod.GET)
    public String selectServiceReceivePopup(Model model)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //시스탬일자
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat + " HH:mm:ss"));
        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());

        return "/ser/cmm/popup/selectServiceReceivePopup";
    }

    /**
     *
     * 정산제로 팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectPointCutPopup.do",method=RequestMethod.GET)
    public String selectPointCutPopup(Model model)throws Exception{
        return "/ser/cmm/popup/selectPointCutPopup";
    }

    /**
     *
     * 사전점검 팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectPreCheckInfoPopup.do",method=RequestMethod.GET)
    public String selectPreCheckInfoPopup(Model model)throws Exception{

        return "/ser/cmm/popup/selectPreCheckInfoPopup";
    }

    /**
     *
     * 공임 파일업로드 팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectLaborUploadPopup.do",method=RequestMethod.GET)
    public String selectLaborUploadPopup(Model model)throws Exception{

        return "/ser/cmm/popup/selectLaborUploadPopup";
    }

    /**
     *
     * 고객조회 팝업
     *
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/popup/selectServiceUserPopup.do",method=RequestMethod.GET)
    public String selectServiceUserPopup(Model model)throws Exception{

        return "/ser/cmm/popup/selectServiceUserPopup";
    }

    /**
     * 서비스 공통용 : 증서수정 여부
     * @param saveVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectAbleToEditSsnCrnNo.do", method=RequestMethod.POST)
    @ResponseBody
    public String selectAbleToEditSsnCrnNo(@RequestBody VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception{

        return customerInfoOutBoundService.selectAbleToEditSsnCrnNo(LoginUtil.getDlrCd(), vehOfCustInfoSearchVO.getsCustCd());
    }
    
    /**
     * 车辆销售日期查询
     * @param vehOfCustInfoSearchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectCustSaleDt.do", method=RequestMethod.POST)
    @ResponseBody
    public VehOfCustInfoSearchVO selectCustSaleDt(@RequestBody VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception{


    	VehOfCustInfoSearchVO vo= vehOfCustInfoService.selectCustSaleDt(vehOfCustInfoSearchVO);

        return vo;
    }
}
