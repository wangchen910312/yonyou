package chn.bhmc.dms.crm.cif.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

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
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoUpdateService;
import chn.bhmc.dms.crm.cif.service.CustomerMemoService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoUpdtReqVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerMemoVO;
import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoSearchVO;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesActiveSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.crm.slm.service.LeadInfoService;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.sal.cnt.service.ProgressStsService;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
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
     * MemberShipGradeManagement Service
     */
    @Resource(name = "membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

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
     * customerInfoUpdateService Service
     */
    @Resource(name = "customerInfoUpdateService")
    CustomerInfoUpdateService customerInfoUpdateService;

    /**
     * 계약품의현황 서비스
     */
    //@Autowired
    //VehOfCustInfoService vehOfCustInfoService;

    /**
     * 고객정보등록 (개인) 등록 화면
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoRegMain.do", method = RequestMethod.GET)
    public String selectCustomerInfoRegMain(Model model) throws Exception {

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
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // model.addAttribute("custTpList", custTpList);
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        // model.addAttribute("custCdList", custCdList);
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        // model.addAttribute("custHoldTpDtlList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
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
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // model.addAttribute("custTpList", custTpList);
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        // model.addAttribute("custCdList", custCdList);
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        // model.addAttribute("custHoldTpDtlList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
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
        List<MembershipGradeMngVO> mbrGradeCdList = membershipGradeMngService.selectMembershipGradeMngsByCondition(membershipGradeMngSearchVO);
        model.addAttribute("mbrGradeCdList", mbrGradeCdList);

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // model.addAttribute("custTpList", custTpList);
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        // model.addAttribute("custCdList", custCdList);
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        // model.addAttribute("custHoldTpDtlList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
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
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));
        model.addAttribute("callStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화상태
        model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd)); // 리드출처
        model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd)); // 리드상태
        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd)); // 성공확률

        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd)); // 판매기회출처
        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd)); // 판매기회단계
        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd)); // 전출상태
        model.addAttribute("memoTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM039", null, langCd)); // 메모유형

        // 멤버십 종류 (충전식/포인트식)
        model.addAttribute("cardTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM801", null, langCd)); // 멤버십 종류

        // 블루멤버십 유형
        model.addAttribute("pointCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd)); // 블루멤버십 종류

        // 정비이력 - RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

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
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // model.addAttribute("custTpList", custTpList);
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        // model.addAttribute("custCdList", custCdList);
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        // model.addAttribute("custHoldTpDtlList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
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
        model.addAttribute("chinaZodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM034", null, langCd));
        model.addAttribute("zodiacSignCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM035", null, langCd));
        model.addAttribute("bloodTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM036", null, langCd));
        model.addAttribute("dutyCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM037", null, langCd));
        model.addAttribute("callStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화상태
        model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd)); // 리드출처
        model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd)); // 리드상태
        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd)); // 성공확률

        model.addAttribute("saleOpptSrcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM213", null, langCd)); // 판매기회출처
        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd)); // 판매기회단계
        model.addAttribute("trsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM219", null, langCd)); // 전출상태
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

        // TODO [이교진] 고객유형 custTpList (CRM001)
        List<CustomerInfoVO> custTpList = new ArrayList<CustomerInfoVO>();
        customerInfoVO.setItemCd("01");
        customerInfoVO.setItemNm("个人客户"); // 개인
        custTpList.add(customerInfoVO);
        customerInfoVO = new CustomerInfoVO();
        customerInfoVO.setItemCd("02");
        customerInfoVO.setItemNm("公司客户"); // 법인
        custTpList.add(customerInfoVO);

        // TODO [이교진] 잠재보유 custCdList
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
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("custTpList", custTpList);
        // model.addAttribute("custTpList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        model.addAttribute("custCdList", custCdList);
        // model.addAttribute("custCdList",
        // commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));

        model.addAttribute("custHoldTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd));
        // TODO [이교진] 고객확보유형 custHoldTp1List 추가 필요.
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
        model.addAttribute("callStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM608", null, langCd)); // 통화상태
        model.addAttribute("leadSrcList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM209", null, langCd)); // 리드출처
        model.addAttribute("statList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM210", null, langCd)); // 리드상태
        model.addAttribute("succPrbCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM212", null, langCd)); // 성공확률

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

        result.setTotal(customerInfoService.selectCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */

            customerInfoVO.setCustInfoDS(customerInfoService.selectCustomerInfoByCondition(searchVO));
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

            int vehicleCnt;
            vehicleCnt = vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(vehicleMasterSearchVO);
            if (vehicleCnt > 0 ) {
                List<VehicleCustomerInfoVO> vehicleCustomerInfoVO = new ArrayList<VehicleCustomerInfoVO>();
                vehicleCustomerInfoVO = (List<VehicleCustomerInfoVO>)vehicleMasterService.selectVehicleCustomerInfoByCondition(vehicleMasterSearchVO);
                customerInfoVO.setCarlineNmHC(vehicleCustomerInfoVO.get(0).getCarlineNm());
                customerInfoVO.setModelNmHC(vehicleCustomerInfoVO.get(0).getModelNm());
                customerInfoVO.setCarRegNoHC(vehicleCustomerInfoVO.get(0).getCarRegNo());
                customerInfoVO.setCustSaleDtHC(vehicleCustomerInfoVO.get(0).getCustSaleDt());
            }

            // 정비이력
            RepairOrderSearchVO repairOrderSearchVO = new RepairOrderSearchVO();
            repairOrderSearchVO.setsCarOwnerId(searchVO.getsCustNo());

            int repairOrderCnt;
            repairOrderCnt = repairOrderService.selectRepairOrderByConditionCnt(repairOrderSearchVO);

            if (repairOrderCnt > 0 ) {
                List<RepairOrderVO> repairOrderVO = new ArrayList<RepairOrderVO>();
                repairOrderVO = (List<RepairOrderVO>)repairOrderService.selectRepairOrderByCondition(repairOrderSearchVO);

                customerInfoVO.setDlrCdLH(repairOrderVO.get(0).getDlrCd());
                customerInfoVO.setCarRegNoLH(repairOrderVO.get(0).getCarRegNo());
                customerInfoVO.setDriverNmLH(repairOrderVO.get(0).getDriverNm());
                customerInfoVO.setRunDistValLH(repairOrderVO.get(0).getRunDistVal());
                customerInfoVO.setRoDtLH(repairOrderVO.get(0).getRoDt());
            }

            // 딜러멤버십
            MembershipPointHisSearchVO membershipPointHisSearchVO = new MembershipPointHisSearchVO();
            membershipPointHisSearchVO.setsCustNo(searchVO.getsCustNo());
            membershipPointHisSearchVO.setsDlrCd(LoginUtil.getDlrCd());

            int membershipCnt;
            membershipCnt = membershipPointHisService.selectPointHistorysByConditionCnt(membershipPointHisSearchVO);

            if (membershipCnt > 0 ) {
                List<MembershipPointHisVO> membershipPointHisVO = new ArrayList<MembershipPointHisVO>();
                membershipPointHisVO = (List<MembershipPointHisVO>)membershipPointHisService.selectPointInfosCondition(membershipPointHisSearchVO);

                customerInfoVO.setGradeCdDMS(membershipPointHisVO.get(0).getGradeCd());
                customerInfoVO.setUsePointDMS(membershipPointHisVO.get(0).getUsePoint());
                customerInfoVO.setChargeUsePointDMS(membershipPointHisVO.get(0).getChargeUsePoint());
                customerInfoVO.setJoinDtDMS(membershipPointHisVO.get(0).getRegDt());

            }

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

        return customerInfoService.selectCustDupByKey(searchVO);
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
    public CustomerInfoVO selectCustMathDocDupByKey(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        return customerInfoService.selectCustMathDocDupByKey(searchVO);
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
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())) {
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(customerInfoService.selectCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {


            result.setData(customerInfoService.selectCustomerInfoByCondition(searchVO));
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
    public SearchResult selectCustomerRelInfo(@RequestBody CustomerRelInfoVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(customerRelInfoService.selectCustomerRelInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(customerRelInfoService.selectCustomerRelInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 고객을 신규로 생성한다.
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
     * 고객 유일정보를 수정요청한다.
     *
     * @param CustomerInfo
     *            VO - 고객정보 VO
     * @return CustomerInfoVO
     */
    @RequestMapping(value = "/crm/cif/customerInfo/insertCustomerInfoReq.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertCustomerInfoReq(@RequestBody CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception {

        return customerInfoService.insertCustomerInfoReq(customerInfoUpdtReqVO);
    }

    /**
     * 고객조회 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustSearchPopup.do", method = RequestMethod.GET)
    public String selectCustSearchPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        // sexCdList (COM017)
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cif/customerInfo/selectCustSearchPopup";
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
     * RO접수 목록 데이터를 조회한다.
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
     * 보유차량 목록 데이터를 조회한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectHaveCar.do", method = RequestMethod.POST)
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
     * 고객정보등록 (개인) 등록 화면 - View
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectCustomerInfoUpdatePopup.do", method = RequestMethod.GET)
    public String selectCustomerInfoUpdatePopup(@RequestParam(value = "custNo", defaultValue = "") String custNo,
            @RequestParam(value = "dlrCd", defaultValue = "") String dlrCd, Model model) throws Exception {

        SearchResult result = new SearchResult();

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsCustNo(custNo);

        result.setTotal(customerInfoService.selectCustomerInfoByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            List<CustomerInfoVO> customerInfoVO = customerInfoService.selectCustomerInfoByCondition(searchVO);

            model.addAttribute("customer", customerInfoVO);
        }

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        model.addAttribute("custNo", custNo);

        return "/crm/cif/customerInfo/selectCustomerInfoUpdatePopup";
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

        result.setTotal(membershipPointHisService.selectPointHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipPointHisService.selectPointHistorysByCondition(searchVO));
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
    public SearchResult selectBlueMembershipCalcDetails(@RequestBody BlueMembershipCalcSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        result.setTotal(blueMembershipCalcService.selectBlueMembershipCalcDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(blueMembershipCalcService.selectBlueMembershipCalcDetailsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 멤버십 포인트 정보 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerInfo/selectPointInfosCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPointInfosCondition(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if (StringUtils.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        result.setTotal(membershipPointHisService.selectPointHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipPointHisService.selectPointInfosCondition(searchVO));
        }

        return result;

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
     * 고객 유일정보를 수정한다.
     *
     * @param CustomerInfoUpdtReqVO
     *            VO - 고객정보 VO
     * @return CustomerInfoUpdtReqVO
     */
    @RequestMapping(value = "/crm/cif/customerInfo/updateCustomerInfoReq.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateCustomerInfoReq(@RequestBody CustomerInfoUpdtReqVO customerInfoUpdtReqVO) throws Exception {

        int sendCnt = 0;

        customerInfoUpdtReqVO.setEvalUsrId(LoginUtil.getUserId());
        customerInfoUpdtReqVO.setEvalUsrNm(LoginUtil.getUserNm());
        customerInfoUpdtReqVO.setUpdtUsrId(LoginUtil.getUserId());

        sendCnt = customerInfoUpdateService.updateCustomerInfoReq(customerInfoUpdtReqVO);

        if (sendCnt != 0) {
            customerInfoUpdateService.selectCustomerInfoReqCallEai();
        }

        return sendCnt;
    }

}
