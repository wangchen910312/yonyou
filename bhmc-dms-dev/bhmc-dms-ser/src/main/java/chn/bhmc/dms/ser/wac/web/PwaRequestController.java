package chn.bhmc.dms.ser.wac.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.cmp.vo.StorageVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.AbcClassSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.wac.service.PwaRequestService;
import chn.bhmc.dms.ser.wac.vo.PwaSaveVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaRequestController.java
 * @Description : PWA 요청 Controller
 * @author Ki Hyun Kwon
 * @since 2016. 2. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 5.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@Controller
public class PwaRequestController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="pwaRequestService")
    PwaRequestService pwaRequestService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    @Autowired
    RepairOrderService repairOrderService;

    @Autowired
    RateManageService rateManageService;

    /**
     * 파일관리 서비스
     */
    @Autowired
    FileMgrService fileMgrService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 품목그룹 관리 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;

    /**
     * 거래처 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
    *
    * PWA 요청 화면 메인
    *
    * @param model
    * @return PWA 요청 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaRequestMain.do" , method = RequestMethod.GET)
   public String selectPwaRequestMain(Model model
           ,@RequestParam(value="vinNo", defaultValue="") String vinNo
           ,@RequestParam(value="infoType", defaultValue="") String infoType
           ,@RequestParam(value="diagDocNo", defaultValue="") String diagDocNo
           ,@RequestParam(value="ltsModelCd", defaultValue="") String ltsModelCd
           ,@RequestParam(value="roDocNo", defaultValue="") String roDocNo)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
       VatInfoVO vatInfoVO = new VatInfoVO();
       int vatInfoCnt = 0;

       vatInfoSearchVO.setsVatId("V01");
       vatInfoSearchVO.setsVatTypeCd("ALL");

       vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

       if(vatInfoCnt == 1){
           vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
       }else{
           vatInfoVO.setVatApplyRate(0.16);
       }

       model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );
       //获取PWA 系数  需求 csr清单　62　JM 2020-2-28 
       model.addAttribute("pwaCoeD", commonCodeService.selectCommonCodesByCmmGrpCd("SER518", null, langCd));
       // PWA 유형코드
       model.addAttribute("pwaTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER100", null, langCd));
       // PWA 상태코드
       model.addAttribute("pwaStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER102", null, langCd));
       // 사용여부
       model.addAttribute("pwaCauYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER101", null, langCd));
       // 임률코드 정보
       RateManageSearchVO searchVO = new RateManageSearchVO();
       model.addAttribute("rateDs", rateManageService.selectRates(searchVO ));

       model.addAttribute("sVinNo", vinNo );
       model.addAttribute("infoType", infoType );
       model.addAttribute("roDocNo", roDocNo );
       model.addAttribute("diagDocNo", diagDocNo );
       model.addAttribute("ltsModelCd", ltsModelCd );
       model.addAttribute("vatCd", vatInfoVO.getVatApplyRate());

       return "/ser/wac/pwaReq/selectPwaRequestMain";

   }
   
   /**
    * 获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，并用是已经承认 状态的 csr清单 　62 贾明 2020-3-24  
    * @param model
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaRelateRequiSearchPopup.do" , method = RequestMethod.GET)
   public String selectPwaRelateRequiSearchPopup(Model model )throws Exception{
	   String langCd = LocaleContextHolder.getLocale().getLanguage();
	   // PWA 状态
       model.addAttribute("pwaStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER102", null, langCd));
       //是否有 PWA 主要代码
       model.addAttribute("pwaCauYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER101", null, langCd));
	   return "/ser/wac/pwaReq/selectPwaRelateRequiSearchPopup";
   }
   
   /**
    * 获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态 个数csr清单 　62 贾明 2020-3-24
    * 
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaRelateRequiConditionCnt.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaRelateRequiConditionCnt(@RequestBody PwaSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(pwaRequestService.selectPwaRelateRequiMainsByConditionCnt(searchVO));
       return result;

   }
   
  /**
   * 获取PWA 系数  需求 4，弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态的 csr清单 　62 贾明 2020-3-24
   * @param searchVO
   * @return
   * @throws Exception
   */
  @RequestMapping(value="/ser/wac/pwaReq/selectPwaRelateRequiMains.do" , method=RequestMethod.POST)
  @ResponseBody
  public SearchResult selectPwaRelateRequiMains(@RequestBody PwaSearchVO searchVO)throws Exception{

      SearchResult result = new SearchResult();

      result.setTotal(pwaRequestService.selectPwaRelateRequiMainsByConditionCnt(searchVO));

      if(result.getTotal() != 0 ){
          result.setData(pwaRequestService.selectPwaRelateRequiMainsByCondition(searchVO));
      }
      return result;

  }
  
   /**
    *
    * PWA 부품 조회 팝업 메인
    *
    * @param model
    * @return PWA 부품 조회  화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaItemSearchPopup.do" , method = RequestMethod.GET)
   public String selectPwaItemSearchPopup(Model model )throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);
        model.addAttribute("itemGroupList", itemGroupList);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       //useYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // ABC Class 공통코드정보 조회.
        AbcClassSearchVO abcClassSearchVO = new AbcClassSearchVO();
        abcClassSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        abcClassSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));

        //BMP VenderMaster VO
        VenderMasterVO venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            //BMP Info
            model.addAttribute("bpCd", venderMasterVO.getBpCd());
            model.addAttribute("bpNm", venderMasterVO.getBpNm());
            model.addAttribute("bpTp", venderMasterVO.getBpTp());
        }else{
            //Default BMP Info
            model.addAttribute("bpCd", "A10AA001");
            model.addAttribute("bpNm", "BMP");
            model.addAttribute("bpTp", "01");
        }

        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        model.addAttribute("prcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));

        //창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        model.addAttribute("giStrgeCdList", storageList);

       return "/ser/wac/pwaReq/selectPwaItemSearchPopup";

   }

   /**
    *
    * PWA 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 요청 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaRequestMains.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaRequestMains(@RequestBody PwaSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaRequestService.selectPwaRequestMainsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaRequestService.selectPwaRequestMainsByCondition(searchVO));
       }
       return result;

   }


   /**
    *
    * PWA 상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaRequestByKey.do", method=RequestMethod.POST)
   @ResponseBody
   public PwaVO selectPwaRequestByKey(@RequestBody PwaSearchVO searchVO)throws Exception{

       return pwaRequestService.selectPwaRequestByKey(searchVO);
   }

   /**
    *
    * PWA 공임 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaRequestLbrs.do", method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaRequestLbrs(@RequestBody PwaSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaRequestService.selectPwaRequestLbrsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaRequestService.selectPwaRequestLbrsByCondition(searchVO));
       }

       return result;
   }

   /**
    *
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 부품  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectPwaRequestParts.do", method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaRequestParts(@RequestBody PwaSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaRequestService.selectPwaRequestPartsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaRequestService.selectPwaRequestPartsByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * RO 공임 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectRoLabors.do", method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectRoLabors(@RequestBody TabInfoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaRequestService.selectRoLaborsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaRequestService.selectRoLaborsByCondition(searchVO));
       }

       return result;
   }

   /**
    *
    * RO 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 부품  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/selectRoParts.do", method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectRoParts(@RequestBody TabInfoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaRequestService.selectRoPartsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaRequestService.selectRoPartsByCondition(searchVO));
       }

       return result;
   }

   /**
    *
    * PWA 요청 정보를 등록한다.
    *
    * @param saveVO - PWA 요청 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/multiPwaRequests.do", method=RequestMethod.POST)
   @ResponseBody
   public String multiPwaRequests(@Validated @RequestBody PwaSaveVO saveVO)throws Exception{
       String pwaDocNo = "";
       pwaDocNo = pwaRequestService.multiPwaRequests(saveVO);

       String fileNo = saveVO.getPwaFormVO().getFileKeyNm();
       if(StringUtils.isNotBlank(fileNo)){
           fileMgrService.updateFileDocEnabled(new FileDocVO(fileNo, LoginUtil.getUserId()));
       }
       return pwaDocNo;
   }

   /**
    *
    * PWA 요청 정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/deletePwaRequests.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean deletePwaRequests(@Validated @RequestBody PwaVO pwaVO)throws Exception{

       pwaRequestService.deletePwaRequests(pwaVO);

       return true;
   }

   /**
    *
    * PWA 요청 상태정보를 수정한다.
    *
    * @param saveVO - PWA 요청 상태정보를 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/updatePwaRequestStat.do", method=RequestMethod.POST)
   @ResponseBody
   public String updatePwaRequestStat(@Validated @RequestBody PwaSaveVO saveVO)throws Exception{

       String pwaDocNo = pwaRequestService.multiPwaRequests(saveVO);

       String fileNo = saveVO.getPwaFormVO().getFileKeyNm();
       if(StringUtils.isNotBlank(fileNo)){
           fileMgrService.updateFileDocEnabled(new FileDocVO(fileNo, LoginUtil.getUserId()));
       }

       pwaRequestService.updatePwaRequestStat(saveVO.getPwaFormVO());

       return pwaDocNo;
   }


   /**
    *
    * 클레임 PWA , 반품승인 번호를 삭제 한다.
    *
    * @param saveVO - 클레임 요청 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaReq/deleteApproveNo.do" , method=RequestMethod.POST)
   @ResponseBody
   public boolean deleteApproveNo(@RequestBody PwaVO pwaVO)throws Exception{

       pwaRequestService.deleteApproveNo(pwaVO);

       return true;
   }


}
