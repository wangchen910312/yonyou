package chn.bhmc.dms.crm.cif.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.util.fmt.StringUtil;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileItemSearchVO;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustChargeMgmtService;
import chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService;
import chn.bhmc.dms.crm.cif.service.CustomerMemoService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstVO;
import chn.bhmc.dms.crm.cif.vo.CustFileItemVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService;
import chn.bhmc.dms.crm.cso.vo.ContactHistorySearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.sal.acc.service.AccessoryConditionService;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;
import chn.bhmc.dms.sal.cnt.service.ProgressStsService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustomerInfoController.java
 * @Description : 고객정보관리 컨트롤러
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Controller
public class CustomerInfoController extends HController {

    /**
     * systemConfigInfoService Service
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

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
     * MembershipPointHisSupportService
     */
    @Resource(name = "membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     * MemberShipGradeManagement Service
     */
    @Resource(name = "membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

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
     * BlueMembership Join Service
     */
    @Resource(name = "blueMembershipJoinService")
    BlueMembershipJoinService blueMembershipJoinService;

    /**
     * BlueMembershipCalc Service
     */
    @Resource(name = "salesActiveMgmtService")
    SalesActiveMgmtService salesActiveMgmtService;

    /**
     * FincInfoMngOutBoundService Service
     */
    @Resource(name = "incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * 패키지 쿠폰이력 서비스
     */
    @Resource(name="packageCouponHisSupportService")
    PackageCouponHisSupportService packageCouponHisSupportService;

    /**
     * 메시지이력 서비스
     */
    @Resource(name="contactHistoryService")
    ContactHistoryService contactHistoryService;

    /**
     * 고객조회팝업 서비스
     */
    @Resource(name="vehOfCustInfoService")
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * 용품관리 서비스
     */
    @Resource(name="accessoryConditionService")
    AccessoryConditionService accessoryConditionService;

    /**
     * CustomerInfoOutBoundService (고객관리 From Support)
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 판매기회 추적관리
     */
    @Resource(name="salesOpptTraceMgmtService")
    SalesOpptTraceMgmtService salesOpptTraceMgmtService;

    /**
     * 판매기회관리
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /**
     * 고객 유일정보 수정관리
     */
    @Resource(name="customerInfoUpdateService")
    CustomerInfoUpdateService customerInfoUpdateService;

    /**
     * blueMembershipJoinSupportService
     */
    @Resource(name="blueMembershipJoinSupportService")
    BlueMembershipJoinSupportService blueMembershipJoinSupportService;

    /**
     * contractReOutBoundService
     */
    @Resource(name="contractReOutBoundService")
    ContractReOutBoundService contractReOutBoundService;

    /**
     * blueMembershipInterfaceService
     */
    @Resource(name="blueMembershipInterfaceService")
    BlueMembershipInterfaceService blueMembershipInterfaceService;

    /**
     * 고객할인 발행 서비스
     */
    @Resource(name="customerCouponMgmtService")
    CustomerCouponMgmtService customerCouponMgmtService;

    /**
     * CustChargeMgmtService
     */
    @Resource(name="custChargeMgmtService")
    CustChargeMgmtService custChargeMgmtService;

    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 용품판매관리 서비스
     */
//    @Resource(name="accessoryItemSalesService")
//    AccessoryItemSalesService accessoryItemSalesService;

    /**
     * 고객정보등록 (개인) 등록 화면
     * GET custCollSrcCd(고객수집경로 : 01판매, 02정비)
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoRegMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoRegMain(Model model
            ,@RequestParam(value="custCollSrcCd", defaultValue="") String custCollSrcCd ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
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

        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        if (StringUtils.isEmpty(custCollSrcCd)) {
            custCollSrcCd = "01";   // 없는 경우 기본 '01' 판매  ,  '02' 정비
        }

        model.addAttribute("custCollSrcCd", custCollSrcCd);

        // 고객수집경로
        model.addAttribute("custCollSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM042", null, langCd));
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("incomeLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("ageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));
        model.addAttribute("driverTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));
        model.addAttribute("jobCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));
        model.addAttribute("acCareerCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));
        model.addAttribute("cmpScaleContList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));
        model.addAttribute("marryYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));
        model.addAttribute("avgCarChgCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("chgBuyYnDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        //model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL181", null, langCd));
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));

        return "/crm/cif/customerInfo/selectCustomerInfoRegMain";
    }

    /**
     * 고객정보등록 (법인) 등록 화면
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoCompanyRegMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoCompanyRegMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
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

        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("incomeLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("ageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));
        model.addAttribute("driverTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));
        model.addAttribute("jobCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));
        model.addAttribute("acCareerCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));
        model.addAttribute("cmpScaleContList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));
        model.addAttribute("marryYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));
        model.addAttribute("avgCarChgCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("chgBuyYnDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        //model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL181", null, langCd));
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));

        return "/crm/cif/customerInfo/selectCustomerInfoCompanyRegMain";
    }

    /**
     * 고객정보등록 (개인) 관리 화면
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoMain(Model model
            ,@RequestParam(value="custNo", defaultValue="") String custNo ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 고객번호
        model.addAttribute("custNo", custNo);

        // GetParamChk
        if (StringUtils.isNotEmpty(custNo)) {
            model.addAttribute("getParamChk", "GETCUSTNO");
        }


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
        // 캠페인 리스트
        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);

        // 딜러멤버십 등급
        MembershipGradeMngSearchVO membershipGradeMngSearchVO = new MembershipGradeMngSearchVO();
        List<MembershipGradeMngVO> mbrGradeCdList = membershipGradeMngSupportService.selectMembershipGradeMngsByCondition(membershipGradeMngSearchVO);
        model.addAttribute("mbrGradeCdList", mbrGradeCdList);

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 고객수집경로
        model.addAttribute("custCollSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM042", null, langCd));
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd)); // 고객출처
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("incomeLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("ageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));
        model.addAttribute("driverTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));
        model.addAttribute("jobCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));
        model.addAttribute("acCareerCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));
        model.addAttribute("cmpScaleContList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));
        model.addAttribute("marryYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));
        model.addAttribute("avgCarChgCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("chgBuyYnDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        //model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL181", null, langCd));
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));
        model.addAttribute("callStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화결과
//        model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드출처 // CRM209
//        model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드상태 CRM210
//        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 성공확률 CRM212

//        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회출처 CRM213
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회단계 CRM211
//        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 전출상태 CRM219
        model.addAttribute("memoTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM039", null, langCd)); // 메모유형

        //보험유형
        //model.addAttribute("insTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd)); // 보험유형
        model.addAttribute("incCmpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd)); //보험회사코드 목록

        // 멤버십 종류 (충전식/포인트식)
        model.addAttribute("cardTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM801", null, langCd)); // 멤버십 종류

        // 멤버십 포인트 사용 유형
        model.addAttribute("pointCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd));

        // 블루멤버십 포인트 사용 유형
        model.addAttribute("bmPointCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM807", null, langCd));

        // 블루멤버십 등급
        model.addAttribute("mLevelList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd)); // 블루멤버십 등급

        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //계약상태 공통코드 목록
        model.addAttribute("contractStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        //리드유형
        model.addAttribute("leadTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM223", null, langCd));  //리드유형

        // 사용자
        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);

        /******************************************************
         *********** 활동 탭 그리드 정보 코드************************/
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM321", null, langCd));           // 연락방식코드
        model.addAttribute("salesActiveTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM322", null, langCd));     // 영업활동유형코드
        model.addAttribute("salesActiveStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM323", null, langCd));   // 영업활동상태코드
        /*********** 활동 탭 그리드 정보 코드************************
        ******************************************************/

        // 주요정보수정가능기간
        String custInfoUpdtValidPrid = systemConfigInfoService.selectSystemConfigInfoByKey("custInfoUpdtValidPrid").getPrefVal();
        model.addAttribute("custInfoUpdtValidPrid", custInfoUpdtValidPrid);

        model.addAttribute("rcptTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, LocaleContextHolder.getLocale().getLanguage()));
        //model.addAttribute("paymMthList",commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, LocaleContextHolder.getLocale().getLanguage())); by wushibin 20191128
        model.addAttribute("paymMthList",commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", LocaleContextHolder.getLocale().getLanguage()));
        
        // NCAR_DSTIN_CD
        model.addAttribute("ncarDstinCdList",commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        //변경이력 유형
        model.addAttribute("custChgHistCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM100", null, langCd));

        // 멤버십 운영기준
        model.addAttribute("policy", LoginUtil.getMembershipPolicy());
        model.addAttribute("dcUseTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM052", null, langCd));

        //용품업무유형
        model.addAttribute("goodsTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        //용품판매상태
        model.addAttribute("contractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));

        //금융신청상태 : SAL042
        model.addAttribute("fincStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL042", null, langCd));

        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));

        return "/crm/cif/customerInfo/selectCustomerInfoMain";
    }

    /**
     * 고객정보등록 (법인) 관리 화면
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoCompanyMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoCompanyMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 캠페인 목록
        MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
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

        List<MarketingCampaignVO> custHoldTpDtlList = marketingCampaignService.selectMarketingCampaignsByCondition(marketingCampaignSearchVO);
        model.addAttribute("custHoldTpDtlList", custHoldTpDtlList);

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("incomeLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("ageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));
        model.addAttribute("driverTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));
        model.addAttribute("jobCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));
        model.addAttribute("acCareerCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));
        model.addAttribute("cmpScaleContList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));
        model.addAttribute("marryYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));
        model.addAttribute("avgCarChgCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("chgBuyYnDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        //model.addAttribute("purcCarBrandCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL181", null, langCd));
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));
        model.addAttribute("callStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화결과
//        model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드출처 CRM209
//        model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드상태 CRM210
//        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 성공확률 CRM212

//        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회출처 CRM213
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 판매기회단계 CRM211
//        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 전출상태 CRM219
        model.addAttribute("memoTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM039", null, langCd)); // 메모유형

        // 정비이력 - RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //계약상태 공통코드 목록
        model.addAttribute("contractStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        // 사용자
        UserSearchVO searchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(searchVO);
        model.addAttribute("users", users);

        return "/crm/cif/customerInfo/selectCustomerInfoCompanyMain";
    }

    /**
     * 고객정보등록 (개인) 등록 화면 - View
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoViewMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoViewMain(@RequestParam(value = "custNo", defaultValue = "") String custNo,
            @RequestParam(value = "dlrCd", defaultValue = "") String dlrCd,
            @RequestParam(value = "pltCd", defaultValue = "") String pltCd, Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        CustomerInfoVO customerInfoVO = new CustomerInfoVO();

        // 그룹,태그 목록
        CustomerGroupSearchVO customerGroupSearchVO = new CustomerGroupSearchVO();

        List<CustomerInfoVO> custTpList = new ArrayList<CustomerInfoVO>();
        customerInfoVO.setItemCd("01");
        customerInfoVO.setItemNm("个人客户"); // 개인
        custTpList.add(customerInfoVO);
        customerInfoVO = new CustomerInfoVO();
        customerInfoVO.setItemCd("02");
        customerInfoVO.setItemNm("公司客户"); // 법인
        custTpList.add(customerInfoVO);

        List<CustomerInfoVO> custCdList = new ArrayList<CustomerInfoVO>();
        customerInfoVO = new CustomerInfoVO();
        customerInfoVO.setItemCd("01");
        customerInfoVO.setItemNm("潜在"); // 잠재
        custCdList.add(customerInfoVO);
        customerInfoVO = new CustomerInfoVO();
        customerInfoVO.setItemCd("02");
        customerInfoVO.setItemNm("보유"); // 보유
        custCdList.add(customerInfoVO);

        customerGroupSearchVO.setsGrpTp("001"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custGroups = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custGroups", custGroups);

        customerGroupSearchVO.setsGrpTp("002"); // 001 그룹 , 002 태그
        List<CustomerGroupVO> custTags = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custTags", custTags);

        customerGroupSearchVO.setsGrpTp("003"); // 001 그룹 , 002 태그 , 003 취미
        List<CustomerGroupVO> custHobbys = customerGroupService.selectCustomerGroupByCondition(customerGroupSearchVO);
        model.addAttribute("custHobbys", custHobbys);

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("custTpList", custTpList);
        // 잠재,보유고객
        model.addAttribute("custCdList", custCdList);

        model.addAttribute("custHoldTp1List", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("incomeLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM013", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("ageCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM014", null, langCd));
        model.addAttribute("driverTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM015", null, langCd));
        model.addAttribute("jobCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM002", null, langCd));
        model.addAttribute("acCareerCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM012", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        model.addAttribute("prefContactMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        model.addAttribute("cmpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM032", null, langCd));
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));
        model.addAttribute("cmpScaleContList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM026", null, langCd));
        model.addAttribute("marryYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM028", null, langCd));
        model.addAttribute("avgCarChgCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM029", null, langCd));
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));
        model.addAttribute("callStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화결과
//        model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드출처 CRM209
//        model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 리드상태 CRM210
//        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd)); // 성공확률 CRM212

        model.addAttribute("custNo", custNo);

        return "/crm/cif/customerInfo/selectCustomerInfoViewMain";
    }

    /**
     * 고객 데이터를 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/customerSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO selectCustomerInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

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

            // 보유차량
            VehicleMasterSearchVO vehicleMasterSearchVO = new VehicleMasterSearchVO();
            vehicleMasterSearchVO.setsDlrCd(searchVO.getsDlrCd());
            vehicleMasterSearchVO.setsCustNo(searchVO.getsCustNo());
            //vehicleMasterSearchVO.setsUseYn("Y");//현재보유
            vehicleMasterSearchVO.setsNcarDstinCd("N"); // 현대차

            int vehicleCnt;
            vehicleCnt = vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(vehicleMasterSearchVO);
            //  추가구매여부
            if (vehicleCnt >= 2 ) {
                customerInfoVO.setBuyCnt("Y");
            } else {
                customerInfoVO.setBuyCnt("N");
            }

            // 교환구매

            ContractReSupportSearchVO contractReSupportSearchVO = new ContractReSupportSearchVO();
            contractReSupportSearchVO.setsContractCustNo(searchVO.getsCustNo());

            List<ContractReSupportVO> contractChangePurc = contractReOutBoundService.selectCustContractUseCarInfoSearch(contractReSupportSearchVO);

            if (contractChangePurc.size() != 0) {
                customerInfoVO.setChgBuyYn("Y");
                customerInfoVO.setPurcCarBrandNm(contractChangePurc.get(0).getCarBrandNm());
                customerInfoVO.setPurcCarModelNm(contractChangePurc.get(0).getCarNm());
            } else {
                customerInfoVO.setChgBuyYn("N");
            }

//            if (vehicleCnt > 0 ) {
//                List<VehicleCustomerInfoVO> vehicleCustomerInfoVO = new ArrayList<VehicleCustomerInfoVO>();
//                vehicleCustomerInfoVO = (List<VehicleCustomerInfoVO>)vehicleMasterService.selectVehicleCustomerInfoByCondition(vehicleMasterSearchVO);
//                customerInfoVO.setCarlineNmHC(vehicleCustomerInfoVO.get(0).getCarlineNm());
//                customerInfoVO.setModelNmHC(vehicleCustomerInfoVO.get(0).getModelNm());
//                customerInfoVO.setCarRegNoHC(vehicleCustomerInfoVO.get(0).getCarRegNo());
//                customerInfoVO.setCustSaleDtHC(vehicleCustomerInfoVO.get(0).getCustSaleDt());
//            }

            // 정비이력
//            RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
//            repairOrderSearchVO.setsCarOwnerId(searchVO.getsCustNo());
//
//            int repairOrderCnt;
//            repairOrderCnt = repairOrderService.selectRepairOrderByConditionCnt(repairOrderSearchVO);
//
//            if (repairOrderCnt > 0 ) {
//                List<RepairOrderVO> repairOrderVO = new ArrayList<RepairOrderVO>();
//                repairOrderVO = (List<RepairOrderVO>)repairOrderService.selectRepairOrderByCondition(repairOrderSearchVO);
//
//                customerInfoVO.setDlrCdLH(repairOrderVO.get(0).getDlrCd());
//                customerInfoVO.setCarRegNoLH(repairOrderVO.get(0).getCarRegNo());
//                customerInfoVO.setDriverNmLH(repairOrderVO.get(0).getDriverNm());
//                customerInfoVO.setRunDistValLH(repairOrderVO.get(0).getRunDistVal());
//                customerInfoVO.setRoDtLH(repairOrderVO.get(0).getRoDt());
//            }

        }

        return customerInfoVO;
    }

    /**
     * 고객 중복 체크 (고객명 + 핸드폰)
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustDupByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO selectCustDupByKey(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        return customerInfoOutBoundService.selectCustDupByKey(searchVO);
    }

    /**
     * 화면에서 고객 중복 체크 (고객명 + 핸드폰)
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustDupScreenByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustDupScreenByKey(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

//        result.setTotal(customerInfoOutBoundService.selectCustDupByKeyCnt(searchVO));

//        if (result.getTotal() != 0) {

        List<CustomerInfoVO> customerInfoList = new ArrayList<CustomerInfoVO>();

        CustomerInfoVO customerInfoVO = new CustomerInfoVO();
        customerInfoVO = customerInfoOutBoundService.selectCustDupByKey(searchVO);
        if (customerInfoVO != null) {
            customerInfoList.add(customerInfoVO);
            result.setData(customerInfoList);
            result.setTotal(customerInfoList.size());

        } else {
            result.setTotal(0);
        }
//        }

        return result;


    }

    /**
     * 고객 중복 체크 (증거유형 + 증거번호)
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustMathDocDupByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustMathDocDupByKey(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        List<CustomerInfoVO> customerInfoList = new ArrayList<CustomerInfoVO>();

        CustomerInfoVO customerInfoVO = new CustomerInfoVO();
        customerInfoVO = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);
        if (customerInfoVO != null) {
            customerInfoList.add(customerInfoVO);
            result.setData(customerInfoList);
            result.setTotal(customerInfoList.size());

        } else {
            result.setTotal(0);
        }
        return result;
    }


    /**
     * 고객 데이터 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/customerListSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult customerListSearch(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(customerInfoOutBoundService.selectCustomerListByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(customerInfoOutBoundService.selectCustomerListByCondition(searchVO));
        }
        return result;
    }

    /**
     * 고객조회 팝업 > 차량정보 기준 고객 목록 조회
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerAndCarInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerAndCarInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(customerInfoOutBoundService.selectCustomerAndCarInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(customerInfoOutBoundService.selectCustomerAndCarInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 연계인 데이터를 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/customerRelSearch.do", method = RequestMethod.POST)
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
     * 고객을 신규로 생성한다. - 고객화면
     *
     * @param CustomerInfo
     *            VO - 고객정보 VO
     * @return CustomerInfoVO
     */
    @RequestMapping(value = "/crm/cif/customerInfo/insertCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO insertCustomer(@RequestBody CustomerInfoVO customerInfoVO) throws Exception {

        customerInfoVO.setRegUsrId(LoginUtil.getUserId());
        customerInfoVO.setDlrCd(LoginUtil.getDlrCd());
        if (StringUtils.isEmpty(customerInfoVO.getCustCollSrcCd())) {
            customerInfoVO.setCustCollSrcCd("01"); // CRM042 01:판매 , 02:정비
        };

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
    @RequestMapping(value = "/crm/cif/customerInfo/updateCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public CustomerInfoVO updateCustomer(@RequestBody CustomerInfoVO customerInfoVO) throws Exception {

        customerInfoVO.setUpdtUsrId(LoginUtil.getUserId());
        customerInfoVO.setDlrCd(LoginUtil.getDlrCd());

        // 고객정보저장
        customerInfoVO = customerInfoService.updateCustomer(customerInfoVO);

        return customerInfoVO;
    }

    /**
     * 고객조회 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustSearchPopup.do", method = RequestMethod.GET)
    public String selectCustSearchPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));// Today
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));// 고객유형 custTpList (CRM001)
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));// 잠재,보유고객
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));// sexCdList (COM017)
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());// 로그인 정보 : 딜러코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));// 증서유형
        model.addAttribute("pconTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM030", null, langCd));//연계인 유형

        return "/crm/cif/customerInfo/selectCustSearchPopup";
    }

    /**
     * 보유차량조회팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustHaveCarSearchPopup.do", method = RequestMethod.GET)
    public String selectCustHaveCarSearchPopup(Model model) throws Exception {

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // NCAR_DSTIN_CD
        model.addAttribute("ncarDstinCdList",commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/crm/cif/customerInfo/selectCustHaveCarSearchPopup";
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
    @RequestMapping(value = "/crm/cif/customerInfo/multiCustomerRelChg.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustomerRelChg(@Validated @RequestBody BaseSaveVO<CustomerRelInfoVO> saveVO,
            BindingResult bindingResult) throws Exception {
        customerRelInfoService.multiCustomerRelChg(saveVO);
        return true;
    }

    /**
     * 고객의 정보를 등록한다.
     *
     * @param saveVO
     *            - 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     *
     */
    @RequestMapping(value = "/crm/cif/customerInfo/multiCustomerInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustomerInfo(@RequestBody BaseSaveVO<CustomerInfoVO> saveVO) throws Exception {

        customerInfoService.multiCustomerInfo(saveVO);
        return true;
    }

    /**
     * 리드 정보를 조회 한다.
     *
     * @param leadInfoVO
     *            - 리드 정보
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectLeads.do", method = RequestMethod.POST)
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
     * 판매기회 관리 목록 데이터를 조회한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectSalesOpptMgmts.do", method = RequestMethod.POST)
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
     * RO접수 목록 데이터를 조회한다. 정비이력
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectRepairOrders.do", method = RequestMethod.POST)
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
     * 계약품위현황 목록을 조회한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectProgressSts.do", method = RequestMethod.POST)
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
     * 메모 목록 데이터를 조회한다.
     *
     * @param searchVO
     *   - 조회 조건을 포함하는 CustomerMemoSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerMemo.do", method = RequestMethod.POST)
    public @ResponseBody
    SearchResult selectCustomerMemo(@RequestBody CustomerMemoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsRegUsrId(LoginUtil.getUserId());

        result.setTotal(customerMemoService.selectCustomerMemoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(customerMemoService.selectCustomerMemoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 메모 목록 데이터를 조회한다.
     *
     * @param saveVO
     *            - 메모 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     *
     */
    @RequestMapping(value = "/crm/cif/customerInfo/multiCustomerMemoChg.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustomerMemoChg(@Validated @RequestBody BaseSaveVO<CustomerMemoVO> saveVO,
            BindingResult bindingResult) throws Exception {
        customerMemoService.multiCustomerMemoChg(saveVO);
        return true;
    }

    /**
     * 딜러멤버십 포인트 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectMembershipPointHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointHiss(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        result.setTotal(membershipPointHisSupportService.selectPointHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipPointHisSupportService.selectPointHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 블루멤버십 포인트 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectBlueMembershipCalcDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipCalcDetails(@RequestBody BlueMembershipIfParamVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BlueMembershipIfConsumeListRapVO blueMembershipIfConsumeListRapVO = blueMembershipInterfaceService.selectAddORConsumeintegral(searchVO);
        if (blueMembershipIfConsumeListRapVO != null) {
            result.setTotal( ((blueMembershipIfConsumeListRapVO.getDataList())==null)?0:blueMembershipIfConsumeListRapVO.getDataList().size());
            if(result.getTotal() != 0){
                result.setData(blueMembershipIfConsumeListRapVO.getDataList());
            }
        }
        return result;
    }

    /**
     * 보험가입정보관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectIncSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncSearch(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        result.setTotal(incJoinInfoService.selectIncJoinInfoByConditionCnt(searchVO));
        if (result.getTotal() != 0 ) {
            result.setData(incJoinInfoService.selectIncJoinInfoByCondition(searchVO));
        }

        return result;

    }

    /**
     * 고객 예치금 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustChargeMstSearchVO
     * @return CustChargeMstVO
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustChargeMst.do", method = RequestMethod.POST)
    @ResponseBody
    public CustChargeMstVO selectCustChargeMst(@RequestBody CustChargeMstSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            };

        return custChargeMgmtService.selectCustChargeMstByKey(searchVO);

    }

    /**
     * 블루멤버십 회원 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectBlueMemberInfoCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfInfoRapVO selectBlueMemberInfoCondition(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        BlueMembershipIfInfoRapVO blueMembershipIfInfoRapVO = new BlueMembershipIfInfoRapVO();
        BlueMembershipJoinVO joinVO = new BlueMembershipJoinVO();

        joinVO.setCustNo(searchVO.getsCustNo());

        blueMembershipIfInfoRapVO = blueMembershipJoinSupportService.selectMemberUserIntegralInfo(joinVO);

        return blueMembershipIfInfoRapVO;

    }

    /**
     * 고객 변경 이력 데이터 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerInfoHistory(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(customerInfoService.selectCustomerInfoHistoryByConditionCnt(searchVO));

        if (result.getTotal() != 0) {


            result.setData(customerInfoService.selectCustomerInfoHistoryByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회 관리 탭 - 활동 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectSalesActives.do", method = RequestMethod.POST)
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
     * 20170302 고객 상세에서 해당 URL 삭제했음
     * 패키지 쿠폰 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectPackageCouponHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageCouponHiss(@RequestBody PackageCouponHisSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        SearchResult result = new SearchResult();
        result.setTotal(packageCouponHisSupportService.selectPackageCouponHissByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageCouponHisSupportService.selectPackageCouponHissByCondition(searchVO));
        }

        return result;
    }

    /**
     * 메시지이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContactHistorySearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectMsgHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMsgHistorys(@RequestBody ContactHistorySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        //{고객번호}을(를) 확인하여 주세요.
        if(StringUtils.isBlank(searchVO.getsCustNo())){
            throw new BizException(
                messageSource.getMessage("global.info.confirmMsgParam",new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())},LocaleContextHolder.getLocale())
            );
        }

        result.setTotal(contactHistoryService.selectMsgHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contactHistoryService.selectMsgHistorysByCondition(searchVO));
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
   @RequestMapping(value="/crm/cif/customerInfo/selectVehOfCustInfo.do" , method=RequestMethod.POST)
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
    * 첨부문서 번호로 등록된 파일 목록을 조회한다.
    * @param fileDocNo 첨부문서번호
    * @return 파일 목록
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectFiles.do")
   @ResponseBody
   public SearchResult selectFiles(@RequestBody CustomerInfoSearchVO fsearchVO) throws Exception {
       SearchResult result = new SearchResult();
       CustFileItemVO custFileItemVO = new CustFileItemVO();
       FileItemSearchVO searchVO = new FileItemSearchVO();
       int rltCnt = 0;
       int i = 0;
       int a = 0;
       String codeNm = "";

       searchVO.setsFileDocNo(fsearchVO.getsDocId());

       String fileDocNo = searchVO.getsFileDocNo();

       List<FileItemVO> list = null;
       List<CustFileItemVO> lists = new ArrayList<CustFileItemVO>();

       // 고객관련 01 시작
       if(StringUtils.isEmpty(fileDocNo)){
           list = new ArrayList<FileItemVO>();
       } else {
           list = fileMgrService.selectFileItemsByFileDocNo(searchVO.getsFileDocNo());

           if (list.size() > 0) {
               codeNm = commonCodeService.selectCommonCodeName("CRM041", "01", "zh");
               for (i=0; i < list.size() ; i++) {
                   custFileItemVO = new CustFileItemVO();
                   custFileItemVO.setDocTp("01");
                   custFileItemVO.setDocTpNm(codeNm);
                   custFileItemVO.setFileDocNo(list.get(i).getFileDocNo());
                   custFileItemVO.setFileNm(list.get(i).getFileNm());
                   custFileItemVO.setFileSize(list.get(i).getFileSize());
                   custFileItemVO.setFileNo(list.get(i).getFileNo());
                   a = i;
                   lists.add(a, custFileItemVO);
               }
           }
       }
       // 고객관련 01 끝

       // 계약관련 정보  02 - 시작
       ContractSearchVO contractSearchVO = new ContractSearchVO();
       List<ContractVO> contractVOList = new ArrayList<ContractVO>();
       contractSearchVO.setsContractCustNo(fsearchVO.getsCustNo());
       rltCnt = progressStsService.selectProgressStsByConditionCnt(contractSearchVO);

       if (rltCnt != 0) {
           contractVOList = progressStsService.selectProgressStsByCondition(contractSearchVO);
           if (contractVOList.size() > 0) {
               for (int j=0; j < contractVOList.size() ; j++) {
                   searchVO = new FileItemSearchVO();
                   searchVO.setsFileDocNo(contractVOList.get(j).getFileDocId());
                   list = new ArrayList<FileItemVO>();
                   list = fileMgrService.selectFileItemsByFileDocNo(searchVO.getsFileDocNo());
                   if (list.size() > 0) {
                       codeNm = commonCodeService.selectCommonCodeName("CRM041", "02", "zh");
                       if (lists.size() != 0) {a++;};
                       for (i=0; i < list.size() ; i++) {
                           custFileItemVO = new CustFileItemVO();
                           custFileItemVO.setDocTp("02");
                           custFileItemVO.setDocTpNm(codeNm);
                           custFileItemVO.setFileDocNo(list.get(i).getFileDocNo());
                           custFileItemVO.setFileNm(list.get(i).getFileNm());
                           custFileItemVO.setFileSize(list.get(i).getFileSize());
                           custFileItemVO.setFileNo(list.get(i).getFileNo());
                           a = a + i;
                           lists.add(a, custFileItemVO);
                       }
                   }

               }
           }
       }
       // 계약관련 정보 - 끝

       // Invoice 정보 - 시작
       // Invoice 정보 - 끝

       // 유일정보수정 - 시작
       CustomerInfoUpdtReqSearchVO customerInfoUpdtReqSearchVO = new CustomerInfoUpdtReqSearchVO();
       customerInfoUpdtReqSearchVO.setsCustNo(fsearchVO.getsCustNo());
       rltCnt = 0;
       rltCnt = customerInfoUpdateService.selectCustomerInfoReqByConditionCnt(customerInfoUpdtReqSearchVO);

       if (rltCnt > 0) {
           List<CustomerInfoUpdtReqVO> customerInfoUpdtReqList= new ArrayList<CustomerInfoUpdtReqVO>();
           customerInfoUpdtReqList = customerInfoUpdateService.selectCustomerInfoReqByCondition(customerInfoUpdtReqSearchVO);
           if (customerInfoUpdtReqList.size() > 0) {
               for (int z=0; z < customerInfoUpdtReqList.size() ; z++) {
                   searchVO = new FileItemSearchVO();
                   searchVO.setsFileDocNo(customerInfoUpdtReqList.get(z).getDocId());
                   list = new ArrayList<FileItemVO>();
                   list = fileMgrService.selectFileItemsByFileDocNo(searchVO.getsFileDocNo());
                   if (list.size() > 0) {
                       codeNm = commonCodeService.selectCommonCodeName("CRM041", "04", "zh");
                       if (lists.size() != 0) {a++;};
                       for (i=0; i < list.size() ; i++) {
                           custFileItemVO = new CustFileItemVO();
                           custFileItemVO.setDocTp("04");
                           custFileItemVO.setDocTpNm(codeNm);
                           custFileItemVO.setFileDocNo(list.get(i).getFileDocNo());
                           custFileItemVO.setFileNm(list.get(i).getFileNm());
                           custFileItemVO.setFileSize(list.get(i).getFileSize());
                           custFileItemVO.setFileNo(list.get(i).getFileNo());
                           a = a + i;
                           lists.add(a, custFileItemVO);
                       }
                   }
               }
           }
       }
       // 유일정보수정 - 끝

       result.setTotal(lists.size());
       result.setData(lists);

       return result;
   }

   /**
    * 추적이력관리 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptTraceMgmtSearchVO
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectSalesOpptTraceMgmt.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSalesOpptTraceMgmt(@RequestBody SalesOpptTraceMgmtSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(salesOpptTraceMgmtService.selectSalesOpptTraceMgmtsByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(salesOpptTraceMgmtService.selectSalesOpptTraceMgmtsByCondition(searchVO));
       }

       return result;
   }

   /**
    * 판매기회 이력 목록 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtHistSearchVO
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectSalesOpptProcessMgmtHist.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSalesOpptProcessMgmtHist(@RequestBody SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsHistByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsHistByCondition(searchVO));
       }

       return result;
   }

   /**
    * 고객 유일정보 업데이트 팝업
    *
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoUpdatePopup.do", method = RequestMethod.GET)
   public String selectCustomerInfoUpdatePopup(@RequestParam(value = "custNo", defaultValue = "") String custNo,
           @RequestParam(value = "dlrCd", defaultValue = "") String dlrCd, Model model) throws Exception {

//       SearchResult result = new SearchResult();

//       CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
//       searchVO.setsDlrCd(dlrCd);
//       searchVO.setsCustNo(custNo);
//       result.setTotal(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));
//
//       if (result.getTotal() != 0) {
//           List<CustomerInfoVO> customerInfoVO = customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO);
//
//           model.addAttribute("customer", customerInfoVO);
//       }

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       //int evalContinuedCnt = 0;

       // Today
       String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
       model.addAttribute("sysDate", sysDate);

       // 로그인 정보 : 딜러코드
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());

       model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
       // 잠재,보유고객
       model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));

       model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

       model.addAttribute("custNo", custNo);

       CustomerInfoUpdtReqSearchVO searchVO = new CustomerInfoUpdtReqSearchVO();
       searchVO.setsCustNo(custNo);
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsStatCd("01");

       // 진행중인 유일정보수정이 있으면 알람을 표시하고 창을 닫는다.
       //evalContinuedCnt = customerInfoUpdateService.selectCustomerInfoReqByConditionCnt(searchVO);

       //model.addAttribute("evalContinuedCnt", evalContinuedCnt);

       return "/crm/cif/customerInfo/selectCustomerInfoUpdatePopup";
   }

   /**
    * 진행중인 유일정보 수정이 있는지 카운트를 조회한다.
    *
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoRequestCheck.do", method = RequestMethod.GET)
   @ResponseBody
   public int selectCustomerInfoRequestCheck(@RequestParam(value = "custNo", defaultValue = "") String custNo,
           @RequestParam(value = "dlrCd", defaultValue = "") String dlrCd, Model model) throws Exception {

       int evalContinuedCnt = 0;

       CustomerInfoUpdtReqSearchVO searchVO = new CustomerInfoUpdtReqSearchVO();
       searchVO.setsCustNo(custNo);
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsStatCd("01");

       // 진행중인 유일정보수정이 있으면 알람을 표시하고 창을 닫는다.
       evalContinuedCnt = customerInfoUpdateService.selectCustomerInfoReqByConditionCnt(searchVO);

       return evalContinuedCnt;
   }

   /**
    * 고객 유일정보를 수정요청한다.
    *
    * @param CustomerInfoUpdtReqVO
    *            VO - 고객정보 VO
    * @return CustomerInfoUpdtReqVO
    */
   @RequestMapping(value = "/crm/cif/customerInfo/insertCustomerInfoReq.do", method = RequestMethod.POST)
   @ResponseBody
   public int insertCustomerInfoReq(@RequestBody CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception {

       int sendCnt = 0;

       sendCnt = customerInfoUpdateService.insertCustomerInfoReq(customerInfoUpdtReqVO);

       if ("02".equals(customerInfoUpdtReqVO.getCustCd())) {
           if (sendCnt != 0) {
               customerInfoUpdateService.selectCustomerInfoReqCallCamel();
           }
       }

       return sendCnt;
   }

   /**
    * 고객 유일정보 목록 화면
    *
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoReqMain.do", method = RequestMethod.GET)
   public String selectCustomerInfoReqMain(Model model) throws Exception {

       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM409", null, LocaleContextHolder.getLocale().getLanguage()));

       return "/crm/cif/customerInfo/selectCustomerInfoReqMain";
   }

   /**
    * 고객 유일정보 심사 목록 화면
    *
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoReqEvalMain.do", method = RequestMethod.GET)
   public String selectCustomerInfoReqEvalMain(Model model) throws Exception {

       model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM409", null, LocaleContextHolder.getLocale().getLanguage()));

       return "/crm/cif/customerInfo/selectCustomerInfoReqEvalMain";
   }

   /**
    * 고객 유일정보 심사 목록 조회
    *
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoReqEval.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCustomerInfoReqEval(@RequestBody CustomerInfoUpdtReqSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       /******************************************
        *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
        ******************************************/
       if (searchVO.getsReqDtFrom() != null || searchVO.getsReqDtTo() != null) {
           Calendar startCal = Calendar.getInstance();
           Calendar endCal = Calendar.getInstance();

           int year;
           int month;
           int day;

           // 시작일
           //startCal.setTime(searchVO.getReqDt)
           startCal.setTime(searchVO.getsReqDtFrom());
           year = startCal.get(Calendar.YEAR);
           month = startCal.get(Calendar.MONTH);
           day = startCal.get(Calendar.DATE);
           startCal.set(year, month, day, 00, 00, 00);
           searchVO.setsReqDtFrom(startCal.getTime());

           // 종료일
           endCal.setTime(searchVO.getsReqDtTo());
           year = endCal.get(Calendar.YEAR);
           month = endCal.get(Calendar.MONTH);
           day = endCal.get(Calendar.DATE);
           endCal.set(year, month, day, 23, 59, 59);
           searchVO.setsReqDtTo(endCal.getTime());
       }
       /******************************************
        *** 날짜 검색 조건 끝 ***********************
        ******************************************/

       result.setTotal(customerInfoUpdateService.selectCustomerInfoReqByConditionCnt(searchVO));

       if(result.getTotal() != 0){

           result.setData(customerInfoUpdateService.selectCustomerInfoReqByCondition(searchVO));
       }

       return result;
   }

   /**
    * 쿠폰 발행 목록을 조회 한다.
    *
    * @param searchVO
    *            - 조회 조건을 포함하는 CustomerInfoSearchVO
    * @param model
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectCustCouponPublishInfo.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCustCouponPublishInfo(@RequestBody CustPublishInfoSearchVO searchVO) throws Exception {
       SearchResult result = new SearchResult();

       result.setTotal(customerCouponMgmtService.selectCouponCustConfigByConditionCnt(searchVO));
       if (result.getTotal() != 0) {
           result.setData(customerCouponMgmtService.selectCouponCustConfigByCondition(searchVO));
       }
       return result;
   }

   /**
    * 멤버십 가입 정보 데이터를 조회한다.
    * @param searchVO - custNo
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectMemberships.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectMemberships(@RequestBody MembershipSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();
       result.setTotal(membershipService.selectMembershipsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(membershipService.selectMembershipsByCondition(searchVO));
       }

       return result;
   }

   /**
    * 고객-연계인 데이터 목록을 조회 한다.
    *
    * @param searchVO - 조회 조건을 포함하는 CustomerInfoSearchVO
    * @param model
    * @return
    */
   @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerAndPconInfo.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectCustomerAndPconInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {
       SearchResult result = new SearchResult();
       result.setTotal(customerInfoOutBoundService.selectCustomerAndPconInfoByConditionCnt(searchVO));
       if (result.getTotal() != 0) {
           result.setData(customerInfoOutBoundService.selectCustomerAndPconInfoByCondition(searchVO));
       }
       return result;
   }

   @RequestMapping(value = "/crm/cif/customerInfo/updateCustomerMngScAssign.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean updateCustomerMngScAssign(@RequestBody BaseSaveVO<CustomerInfoVO> obj) throws Exception {

       customerInfoOutBoundService.multiCustomerMngScAssign(obj);

       return true;

   }

}
