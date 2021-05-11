package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.NpnPartSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.wac.service.ClaimRequestService;
import chn.bhmc.dms.ser.wac.service.SanbaoBaseService;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSaveVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimRequestController.java
 * @Description : 클레임 청구 컨트롤러
 * @author Kwon Ki Hyun
 * @since 2016. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class ClaimRequestController extends HController{


    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="claimRequestService")
    ClaimRequestService claimRequestService;

    @Autowired
    SanbaoBaseService sanbaoBaseService;

    @Autowired
    RateManageService rateManageService;

    @Autowired
    ServicePartService servicePartService;

    /**
     * 파일관리 서비스
     */
    @Autowired
    FileMgrService fileMgrService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    @Autowired
    ServiceCommonService serviceCommonService;

    /**
    *
    * 클레임 요청 화면 메인
    *
    * @param model
    * @return 클레임 요청 화면
    * @throws Exception
    *
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestMain.do" , method=RequestMethod.GET)
   public String selectclaimRequestMain(Model model
           ,@RequestParam(value="claimDocNo", defaultValue="") String claimDocNo
           ,@RequestParam(value="roDocNo", defaultValue="") String roDocNo
           ,@RequestParam(value="vinNo", defaultValue="") String vinNo
           ,HttpServletRequest request)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       Device device = DeviceUtils.getCurrentDevice(request);
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("dlrCd", LoginUtil.getDlrCd());

       model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

       //클레임유형
       model.addAttribute("claimTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER091", null, langCd));
       //캠페인 유형
       model.addAttribute("campaignTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
       //클레임 상태
       model.addAttribute("claimStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER090", null, langCd));
       //RO 유형
       model.addAttribute("roTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

/*       CommonCodeSearchVO searchVO = new CommonCodeSearchVO();
       searchVO.setsCmmGrpCd("SER031");
       model.addAttribute("roWTpDs", commonCodeService.selectCommonCodesByLang(searchVO));*/
       //RO 상태
       model.addAttribute("roStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
       //외주구분
       model.addAttribute("subDstinDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER093", null, langCd));
       //이전부품유형
       model.addAttribute("asPartDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER094", null, langCd));
       //주작업여부
       model.addAttribute("cauYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER101", null, langCd));
       //클레임조회조건
       model.addAttribute("searchTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER095", null, langCd));
       //사용여부
       model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));


       //임률코드 정보
       RateManageSearchVO searchVO = new RateManageSearchVO();
       model.addAttribute("rateDs", rateManageService.selectRates(searchVO));

       //삼보기준정책 RO 작업시간
       model.addAttribute("roWorkTimeDs", sanbaoBaseService.selectSanbaoBaseByKey("05"));


       model.addAttribute("claimDocNo", claimDocNo);
       model.addAttribute("claimYn", LoginUtil.getClaimYn());
       model.addAttribute("sVinNo", vinNo);
       model.addAttribute("roDocNo", roDocNo);
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
       // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
       model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

       return "/ser/wac/claimReq/selectClaimRequestMain";

   }

   /**
    *
    * 클레임 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForRo.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForRo(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimRequestService.selectClaimRequestForRoByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(claimRequestService.selectClaimRequestForRoByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * 클레임 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForClaim.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForClaim(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();


       result.setTotal(claimRequestService.selectClaimRequestForClaimByConditionCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(claimRequestService.selectClaimRequestForClaimByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * 클레임 요청 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 상세 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForRoByKey.do", method=RequestMethod.POST)
   @ResponseBody
   public ClaimReqVO selectClaimRequestForRoByKey(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       return claimRequestService.selectClaimRequestForRoByKey(searchVO);
   }

   /**
    *
    * GoodWill 클레임 요청 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 상세 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForRoGoodWillByKey.do", method=RequestMethod.POST)
   @ResponseBody
   public ClaimReqVO selectClaimRequestForRoGoodWillByKey(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       return claimRequestService.selectClaimRequestForRoGoodWillByKey(searchVO);
   }

   /**
    *
    * 클레임 요청 공임 RO 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 공임 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForRoLabour.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForRoLabour(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimRequestService.selectClaimRequestForRoLabourByConditionCnt(searchVO));
       if(result.getTotal() != 0 ){
           result.setData(claimRequestService.selectClaimRequestForRoLabourByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * 클레임 요청 RO 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForRoPart.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForRoPart(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimRequestService.selectClaimRequestForRoPartByConditionCnt(searchVO));
       if(result.getTotal() != 0 ){
           result.setData(claimRequestService.selectClaimRequestForRoPartByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * 클레임 요청 NPN 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectNpnParts.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectNpnParts(@RequestBody NpnPartSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       //NpnPartSearchVO searchVO = new NpnPartSearchVO();
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
       if(searchVO.getsClaimDt() == null){
           searchVO.setsClaimDt( DateUtil.convertToDate(DateUtil.getDate(dateFormat)));
       }
       searchVO.setsClaimDt(searchVO.getsClaimDt());

/*
       List<NpnPartVO> npnpList = serviceCommonService.selectNpnPartByCondition(npnSearchVO);
       for(NpnPartVO npnPartVO : npnpList){
           ClaimReqPartVO partVO = new ClaimReqPartVO();

           partVO.setItemCd(npnPartVO.getNpnpPartNo());
           partVO.setItemNm(npnPartVO.getNpnpPartNm());
           partVO.setItemQty(1.00);
           partVO.setSaleUnitCd("EA");
           partVO.setItemPrc(npnPartVO.getNpnpMaxUnitAmt());
           partVO.setItemAmt(npnPartVO.getNpnpMaxUnitAmt());
           partVO.setNpnpMaxAmt(npnPartVO.getNpnpMaxPerAmt());
           partVO.setNpnpYn(npnPartVO.getNpnpYn());
           claimReqPartListVO.add(partVO);
       }*/

       /*Collections.sort(claimReqPartListVO , new Comparator<ClaimReqPartVO>(){
           public int compare(ClaimReqPartVO partVO1 , ClaimReqPartVO partVO2){
               return partVO1.getItemCd().compareToIgnoreCase(partVO2.getItemCd());
           }
       });*/

       result.setData(serviceCommonService.selectNpnPartByCondition(searchVO));
       result.setTotal(result.getData().size());

       return result;

   }

   /**
    *
    * GoodWill 클레임 요청 공임 RO 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 공임 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForRoGoodWillLabour.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForRoGoodWillLabour(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimRequestService.selectClaimRequestForRoGoodWillLabourByConditionCnt(searchVO));
       if(result.getTotal() != 0 ){
           result.setData(claimRequestService.selectClaimRequestForRoGoodWillLabourByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * Goodwill 클레임 요청 RO 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForRoGoodWillPart.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForRoGoodWillPart(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(claimRequestService.selectClaimRequestForRoGoodWillPartByConditionCnt(searchVO));
       if(result.getTotal() != 0 ){
           result.setData(claimRequestService.selectClaimRequestForRoGoodWillPartByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * 등록된 클레임 요청 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 상세 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForClaimByKey.do", method=RequestMethod.POST)
   @ResponseBody
   public ClaimReqVO selectClaimRequestForClaimByKey(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       return claimRequestService.selectClaimRequestForClaimByKey(searchVO);
   }

   /**
    *
    * 등록된 클레임 요청 공임 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 공임 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForClaimLabour.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForClaimLabour(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(claimRequestService.selectClaimRequestForClaimLabourByCondition(searchVO));
       result.setTotal(result.getData().size());

       return result;

   }

   /**
    *
    * 등록된 클레임 요청 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForClaimPart.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectClaimRequestForClaimPart(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setData(claimRequestService.selectClaimRequestForClaimPartByCondition(searchVO));
       result.setTotal(result.getData().size());

       return result;

   }
   
   /**
   *
   * 索赔申请页面客户主诉信息查询.
   *
   * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
   * @return 클레임 요청 부품 목록 데이터
   * @throws Exception
   */
  @RequestMapping(value="/ser/wac/claimReq/selectClaimRequestForClaimCustRemark.do" , method=RequestMethod.POST)
  @ResponseBody
  public SearchResult selectClaimRequestForClaimCustRemark(@RequestBody ClaimReqSearchVO searchVO)throws Exception{

      SearchResult result = new SearchResult();

      result.setData(claimRequestService.selectClaimRequestForClaimCustRemarkByCondition(searchVO));
      result.setTotal(result.getData().size());

      return result;

  }

   /**
    *
    * 클레임 요청  정보를 등록/수정 한다.
    *
    * @param saveVO - 클레임 요청 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/multiClaimRequests.do" , method=RequestMethod.POST)
   @ResponseBody
   public String multiClaimRequests(@RequestBody ClaimReqSaveVO saveVO)throws Exception{

       String claimDocNo = claimRequestService.multiClaimRequests(saveVO);

       String fileNo = saveVO.getClaimReqVO().getFileKeyNm();
       if(StringUtils.isNotBlank(fileNo)){
           fileMgrService.updateFileDocEnabled(new FileDocVO(fileNo, LoginUtil.getUserId()));
       }

       return claimDocNo;
   }

   /**
    *
    * 클레임 요청  정보를 수정 한다.
    *
    * @param saveVO - 클레임 요청 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/updateClaimRequest.do" , method=RequestMethod.POST)
   @ResponseBody
   public boolean updateClaimRequest(@RequestBody ClaimReqVO claimReqVO)throws Exception{

       claimRequestService.updateClaimRequest(claimReqVO);

       return true;
   }


  /**
  *
  * 클레임 부품 정보 ITEM_SALE_PRC 비교 및 수정.
  * true : SE_0160T ITEM_SALE_PRC = 0, PT_0214T BMP_PURC_PRC로 수정
  * false: SE_0160T ITEM_SALE_PRC != 0, 수정 없이, return
  * @param searchVO - 클레임 요청 수정 목록을 포함하는 ClaimReqSearchVO
  * @return true || false
  * @throws Exception
  */
  @RequestMapping(value="/ser/wac/claimReq/itemSalePrcJudgeUpdate.do" , method=RequestMethod.POST)
  @ResponseBody
  public void itemSalePrcJudgeUpdate(@RequestBody ClaimReqSearchVO claimReqSearchVO)throws Exception{

      SearchResult result = new SearchResult();

      result.setTotal(claimRequestService.selectClaimRequestForRoPartByConditionCnt(claimReqSearchVO));
      if(result.getTotal() != 0 )
          claimRequestService.itemSalePrcJudgeUpdate(claimReqSearchVO);
  }





   /**
    *
    * 클레임 PWA , 반품승인 번호를 삭제 한다.
    *
    * @param saveVO - 클레임 요청 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/claimReq/deleteApproveNo.do" , method=RequestMethod.POST)
   @ResponseBody
   public boolean deleteApproveNo(@RequestBody ClaimReqVO claimReqVO)throws Exception{

       claimRequestService.deleteApproveNo(claimReqVO);

       return true;
   }


   /**
     * 출고되지 않은 부품 확인
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/wac/claimReq/partGiQtyCheck.do",  method = RequestMethod.POST)
    public @ResponseBody boolean partGiQtyCheck(@RequestBody TabInfoSearchVO searchVO) throws Exception {

        boolean result = servicePartService.partGiQtyCheck(searchVO);

        return result;

    }



}
