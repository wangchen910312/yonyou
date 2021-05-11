package chn.bhmc.dms.ser.cmm.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
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
import chn.bhmc.dms.ser.wac.service.PwaApproveService;
import chn.bhmc.dms.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnApproveService;
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
     * 삼보정보 서비스
     */
    @Autowired
    SanbaoInfoService sanbaoInfoService;

    /**
     * 삼포 반품승인 서비스
     */
    @Autowired
    SanbaoReturnApproveService sanbaoReturnApproveService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    CarInfoService carInfoService;

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

       model.addAttribute("distTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER950", null, langCd));

       //브랜드 목록
       model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

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

        log.debug("selectInsurancePopup Start~");

        model.addAttribute("dlrCd",LoginUtil.getDlrCd());

        return "/ser/cmm/popup/selectInsurancePopup";
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

        // 공통코드 : BAY구분
        model.addAttribute("bayTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/ser/svi/bayManage/selectBayManagePopup";
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
     * 서비스 공통용 RO이력 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectRepairOrderSearchPopup.do", method = RequestMethod.GET)
    public String selectRepairOrderPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        model.addAttribute("preFixId", "RO");
        return "/ser/cmm/popup/selectRepairOrderSearchPopup";
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

        //품목구분
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        return "/ser/cmm/popup/selectWorkPackagePopup";
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
       model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER930", null, langCd));

       //브랜드 목록
       model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

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
     * 서비스 공통용  : 다건의  당일 예약 정보 목록  팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectVehOfReseveInfoPopup.do", method = RequestMethod.GET)
    public String selectVehOfReseveInfoPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("sysDate", DateUtil.getDate("yyyy-MM-dd"));

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));

        return "/ser/cmm/popup/selectVehOfReseveInfoPopup";
    }

    /**
     * 서비스 공통용 : 다건의 당일 예약 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfReseveInfoSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    @RequestMapping(value="/ser/cmm/vehOfCustInfo/selectVehOfReseveInfos.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehOfReseveInfos(@RequestBody VehOfReseveInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(vehOfCustInfoService.selectVehOfReseveInfoByCondition(searchVO));
        result.setTotal(result.getData().size());

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

        model.addAttribute("sysDate", DateUtil.getDate("yyyy-MM-dd"));

        return "/ser/cmm/popup/selectVehOfPartReserveInfoPopup";
    }

    /**
     * 고객정보를 등록/수정 한다.
     * @param saveVO - 고객정보 등록/수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/cmm/vehOfCustInfo/multiVehOfCustInfo.do", method = RequestMethod.POST)
    public @ResponseBody int multiVehOfCustInfo(@Validated @RequestBody VehOfCustInfoVO vehOfCustInfoVO, BindingResult bindingResult) throws Exception {

        vehOfCustInfoService.multiVehOfCustInfo(vehOfCustInfoVO);

        return 1;

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
     * PWA 이력 조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectPwaHistorySearchPopup.do", method = RequestMethod.GET)
    public String selectPwaHistorySearchPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        // PWA 유형코드
        model.addAttribute("pwaTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER100", null, langCd));
        // PWA 상태코드
        model.addAttribute("pwaStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER102", null, langCd));

        return "/ser/cmm/popup/selectPwaHistorySearchPopup";
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

        // 부품그룹 코드
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


        return "/ser/cmm/popup/selectCustInfoRegPopup";
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
     * 할인정보 팝업화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ser/cmm/popup/selectDcRatePopup.do", method = RequestMethod.GET)
    public String selectDcRatePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
        //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER904", null, langCd));
        //할인구분
        model.addAttribute("dsDistCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        //딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

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

       result.setTotal(sanbaoReturnApproveService.selectSanbaoReturnApproveByConditionCnt(searchVO));
       if(result.getTotal() != 0)
       result.setData(sanbaoReturnApproveService.selectSanbaoReturnApproveByCondition(searchVO));

       return result;
   }

   /**
    * 서비스 공통용 RO이력 팝업 화면을 출력한다.
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
       // 공통코드 : 지불방식
       model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));
       // 공통코드 : 지불기한
       model.addAttribute("paymPridCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));
       // 수리유형(정비유형)
       model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER901", null, langCd));
       model.addAttribute("preFixId", "RO");
       return "/ser/cmm/popup/selectRepairOrderSearchPopupHistory";
   }


}
