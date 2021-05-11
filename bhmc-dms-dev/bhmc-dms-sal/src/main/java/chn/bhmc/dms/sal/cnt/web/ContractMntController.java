package chn.bhmc.dms.sal.cnt.web;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.ZipCodeService;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.sal.bsc.service.FinancialProductMngService;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.vo.ContractMntSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;

/**
 * 계약관리
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractMnt")
public class ContractMntController extends HController {

    /**
     * 계약 서비스
     */
    @Resource(name="contractMntService")
    ContractMntService contractMntService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 차관적용차량스펙콤보서비스
     **/
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 사용자 관리 서비스
     */
//    @Resource(name="userService")
//    UserService userService;

    /**
     * Bay관리 : 서비스 담당자
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 보험가입정보관리 서비스 - 주소지: 성, 시, 구 호출
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;
    /**
     * crm 주소정보 관리 서비스
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * CRM 고객 정보 재조회
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 우편번호 조회 서비스
     */
    @Resource(name="zipCodeService")
    ZipCodeService zipCodeService;

    /**
     * 금융상품관리 서비스
     */
    //@Resource(name="financialProductsManagementService")
    //FinancialProductsManagementService financialProductsManagementService;
    @Resource(name="financialProductMngService")
    FinancialProductMngService financialProductMngService;



    /**
     * Customer Management
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 권한 관리 서비스
     */
//    @Resource(name="roleMappingService")
//    AuthoritiesService roleMappingService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;


    /**
     * 판매고문 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;


    /**
     * 중고차 평가매입 서비스
     */
    @Resource(name="purcEvalService")
    PurcEvalService purcEvalService;

    /**
     * 블루멤버십 서비스
     */
    @Resource(name="blueMembershipJoinSupportService")
    BlueMembershipJoinSupportService blueMembershipJoinSupportService;

    /**
     * 계약품의 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContractMntMain.do", method = RequestMethod.GET)
    public String selectContractMntMain(Model model,
            @RequestParam(value="orderNo",    required = false, defaultValue="") String orderNo,
            @RequestParam(value="estimateNo", required = false, defaultValue="") String estimateNo,
            @RequestParam(value="saleOpptNo", required = false, defaultValue="") String saleOpptNo
    ) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        // 판매사원 리스트
        //model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        //List<UserVO> saleEmpList = roleMappingService.selectAuthoritiesUsersByRoleId(Constants.SYS_CD_DLR, LoginUtil.getDlrCd(), "ROLE_CRM_R_03");

        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        //List<UserVO> saleEmpList = viewMappingService.selectUsersByPermission(Constants.SYS_CD_DLR, "VIEW-D-10321", LoginUtil.getDlrCd(), "READ,SEARCHIND");
        //List<UserVO> saleEmpList = viewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10321", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);
        //model.addAttribute("saleEmpDSInfo", saleEmpList);

        //TODO[김진석] 삭제필요-확인후 삭제
        //for(UserVO usVO : saleEmpList){
        //    if(usVO.getUsrId().equals(LoginUtil.getUserId())){
        //        saleEmpYn = "Y";
        //    }
        //}

        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        //if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10321", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_READ)){
        //    saleEmpYn = "Y";
        //}

        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);


        /*
         * 판매관리 여부  : 판매인 이면서, 상위 관리자 인경우 체크 용.
         *   : 판매인도 판매관리자도 아닌 사람은 관리자와 같은 권한을 갖는다. [2016.10.27 : 구상우D ]
         */
        //TODO[김진석] 삭제필요-확인후 삭제
        //        List<UserVO> saleAdminList = roleMappingService.selectAuthoritiesUsersByRoleId(Constants.SYS_CD_DLR, LoginUtil.getDlrCd(), "ROLE_CRM_R_02");
        //        String saleAdminYn = "N";

        //        for(UserVO usVO : saleAdminList){
        //            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
        //                saleAdminYn = "Y";
        //            }
        //        }

        String saleAdminYn = "N";
        //VIEW-D-10634 : 화면 : 판매>계약관리>계약체결관리
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10634", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        // 계약유형 : SAL003
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        //계약상태 : SAL002
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        //탁송구분 : SAL125 - 방문/탁송
        //대행구분 : SAL126 - 대행/본인

        // 할인레벨 SAL156
        model.addAttribute("dcLvlCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 채널유형 COM072
        model.addAttribute("dstbChnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));

        // 2급딜러
        model.addAttribute("lvTwoDlrDs", contractMntService.selectlvTwoDlrOrgsByCondition(LoginUtil.getDlrCd()));

        /**
         * crm 판매기회
         */
        if(!"".equals(saleOpptNo)){
            ContractReSearchVO searchVO = new ContractReSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
            searchVO.setsSaleOpptNo( saleOpptNo );         // 판매기회번호

            List<ContractReVO> opptList = contractMntService.selectContractResByCondition(searchVO);
            if(opptList != null && opptList.size() > 0){
                model.addAttribute("saleOpptNo", opptList.get(0).getContractNo());
            }
        }

        model.addAttribute("estimateNo", estimateNo);     // 견적번호로 조회
        model.addAttribute("orderNo", orderNo);           // 주문번호로 조회

        return "/sal/cnt/contractMnt/selectContractMntMain";
    }

    /**
     * 계약 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectContractMntSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractMntSearch(@RequestBody ContractReSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(contractMntService.selectContractMntsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractMntService.selectContractMntsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 계약관리 상세화면
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectContractMntPopup.do", method = RequestMethod.GET)
    public String selectContMntPopup(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);
        model.addAttribute("threeMonthDay", threeMonthBf);

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn(null);                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //성
        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(null));

        // 판매사원 리스트
        //model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        //List<UserVO> saleEmpList = roleMappingService.selectAuthoritiesUsersByRoleId(Constants.SYS_CD_DLR, LoginUtil.getDlrCd(), "ROLE_CRM_R_03");

        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        //List<UserVO> saleEmpList = viewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10321", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);
        //model.addAttribute("saleEmpDSInfo", saleEmpList);

        //TODO[김진석] 삭제필요-확인후 삭제
        //      for(UserVO usVO : saleEmpList){
        //      if(usVO.getUsrId().equals(LoginUtil.getUserId())){
        //          saleEmpYn = "Y";
        //      }
        //  }

        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        //if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10321", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_READ)){
        //    saleEmpYn = "Y";
        //}

        /*
         * 판매관리 여부  : 판매인 이면서, 상위 관리자 인경우 체크 용.
         *   : 판매인도 판매관리자도 아닌 사람은 관리자와 같은 권한을 갖는다. [2016.10.27 : 구상우D ]
         */
        //TODO[김진석] 삭제필요-확인후 삭제
        //        List<UserVO> saleAdminList = roleMappingService.selectAuthoritiesUsersByRoleId(Constants.SYS_CD_DLR, LoginUtil.getDlrCd(), "ROLE_CRM_R_02");
        //        String saleAdminYn = "N";
        //
        //        for(UserVO usVO : saleAdminList){
        //            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
        //                saleAdminYn = "Y";
        //            }
        //        }


        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        String saleAdminYn = "N";
        //VIEW-D-10634 : 화면 : 판매>계약관리>계약체결관리
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10634", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        //지불방식 : SAL071
        model.addAttribute("amtPayTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        // 계약유형 : SAL003
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        //계약상태 : SAL002
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        //주소유형 : CRM033
        model.addAttribute("addrTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));

        //용품판매품목상태
        model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL199", null, langCd));

        //서비스고문
        BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo("C01");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("eqipPrsnList", bayManageService.selectBayDetailsByCondition(searchVO));

        // 차량등록지역 : SAL086
        //model.addAttribute("regDistCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL086", null, langCd));

        // 대행업무유형 : SAL021
        model.addAttribute("aapWorkDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL021", null, langCd));

        // 보험회사 : SAL127
        model.addAttribute("incCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));

        // 보험유형 : SAL019, SAL088
        List<CommonCodeVO> incTpList = new ArrayList<CommonCodeVO>();
        incTpList.addAll(commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd));
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL088", null, langCd)){if(StringUtils.isBlank(vo.getRemark1())){incTpList.add(vo);}}
        model.addAttribute("insTpDS", incTpList);

        // 3자보험유형 - 금액 : SAL197
        model.addAttribute("threeIncTpAmtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL197", null, langCd));

        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));

        // 금융상품 : SA_0117T
        //model.addAttribute("fincItemDS", financialProductsManagementService.selectFinancialProductAmtListsByCondition("01"));
        model.addAttribute("fincItemDS", financialProductMngService.selectFinancialProductAmtListsByCondition());

        // 금융상품 - Bhaf
        model.addAttribute("fincBHAFItemDS", financialProductMngService.selectFinancialBhafProductListsByCondition("BHAF"));

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        // 할인레벨 SAL156
        model.addAttribute("dcLvlCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 채널유형 COM072
        model.addAttribute("dstbChnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));

        // 사용자의 채널유형
        ContractReSearchVO sEmpChannelVO = new ContractReSearchVO();
        sEmpChannelVO.setsSaleEmpNo(LoginUtil.getUserId());
        sEmpChannelVO.setsLangCd(langCd);
        model.addAttribute("dstbChnInfo", contractMntService.selectSaleEmpChannelTupeSearch(sEmpChannelVO));

        // 2급딜러
        model.addAttribute("lvTwoDlrDs", contractMntService.selectlvTwoDlrOrgsByCondition(LoginUtil.getDlrCd()));

        // 블루멤버십 회원등급 유형 CRM806
        model.addAttribute("mLevelList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));

        return "/sal/cnt/contractMnt/selectContractMntPopup";
    }

    /**
     * 계약 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectContractReSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractReSearch(@RequestBody ContractReSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(contractMntService.selectContractResByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractMntService.selectContractResByCondition(searchVO));
        }

        return result;
    }


    /**
     * 차종에 따른 차관조회
     */
    @RequestMapping(value = "/selectFsc.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFsc(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        List<VehicleSpecVO> list = vehicleSpecComboCommService.selectModelTypeCombo(searchVO);

        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }

        return result;
    }

    /**
     * 차종과 차관에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody VehicleSpecSearchVO searchVO) throws Exception{
        SearchResult result = new SearchResult();
        List<VehicleSpecVO> list = vehicleSpecComboCommService.selectOcnCombo(searchVO);

        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }
        return result;
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 딜러옵션 금액정보 조회
     */
    @RequestMapping(value = "/selectDlrAmtTxt.do", method = RequestMethod.POST)
    @ResponseBody
    public String selectDlrAmtTxt() throws Exception {
        DealerSearchVO dealerSearchVO = new DealerSearchVO();

        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList = dealerService.selectDealersByCondition( dealerSearchVO );
        String reStr = "";
        if(dlrList.size() > 0 && StringUtils.isNotBlank(dlrList.get(0).getTermSpecie()) ){
            reStr = dlrList.get(0).getTermSpecie();
        }
        return reStr;
    }

    /**
     * 성에 해당하는 도시를 조회.
     */
    @RequestMapping(value = "/selectCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCity(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectCityCd(vo));

        return result;
    }


    /**
     * 도시에 해당하는 구를 조회.
     */
    @RequestMapping(value = "/selectDist.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDist(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectDistCd(vo));

        return result;
    }

    /**
     * 주소(성,시,구)로 우편번호 조회.
     */
    @RequestMapping(value = "/selectZipCodeSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public ZipCodeVO selectZipCodeSearch(@RequestBody IncJoinInfoVO vo) throws Exception{
        return zipCodeService.selectZipCodeByKey(vo.getSungCd(), vo.getCityCd(), vo.getDistCd());
    }


    /**
     * CRM 고객 데이터 재조회
     */
    @RequestMapping(value = "/selectCrmCustomerInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmCustomerInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 금융서비스 - 모델에 따른 상품조회
     */
    /*
    @RequestMapping(value = "/selectFinancialProductModelSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFinancialProductModelSearch(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        List<FinancialProductsManagementVO> fList = financialProductsManagementService.selectFinancialProductModelListsByCondition(searchVO.getModelCd());

        SearchResult result = new SearchResult();
        result.setTotal(fList.size());

        if(result.getTotal() != 0){
            result.setData(fList);
        }
        return result;
    }
    */

    /**
     * 계약별 보험내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectIncSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractMntService.selectIncListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractMntService.selectIncListsByCondition(searchVO));
       }
        return result;
    }

    /**
     * 계약별 용품 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGoodsSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGoodsSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractMntService.selectGoodsListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractMntService.selectGoodsListsByCondition(searchVO));
       }
        return result;
    }

    /**
     * 계약 대행업무 조회
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectAapSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAapSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{
       SearchResult result = new SearchResult();
       result.setTotal(contractMntService.selectAapsListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractMntService.selectAapsListsByCondition(searchVO));
       }
        return result;
    }


    /**
     * 증서번호, 증서유형 제한여부 검색.
     * @param sDlrCd
     * @param sCustNo
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectAbleToEditSsnCrnNoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public String selectAbleToEditSsnCrnNoSearch(@RequestBody ContractReVO contVO) throws Exception {
        if(StringUtils.isBlank(contVO.getDlrCd())){
            contVO.setDlrCd(LoginUtil.getDlrCd());
        }

        return customerInfoOutBoundService.selectAbleToEditSsnCrnNo(contVO.getDlrCd(), contVO.getContractCustNo());
    }



    // 계약 저장
    @RequestMapping(value = "/multiContractMnts.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiContractMnts(@Validated @RequestBody ContractReSaveVO saveVO) throws Exception {
        saveVO.getContractReVO().setDlrCd(LoginUtil.getDlrCd());
        return contractMntService.multiContractMnts(saveVO);
    }

    // 계약 생성
    @RequestMapping(value = "/approvalContractMnts.do", method = RequestMethod.POST)
    @ResponseBody
    public String approvalContractMnts(@Validated @RequestBody ContractReSaveVO saveVO) throws Exception {
        saveVO.getContractReVO().setDlrCd(LoginUtil.getDlrCd());
        return contractMntService.approvalContractMnts(saveVO);
    }

    // 계약삭제 : 승인전
    @RequestMapping(value = "/deleteContract.do", method = RequestMethod.POST)
    @ResponseBody
    public String deleteContract(@RequestBody ContractReVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractMntService.deleteContract(contVO);
    }

    // 계약취소 : 승인후
    @RequestMapping(value = "/cancelContract.do", method = RequestMethod.POST)
    @ResponseBody
    public String cancelContract(@RequestBody ContractReVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractMntService.cancelContract(contVO);
    }

    // 계약 멀티 계약취소, 계약삭제
    @RequestMapping(value = "/deleteContractMnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteContractMnt(@RequestBody ContractMntSaveVO saveVO) throws Exception {
        return contractMntService.deleteContractMnt(saveVO);
    }

    // 딜러 프로모션에 대한 할인 레벨을 조회한다.
    @RequestMapping(value = "/selectDlrDcLevel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrDcLevel(@RequestBody ContractReSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(contractMntService.selectDlrDcLevelCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractMntService.selectDlrDcLevel(searchVO));
        }

         return result;
    }

    /**
     * 미배정된 차량조회 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectContractReVinNoSearchPopup.do", method = RequestMethod.GET)
    public String selectContractReVinNoSearchPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        //차량보유상태 SAL149
        model.addAttribute("ownStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn(null);                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/cnt/contractRe/selectContractReVinNoSearchPopup";
    }

    /**
     * 미배정 차량 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectContractReVinNoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractReVinNoSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractMntService.selectContractReVinNosByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractMntService.selectContractReVinNosByCondition(searchVO));
       }
        return result;
    }

    /**
     * 품목팝업 정보(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectItemSalePrcPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemSalePrcPopupByCondition(@RequestBody ContractReSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(contractMntService.selectItemSalePrcPopupByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(contractMntService.selectItemSalePrcPopupByCondition(searchVO));
        }
        return result;
    }

    //
    @RequestMapping(value = "/contractMessagePopup.do", method = RequestMethod.GET)
    public String contractMessagePopup(Model model) throws Exception{
        return "/sal/cnt/contract/contractMessagePopup";
    }


    /**
     * 중고차 팝업 조회
     */
    @RequestMapping(value = "/selectContractReUsedCarSearchPopup.do", method = RequestMethod.GET)
    public String selectContractReUsedCarSearchPopup(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        //중고차매입상태 SAL044
        model.addAttribute("purcStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL044", null, langCd));
        //차량브랜드 COM019
        model.addAttribute("carBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        //중고차 용도 SAL213
        model.addAttribute("usedCarUsgeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL213", null, langCd));

        return "/sal/cnt/contractRe/selectContractReUsedCarSearchPopup";
    }

    /**
     * 중고차량마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPurcMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedCarMaster(@RequestBody PurcEvalSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();
        //searchVO.setsPurcStatCd("04");      // 매입완료상태
        searchVO.setsContSearch("Y");
        result.setTotal(purcEvalService.selectPurcByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcEvalService.selectPurcByCondition(searchVO));
        }

        return result;
    }

    /**
     * 예약판매 팝업 조회
     */
    @RequestMapping(value = "/selectContractBeforeSearchPopup.do", method = RequestMethod.GET)
    public String selectContractBeforeSearchPopup(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //DateUtil//
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);
        model.addAttribute("threeMonthDay", threeMonthBf);
        //DateUtil end//

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        String saleAdminYn = "N";
        //VIEW-D-10634 : 화면 : 판매>계약관리>계약체결관리
        //if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10634", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
        //    saleAdminYn = "Y";
        //}

        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 고객유형 CRM001
        model.addAttribute("custTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        return "/sal/cnt/contractMnt/selectContractBeforeSearchPopup";
    }


    /**
     * 블루멤버십 포인트 조회
     */
    @RequestMapping(value = "/selectBuleMemeberInfoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfInfoRapVO selectBuleMemeberInfoSearch(@RequestBody BlueMembershipJoinVO searchVO) throws Exception {
        if(StringUtil.isEmpty(searchVO.getDlrCd())){
            searchVO.setDlrCd(LoginUtil.getDlrCd());
        }

        BlueMembershipIfInfoRapVO result = blueMembershipJoinSupportService.selectMemberUserIntegralInfo(searchVO);
        return result;
    }


}