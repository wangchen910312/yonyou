package chn.bhmc.dms.mob.crm.cso.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cmm.service.CarLineInfoService;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptFailMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 판매기회 관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/mob/crm/cso/salesOpptMgmt")
@Controller
public class MobSalesOpptMgmtController extends HController {

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;

    /**
     * 영업 스케줄 관리 서비스
     */
    @Resource(name="salesActiveMgmtService")
    SalesActiveMgmtService salesActiveMgmtService;

    /**
     * marketingCampaignService
     */
    @Resource(name="marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 메시지이력 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 메시지이력 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 리드정보 서비스
     */
    @Resource(name="leadInfoService")
    LeadInfoService leadInfoService;

    /**
     * Customer Information Management Service
     */
    @Resource(name="carLineInfoService")
    CarLineInfoService carLineInfoService;

    /**
     * 판매기회 실패관리 서비스
     */
    @Resource(name="salesOpptFailMgmtService")
    SalesOpptFailMgmtService salesOpptFailMgmtService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 판매기회 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptMgmtMain.do", method = RequestMethod.GET)
    public String selectSalesOpptMgmtMain(Model model
            , @RequestParam(value="leadNo", defaultValue="") String leadNo
            , @RequestParam(value="vsitNo", defaultValue="") String vsitNo
            ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        /*********************************************************************
         *********** 내방고객 - 판매기회 연결 ( 고객정보만.. ) **********************
         *  - 해당 번호로 고객정보를 가져와서 고객정보를 set 해준다.
         *  - 리드번호 있으면 리드번호 저장
         **********************************************************************/
        if( StringUtils.isNotEmpty(vsitNo) ) {

            String custNo = null;



        }
        /*********************************************************************
         *********** 내방고객 - 판매기회 연결 ( 고객정보만.. ) **********************
         *  - 해당 번호로 고객정보를 가져와서 고객정보를 set 해준다.
         *  - 리드번호 있으면 리드번호 저장
         **********************************************************************/


        String sysDate = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("scId", mobLoginVO.getUserId());

        /******************************************************
         *********** 판매고문 그리드 및 폼 코드 **********************/
        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);
        /*********** 판매고문 그리드 및 폼 코드 **********************
         ******************************************************/

        /******************************************************
         *********** 판매기회 그리드 및 폼 코드 **********************/
        //model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));      // 판매기회단계  CRM211
        //model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));           // 판매기회출처 CRM213
        //model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));           // 성공확률 CRM212
        //model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));           // 전출상태 CRM219
        /*********** 판매기회 그리드 및 폼 코드 **********************
        ******************************************************/

        /******************************************************
         *********** 관심차 그리드 코드****************************/
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        /*********** 관심차 그리드 코드****************************
         ******************************************************/

        /******************************************************
         *********** 판매기회실패 그리드 정보 코드*******************/
        //model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));         // 실패유형 CRM220
        //model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패1급원인 CRM221
        //model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패2급원인 CRM222
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));       // 등록차량 브랜드
        /*********** 판매기회실패 그리드 정보 코드*******************
        ******************************************************//*

        *//******************************************************
         *********** 활동 탭 그리드 정보 코드************************/
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 영업활동상태코드
        /*********** 활동 탭 그리드 정보 코드************************
        ******************************************************//*

        *//******************************************************
         *********** 메시지이력 탭 그리드 정보 코드*******************/
        // 컨탭유형 : ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat ) // 활동형태랑 동일 (CRM321 : 활동형태 )
        //model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321"));        // 활동 형태
        model.addAttribute("contactBizCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM361", null, langCd));      // 컨택업무
        /*********** 메시지이력 탭 그리드 정보 코드*******************
         ******************************************************//*

        *//******************************************************
         * 고객상세정보 탭 코드 - 시작
         ******************************************************//*
         model.addAttribute("custTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM001"));
         model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023"));
         model.addAttribute("sexCdList",             commonCodeService.selectCommonCodesByCmmGrpCd("COM017"));
         model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024"));
         model.addAttribute("custHoldTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("CRM008"));

         MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
         List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
         model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);
         model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022"));
         model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038"));
         model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027"));
         model.addAttribute("addrTpList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM033"));
         model.addAttribute("purcCarBrandCdDS",      commonCodeService.selectCommonCodesByCmmGrpCd("COM019"));
         *//******************************************************
          * 고객상세정보 탭 코드 - 끝
          ******************************************************//*
*/
         String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
//         String sysDate     = DateUtil.getDate(dateFormat);
         String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -1), dateFormat);
         model.addAttribute("toDt",            sysDate);
         model.addAttribute("sevenDtBf",       sevenDtBf);


        return "/mob/crm/cso/salesOpptMgmt/selectSalesOpptMgmtMain";
    }

    /**
     * 판매기회 관리 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="selectSalesOpptMgmtsList.do", method = RequestMethod.GET)
    public String selectWorkHistoryList(Model model) throws Exception {
       return "/mob/crm/cso/salesOpptMgmt/selectSalesOpptMgmtsList";
    }


    /**
     * 판매기회 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartRegDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsEndRegDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndRegDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndRegDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;

    }


    /**
     * 관심차종 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="selectCarLineInfoList.do", method = RequestMethod.GET)
    public String selectCarLineInfoList(Model model) throws Exception {
       return "/mob/crm/cso/salesOpptMgmt/selectCarLineInfoList";
    }


    /**
     * 관심차종 정보를 조회 한다.
     * @param carLineInfoSearchVO - 관심차종
     * @return
     */
    @RequestMapping(value = "selectCarLineInfo.do", method = RequestMethod.POST)
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
     * 활동 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="selectSalesActivesList.do", method = RequestMethod.GET)
    public String selectSalesActivesList(Model model) throws Exception {
       return "/mob/crm/cso/salesOpptMgmt/selectSalesActivesList";
    }

    /**
     * 활동 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesActives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesActives(@RequestBody SalesActiveSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesActiveMgmtService.selectSalesActiveMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesActiveMgmtService.selectSalesActiveMgmtsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 활동 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="selectMsgHistorysList.do", method = RequestMethod.GET)
    public String selectMsgHistorysList(Model model) throws Exception {
       return "/mob/crm/cso/salesOpptMgmt/selectMsgHistorysList";
    }

    /**
     * 판매기회 관리 탭 - 메시지이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        // 검색조건 : dlr, ref_table_nm, key

        searchVO.setsRefTableNm("CR_0201T");
        searchVO.setsContactBizCd("03");         // 업무 구분 (고객,리드,기회,VOC,만족도,캠페인,멤버십)
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
        }

        return result;

    }


    /**
     * 실패관리 상세 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="selectSalesOpptFailDetlMgmtsList.do", method = RequestMethod.GET)
    public String selectSalesOpptFailDetlMgmtsList(Model model) throws Exception {
       return "/mob/crm/cso/salesOpptMgmt/selectSalesOpptFailDetlMgmtsList";
    }

    /**
     * 판매기회 실패관리 상세 목록 데이터를 조회한다.
     * 4.4.10.001-01
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptFailDetlMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptFailDetlMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptFailMgmtService.selectSalesOpptFailDetlMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptFailMgmtService.selectSalesOpptFailDetlMgmtsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 판매기회 히스토리 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="selectSalesOpptHistorysList.do", method = RequestMethod.GET)
    public String selectSalesOpptHistorysList(Model model) throws Exception {
       return "/mob/crm/cso/salesOpptMgmt/selectSalesOpptHistorysList";
    }

    /**
     * 판매기회 관리 탭 - 판매기회 히스토리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptHistorys(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptMgmtService.selectSalesOpptHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptMgmtService.selectSalesOpptHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 판매기회 관리 정보를 저장한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/multiSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSalesOpptMgmts(@Validated(Draft.class) @RequestBody SalesOpptMgmtSaveVO saveVO)throws Exception {

        String saleOpptNo;

        saveVO.getSalesOpptMgmtVO().setBhmcYn("N");        // TODO[이인문] BhmcYn 디폴트 값 정의
        saleOpptNo = salesOpptMgmtService.multiSalesOpptMgmts(saveVO);

        return saleOpptNo;
    }




    /*********************************************************************************************************/


    /**
    * 판매기회 관리 상세 정보를 조회한다.
    * @param TestDriveResvSearchVO searchVO
    * @return
    */
   @RequestMapping(value = "/selectSalesOpptMgmtByKey.do", method = RequestMethod.POST)
   @ResponseBody
   public SalesOpptMgmtVO selectSalesOpptMgmtByKey(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

       // TODO[이인문] 로그인 SC/ 권한 이랑 파라미터SC 권한 체크 ( 아무나 get방식으로 param 보내서 조회 하면 안되니까.. )
       SalesOpptMgmtVO vo = salesOpptMgmtService.selectSalesOpptMgmtByKey(searchVO);
       return vo;

   }






   /**
    * 판매기회 조회 메인 화면을 출력한다.
    * @return
    */
   @RequestMapping(value = "/selectSalesOpptMain.do", method = RequestMethod.GET)
   public String selectSalesOpptMain(Model model) throws Exception {

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       String sysDate = DateUtil.getDate("yyyy-MM-dd");

       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       model.addAttribute("sysDate", sysDate);
       model.addAttribute("scId", mobLoginVO.getUserId());

       UserSearchVO searchVO = new UserSearchVO();
       List<UserVO> users = userService.selectUsersByCondition(searchVO);
       model.addAttribute("users", users);
       //model.addAttribute("scIdList", scIdList);

       // 차종
       CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
       carInfoSearchVO.setUseYn("Y");                       // 사용여부
       model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

       //model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));      // 판매기회단계 CRM211
       //model.addAttribute("saleOpptStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));      // 판매기회상태 CRM215
       //model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));           // 판매기회출처 CRM213
       //model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));           // 성공확률 CRM212
       //model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));           // 전출상태 CRM219

       //model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));         // 실패유형 CRM220
       //model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패1급원인 CRM221
       //model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패2급원인 CRM222
       model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));       // 등록차량 브랜드

       model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));        // 활동 형태
       model.addAttribute("activeContCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));      // 활동 내용


       return "/crm/cso/salesOpptMgmt/selectSalesOpptMain";
   }

   /**
    * 판매기회 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/selectSalesOppts.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSalesOppts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();
       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       /******************************************
        *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
        ******************************************/
       Calendar startCal = Calendar.getInstance();
       if(searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null ){

           int year;
           int month;
           int day;

           if(searchVO.getsStartRegDt() == searchVO.getsEndRegDt()){
               // 시작일 = 종료일 동일한경우
               startCal.setTime(searchVO.getsStartRegDt());
               year = startCal.get(Calendar.YEAR);
               month = startCal.get(Calendar.MONTH);
               day = startCal.get(Calendar.DATE);
               startCal.set(year, month, day+1, 00, 00, 00);
               searchVO.setsEndRegDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
           }else if(searchVO.getsEndRegDt() != null){
               // 종료일이 있는경우
               Calendar endCal = Calendar.getInstance();
               endCal.setTime(searchVO.getsEndRegDt());
               year = endCal.get(Calendar.YEAR);
               month = endCal.get(Calendar.MONTH);
               day = endCal.get(Calendar.DATE);
               endCal.set(year, month, day+1, 00, 00, 00);
               searchVO.setsEndRegDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
           }
       }
       /******************************************
        *** 날짜 검색 조건 종료 ***********************
        ******************************************/

       searchVO.setsDlrCd(mobLoginVO.getDlrCd());

       result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
       }

       return result;

   }

   /**
    * 판매기회단계 상태를 변경한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/updateSalesOpptStep.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateSalesOpptStep(@Validated(Modify.class)@RequestBody SalesOpptMgmtVO saveVO)throws Exception {
       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       saveVO.setUpdtUsrId(mobLoginVO.getUserId());
       saveVO.setDlrCd(mobLoginVO.getDlrCd());

       salesOpptMgmtService.updateSalesOpptStep(saveVO);
       return true;

   }

   /**
    * 전출상태를 변경한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/updateTrsfStat.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateTrsfStat(@Validated(Modify.class)@RequestBody SalesOpptMgmtVO saveVO)throws Exception {

       /** TODO [이인문] SC 아이디 가져오기
        * 로그인 세션에서 영업자인지 체크후 등록시 영업자이면 scId = 아이디 / 아니면 null
        **/

       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       saveVO.setScId(mobLoginVO.getUserId());
       saveVO.setUpdtUsrId(mobLoginVO.getUserId());
       saveVO.setDlrCd(mobLoginVO.getDlrCd());        // TODO[이인문] 딜러코드

       salesOpptMgmtService.updateTrsfStat(saveVO);
       return true;

   }

   /**
    * 판매기회 관리 상태를 변경한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/updateSalesOpptFail.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateSalesOpptFail(@RequestBody String[] saleOpptNos )throws Exception {

       /** TODO [이인문] SC 아이디 가져오기
        * 로그인 세션에서 영업자인지 체크후 등록시 영업자이면 scId = 아이디 / 아니면 null
        **/
       salesOpptMgmtService.updateSalesOpptFail(saleOpptNos);

       return true;

   }

   /**
    * 판매기회 관리 상태알림 팝업 화면을 출력한다.
    * @return
    */

   @RequestMapping(value = "/selectSalesOpptStatPopup.do", method = RequestMethod.GET)
   public String selectSalesOpptMgmtPopup(Model model) throws Exception {

       return "/crm/cso/salesOpptMgmt/selectSalesOpptStatPopup";
   }

    /**
    * 판매기회 관리 실패등록 팝업 화면을 출력한다.
    * @return
    */
    @RequestMapping(value = "/selectSalesOpptFailPopup.do", method = RequestMethod.GET)
    public String selectSalesOpptFailPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //model.addAttribute("failTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));         // 실패유형 CRM220
        //model.addAttribute("failCau1CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패1급원인 CRM221
        //model.addAttribute("failCau2CdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));       // 실패2급원인 CRM222
        model.addAttribute("failBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));      // 등록차량 브랜드

        return "/crm/cso/salesOpptMgmt/selectSalesOpptFailPopup";
    }

   /**
    * 판매기회 관리 실패를 등록한다..
    * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
    * @return
    */
    @RequestMapping(value = "/insertSalesOpptFail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSalesOpptFail(@Validated @RequestBody SalesOpptFailMgmtVO saveVO)throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        saveVO.setRegUsrId(mobLoginVO.getUserId());
        saveVO.setUpdtUsrId(mobLoginVO.getUserId());

        salesOpptMgmtService.insertSalesOpptFail(saveVO);
        return true;

    }

}