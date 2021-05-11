package chn.bhmc.dms.ser.ro.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.vo.HMap;
import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.CarCheckService;
import chn.bhmc.dms.ser.ro.vo.CarCheckSaveVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.CarCheckVO;
import chn.bhmc.dms.ser.svi.service.PDIChkAtcService;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarCheckController.java
 * @Description : 차량점검 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class CarCheckController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="carCheckService")
    CarCheckService carCheckService;

    @Resource(name="pDIChkAtcService")
    PDIChkAtcService pDIChkAtcService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 차량점검 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/carCheck/selectCarCheckMain.do", method = RequestMethod.GET)
    public String selectCarCheckMain(Model model
            ,@RequestParam(value="carChkDocNo", defaultValue="") String carChkDocNo
            ,@RequestParam(value="vinNo", defaultValue="") String vinNo
            ,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        Device device = DeviceUtils.getCurrentDevice(request);
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        // 공통코드 : 예약구분
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("preFixId", "CH");

        model.addAttribute("carTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER910", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 차량점검유형
        model.addAttribute("carChkTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER961", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : 블루멤버쉽등급
        model.addAttribute("bmMemberGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        //공통코드 : 고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        //차량점검상태 코드
        model.addAttribute("carChkStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER970", null, langCd));
        //차량점검유형별 점검목록
        List<CommonCodeVO> pdiChkList501 = commonCodeService.selectCommonCodesByCmmGrpCd("SER501", null, langCd);
        List<CommonCodeVO> pdiChkList502 = commonCodeService.selectCommonCodesByCmmGrpCd("SER502", null, langCd);
        List<CommonCodeVO> pdiChkList503 = commonCodeService.selectCommonCodesByCmmGrpCd("SER503", null, langCd);
        List<CommonCodeVO> pdiChkList504 = commonCodeService.selectCommonCodesByCmmGrpCd("SER504", null, langCd);
        List<CommonCodeVO> pdiChkList505 = commonCodeService.selectCommonCodesByCmmGrpCd("SER505", null, langCd);
        List<CommonCodeVO> pdiChkList506 = commonCodeService.selectCommonCodesByCmmGrpCd("SER506", null, langCd);
        List<CommonCodeVO> pdiChkList507 = commonCodeService.selectCommonCodesByCmmGrpCd("SER507", null, langCd);
        List<CommonCodeVO> pdiChkList508 = commonCodeService.selectCommonCodesByCmmGrpCd("SER508", null, langCd);
        List<CommonCodeVO> pdiChkList509 = commonCodeService.selectCommonCodesByCmmGrpCd("SER509", null, langCd);
        List<CommonCodeVO> pdiChkList510 = commonCodeService.selectCommonCodesByCmmGrpCd("SER510", null, langCd);
        List<CommonCodeVO> pdiChkList511 = commonCodeService.selectCommonCodesByCmmGrpCd("SER511", null, langCd);
        List<CommonCodeVO> pdiChkList512 = commonCodeService.selectCommonCodesByCmmGrpCd("SER512", null, langCd);
        List<CommonCodeVO> pdiChkList513 = commonCodeService.selectCommonCodesByCmmGrpCd("SER513", null, langCd);
        List<CommonCodeVO> pdiChkList514 = commonCodeService.selectCommonCodesByCmmGrpCd("SER514", null, langCd);
        List<CommonCodeVO> pdiChkList515 = commonCodeService.selectCommonCodesByCmmGrpCd("SER515", null, langCd);
        List<CommonCodeVO> pdiChkList516 = commonCodeService.selectCommonCodesByCmmGrpCd("SER516", null, langCd);
        List<CommonCodeVO> pdiChkList517 = commonCodeService.selectCommonCodesByCmmGrpCd("SER517", null, langCd);

        model.addAttribute("pdiChk501Nm", pdiChkList501.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk502Nm", pdiChkList502.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk503Nm", pdiChkList503.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk504Nm", pdiChkList504.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk505Nm", pdiChkList505.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk506Nm", pdiChkList506.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk507Nm", pdiChkList507.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk508Nm", pdiChkList508.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk509Nm", pdiChkList509.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk510Nm", pdiChkList510.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk511Nm", pdiChkList511.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk512Nm", pdiChkList512.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk513Nm", pdiChkList513.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk514Nm", pdiChkList514.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk515Nm", pdiChkList515.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk516Nm", pdiChkList516.get(0).getCmmGrpCdNm());
        model.addAttribute("pdiChk517Nm", pdiChkList517.get(0).getCmmGrpCdNm());

        model.addAttribute("pdiChkList501", pdiChkList501);
        model.addAttribute("pdiChkList502", pdiChkList502);
        model.addAttribute("pdiChkList503", pdiChkList503);
        model.addAttribute("pdiChkList504", pdiChkList504);
        model.addAttribute("pdiChkList505", pdiChkList505);
        model.addAttribute("pdiChkList506", pdiChkList506);
        model.addAttribute("pdiChkList507", pdiChkList507);
        model.addAttribute("pdiChkList508", pdiChkList508);
        model.addAttribute("pdiChkList509", pdiChkList509);
        model.addAttribute("pdiChkList510", pdiChkList510);
        model.addAttribute("pdiChkList511", pdiChkList511);
        model.addAttribute("pdiChkList512", pdiChkList512);

        model.addAttribute("sVinNo", vinNo);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("usrId", LoginUtil.getUserId());
        model.addAttribute("usrNm", LoginUtil.getUserNm());
        model.addAttribute("carChkDocNo", carChkDocNo);
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

        return "/ser/ro/carCheck/selectCarCheckMain";

    }

    /**
     * 차량점검 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/carCheck/selectCarCheckListMain.do", method = RequestMethod.GET)
    public String selectCarCheckListMain(Model model, @RequestParam HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        // 공통코드 : 예약구분
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("preFixId", "CH");

        PDIChkAtcSearchVO searchVO = new PDIChkAtcSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsCarChkCd("02");
        model.addAttribute("pdiChkList", pDIChkAtcService.selectPDIChkAtcByCondition(searchVO));

        model.addAttribute("carTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER910", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 차량점검유형
        model.addAttribute("carChkTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER961", null, langCd));
        //차량점검상태 코드
        model.addAttribute("carChkStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER970", null, langCd));
        //공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        if (params.containsKey("sVinNo") && params.containsKey("sResvDocNo")) {
            model.addAttribute("sVinNo", (String)params.get("sVinNo"));
            model.addAttribute("sResvDocNo", (String)params.get("sResvDocNo"));
        }

        return "/ser/ro/carCheck/selectCarCheckListMain";

    }

    /**
     * 차량점검 취소 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/ro/carCheck/selectCarCheckCancelPopup.do", method = RequestMethod.GET)
    public String selectCarCheckCancelPopup(Model model , @RequestParam HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("preFixId", "CH");

        //공통코드 : 취소사유
        model.addAttribute("carCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER026", null, langCd));


        return "/ser/ro/carCheck/selectCarCheckCancelPopup";

    }

    /**
    *
    * 차량점검 항목 정보를 등록한다.
    *
    * @param saveVO - 차량점검 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/ro/carCheck/multiCarChecks.do", method=RequestMethod.POST)
   @ResponseBody
   public String multiCarChecks(@Validated @RequestBody CarCheckSaveVO saveVO)throws Exception{
       String diagDocNo = "";
       diagDocNo = carCheckService.multiCarChecks(saveVO);

       return diagDocNo;
   }


   /**
    *
    * 차량점검 항목 인도 체크 정보를 수정한다.
    *
    * @param saveVO - 차량점검 항목 인도 체크 정보를 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/ro/carCheck/updateCarCheck.do", method=RequestMethod.POST)
   @ResponseBody
   public int updateCarCheck(@Validated @RequestBody CarCheckVO carCheckVO)throws Exception{

       carCheckVO.setDlrCd(LoginUtil.getDlrCd());
       return carCheckService.updateCarCheck(carCheckVO);
   }

   /**
    *
    * 차량점검 항목 정보를 취소한다.
    *
    * @param saveVO - 차량점검 항목 삭제 정보를 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/ro/carCheck/updateCarCheckCancel.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean updateCarCheckCancel(@Validated @RequestBody CarCheckVO carCheckVO)throws Exception{

       carCheckService.updateCarCheckCancel(carCheckVO);

       return true;
   }

   /**
    *
    * 차량점검 인쇄 일자 수정한다.
    *
    * @param saveVO - 차량점검 인쇄 일자 수정 정보를 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/ro/carCheck/updateCarCheckPrint.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean updateCarCheckPrint(@Validated @RequestBody CarCheckVO carCheckVO)throws Exception{

       carCheckService.updateCarCheckPrint(carCheckVO);
       return true;
   }

   /**
    *
    * 차량점검 항목 정보를 삭제한다.
    *
    * @param saveVO - 차량점검 항목 삭제 정보를 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/ro/carCheck/deleteCarCheck.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean deleteCarCheck(@Validated @RequestBody CarCheckVO carCheckVO)throws Exception{

       return carCheckService.deleteCarCheck(carCheckVO) > 0 ? true : false;
   }

   /**
    * 예약 사전점검  정보를 조회한다.
    * Statements
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/ro/carCheck/selectCarCheckByKey.do" , method=RequestMethod.POST)
   @ResponseBody
   public CarCheckVO selectReserveInfos(@RequestBody CarCheckSearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       searchVO.setsDlrCd(dlrCd);

       CarCheckVO resultVO = carCheckService.selectCarCheckByKey(searchVO);

       if(resultVO == null){
           resultVO = new CarCheckVO();
       }

       return resultVO;
   }


   /**
   *
   * 차량점검  정보 조회
   *
   * @param searchVO - 차량점검  정보 조회
   * @return
   * @throws Exception
   */
   @RequestMapping(value="/ser/ro/carCheck/selectCarCheckList.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPreCheckListMains(@RequestBody CarCheckSearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       searchVO.setsDlrCd(dlrCd);

       SearchResult result = new SearchResult();

       result.setTotal(carCheckService.selectCarCheckListByConditionCnt(searchVO));
       if(result.getTotal() > 0){
           result.setData(carCheckService.selectCarCheckListByCondition(searchVO));
       }
       return result;
   }

   /**
    * 차량점검 정보 건수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 CarCheckSearchVO
    * @return
    */
   @RequestMapping(value="/ser/ro/carCheck/selectCarCheckListCnt.do",  method = RequestMethod.POST)
   public @ResponseBody SearchResult selectCarCheckListCnt(@RequestBody CarCheckSearchVO searchVO) throws Exception {
       SearchResult result = new SearchResult();

       result.setTotal(carCheckService.selectCarCheckListByConditionCnt(searchVO));
       return result;
   }


      /**
    * 예약 사전점검 상세  정보를 조회한다.
    * Statements
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   @RequestMapping(value="/ser/ro/carCheck/selectCarCheckDetails.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCarCheckDetails(@RequestBody CarCheckSearchVO searchVO)throws Exception{

       String dlrCd = LoginUtil.getDlrCd();
       searchVO.setsDlrCd(dlrCd);

       SearchResult result = new SearchResult();

       result.setData(carCheckService.selectCarCheckDetails(searchVO));

       result.setTotal(result.getData().size());

       return result;
   }

   /**
     * RO접수 상세 데이터 존재여부 체크
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/ser/ro/carCheck/selectCarCheckExistByKey.do",  method = RequestMethod.POST)
    public @ResponseBody Boolean selectRepairOrderExistByKey(@RequestBody CarCheckSearchVO searchVO) throws Exception {

        CarCheckVO result = carCheckService.selectCarCheckByKey(searchVO);
        return (result.getCarChkDocNo() == null )? false : true;

     }
}
