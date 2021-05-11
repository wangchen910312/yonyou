package chn.bhmc.dms.mob.api.crm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.icu.util.Calendar;

import able.com.exception.BizException;
import able.com.web.HController;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerMemoService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.mob.api.crm.service.CrmAccessoryItemSalesService;
import chn.bhmc.dms.mob.api.crm.service.CrmAddressInfoService;
import chn.bhmc.dms.mob.api.crm.service.CrmBlueMembershipInterfaceService;
import chn.bhmc.dms.mob.api.crm.service.CrmCommonCodeService;
import chn.bhmc.dms.mob.api.crm.service.CrmContactHistoryService;
import chn.bhmc.dms.mob.api.crm.service.CrmContractReOutBoundService;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerGroupService;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerInfoOutBoundService;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerInfoService;
import chn.bhmc.dms.mob.api.crm.service.CrmCustomerRelInfoService;
import chn.bhmc.dms.mob.api.crm.service.CrmDealerService;
import chn.bhmc.dms.mob.api.crm.service.CrmFileMgrService;
import chn.bhmc.dms.mob.api.crm.service.CrmFincInfoMngService;
import chn.bhmc.dms.mob.api.crm.service.CrmIdccRoleMgmtService;
import chn.bhmc.dms.mob.api.crm.service.CrmIncJoinInfoService;
import chn.bhmc.dms.mob.api.crm.service.CrmMarketingCampaignService;
import chn.bhmc.dms.mob.api.crm.service.CrmMembershipGradeMngSupportService;
import chn.bhmc.dms.mob.api.crm.service.CrmMembershipPointHisSupportService;
import chn.bhmc.dms.mob.api.crm.service.CrmMembershipService;
import chn.bhmc.dms.mob.api.crm.service.CrmProgressStsService;
import chn.bhmc.dms.mob.api.crm.service.CrmRepairOrderService;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptProcessMgmtService;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptTraceMgmtService;
import chn.bhmc.dms.mob.api.crm.service.CrmUserService;
import chn.bhmc.dms.mob.api.crm.service.CrmVehicleMasterService;
import chn.bhmc.dms.mob.api.crm.service.CrmViewMappingService;
import chn.bhmc.dms.mob.api.crm.service.CrmZipCodeService;
import chn.bhmc.dms.mob.api.crm.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.mob.api.crm.vo.BlueMembershipIfParamVO;
import chn.bhmc.dms.mob.api.crm.vo.ContactHistorySearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerGroupVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerInfoVO;
import chn.bhmc.dms.mob.api.crm.vo.CustomerRelInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.DealerVO;
import chn.bhmc.dms.mob.api.crm.vo.FileItemSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.FileItemVO;
import chn.bhmc.dms.mob.api.crm.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.IdccRoleMgmtVO;
import chn.bhmc.dms.mob.api.crm.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MarketingCampaignVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.UserSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.UserVO;
import chn.bhmc.dms.mob.api.crm.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ZipCodeSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping(value = "api/crm/customerInfo")
@Api("CRM客户管理相关接口")
public class CustomerInfoApi extends HController{
    /**
     * Customer Information Management Service
     */
    @Resource(name = "CrmcustomerInfoService")
    CrmCustomerInfoService CrmcustomerInfoService;
    /**
     * Customer Relation Information Management Service
     */
    @Resource(name = "CrmcustomerRelInfoService")
    CrmCustomerRelInfoService CrmcustomerRelInfoService;
    /**
     * Group Management Service
     */
    @Resource(name = "CrmcustomerGroupService")
    CrmCustomerGroupService CrmcustomerGroupService;

    @Resource(name="CrmzipCodeService")
    CrmZipCodeService CrmzipCodeService;
    /**
     * MarketingCampaign Management Service
     */
    @Resource(name = "CrmmarketingCampaignService")
    CrmMarketingCampaignService CrmmarketingCampaignService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name = "CrmcommonCodeService")
    CrmCommonCodeService CrmcommonCodeService;
    
    @Resource (name = "CrmdealerService")
    CrmDealerService CrmdealerService;
    /**
     * 주소관리 서비스
     */
    @Resource(name = "CrmaddressInfoService")
    CrmAddressInfoService CrmaddressInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name = "CrmuserService")
    CrmUserService CrmuserService;

    /**
     * Address Information Management Service
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * Customer Relation Information Management Service
     */
    @Resource(name = "customerRelInfoService")
    CustomerRelInfoService customerRelInfoService;
    /**
     * 정비 서비스
     */
    @Resource(name = "CrmrepairOrderService")
    CrmRepairOrderService CrmrepairOrderService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name = "CrmprogressStsService")
    CrmProgressStsService CrmprogressStsService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name = "customerMemoService")
    CustomerMemoService customerMemoService;
    
    @Resource(name = "customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 계약품의현황 서비스
     */
    @Resource(name = "CrmvehicleMasterService")
    CrmVehicleMasterService CrmvehicleMasterService;

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
    @Resource(name = "CrmmembershipService")
    CrmMembershipService CrmmembershipService;

    @Resource(name = "CrmmembershipPointHisSupportService")
    CrmMembershipPointHisSupportService CrmmembershipPointHisSupportService;

    /**
     * MemberShipGradeManagement Service
     */
    @Resource(name = "CrmmembershipGradeMngSupportService")
    CrmMembershipGradeMngSupportService CrmmembershipGradeMngSupportService;

    /**
     * BlueMembershipCalc Service
     */
    @Resource(name = "blueMembershipCalcService")
    BlueMembershipCalcService blueMembershipCalcService;

    /**
     * Customer Management
     */
    @Resource(name="CrmcustomerInfoOutBoundService")
    CrmCustomerInfoOutBoundService CrmcustomerInfoOutBoundService;
    /**
     * IDCC Role 코멘트서비스
     */
    @Resource(name="CrmidccRoleMgmtService")
    CrmIdccRoleMgmtService CrmidccRoleMgmtService;
    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="CrmviewMappingService")
    CrmViewMappingService CrmviewMappingService;


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
     * 판매기회 추적관리
     */
    @Resource(name="CrmsalesOpptTraceMgmtService")
    CrmSalesOpptTraceMgmtService CrmsalesOpptTraceMgmtService;

    @Resource(name="CrmcontractReOutBoundService")
    CrmContractReOutBoundService CrmcontractReOutBoundService;
    /**
     * 판매기회관리
     */
    @Resource(name="CrmsalesOpptProcessMgmtService")
    CrmSalesOpptProcessMgmtService CrmsalesOpptProcessMgmtService;

    @Resource(name="CrmblueMembershipInterfaceService")
    CrmBlueMembershipInterfaceService CrmblueMembershipInterfaceService;

    @Resource(name="CrmcontactHistoryService")
    CrmContactHistoryService CrmcontactHistoryService;
    /**
     * FincInfoMngOutBoundService Service
     */
    @Resource(name = "CrmincJoinInfoService")
    CrmIncJoinInfoService CrmincJoinInfoService;
    /**
     * 금융정보관리 서비스
     */
    @Resource(name="CrmfincInfoMngService")
    CrmFincInfoMngService CrmfincInfoMngService;
    /**
     * 용품판매관리 서비스
     */
    @Resource(name="CrmaccessoryItemSalesService")
    private CrmAccessoryItemSalesService CrmaccessoryItemSalesService;

    @Resource(name="CrmfileMgrService")
    CrmFileMgrService CrmfileMgrService;



    /**
     *@description 客户管理-客户管理条件查询URL
     *@param searchVO
     *@return BaseJSON
     */
    @ApiOperation("预约试驾根据客户信息查询客户")
    @RequestMapping(value = "/customerListSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON customerListSearch(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {
    	SearchResult result = new SearchResult();
        result.setTotal(CrmcustomerInfoOutBoundService.selectCustomerListByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(CrmcustomerInfoOutBoundService.selectCustomerListByCondition(searchVO));
        }
        BaseJSON baseJSON = new BaseJSON();
        baseJSON.setResult(result);
        return baseJSON;
    }



    /**
     * 客户管理-客户管理页面跳转URL
     * @param 无/session中取值
     *
     */
    @ApiOperation("客户管理-客户管理页面跳转URL")
    @RequestMapping(value = "/selectCustomerInfoMain.do", method = RequestMethod.GET)
    public BaseJSON selectCustomerInfoMain(Model model, HttpServletRequest request) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
     // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        List<IdccRoleMgmtVO> users_ = CrmidccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);
        model.addAttribute("userList", users_);
        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // sexCdList (COM017)
        model.addAttribute("sexCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("custCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        //model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));          //고객확보유형
        model.addAttribute("custHoldTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        // model.addAttribute("custHoldTpDtlList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM008"));
        model.addAttribute("prefCommMthCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));       //선호연락방법
        model.addAttribute("sexCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));               //성별
        model.addAttribute("incomeLvlCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));         //소득수준
        model.addAttribute("mathDocTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));           //신분증유형
        model.addAttribute("ageCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));               //연령
        model.addAttribute("driverTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));            //주운전자
        model.addAttribute("jobCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));               //직업군
        model.addAttribute("acCareerCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));          //학력
        model.addAttribute("prefContactMthCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));    //우선연락방식
        model.addAttribute("cmpTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));               //회사유형
        model.addAttribute("bizcondCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));           //업종
        model.addAttribute("cmpScaleContList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));        //회사규모
        model.addAttribute("marryYnList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));             //결혼여부
        model.addAttribute("avgCarChgCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));         //평균차량교체시기
        model.addAttribute("prefContactTimeCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));   //우선연락시간
        model.addAttribute("pconTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));              //주소유형
        model.addAttribute("chgBuyYnDS", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));              //교환구매여부
        model.addAttribute("purcCarBrandCdDS", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));        //교환구매 브랜드
        model.addAttribute("chinaZodiacSignCdDS", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));     //띠
        model.addAttribute("zodiacSignCdDS", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));          //별자리
        model.addAttribute("bloodTpDS", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));               //혈액형
        model.addAttribute("dutyCdDS", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));                //직무
        model.addAttribute("callStatCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화상태
        //model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드출처 CRM209
        //model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드상태 CRM210
        //model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 성공확률 CRM212
        //model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회출처 CRM213
        //model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회단계 CRM211
        //model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 전출상태 CRM219
        model.addAttribute("memoTpDS", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM039", null, langCd)); // 메모유형
        // 멤버십 종류 (충전식/포인트식)
        model.addAttribute("cardTpCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM801", null, langCd)); // 멤버십 종류
        // 딜러멤버십 등급
        MembershipGradeMngSearchVO membershipGradeMngSearchVO = new MembershipGradeMngSearchVO();
        List<MembershipGradeMngVO> mbrGradeCdList = CrmmembershipGradeMngSupportService.selectMembershipGradeMngsByCondition(membershipGradeMngSearchVO);
        model.addAttribute("mbrGradeCdList", mbrGradeCdList);
        // 블루멤버십 유형
        model.addAttribute("pointCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd)); // 블루멤버십 종류
        // 블루멤버십 등급
        model.addAttribute("mLevelList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd)); // 블루멤버십 등급
        //용품업무유형
        model.addAttribute("goodsTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));
        //용품판매상태
        model.addAttribute("contractStatCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));
        // 정비이력 - RO유형
        model.addAttribute("roTpCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //계약상태 공통코드 목록
        model.addAttribute("contractStatList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));
        //리드유형
        model.addAttribute("leadTpList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM223", null, langCd));  //리드유형
        //보험유형
        model.addAttribute("incCmpCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd)); //보험회사코드 목록
        // 사용자
        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = CrmuserService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);
        // 그룹,태그 목록
        CustomerGroupSearchVO customerGroupSearchVO = new CustomerGroupSearchVO();
        customerGroupSearchVO.setsGrpTp("001"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custGroups = CrmcustomerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custGroups", custGroups);

        customerGroupSearchVO.setsGrpTp("002"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custTags = CrmcustomerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custTags", custTags);

        customerGroupSearchVO.setsGrpTp("003"); // 001 그룹 , 002 태그 , 003 취미
        List<CustomerGroupVO> custHobbys = CrmcustomerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custHobbys", custHobbys);
        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
        List<MarketingCampaignVO> custHoldTpDtlList = CrmmarketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
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

        if ( CrmviewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10051", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        // NCAR_DSTIN_CD
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(model);
        return baseJSON;
    }



    /**
     *@author sll
     *@description 地址URL
     *@param AddressInfoSearchVO
     *@return
     */
    @RequestMapping(value = "/selectAddressInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectAddressInfo(@RequestBody AddressInfoSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(CrmaddressInfoService.selectAddressInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmaddressInfoService.selectAddressInfoByCondition(searchVO));
        }
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(result);
        return baseJSON;
    }

    @ApiOperation("预约试驾根据车辆信息查询客户")
    @RequestMapping(value = "/selectCustomerAndCarInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectCustomerAndCarInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BaseJSON baseJSON = new BaseJSON();
        result.setTotal(CrmcustomerInfoOutBoundService.selectCustomerAndCarInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(CrmcustomerInfoOutBoundService.selectCustomerAndCarInfoByCondition(searchVO));
            baseJSON.setResult(result);
        }
        return baseJSON;
    }
    


    /**
     *@author sll
     *@description 联系人URL
     *@param CustomerRelInfoSearchVO
     *@return  BaseJSON
     */
    @RequestMapping(value = "/customerRelSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectCustomerRelInfo(@RequestBody CustomerRelInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(CrmcustomerRelInfoService.selectCustomerRelInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(CrmcustomerRelInfoService.selectCustomerRelInfoByCondition(searchVO));
        }
        BaseJSON baseJSON=new BaseJSON();
        baseJSON.setResult(result);
        return baseJSON;
    }



    /**
     *@author sll
     *@description 保有车辆
     * @param VehicleMasterSearchVO
     * @return BaseJSON
     */
    @RequestMapping(value = "/selectHaveCar.do", method = RequestMethod.POST)
    public @ResponseBody
    BaseJSON selectHaveCar(@RequestBody VehicleMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        result.setTotal(CrmvehicleMasterService.selectVehicleCustomerInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(CrmvehicleMasterService.selectVehicleCustomerInfoByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

    }

    /**
     *@author sll
     *@description 备注
     * @param searchVO
     *   - 조회 조건을 포함하는 CustomerMemoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustomerMemo.do", method = RequestMethod.POST)
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
     *@author sll
     *@description 客户管理客户查询条目点击URL(基本信息/详细信息/蓝缤会员)
     *@param CustomerInfoSearchVO
     *@return BaseJSON
     */
    @RequestMapping(value = "/customerSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectCustomerInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {
    	BaseJSON baseJson=new BaseJSON();
        CustomerInfoVO customerInfoVO = new CustomerInfoVO();
        AddressInfoSearchVO addressInfoSearchVO = new AddressInfoSearchVO();

        SearchResult result = new SearchResult();

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
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(CrmcustomerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */

            customerInfoVO.setCustInfoDS(CrmcustomerInfoOutBoundService.selectCustomerInfoByCondition(searchVO));
            customerInfoVO.setGroupDS(CrmcustomerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "001",
                    searchVO.getsDlrCd(), searchVO.getsPltCd()));
            customerInfoVO.setTagDS(CrmcustomerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "002",
                    searchVO.getsDlrCd(), searchVO.getsPltCd()));
            customerInfoVO.setHobbyDS(CrmcustomerGroupService.selectCustomerGroupByKey(searchVO.getsCustNo(), "003",
                    searchVO.getsDlrCd(), searchVO.getsPltCd()));

            /*
             * 주소정보 셋팅
             */
            addressInfoSearchVO.setsRefTableNm("CR_0101T");
            addressInfoSearchVO.setsRefKeyNm(searchVO.getsCustNo());
            addressInfoSearchVO.setsDlrCd(searchVO.getsDlrCd());
            addressInfoSearchVO.setsPltCd(searchVO.getsPltCd());

            customerInfoVO.setAddressDS(CrmaddressInfoService.selectAddressInfoByCondition(addressInfoSearchVO));

            // 보유차량
            VehicleMasterSearchVO vehicleMasterSearchVO = new VehicleMasterSearchVO();
            vehicleMasterSearchVO.setsDlrCd(searchVO.getsDlrCd());
            vehicleMasterSearchVO.setsCustNo(searchVO.getsCustNo());
            //vehicleMasterSearchVO.setsUseYn("Y");//현재보유
            vehicleMasterSearchVO.setsNcarDstinCd("N"); // 현대차

            int vehicleCnt;
            vehicleCnt = CrmvehicleMasterService.selectVehicleCustomerInfoByConditionCnt(vehicleMasterSearchVO);
            //  추가구매여부
            if (vehicleCnt >= 2 ) {
                customerInfoVO.setBuyCnt("Y");
            } else {
                customerInfoVO.setBuyCnt("N");
            }

            // 교환구매

            ContractReSupportSearchVO contractReSupportSearchVO = new ContractReSupportSearchVO();
            contractReSupportSearchVO.setsContractCustNo(searchVO.getsCustNo());

            List<ContractReSupportVO> contractChangePurc = CrmcontractReOutBoundService.selectCustContractUseCarInfoSearch(contractReSupportSearchVO);

            if (contractChangePurc.size() != 0) {
                customerInfoVO.setChgBuyYn("Y");
                customerInfoVO.setPurcCarBrandNm(contractChangePurc.get(0).getCarBrandNm());
                customerInfoVO.setPurcCarModelNm(contractChangePurc.get(0).getCarNm());
            } else {
                customerInfoVO.setChgBuyYn("N");
            }

        }
        baseJson.setResult(customerInfoVO);
        return baseJson;
    }


    /**
     *@author sll
     *@description 自店会员
     *@param MembershipSearchVO
     *@return BaseJSON
     */
    @RequestMapping(value = "/selectMemberships.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectMemberships(@RequestBody MembershipSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        result.setTotal(CrmmembershipService.selectMembershipsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmmembershipService.selectMembershipsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }
    /**
     *@author sll
     *@description 历史跟踪
     *@param SalesOpptTraceMgmtSearchVO
     *@return
     */
    @RequestMapping(value = "/selectSalesOpptTraceMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON  selectSalesOpptTraceMgmt(@RequestBody SalesOpptTraceMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();

        result.setTotal(CrmsalesOpptTraceMgmtService.selectSalesOpptTraceMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(CrmsalesOpptTraceMgmtService.selectSalesOpptTraceMgmtsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 流转记录
     * @param SalesOpptProcessMgmtHistSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptProcessMgmtHist.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSalesOpptProcessMgmtHist(@RequestBody SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();

        result.setTotal(CrmsalesOpptProcessMgmtService.selectSalesOpptProcessMgmtsHistByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(CrmsalesOpptProcessMgmtService.selectSalesOpptProcessMgmtsHistByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }
    /**
     *@author sll
     *@decscrpition 查询服务历史
     *@param RepairOrderSearchVO - sCarOwnerId, sRoStatCd
     *@return BaseJSON
     */
    @RequestMapping(value = "/selectRepairOrdersHistory.do", method = RequestMethod.POST)
    public @ResponseBody
    BaseJSON selectCustomerCareRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        if ( StringUtils.isEmpty(searchVO.getsCarOwnerId()) ) {
            // {고객번호}을(를) 확인하여 주세요.
            throw new BizException(messageSource.getMessage("global.info.confirmMsgParam", new String[]{
                    messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())
            }, LocaleContextHolder.getLocale()));
        }
        if ( StringUtils.isEmpty(searchVO.getsSearchGubun()) ) {
            searchVO.setsSearchGubun("MD");
        }
        SearchResult result = new SearchResult();
        BaseJSON baseJSON =new BaseJSON();
        result.setData(CrmrepairOrderService.selectRepairOrdersHistory(searchVO));
        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     *@author sll
     *@decscrpition 自店会员 one and two
     *@param MembershipPointHisSearchVO
     *@return BaseJSON
     */
    @RequestMapping(value = "/selectMembershipPointHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectMembershipPointHissOneAndTwo(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON =new BaseJSON();
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        result.setTotal(CrmmembershipPointHisSupportService.selectPointHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmmembershipPointHisSupportService.selectPointHistorysByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

    }

    /**
     *@author sll
     *@description 蓝缤会员 one
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/selectBlueMembershipCalcDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectBlueMembershipCalcDetails(@RequestBody BlueMembershipIfParamVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        BlueMembershipIfConsumeListRapVO blueMembershipIfConsumeListRapVO = CrmblueMembershipInterfaceService.selectAddORConsumeintegral(searchVO);
        if (blueMembershipIfConsumeListRapVO != null) {
            result.setTotal( ((blueMembershipIfConsumeListRapVO.getDataList())==null)?0:blueMembershipIfConsumeListRapVO.getDataList().size());
            if(result.getTotal() != 0){
                result.setData(blueMembershipIfConsumeListRapVO.getDataList());
            }
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 保险信息
     * @param IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIncSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectIncSearch(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        result.setTotal(CrmincJoinInfoService.selectIncJoinInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0 ) {
            result.setData(CrmincJoinInfoService.selectIncJoinInfoByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

    }

    /**
     *@author sll
     *@description 贷款信息
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFincInfoMngCRMSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectFincInfoMngCRMSearch(@RequestBody FincInfoMngSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        result.setTotal(CrmfincInfoMngService.selectCustFincInfosByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmfincInfoMngService.selectCustFincInfosByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 精品现况
     * @param
     * @return
     */
    @RequestMapping(value = "/selectAccessoryItemSales.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectAccessoryItemSales(@RequestBody AccessoryItemSalesSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(CrmaccessoryItemSalesService.selectAccessoryItemSalesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(CrmaccessoryItemSalesService.selectAccessoryItemSalesByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }


    /**
     *@author sll
     *@description 信息变更履历
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/selectCustomerInfoHistoryCrm.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectCustomerInfoHistoryCrm(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(CrmcustomerInfoService.selectCustomerInfoHistoryByConditionCnt(searchVO));

        if (result.getTotal() != 0) {


            result.setData(CrmcustomerInfoService.selectCustomerInfoHistoryByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 合同
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectProgressSts.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON  selectProgressSts1(@RequestBody ContractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        result.setTotal(CrmprogressStsService.selectProgressStsByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(CrmprogressStsService.selectProgressStsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 附件文件
     * @param fileDocNo 첨부문서번호
     * @return 첨부파일목록
     */
    @RequestMapping(value = "/selectFiles.do")
    @ResponseBody
    public BaseJSON selectFiles(@RequestBody FileItemSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();
        String fileDocNo = searchVO.getsFileDocNo();

        List<FileItemVO> list = null;

        if(StringUtils.isEmpty(fileDocNo)){
            list = new ArrayList<FileItemVO>();
        } else {
            list = CrmfileMgrService.selectFileItemsByFileDocNo(searchVO.getsFileDocNo());
        }

        result.setTotal(list.size());
        result.setData(list);
        baseJSON.setResult(result);

        return baseJSON;
    }

    /**
     *@author sll
     *@description 短信
     * @param searchVO - 조회 조건을 포함하는 ContactHistorySearchVO
     * @return
     */
    @RequestMapping(value = "/selectMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        BaseJSON baseJSON=new BaseJSON();

        //{고객번호}을(를) 확인하여 주세요.
        if(StringUtils.isBlank(searchVO.getsCustNo())){
            throw new BizException(
                messageSource.getMessage("global.info.confirmMsgParam",new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())},LocaleContextHolder.getLocale())
            );
        }

        result.setTotal(CrmcontactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmcontactHistoryService.selectMsgHistorysByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

    @RequestMapping(value = "/selectZipCodePopup.do", method = RequestMethod.GET)
    public BaseJSON selectZipCodePopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        DealerVO dealerVo = CrmdealerService.selectDealerByKey(mobLoginVO.getDlrCd());
        model.addAttribute("zipNo", dealerVo.getZipNo());
        String sZipCd = dealerVo.getZipNo();

        //get sungNm and other data from zipcode db table
        ZipCodeSearchVO zipCodeSearchVO = new ZipCodeSearchVO();  // make a new ZipCodesearchVO
        zipCodeSearchVO.setsZipCd(sZipCd);  // put the sZipCd para to ZipCodesearchVO for using selectZipCodesByCondition() which is in zipCodeService.
        model.addAttribute("zipInfoList",CrmzipCodeService.selectZipCodesByCondition(zipCodeSearchVO));
        model.addAttribute("gubunList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("COM018", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        baseJSON.setResult(model);
        return baseJSON;
    }

    @RequestMapping(value = "/selectZipCodes.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectZipCodes(@RequestBody ZipCodeSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
        SearchResult result = new SearchResult();

        result.setTotal(CrmzipCodeService.selectZipCodesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmzipCodeService.selectZipCodesByCondition(searchVO));
        }

        baseJSON.setResult(result);
        return baseJSON;

    }
    
    /**
     * 고객 정보를 저장한다.
     *
     * @param CustomerInfo
     *            VO - 고객정보 VO
     * @return CustomerInfoVO
     */
    @RequestMapping(value = "/updateCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("客户管理-客户管理保存")
    public BaseJSON updateCustomer(@RequestBody chn.bhmc.dms.crm.cif.vo.CustomerInfoVO customerInfoVO) throws Exception {

    	BaseJSON baseJSON = new BaseJSON();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        customerInfoVO.setUpdtUsrId(mobLoginVO.getUserId());
        customerInfoVO.setDlrCd(mobLoginVO.getDlrCd());
        chn.bhmc.dms.crm.cif.vo.CustomerInfoVO newCustomerInfoVO = new chn.bhmc.dms.crm.cif.vo.CustomerInfoVO();
        newCustomerInfoVO = customerInfoService.updateCustomer(customerInfoVO);
        if(newCustomerInfoVO != null) {
        	baseJSON.setResult(newCustomerInfoVO);
        	return baseJSON;
        }
        baseJSON.setResultCode(1);
        baseJSON.setResultMsg("操作失败");
        return baseJSON;
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
    @RequestMapping(value = "/multiCustomerRelChg.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON multiCustomerRelChg(@Validated @RequestBody BaseSaveVO<CustomerRelInfoVO> saveVO,
            BindingResult bindingResult) throws Exception {
        BaseJSON baseJSON =   new BaseJSON();
        customerRelInfoService.multiCustomerRelChg(saveVO);
    	baseJSON.setResult(true);
        return baseJSON;
    }
    
    /**
     * 주소 정보를 저장 한다.
     * @param addressInfoVO - 주소
     * @return
     */
    @RequestMapping(value = "/multiAddressInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON multiAddressInfo(@RequestBody BaseSaveVO<AddressInfoVO> saveVO)throws Exception {

        BaseJSON baseJSON =   new BaseJSON();
        addressInfoService.multiAddressInfo(saveVO);
        baseJSON.setResult(true);
        return baseJSON;
    }
}

