package chn.bhmc.dms.mob.crm.cso.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtVO;

import chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService;

import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.TraceGradeMgmtService;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
/**
 * 판매기회프로세스 관리 컨트롤러
 *
 * @author kyo jin lee
 * @since 2016.07.10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.10         kyo jin lee            최초 생성
 * </pre>
 */

//@RequestMapping("/crm/cso/salesOpptProcessMgmt")
@Controller
public class MobSalesOpptProcessMgmtController extends HController {

    /**
     * CRM 공통 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 판매기회프로세스 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /**
     * 전시장 관리 서비스
     */
    @Resource(name="salesOpptShowRoomMgmtService")
    SalesOpptShowRoomMgmtService salesOpptShowRoomMgmtService;

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
     * 고객정보 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 판매기회 정보유입 서비스
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * IDCC Role 서비스
     */
    @Resource(name="idccRoleMgmtService")
    IdccRoleMgmtService idccRoleMgmtService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 추적등급 설정관리 서비스
     */
    @Resource(name="traceGradeMgmtService")
    TraceGradeMgmtService traceGradeMgmtService;

    /**
     * 판매기회프로세스 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtMain.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtMain(Model model
            , @RequestParam(value="custNo", defaultValue="") String custNo
            , @RequestParam(value="leadStatCd", defaultValue="") String leadStatCd
            ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("scId", mobLoginVO.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("leadStatCd", leadStatCd);
        model.addAttribute("custNo", custNo);
        /**
         * TODO에서 링크를 통해 왔을 경우 팝업을 호출하기 위한 값을 셋팅 한다.
         */
        if (StringUtils.isNotEmpty(custNo)){
            SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
            salesOpptProcessMgmtSearchVO.setsCustNo(custNo);
            SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByKey(salesOpptProcessMgmtSearchVO);

            model.addAttribute("leadStatCd", salesOpptProcessMgmtVO.getLeadStatCd());
            model.addAttribute("befLeadStatCd", salesOpptProcessMgmtVO.getBefLeadStatCd());
            model.addAttribute("salesOpptSeq", salesOpptProcessMgmtVO.getSeq());
            model.addAttribute("showRoomSeq", salesOpptProcessMgmtVO.getSeq());
            model.addAttribute("exhvFlakSeq", salesOpptProcessMgmtVO.getExhvFlakSeq());
        }


        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String fromDt   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -60), dateFormat);
        String fromDtNow   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, 0), dateFormat);

        fromDt = fromDt.substring(0, 8) + "01";
        fromDtNow = fromDtNow.substring(0, 8) + "01";

        model.addAttribute("toDt",            sysDate);
        model.addAttribute("fromDt",       fromDt);
        model.addAttribute("fromDtNow",       fromDtNow);



        /******************************************************
         *********** 판매기회프로세스 검색창 코드 시작 **********************/

     // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태코드 leadStatCd (CRM375)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));  // 추적방식 commMthCd (CRM321)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        model.addAttribute("rvsitYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM380", null, langCd));  // 재방문유형

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));
        /*********** 판매기회프로세스 검색창 코드 끝 **********************
         ******************************************************/

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());


        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectSalesOpptProcessMgmtMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 판매기회프로세스 관리 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtList.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtList(Model model, @RequestParam(value="btnLeadStatCd", defaultValue="") String btnLeadStatCd ) throws Exception {

        String template= btnLeadStatCd.equals("01") ? "list-template" : "list-template2";
        model.addAttribute("template", template);
        return "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtList";
    }


    /**
     * 판매기회프로세스 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptProcessMgmt(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsRegDtFrom() == searchVO.getsRegDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsRegDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsRegDtTo() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsRegDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        result.setTotal(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 판매기회프로세스 관리 전시장흐름 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomList.do", method = RequestMethod.GET)
    public String selectSalesOpptShowRoomList(Model model) throws Exception {
        return "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomList";
    }


    /**
     * 판매기회프로세스 관리 전시장흐름 신규등록화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectNewSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String __selectNewSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10648", null, "READ,SEARCHIND", null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      //users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));


        // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptShowRoomPopup";
    }

    /**
     * 판매기회프로세스 관리 전시장흐름 신규등록화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectNewSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10648", null, "READ,SEARCHIND", null);
        List<UserVO> users = new ArrayList<UserVO>();
        users.addAll(usersRoleCrmR03);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));


        // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectNewSalesOpptShowRoomPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * 판매기회프로세스 관리 전시장흐름 수정화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectEditSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      //users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectEditSalesOpptShowRoomPopup.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * 전시장유동량 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptShowRoomMgmt(@RequestBody SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsRegDtFrom() == searchVO.getsRegDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsRegDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsRegDtTo() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsRegDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        Calendar vistCal = Calendar.getInstance();
        if(searchVO.getsVsitDtFrom()!= null || searchVO.getsVsitDtTo() != null ){

            int vistYear;
            int vistMonth;
            int vistDay;

            if(searchVO.getsVsitDtFrom() == searchVO.getsVsitDtTo()){
                // 시작일 = 종료일 동일한경우
                vistCal.setTime(searchVO.getsVsitDtFrom());
                vistYear = vistCal.get(Calendar.YEAR);
                vistMonth = vistCal.get(Calendar.MONTH);
                vistDay = vistCal.get(Calendar.DATE);
                vistCal.set(vistYear, vistMonth, vistDay+1, 00, 00, 00);
                searchVO.setsVsitDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsVsitDtTo() != null){
                // 종료일이 있는경우
                Calendar vistEndCal = Calendar.getInstance();
                vistEndCal.setTime(searchVO.getsVsitDtTo());
                vistYear = vistEndCal.get(Calendar.YEAR);
                vistMonth = vistEndCal.get(Calendar.MONTH);
                vistDay = vistEndCal.get(Calendar.DATE);
                vistEndCal.set(vistYear, vistMonth, vistDay+1, 00, 00, 00);
                searchVO.setsVsitDtTo(vistEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        result.setTotal(salesOpptShowRoomMgmtService.selectSalesOpptShowRoomMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptShowRoomMgmtService.selectSalesOpptShowRoomMgmtsByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmtSummary.do", method = RequestMethod.POST)
    @ResponseBody
    public SalesOpptShowRoomMgmtVO selectSalesOpptShowRoomMgmtSummary(@RequestBody SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsRegDtFrom() == searchVO.getsRegDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsRegDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsRegDtTo() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsRegDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        Calendar vistCal = Calendar.getInstance();
        if(searchVO.getsVsitDtFrom()!= null || searchVO.getsVsitDtTo() != null ){

            int vistYear;
            int vistMonth;
            int vistDay;

            if(searchVO.getsVsitDtFrom() == searchVO.getsVsitDtTo()){
                // 시작일 = 종료일 동일한경우
                vistCal.setTime(searchVO.getsVsitDtFrom());
                vistYear = vistCal.get(Calendar.YEAR);
                vistMonth = vistCal.get(Calendar.MONTH);
                vistDay = vistCal.get(Calendar.DATE);
                vistCal.set(vistYear, vistMonth, vistDay+1, 00, 00, 00);
                searchVO.setsVsitDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsVsitDtTo() != null){
                // 종료일이 있는경우
                Calendar vistEndCal = Calendar.getInstance();
                vistEndCal.setTime(searchVO.getsVsitDtTo());
                vistYear = vistEndCal.get(Calendar.YEAR);
                vistMonth = vistEndCal.get(Calendar.MONTH);
                vistDay = vistEndCal.get(Calendar.DATE);
                vistEndCal.set(vistYear, vistMonth, vistDay+1, 00, 00, 00);
                searchVO.setsVsitDtTo(vistEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        return salesOpptShowRoomMgmtService.selectSalesOpptShowRoomSummaryCntByCondition(searchVO);
    }

    /**
     * 판매기회프로세스 관리 전시장흐름 step04를 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectStep04NextSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10649", null, "READ,SEARCHIND", null);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10648", null, "READ,SEARCHIND", null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> holdDetlTpSeqList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStep04NextSalesOpptShowRoomPopup.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    ///mob/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptShowRoomPopup.jsp
    /**
     * Step4의 다음단계 팝업 (전시장)
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectStep04PrevSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10649", null, "READ,SEARCHIND", null);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10648", null, "READ,SEARCHIND", null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStep04PrevSalesOpptShowRoomPopup.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateP";

    }

    /**
     * 추적기록 리스트 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmtList.do", method = RequestMethod.GET)
    public String selectSalesOpptTraceMgmtList(Model model) throws Exception {
        return "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmtList";
    }

    /**
     * 회전기록 리스트 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHistList.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtHist(Model model) throws Exception {

        return "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHistList";
    }

    /**
     * 고객등록 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectNewSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String __selectNewSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10649", null, "READ,SEARCHIND", null);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10648", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptProcessPopup";
    }
    /**
     * 고객등록 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectNewSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10649", null, "READ,SEARCHIND", null);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10648", null, Constants.PERMISSION_READ, null);

        List<UserVO> users = new ArrayList<UserVO>();
        users.addAll(usersRoleCrmR03);
        users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectNewSalesOpptProcessPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * 고객등록 팝업 화면을 출력한다. (수정용)
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectEditSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String __selectEditSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

       List<UserVO> users = new ArrayList<UserVO>();
       users.addAll(usersRoleCrmR03);
       users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 추적등급 설정
        TraceGradeMgmtSearchVO traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();
        int traceGrdCnt = traceGradeMgmtService.selectTraceGradeMgmtsByCnt(traceGradeMgmtSearchVO);
        if (traceGrdCnt > 0){
            List<TraceGradeMgmtVO> traceGrdList = traceGradeMgmtService.selectTraceGradeMgmts(traceGradeMgmtSearchVO);
            model.addAttribute("traceGrdList", traceGrdList);
        }

     // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup";
    }

    /**
     * 고객등록 팝업 화면을 출력한다. (수정용)
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        List<UserVO> users = new ArrayList<UserVO>();
        users.addAll(usersRoleCrmR03);
        users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 추적등급 설정
        TraceGradeMgmtSearchVO traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();
        int traceGrdCnt = traceGradeMgmtService.selectTraceGradeMgmtsByCnt(traceGradeMgmtSearchVO);
        if (traceGrdCnt > 0){
            List<TraceGradeMgmtVO> traceGrdList = traceGradeMgmtService.selectTraceGradeMgmts(traceGradeMgmtSearchVO);
            model.addAttribute("traceGrdList", traceGrdList);
        }

     // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectEditSalesOpptProcessPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";

        //return "/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup";
    }


    /**
     * 추적추가 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectSalesOpptProcessMgmtActivePopup.do", method = RequestMethod.GET)
    public String __selectSalesOpptProcessMgmtActivePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

     // 추적등급 설정
        TraceGradeMgmtSearchVO traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();
        int traceGrdCnt = traceGradeMgmtService.selectTraceGradeMgmtsByCnt(traceGradeMgmtSearchVO);
        if (traceGrdCnt > 0){
            List<TraceGradeMgmtVO> traceGrdList = traceGradeMgmtService.selectTraceGradeMgmts(traceGradeMgmtSearchVO);
            model.addAttribute("traceGrdList", traceGrdList);
        }

        return "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtActivePopup";
    }

    /**
     * 추적추가 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtActivePopup.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtActivePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

     // 추적등급 설정
        TraceGradeMgmtSearchVO traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();
        int traceGrdCnt = traceGradeMgmtService.selectTraceGradeMgmtsByCnt(traceGradeMgmtSearchVO);
        if (traceGrdCnt > 0){
            List<TraceGradeMgmtVO> traceGrdList = traceGradeMgmtService.selectTraceGradeMgmts(traceGradeMgmtSearchVO);
            model.addAttribute("traceGrdList", traceGrdList);
        }

        //return "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtActivePopup";
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectSalesOpptProcessMgmtActivePopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * Step1의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectStep01NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String __selectStep01NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectStep01NextSalesOpptProcessPopup";
    }

    /**
     * Step1의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep01NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep01NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStep01NextSalesOpptProcessPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * Step2의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectStep02NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String __selectStep02NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 당직사용여부
        //String onDutyYn = systemConfigInfoService.selectStrValueByKey("onDutyYn");
        String onDutyYn = LoginUtil.getOnDutyYn();
        model.addAttribute("onDutyYn", onDutyYn);

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectStep02NextSalesOpptProcessPopup";
    }
    /**
     * Step2의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep02NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep02NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 당직사용여부
        //String onDutyYn = systemConfigInfoService.selectStrValueByKey("onDutyYn");
        String onDutyYn = LoginUtil.getOnDutyYn();
        model.addAttribute("onDutyYn", onDutyYn);

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStep02NextSalesOpptProcessPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }
    /**
     * Step3의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectStep03NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String __selectStep03NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectStep03NextSalesOpptProcessPopup";
    }
    /**
     * Step3의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep03NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep03NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStep03NextSalesOpptProcessPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }
    /**
     * Step4의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep04NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStep04NextSalesOpptProcessPopup.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * Step4의 전출단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextFailSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep04NextFailSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectStep04NextFailSalesOpptProcessPopup";
    }


    /**
     * Step03 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectStep03PrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String __selectStep03PrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectStep03PrevSalesOpptProcessPopup";
    }
    /**
     * Step03 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStep03PrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep03PrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStep03PrevSalesOpptProcessPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * Step04 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/__selectStepPrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String __selectStepPrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("failCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인 (CRM369)
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        return "/mob/crm/cso/salesOpptProcessMgmt/selectStepPrevSalesOpptProcessPopup";
    }
    /**
     * Step04 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectStepPrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStepPrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM367", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("failCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인 (CRM369)
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10058", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectStepPrevSalesOpptProcessPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }


    /**
     * 판매기회 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/insertSalesOpptPorcessBatchUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertSalesOpptPorcessBatchUpload(@RequestBody List<SalesOpptProcessMgmtVO> list) throws Exception {
        return salesOpptProcessMgmtService.insertSalesOpptPorcessBatchUpload(list);
    }


    /**
     * 판매기회 잠재고객DB
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtFailMain.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtFailMain(Model model
            , @RequestParam(value="custNo", defaultValue="") String custNo
            , @RequestParam(value="leadStatCd", defaultValue="") String leadStatCd
            ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("scId", mobLoginVO.getUserId());
        model.addAttribute("custNo", custNo);

        /**
         * TODO에서 링크를 통해 왔을 경우 팝업을 호출하기 위한 값을 셋팅 한다.
         */
        if (StringUtils.isNotEmpty(custNo)){
            SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
            salesOpptProcessMgmtSearchVO.setsCustNo(custNo);
            SalesOpptProcessMgmtVO salesOpptProcessMgmtVO = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByKey(salesOpptProcessMgmtSearchVO);

            model.addAttribute("leadStatCd", leadStatCd);
            model.addAttribute("befLeadStatCd", salesOpptProcessMgmtVO.getBefLeadStatCd());
            model.addAttribute("salesOpptSeq", salesOpptProcessMgmtVO.getSeq());
            model.addAttribute("showRoomSeq", salesOpptProcessMgmtVO.getSeq());
            model.addAttribute("exhvFlakSeq", salesOpptProcessMgmtVO.getExhvFlakSeq());
        }
        model.addAttribute("toDt", DateUtil.getDate(dateFormat));
        model.addAttribute("fromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat)); //7일전
        model.addAttribute("towMonFromDt", DateUtil.getDate(DateUtils.setDays(DateUtil.add(new Date(), Calendar.MONTH, -2), 1), dateFormat));//2달전

        /******************************************************
         *********** 판매기회프로세스 검색창 코드 시작 **********************/

     // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

      List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

      List<UserVO> users = new ArrayList<UserVO>();
      users.addAll(usersRoleCrmR03);
      users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
        model.addAttribute("failCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인 (CRM369)

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));
        /*********** 판매기회프로세스 검색창 코드 끝 **********************
         ******************************************************/
        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";
        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-12363", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectSalesOpptProcessMgmtFailMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtFailList.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtFailList(Model model) throws Exception {
        return "/mob/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtFailList";
    }

    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/updateSalesOpptProcessMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateSalesOpptProcessMgmt(@RequestBody SalesOpptProcessMgmtVO salesOpptProcessMgmtVO)throws Exception {
       return salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessAndInsertHist(salesOpptProcessMgmtVO);
    }


    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditStep09SalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        List<UserVO> users = new ArrayList<UserVO>();
        users.addAll(usersRoleCrmR03);
        users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM367)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("activeGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));  // 추적등급-의향등급 activeGradeCd (CRM363)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

        model.addAttribute("trsfTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM378", null, langCd)); // 전출유형
        model.addAttribute("evalCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM379", null, langCd)); // 심사코드

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 관심모델 intrModelCd / 구매선택모델 purcModelCd
        // 관심외장색상 colorCd (SA_0107T) CarinfoService.selectExtColorListsByCondition
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 추적등급 설정
        TraceGradeMgmtSearchVO traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();
        int traceGrdCnt = traceGradeMgmtService.selectTraceGradeMgmtsByCnt(traceGradeMgmtSearchVO);
        if (traceGrdCnt > 0){
            List<TraceGradeMgmtVO> traceGrdList = traceGradeMgmtService.selectTraceGradeMgmts(traceGradeMgmtSearchVO);
            model.addAttribute("traceGrdList", traceGrdList);
        }


     // 로그인 정보 : 딜러코드

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());



        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";
        //String mngScIdCtrl = "Y";

/*        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10316", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }*/

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-12363", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectEditStep09SalesOpptProcessPopup.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * 고객등록 팝업 화면을 출력한다. (수정용)
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessFailPopup.do", method = RequestMethod.GET)
    public String selectEditSalesOpptProcessFailPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());


        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//        List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        List<UserVO> users = new ArrayList<UserVO>();
        users.addAll(usersRoleCrmR03);
        users.addAll(usersRoleCrmR18);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
        model.addAttribute("mngScIdList", users);
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));  // 선호연락방법코드 - prefCommMthCd (CRM022)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));  // 성별코드 - sexCd (COM017)
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 정보유형 infoTp (CRM366)
        model.addAttribute("infoPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보경로 infoPathCd (CRM008)
        model.addAttribute("leadStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM375", null, langCd));  // 리드상태 leadStatCd (CRM375)
        model.addAttribute("leadLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM376", null, langCd));  // 리드레벨코드 leadLvlCd (CRM376)
        model.addAttribute("validCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd));  // 유효성등급 validCd (CRM364)
        model.addAttribute("invalidCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd));  // 무효원인코드 invalidCd (CRM365)
        model.addAttribute("failedCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인코드 failedCd (CRM369)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종

        // 추적관련
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 추적방식 (CRM377)
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); // 추적등급 (CRM363)
        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)
        model.addAttribute("invalidCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM365", null, langCd)); // 무효원인 (CRM365)

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // 추적등급 설정
        TraceGradeMgmtSearchVO traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();
        int traceGrdCnt = traceGradeMgmtService.selectTraceGradeMgmtsByCnt(traceGradeMgmtSearchVO);
        if (traceGrdCnt > 0){
            List<TraceGradeMgmtVO> traceGrdList = traceGradeMgmtService.selectTraceGradeMgmts(traceGradeMgmtSearchVO);
            model.addAttribute("traceGrdList", traceGrdList);
        }

     // 로그인 정보 : 딜러코드
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-12363", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/salesOpptProcessMgmt/baseJsp/selectEditSalesOpptProcessFailPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

}