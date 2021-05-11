package chn.bhmc.dms.mob.crm.cif.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSearchVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerMemoService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.cnt.service.ProgressStsService;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustomerInfoController.java
 * @Description : 고객정보관리 컨트롤러
 * @author Sung sin Park
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Park Sung sin     최초 생성
 * </pre>
 */

@Controller
public class MobCustomerInfoController extends HController {

    /**
     * Customer Information Management Service
     */
    @Resource(name = "customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * Customer Relation Information Management Service
     */
    @Resource(name = "customerRelInfoService")
    CustomerRelInfoService customerRelInfoService;

    /**
     * Group Management Service
     */
    @Resource(name = "customerGroupService")
    CustomerGroupService customerGroupService;

    /**
     * MarketingCampaign Management Service
     */
    @Resource(name = "marketingCampaignService")
    MarketingCampaignService marketingCampaignService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 주소관리 서비스
     */
    @Resource(name = "addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name = "userService")
    UserService userService;

    /**
     * 리드 서비스
     */
    @Resource(name = "leadInfoService")
    LeadInfoService leadInfoService;

    /**
     * 판매기회 서비스
     */
    @Resource(name = "salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;

    /**
     * 정비 서비스
     */
    @Resource(name = "repairOrderService")
    RepairOrderService repairOrderService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name = "progressStsService")
    ProgressStsService progressStsService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name = "customerMemoService")
    CustomerMemoService customerMemoService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name = "vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * MembershipPointHisService
     */
    @Resource(name = "membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 멤버십 서비스
     */
    @Resource(name = "membershipSupportService")
    MembershipSupportService membershipSupportService;

    /**
     * 멤버십 서비스
     */
    @Resource(name = "membershipService")
    MembershipService membershipService;

    /**
     * membershipPointHisSupportService
     */
    @Resource(name = "membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     * MemberShipGradeManagement Service
     */
    @Resource(name = "membershipGradeMngSupportService")
    MembershipGradeMngSupportService membershipGradeMngSupportService;

    /**
     * BlueMembershipCalc Service
     */
    @Resource(name = "blueMembershipCalcService")
    BlueMembershipCalcService blueMembershipCalcService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;
    /**
     * IDCC Role 코멘트서비스
     */
    @Resource(name="idccRoleMgmtService")
    IdccRoleMgmtService idccRoleMgmtService;
    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;


    /**
     * 메시지템플릿 관리 서비스
     */
    @Resource(name="messageTemplateService")
    MessageTemplateService messageTemplateService;

    /**
     * systemConfigInfoService Service
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 고객 데이터 목록.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustSearchListPopup.do", method = RequestMethod.GET)

    public String selectCustSearchListPopup(Model model) throws Exception {

        return "/mob/crm/cif/customerInfo/selectCustSearchListPopup";
    }

    /**
     * 고객(차량) 데이터 목록.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustSearchList2Popup.do", method = RequestMethod.GET)

    public String selectCustSearchList2Popup(Model model) throws Exception {

        return "/mob/crm/cif/customerInfo/selectCustSearchList2Popup";
    }

    /**
     * 고객 데이터 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/customerListSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult customerListSearch(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsRegDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsRegDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsRegDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsRegDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        result.setTotal(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
                searchVO.setsDlrCd(mobLoginVO.getDlrCd());
            }
            if (StringUtils.isEmpty(searchVO.getsPltCd())) {
                searchVO.setsPltCd(mobLoginVO.getPltCd());
            }

            result.setData(customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 고객조회 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustSearchPopup.do", method = RequestMethod.GET)
    public String selectCustSearchPopup(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        // sexCdList (COM017)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        if(request.getParameter("tabSel") != null && request.getParameter("tabSel") != null ){
            model.addAttribute("tabSel", request.getParameter("tabSel"));
        }else{
            model.addAttribute("tabSel", "0");
        }
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/baseJsp/selectCustSearchPopup.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateP";
    }

    /**
     * 고객정보 관리 화면을 출력한다.
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustomerInfoMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

     // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        List<IdccRoleMgmtVO> users_ = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);
        model.addAttribute("userList", users_);

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        // sexCdList (COM017)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        //model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));          //고객확보유형
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        // model.addAttribute("custHoldTpDtlList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM008"));
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));       //선호연락방법
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));               //성별
        model.addAttribute("incomeLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));         //소득수준
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));           //신분증유형
        model.addAttribute("ageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));               //연령
        model.addAttribute("driverTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));            //주운전자
        model.addAttribute("jobCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));               //직업군
        model.addAttribute("acCareerCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));          //학력
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));    //우선연락방식
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));               //회사유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));           //업종
        model.addAttribute("cmpScaleContList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));        //회사규모
        model.addAttribute("marryYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));             //결혼여부
        model.addAttribute("avgCarChgCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));         //평균차량교체시기
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));   //우선연락시간
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));              //주소유형
        model.addAttribute("chgBuyYnDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));              //교환구매여부
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));        //교환구매 브랜드
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));     //띠
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));          //별자리
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));               //혈액형
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));                //직무
        model.addAttribute("callStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화상태
        //model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드출처 CRM209
        //model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드상태 CRM210
        //model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 성공확률 CRM212

        //model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회출처 CRM213
        //model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회단계 CRM211
        //model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 전출상태 CRM219
        model.addAttribute("memoTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM039", null, langCd)); // 메모유형

        // 멤버십 종류 (충전식/포인트식)
        model.addAttribute("cardTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM801", null, langCd)); // 멤버십 종류

        // 딜러멤버십 등급
        MembershipGradeMngSearchVO membershipGradeMngSearchVO = new MembershipGradeMngSearchVO();
        List<MembershipGradeMngVO> mbrGradeCdList = membershipGradeMngSupportService.selectMembershipGradeMngsByCondition(membershipGradeMngSearchVO);
        model.addAttribute("mbrGradeCdList", mbrGradeCdList);

        // 블루멤버십 유형
        model.addAttribute("pointCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd)); // 블루멤버십 종류

        // 블루멤버십 등급
        model.addAttribute("mLevelList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd)); // 블루멤버십 등급

        //용품업무유형
        model.addAttribute("goodsTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        //용품판매상태
        model.addAttribute("contractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));

        // 정비이력 - RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //계약상태 공통코드 목록
        model.addAttribute("contractStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        //리드유형
        model.addAttribute("leadTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM223", null, langCd));  //리드유형

        //보험유형
        model.addAttribute("incCmpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd)); //보험회사코드 목록


        // 사용자
        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);

        // 그룹,태그 목록
        CustomerGroupSearchVO customerGroupSearchVO = new CustomerGroupSearchVO();

        customerGroupSearchVO.setsGrpTp("001"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custGroups = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custGroups", custGroups);

        customerGroupSearchVO.setsGrpTp("002"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custTags = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custTags", custTags);

        customerGroupSearchVO.setsGrpTp("003"); // 001 그룹 , 002 태그 , 003 취미
        List<CustomerGroupVO> custHobbys = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custHobbys", custHobbys);

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();

        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);


        if(request.getParameter("tabSel") != null && request.getParameter("tabSel") != null ){
            model.addAttribute("tabSel", request.getParameter("tabSel"));
        }else{
            model.addAttribute("tabSel", "0");
        }

        if(request.getParameter("custNo") != null){
            model.addAttribute("custNo", request.getParameter("custNo"));
        }

        //화면보기 권한에 따른 검색조건
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10051", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        // NCAR_DSTIN_CD
        model.addAttribute("ncarDstinCdList",commonCodeService.selectCommonCodesByCmmGrpCd("SAL112", null, LocaleContextHolder.getLocale().getLanguage()));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cif/customerInfo/baseJsp/selectCustomerInfoMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateC";
    }

    /**
     * 주소정보 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectAddressList.do", method = RequestMethod.GET)
    public String selectAddressList(Model model) throws Exception {
       return "/mob/crm/cif/customerInfo/selectCustomerInfoAddressList";
    }

    /**
     * 주소 정보를 조회 한다.
     * @param addressInfoSearchVO - 주소
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectAddressInfo.do", method = RequestMethod.POST)
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
     * 연계인 목록 화면을 출력한다.customerRelSearch.do
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectcustomerRelSearchList.do", method = RequestMethod.GET)
    public String selectcustomerRelSearchList(Model model) throws Exception {
       return "/mob/crm/cif/customerInfo/selectCustomerInfoRelList";
    }

    /**
     * 연계인 데이터를 조회 한다.
     *
     * TODO 20170222 - 연계인 searchVO 변경되었음. 훈식대리님 확인좀 해주세요~~ ( 이인문  )
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/customerRelSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerRelInfo(@RequestBody CustomerRelInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(customerRelInfoService.selectCustomerRelInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(customerRelInfoService.selectCustomerRelInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 고객의 연계인 정보를 등록한다.
     *
     * @param saveVO
     *            - 연계인 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     *
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/multiCustomerRelChg.do", method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public boolean multiCustomerRelChg(@Validated @RequestBody BaseSaveVO<CustomerRelInfoVO> saveVO,
            BindingResult bindingResult) throws Exception {
        customerRelInfoService.multiCustomerRelChg(saveVO);
        return true;
    }

    /**
     * 보유차량 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectHaveCarList.do", method = RequestMethod.GET)
    public String selectHaveCarList(Model model) throws Exception {
       return "/mob/crm/cif/customerInfo/selectCustomerInfoCarList";
    }

    /**
     * 보유차량 목록 데이터를 조회한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectHaveCar.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectHaveCar(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(vehicleMasterService.selectVehicleCustomerInfoByCondition(searchVO));
        }

        return result;

    }



    /**
     * 추적이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerSalesOpptTraceMgmtList.do", method = RequestMethod.GET)
    public String selectCustomerSalesOpptTraceMgmtList(Model model) throws Exception {
       return "/mob/crm/cif/customerInfo/selectCustomerSalesOpptTraceMgmtList";
    }

    /**
     * 회전이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectSalesOpptProcessMgmtHistList.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtHistList(Model model) throws Exception {
       return "/mob/crm/cif/customerInfo/selectSalesOpptProcessMgmtHistList";
    }

    /**
     * 리드정보 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectLeadsList.do", method = RequestMethod.GET)
    public String selectLeadsList(Model model) throws Exception {
       return "/mob/crm/cif/customerInfo/selectCustomerInfoLeadList";
    }

    /**
     * 리드 정보를 조회 한다.
     *
     * @param leadInfoVO
     *            - 리드 정보
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectLeads.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeads(@RequestBody LeadInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsAllocDtFrom() != null || searchVO.getsAllocDtTo() != null) {

            // 시작일
            startCal.setTime(searchVO.getsAllocDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsAllocDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsAllocDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsAllocDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/
        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsNextCallDtFrom() != null || searchVO.getsNextCallDtTo() != null) {

            // 시작일
            startCal.setTime(searchVO.getsNextCallDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsNextCallDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsNextCallDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsNextCallDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        result.setTotal(leadInfoService.selectLeadInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(leadInfoService.selectLeadInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회관리 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectSaleOpptList.do", method = RequestMethod.GET)
    public String selectSaleOpptList(Model model) throws Exception {
       return "/mob/crm/cif/customerInfo/selectCustomerInfoOpptList";
    }

    /**
     * 판매기회 관리 목록 데이터를 조회한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectSalesOpptMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptMgmts(@RequestBody SalesOpptMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if (searchVO.getsStartRegDt() != null || searchVO.getsEndRegDt() != null) {

            int year;
            int month;
            int day;

            if (searchVO.getsStartRegDt() == searchVO.getsEndRegDt()) {
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartRegDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day + 1, 00, 00, 00);
                searchVO.setsEndRegDt(startCal.getTime()); // 종료일 설정 ( 시작일 + 1일
                                                           // ) 2016-06-06
                                                           // 00:00:00
            } else if (searchVO.getsEndRegDt() != null) {
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndRegDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day + 1, 00, 00, 00);
                searchVO.setsEndRegDt(endCal.getTime()); // 종료일 설정( 종료일 + 1일 )
                                                         // 2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        result.setTotal(salesOpptMgmtService.selectSalesOpptMgmtsByConditionCnt(searchVO));

        if (result.getTotal() != 0) {

            result.setData(salesOpptMgmtService.selectSalesOpptMgmtsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 정비이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectRepairOrdersList.do", method = RequestMethod.GET)
    public String selectRepairOrdersList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerInfoRepairOrderList";
    }

    /**
     * RO접수 목록 데이터를 조회한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectRepairOrders.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;
    }

    /**
     * 딜러멤버십 포인트 이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectMembershipPointHisList.do", method = RequestMethod.GET)
    public String selectMembershipPointHisList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerInfoMemberShipList";
    }

    /**
     * 딜러멤버십 포인트 이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectMembershipCardHisList.do", method = RequestMethod.GET)
    public String selectMembershipCardHisList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerInfoMembershipCardHisList";
    }

    /**
     * 딜러멤버십 포인트 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectMembershipPointHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointHiss(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(mobLoginVO.getDlrCd()); };

        result.setTotal(membershipPointHisSupportService.selectPointHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipPointHisSupportService.selectPointHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 블루멤버십 포인트이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectBlueMembershipCalcDetailList.do", method = RequestMethod.GET)
    public String selectBlueMembershipCalcDetailList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerInfoBlueList";
    }

    /**
     * 블루멤버십 포인트 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectBlueMembershipCalcDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipCalcDetails(@RequestBody BlueMembershipCalcSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(mobLoginVO.getDlrCd()); };

        result.setTotal(blueMembershipCalcService.selectBlueMembershipCalcDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(blueMembershipCalcService.selectBlueMembershipCalcDetailsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 보험 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerIncSearchList", method = RequestMethod.GET)
    public String selectCustomerIncSearchList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerIncSearchList";
    }

    /**
     * 금융 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerFincSearchList", method = RequestMethod.GET)
    public String selectCustomerFincSearchList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerFincSearchList";
    }

    /**
     * 용품 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerAccessoryList", method = RequestMethod.GET)
    public String selectCustomerAccessoryList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerAccessoryList";
    }

    /**
     * 고객변경 이력 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerInfoHistoryList.do", method = RequestMethod.GET)
    public String selectCustomerInfoHistoryList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerInfoChangeList";
    }

    /**
     * 고객 변경 이력 데이터 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustomerInfoHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerInfoHistory(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        }

        result.setTotal(customerInfoService.selectCustomerInfoHistoryByConditionCnt(searchVO));

        if (result.getTotal() != 0) {


            result.setData(customerInfoService.selectCustomerInfoHistoryByCondition(searchVO));
        }

        return result;
    }

    /**
     * 메목 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerMemoList.do", method = RequestMethod.GET)
    public String selectCustomerMemoList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerInfoMemoList";
    }

    /**
     * 메모 목록 데이터를 조회한다.
     *
     * @param searchVO
     *   - 조회 조건을 포함하는 CustomerMemoSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustomerMemo.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectCustomerMemo(@RequestBody CustomerMemoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsRegUsrId(mobLoginVO.getUserId());

        result.setTotal(customerMemoService.selectCustomerMemoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(customerMemoService.selectCustomerMemoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 계약품위현황 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectProgressStsList.do", method = RequestMethod.GET)
    public String selectProgressStsList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerInfoContactList";
    }

    /**
     * 계약품위현황 목록을 조회한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectProgressSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectProgressSts(@RequestBody ContractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(progressStsService.selectProgressStsByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(progressStsService.selectProgressStsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 메시지 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerMsgList.do", method = RequestMethod.GET)
    public String selectCustomerMsgList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustomerMsgList";
    }

    /**
     * 첨부파일 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/cmm/sci/fileUpload/selectFileList.do", method = RequestMethod.GET)
    public String selectFileList(Model model) throws Exception {
        return "/mob/crm/cif/customerInfo/selectFileList";
    }

    /**
     * 고객 데이터를 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/customerSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO selectCustomerInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        CustomerInfoVO customerInfoVO = new CustomerInfoVO();
        AddressInfoSearchVO addressInfoSearchVO = new AddressInfoSearchVO();

        SearchResult result = new SearchResult();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsRegDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsRegDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsRegDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsRegDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        }

        result.setTotal(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */

            customerInfoVO.setCustInfoDS(customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO));
            customerInfoVO.setGroupDS(customerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "001",
                    searchVO.getsDlrCd(), searchVO.getsPltCd()));
            customerInfoVO.setTagDS(customerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "002",
                    searchVO.getsDlrCd(), searchVO.getsPltCd()));
            customerInfoVO.setHobbyDS(customerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "003",
                    searchVO.getsDlrCd(), searchVO.getsPltCd()));

            /*
             * 주소정보 셋팅
             */
            addressInfoSearchVO.setsRefTableNm("CR_0101T");
            addressInfoSearchVO.setsRefKeyNm(searchVO.getsCustNo());
            addressInfoSearchVO.setsDlrCd(searchVO.getsDlrCd());
            addressInfoSearchVO.setsPltCd(searchVO.getsPltCd());

            customerInfoVO.setAddressDS(addressInfoService.selectAddressInfoByCondition(addressInfoSearchVO));

        }

        return customerInfoVO;
    }

    /**
     * 고객을 신규로 생성한다.
     *
     * @param CustomerInfo
     *            VO - 고객정보 VO
     * @return CustomerInfoVO
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/insertCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO insertCustomer(@RequestBody CustomerInfoVO customerInfoVO) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        customerInfoVO.setRegUsrId(mobLoginVO.getUserId());
        customerInfoVO.setDlrCd(mobLoginVO.getDlrCd());

        // 신규 등록
        customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);

        return customerInfoVO;
    }

    /**
     * 고객 정보를 저장한다.
     *
     * @param CustomerInfo
     *            VO - 고객정보 VO
     * @return CustomerInfoVO
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/updateCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO updateCustomer(@RequestBody CustomerInfoVO customerInfoVO) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        customerInfoVO.setUpdtUsrId(mobLoginVO.getUserId());
        customerInfoVO.setDlrCd(mobLoginVO.getDlrCd());

        // 고객정보저장
        customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);

        return customerInfoVO;
    }



    /**
     * 고객정보등록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectCustomerInfoRegMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoRegMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

     // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        // sexCdList (COM017)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));          //고객확보유형
        // model.addAttribute("custHoldTpDtlList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM008"));
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));       //선호연락방법
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));               //성별
        model.addAttribute("incomeLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));         //소득수준
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));           //신분증유형
        model.addAttribute("ageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));               //연령
        model.addAttribute("driverTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));            //주운전자
        model.addAttribute("jobCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));               //직업군
        model.addAttribute("acCareerCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));          //학력
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));    //우선연락방식
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));               //회사유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));           //업종
        model.addAttribute("cmpScaleContList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));        //회사규모
        model.addAttribute("marryYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));             //결혼여부
        model.addAttribute("avgCarChgCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));         //평균차량교체시기
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));   //우선연락시간
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));              //주소유형
        model.addAttribute("chgBuyYnDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));              //교환구매여부
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));        //교환구매 브랜드
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));     //띠
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));          //별자리
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));               //혈액형
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));                //직무

        // 그룹,태그 목록
        CustomerGroupSearchVO customerGroupSearchVO = new CustomerGroupSearchVO();

        customerGroupSearchVO.setsGrpTp("001"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custGroups = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custGroups", custGroups);

        customerGroupSearchVO.setsGrpTp("002"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custTags = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custTags", custTags);

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();

        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);


        return "/mob/crm/cif/customerInfo/selectCustomerInfoRegMain";
    }

    /**
     * SMS팝업
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustSendSMSPopup.do", method = RequestMethod.GET)

    public String selectCustSendSMSPopup(Model model) throws Exception {

        MessageTemplateGroupSearchVO searchGroupVO = new MessageTemplateGroupSearchVO();
        searchGroupVO.setsMesgTmplGrpTp("02");      // CRM 에서 사용하는 문자 템플릿은 sMesgTmplGrpTp : 02 조회 조건 필수! 추후 다른 파트에서 사용하려면 수정해야함
        //MessageTemplateSearchVO searchVO = new MessageTemplateSearchVO();
        //searchVO.setsMesgTmplTp(MessageTemplateVO.MESG_TMPL_TP_SMS);

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("smsTemplateGroupList", messageTemplateService.selectMessageTemplateGroupsByCondition(searchGroupVO));     // 메시지 템플릿 그룹 목록

        String sysDate = DateUtil.getDate("yyyy-MM-dd HH:mm");
        model.addAttribute("sysDate", sysDate);

        return "/mob/crm/cif/customerInfo/selectCustSendSMSPopup";
    }


    /**
     * 고객조회 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectContractCustSearchPopup.do", method = RequestMethod.GET)
    public String selectContractCustSearchPopup(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        // sexCdList (COM017)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        if(request.getParameter("tabSel") != null && request.getParameter("tabSel") != null ){
            model.addAttribute("tabSel", request.getParameter("tabSel"));
        }else{
            model.addAttribute("tabSel", "0");
        }
        return "/mob/crm/cif/customerInfo/selectContractCustSearchPopup";
    }


    /**
     * 고객(차량) 데이터 목록.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectContractCustSearchListPopup.do", method = RequestMethod.GET)

    public String selectContractCustSearchList3Popup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));

        // sexCdList (COM017)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 멤버십 기준
        model.addAttribute("policy", LoginUtil.getMembershipPolicy());

        // 증서유형
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        return "/mob/crm/cif/customerInfo/selectContractCustSearchListPopup";
    }


    /**
     * 딜러멤버십회원 정보 조회
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     */
    @RequestMapping(value="/mob/crm/cif/customerInfo/selectMembershipInfoByKey.do", method=RequestMethod.POST)
    @ResponseBody
    public MembershipVO selectMembershipInfoByKey(@RequestBody MembershipSearchVO searchVO)throws Exception{

        MembershipVO result = membershipSupportService.selectMembershipInfoByKey(searchVO);

        if(result == null){
            result = new MembershipVO();
        }

        return result;

    }

    /**
     * 멤버십 가입 정보 데이터를 조회한다.
     * @param searchVO - custNo
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectMemberships.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMemberships(@RequestBody MembershipSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipService.selectMembershipsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipService.selectMembershipsByCondition(searchVO));
        }

        return result;
    }


}
