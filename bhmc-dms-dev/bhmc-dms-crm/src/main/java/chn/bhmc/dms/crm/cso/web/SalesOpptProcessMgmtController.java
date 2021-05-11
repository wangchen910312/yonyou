package chn.bhmc.dms.crm.cso.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService;
import chn.bhmc.dms.crm.cso.service.TraceGradeMgmtService;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtUploadSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;

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
public class SalesOpptProcessMgmtController extends HController {

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
     * 추적 관리 서비스
     */
    @Resource(name="salesOpptTraceMgmtService")
    SalesOpptTraceMgmtService salesOpptTraceMgmtService;

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

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 시스템 컨피그 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

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
     * 당직 서비스
     */
    @Resource(name="salesOnDutyMgmtService")
    SalesOnDutyMgmtService salesOnDutyMgmtService;

    /**
     * 판매기회 정보유입 서비스
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * 판매기회 정보 업데이트
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * IDCC Role 코멘트 서비스
     */
    @Resource(name="idccRoleMgmtService")
    IdccRoleMgmtService idccRoleMgmtService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 판매기회 실패 시 브랜드 관리 서비스
     */
    @Resource(name="salesOpptFailOtherBrandMgmtService")
    SalesOpptFailOtherBrandMgmtService salesOpptFailOtherBrandMgmtService;

    /**
     * 추적등급 설정관리 서비스
     */
    @Resource(name="traceGradeMgmtService")
    TraceGradeMgmtService traceGradeMgmtService;

    /**
     * Role 설정관리 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 차량스펙 설정관리 서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * CustomerInfoOutBoundService
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;


    /**
     * 판매기회 중북 화면 출력한다.
     *
     * @param searchVO
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectLeadRepetitionMain.do", method = RequestMethod.GET)
    public String selectCustomerChargeMgmtMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));  // 정보수집경로(리드출처) - CRM008
        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));  // 리드유형(리드유형) - CRM366

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("intrCarlineList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        
        model.addAttribute("purposeTagList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM902", null, langCd));
        
        return "/crm/cso/salesOpptProcessMgmt/selectLeadRepetitionMain";
    }


    /**
     * 판매기회프로세스 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtMain.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtMain(Model model
            , @RequestParam(value="custNo", defaultValue="") String custNo
            , @RequestParam(value="leadStatCd", defaultValue="") String leadStatCd
            , @RequestParam(value="callTelNo", defaultValue="") String callTelNo
            ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat"));

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("sysDate", sysDate );
        model.addAttribute("scId", LoginUtil.getUserId());
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

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        //List<IdccRoleMgmtVO> users1 = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

        // 판매고문 롤을 가진 사용자 목록

        //List<UserVO> usersRoleCrmR03 = crmCommonService..crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        //crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

        // ob 사용자 목록
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

//        List<UserVO> users = new ArrayList<UserVO>();
//        users.addAll(usersRoleCrmR18);   // OB 사용자 목록
//        users.addAll(usersRoleCrmR03);   // 판매고문목록

//        for (int i = 0; i < users.size(); i++) {
//            for (int j = 0; j < users.size(); j++) {
//                if (i == j) {
//                } else if (users.get(j).getUsrId().equals(users.get(i).getUsrId())) {
//                    users.remove(j);
//                }
//            }
//        }

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
        model.addAttribute("failCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인 (CRM369)

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종
        model.addAttribute("rvsitYnList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM380", null, langCd));  // 재방문유형
        model.addAttribute("dstbChnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));  // 판매채널
        model.addAttribute("purposeTagList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM902", null, langCd));
        
        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10316", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }

        model.addAttribute("mngScIdCtrl", mngScIdCtrl);
        model.addAttribute("callTelNo", callTelNo);

        return "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtMain";
    }

    /**
     * 판매기회 잠재고객DB 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtFailMain.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessMgmtFailMain(Model model
            , @RequestParam(value="custNo", defaultValue="") String custNo
            , @RequestParam(value="leadStatCd", defaultValue="") String leadStatCd
    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat"));

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("scId", LoginUtil.getUserId());
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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);


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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));
        model.addAttribute("failCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인 (CRM369)

        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));  // 신분증유형
        model.addAttribute("bizcondCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM031", null, langCd));  // 업종
        model.addAttribute("dstbChnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM072", null, langCd));  // 판매채널

        // 정보확보 상세 목록 - 시작
        SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();

        int holdDtlCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);
        model.addAttribute("holdDetlTpSeqList", "");
        if (holdDtlCnt > 0){
            List<SalesOpptHoldTypeMgmtVO> holdDetlTpSeqList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
            model.addAttribute("holdDetlTpSeqList", holdDetlTpSeqList);
        }
        //정보확보 상세 목록 - 끝


        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("colorCdList" , carInfoService.selectExtColorListsByCondition(carInfoSearchVO));

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10141", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        model.addAttribute("purposeTagList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM902", null, langCd));
        
        return "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtFailMain";
    }

    /**
     * 판매기회프로세스 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptProcessMgmt(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        int year;
        int month;
        int day;

        if(searchVO.getsLeadStartDtFrom() != null || searchVO.getsLeadStartDtTo() != null ){


            if(searchVO.getsLeadStartDtFrom() == searchVO.getsLeadStartDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsLeadStartDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsLeadStartDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsLeadStartDtTo() != null){
                // 종료일이 있는경우
                endCal.setTime(searchVO.getsLeadStartDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsLeadStartDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        if(searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null ){


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
                endCal.setTime(searchVO.getsRegDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        if(searchVO.getsSubmitDtFrom() != null || searchVO.getsSubmitDtTo() != null ){

            if(searchVO.getsSubmitDtFrom() == searchVO.getsSubmitDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsSubmitDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsSubmitDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsSubmitDtTo() != null){
                // 종료일이 있는경우
                endCal.setTime(searchVO.getsSubmitDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsSubmitDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

//        if ("04".equals(leadStatCd)) {
//            result.setTotal(salesOpptProcessMgmtService.selectSalesOpptProcessUnionMgmtsByConditionCnt(searchVO));
//            if(result.getTotal() != 0){
//
//                result.setData(salesOpptProcessMgmtService.selectSalesOpptProcessUnionMgmtsByCondition(searchVO));
//            }
//
//        } else {
//
//        }
        result.setTotal(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByConditionCnt(searchVO));
        if(result.getTotal() != 0){

            result.setData(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회프로세스 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtIng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptProcessMgmtIng(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsIngByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsIngByCondition(searchVO));
        }

        return result;
    }

    /**
     * 고객등록 팝업 화면을 출력한다. (신규등록용)
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectNewSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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

        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10316", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        return "/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptProcessPopup";
    }

    /**
     * 고객등록 팝업 화면을 출력한다. (신규등록용)
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptProcessPopup";
    }

    /**
     * Step1의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep01NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep01NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep01NextSalesOpptProcessPopup";
    }

    /**
     * Step2의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep02NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep02NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 당직사용여부
        //String onDutyYn = systemConfigInfoService.selectStrValueByKey("onDutyYn");
//        String onDutyYn = LoginUtil.getOnDutyYn();
//        model.addAttribute("onDutyYn", onDutyYn);

        model.addAttribute("validGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM364", null, langCd)); // 유효성판단 (CRM364)

        return "/crm/cso/salesOpptProcessMgmt/selectStep02NextSalesOpptProcessPopup";
    }
    /**
     * Step3의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep03NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep03NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep03NextSalesOpptProcessPopup";
    }

    /**
     * Step4의 다음단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep04NextSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptProcessPopup";
    }

    /**
     * Step01 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep01PrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep01PrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep01PrevSalesOpptProcessPopup";
    }
    /**
     * Step02 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep02PrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep02PrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("failCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인 (CRM369)

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep02PrevSalesOpptProcessPopup";
    }
    /**
     * Step03 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep03PrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep03PrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep03PrevSalesOpptProcessPopup";
    }
    /**
     * Step04 단계에서 이전단계 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectStep04PrevSalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd));  // 예상구매시간코드 expcPurcHmCd (CRM372)
        model.addAttribute("commMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));  // 추적방식 commMthCd (CRM377)
        model.addAttribute("addrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));  // 주소유형 (CRM033)
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));  // 지불유형 (CRM368)
        model.addAttribute("failCauCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM369", null, langCd));  // 전패원인 (CRM369)

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptProcessPopup";
    }


    /**
     * 사용자 패스워드 확인
     * @return success / fail
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectUserPassWordCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectUserPassWordCheck(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        return userService.isValidPassword(LoginUtil.getUserId(), searchVO.getsPassword());
    }

    /**
     * 판매기회 정보 업데이트
     * @param SalesOpptProcessMgmtVO - 판매기회 정보
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/updateSalesOpptProcessMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateSalesOpptProcessMgmt(@Validated @RequestBody SalesOpptProcessMgmtVO salesOpptProcessMgmtVO)throws Exception {
        return salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessAndInsertHist(salesOpptProcessMgmtVO);
    }

    /**
     * 판매기회 정보를 저장 한다.
     * @param SalesOpptProcessMgmtVO - 판매기회 정보
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcess.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSalesOpptProcess(@Validated @RequestBody SalesOpptProcessMgmtSaveVO saveVO, BindingResult bindingResult)throws Exception {

        return salesOpptProcessMgmtService.multiSalesOpptProcMgmts(saveVO);
    }

    /**
     * 추적이력 정보를 저장 한다.
     * @param SalesOpptProcessMgmtVO - 판매기회 정보
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/multiSalesOpptTraceMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSalesOpptTraceMgmts(@Validated @RequestBody SalesOpptTraceMgmtVO saveVO)throws Exception {

        return salesOpptTraceMgmtService.multiSalesOpptTraceMgmts(saveVO);
    }

    /**
     * 추적이력관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptTraceMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptTraceMgmt.do", method = RequestMethod.POST)
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
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtHist.do", method = RequestMethod.POST)
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
     * 판매기회 중복 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtHistSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptDupHist.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptDupHist(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptProcessMgmtService.selectSalesOpptDupHistByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptProcessMgmtService.selectSalesOpptDupHistByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회 중복 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtHistSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectLeadRepetition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeadRepetition(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(salesOpptProcessMgmtService.selectLeadRepetitionByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOpptProcessMgmtService.selectLeadRepetitionByCondition(searchVO));
        }

        return result;
    }

    /**
     * 전시장유동량 등록 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectNewSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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
        users.addAll(usersRoleCrmR03);   // 판매고문목록
        //users.addAll(usersRoleCrmR18);   // OB 사용자 목록

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectNewSalesOpptShowRoomPopup";
    }

    /**
     * 전시장유동량 수정 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectEditSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

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
        users.addAll(usersRoleCrmR03);   // 판매고문목록
        //users.addAll(usersRoleCrmR18);   // OB 사용자 목록

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectEditSalesOpptShowRoomPopup";
    }

    /**
     * 전시장유동량 정보를 저장 한다.
     * @param SalesOpptShowRoomMgmtSaveVO - 판매기회 정보
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/multiSalesOpptShowRoom.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSalesOpptShowRoom(@Validated @RequestBody SalesOpptShowRoomMgmtSaveVO saveVO)throws Exception {

        return salesOpptShowRoomMgmtService.multiSalesOpptShowRoomMgmts(saveVO);
    }

    /**
     * 전시장유동량 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptShowRoomMgmt.do", method = RequestMethod.POST)
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

    /**
     * Step4의 다음단계 팝업 (전시장)
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectStep04NextSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep04NextSalesOpptShowRoomPopup";
    }

    /**
     * Step4의 수정팝업 (전시장)
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep04EditSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectStep04EditSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep04EditSalesOpptShowRoomPopup";
    }

    /**
     * Step4의 이전단계 팝업 (전시장)
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public String selectStep04PrevSalesOpptShowRoomPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("otherBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM224", null, langCd));  // 타사브랜드 (CRM224)
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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectStep04PrevSalesOpptShowRoomPopup";
    }

    /**
     * 당직 담당자를 배정한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectOnDutyMngScId.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOnDutyMngScId(@RequestBody SalesOnDutyMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsVsitResvDt() != null){
            int year;
            int month;
            int day;

            startCal.setTime(searchVO.getsVsitResvDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsVsitResvDtFrom(startCal.getTime());

            startCal.set(year, month, day+1, 00, 00, 00);
            searchVO.setsVsitResvDtTo(startCal.getTime());

        }

        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        result.setTotal(salesOnDutyMgmtService.selectSalesOnDutyMgmtByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            result.setData(salesOnDutyMgmtService.selectSalesOnDutyMgmtByCondition(searchVO));
        }

        return result;
    }

    /**
     * 담당자를 배정한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptScAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptScAssign(@RequestBody SalesOnDutyMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();



        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsVsitResvDt() != null){
            int year;
            int month;
            int day;

            startCal.setTime(searchVO.getsVsitResvDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsVsitResvDtFrom(startCal.getTime());

            startCal.set(year, month, day+1, 00, 00, 00);
            searchVO.setsVsitResvDtTo(startCal.getTime());

        }

        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        // 당직사용여부
        if (StringUtils.isEmpty(searchVO.getsOndutyYn())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
//            searchVO.setsOndutyYn(LoginUtil.getOnDutyYn());
        }

        if ("Y".equals(searchVO.getsOndutyYn())) {
            searchVO.setsOndutyTp("01");
            result.setTotal(salesOnDutyMgmtService.selectSalesOnDutyMgmtByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(salesOnDutyMgmtService.selectSalesOnDutyMgmtByCondition(searchVO));
            }
        }

        if (("N".equals(searchVO.getsOndutyYn())) || (result.getTotal() == 0) ) {
            searchVO.setsOndutyTp("02");
            result.setTotal(salesOnDutyMgmtService.selectSalesOpptScAssignMgmtByConditionCnt(searchVO));

            if(result.getTotal() != 0){
                result.setData(salesOnDutyMgmtService.selectSalesOpptScAssignMgmtByCondition(searchVO));
            }

        }

        return result;
    }

    /**
     * 대량 전출을 한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/multiSalesOpptProcessToFail.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSalesOpptProcessToFail(@RequestBody SalesOpptProcessSaveVO searchVO) throws Exception {

        salesOpptProcessMgmtService.multiSalesOpptProcessToFail(searchVO);

        return true;
    }

    /**
     * 정보유형 상세조회
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectHoldTpDetl(@RequestBody SalesOpptHoldTypeMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        if(StringUtils.isEmpty(searchVO.getFlag())){
            if(searchVO.getsStartDt() == null ){
                searchVO.setsStartDt(startCal.getTime());
            }
            if(searchVO.getsEndDt() == null ){
                searchVO.setsEndDt(startCal.getTime());
            }
        }
        int year;
        int month;
        int day;

        // 시작일
        if(searchVO.getsStartDt() != null ){
            startCal.setTime(searchVO.getsStartDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());
        }


        // 종료일
        if(searchVO.getsEndDt() != null ){
            endCal.setTime(searchVO.getsEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }

        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        result.setTotal(salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 당직설정화면
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectOnDutyMgmtMain.do", method = RequestMethod.GET)
    public String selectOnDutyMgmtMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        model.addAttribute("sysDate", sysDate);
//        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM999", null, langCd));      // 판매기회단계 CRM211
        model.addAttribute("tdrvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM404", null, langCd));          // 시승 상태

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());

        return "/crm/cso/salesOpptProcessMgmt/selectOnDutyMgmtMain";
    }

    /**
     * 당직자 목록 데이터를 조회한다.
     * @param carId
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectOnDutyMember.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOnDutyMember(@RequestBody IdccRoleMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // 관리SCID - mngScId
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);
        result.setTotal((usersRoleCrmR03 == null)?0:usersRoleCrmR03.size());
        //result.setTotal(idccRoleMgmtService.selectIdccRoleMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            //result.setData(idccRoleMgmtService.selectIdccRoleMgmtsByCondition(searchVO));
            result.setData(usersRoleCrmR03);
        }

        return result;

    }

    /**
     * 당직 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectOnDutySetMember.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOnDutySetMember(@RequestBody SalesOnDutyMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 스케줄러에서.. 당일 검색 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsStartDt() == null ){
            searchVO.setsStartDt(startCal.getTime());
        }

        int year;
        int month;
        int day;

        startCal.setTime(searchVO.getsStartDt());
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        day = startCal.get(Calendar.DATE);

        //startCal.set(year, month, day, 00, 00, 00);
        startCal.set(year, month, 01, 00, 00, 00);
        searchVO.setsOndutyDtFrom(startCal.getTime());             // 시작일 설정

        //startCal.set(year, month+1, day+1, 00, 00, 00);
        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsStartDt(startCal.getTime());
        searchVO.setsOndutyDtTo(startCal.getTime());               // 종료일 설정( 시작일 + 1일 )
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        searchVO.setsOndutyTp("01");
        searchVO.setsViewId("VIEW-D-10322");//OB 역활
        searchVO.setsMask(0);
        List<SalesOnDutyMgmtVO> list = salesOnDutyMgmtService.selectSalesOnDutySchedulerMgmtByCondition(searchVO);

        result.setTotal((list == null)?0:list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }

        return result;

    }

    /**
     * 당직 목록 추가한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/insertOnDutySetMember.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertOnDutySetMember(@RequestBody SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception {
        salesOnDutyMgmtVO.setCnt(0);
        return salesOnDutyMgmtService.insertSalesOpptScAssignMgmt(salesOnDutyMgmtVO);

    }

    /**
     * 당직 - 현재달의 당직 정보를 다음달로 복사한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/insertCopyOnDutyMbrNextMonth.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertCopyOnDutyMbrNextMonth(@RequestBody SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception {
        return salesOnDutyMgmtService.insertCopyOnDutyMbrNextMonth(salesOnDutyMgmtVO);

    }

    /**
     * 당직 목록에서 당직자를 삭제한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/deleteOnDutySetMember.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteOnDutySetMember(@RequestBody SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception {
        salesOnDutyMgmtVO.setDlrCd(LoginUtil.getDlrCd());
        return salesOnDutyMgmtService.deleteOnDutySetMember(salesOnDutyMgmtVO);
    }

    /**
     * 판매기회 대량등록 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectSalesOpptProcessExcelUploadPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 관심차종 intrCarlineCd / 구매선택차종 purcCarlineCd - carLineCdList
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("infoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM366", null, langCd));
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM368", null, langCd));
        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, langCd));

        return "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessExcelUploadPopup";
    }

    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/insertSalesOpptProcessUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertSalesOpptProcessUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<SalesOpptProcessMgmtVO> list = new ArrayList<SalesOpptProcessMgmtVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<SalesOpptProcessMgmtVO> excelReader = new ExcelReader<SalesOpptProcessMgmtVO>(SalesOpptProcessMgmtVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                List<SalesOpptProcessMgmtVO> listFilt = new ArrayList<SalesOpptProcessMgmtVO>();
                for(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO : list) {
                    if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getCustNm())) {
                        listFilt.add(salesOpptProcessMgmtVO);
                    }
                }

                listFilt = salesOpptProcessMgmtService.selectSalesOpptPorcessBatchUploadPreChk(listFilt);
                result.setTotal(listFilt.size());
                result.setData(listFilt);

                status.setStep(ExcelUploadStatus.COMPLETED);
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return result;

    }

    /**
     * 판매기회 일괄등록 데이터를 저장 한다.
     * @return 등록결과 메시지
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/insertSalesOpptPorcessBatchUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertSalesOpptPorcessBatchUpload(@Validated @RequestBody SalesOpptProcessMgmtUploadSaveVO batchUploadList) throws Exception {

        return salesOpptProcessMgmtService.insertSalesOpptPorcessBatchUpload(batchUploadList.getBatchUploadList());

    }

    /**
     * 판매기회 일괄등록 데이터를 저장 한다.
     * @return  등록결과 그리드에 표시하기
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/insertSalesOpptPorcessBatchUploadRlt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertSalesOpptPorcessBatchUploadRlt(@Validated @RequestBody SalesOpptProcessMgmtUploadSaveVO batchUploadList) throws Exception {
        SearchResult result = new SearchResult();

        List<SalesOpptProcessMgmtVO> list = new ArrayList<SalesOpptProcessMgmtVO>();

        list = salesOpptProcessMgmtService.insertSalesOpptPorcessBatchUploadRlt(batchUploadList.getBatchUploadList());

        result.setTotal(list.size());
        if (list.size() != 0)
        {
            result.setData(list);
        }

        return result;

    }

    /**
     * Step09의 수정팝업 (실패, 전출 함께 사용)
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditStep09SalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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

//        String onDutyYn = LoginUtil.getOnDutyYn();
//        model.addAttribute("onDutyYn", onDutyYn);

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10141", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        return "/crm/cso/salesOpptProcessMgmt/selectEditStep09SalesOpptProcessPopup";
    }

    /**
     * Step1의 수정팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectEditStep01SalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditStep01SalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // ROLE 체크해서 책임자 컬럼 활성/비활성 체크
        String mngScIdCtrl = "N";

        if ( viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-10316", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL) ) {
            mngScIdCtrl = "Y";
        }
        model.addAttribute("mngScIdCtrl", mngScIdCtrl);

        return "/crm/cso/salesOpptProcessMgmt/selectEditStep01SalesOpptProcessPopup";
    }

    /**
     * Step2의 수정팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectEditStep02SalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditStep02SalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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

//        String onDutyYn = LoginUtil.getOnDutyYn();
//        model.addAttribute("onDutyYn", onDutyYn);

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectEditStep02SalesOpptProcessPopup";
    }
    /**
     * Step3의 수정팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectEditStep03SalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditStep03SalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectEditStep03SalesOpptProcessPopup";
    }
    /**
     * Step4의 수정팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectEditStep04SalesOpptProcessPopup.do", method = RequestMethod.GET)
    public String selectEditStep04SalesOpptProcessPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);

        model.addAttribute("loginUsrNm", LoginUtil.getUserNm());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("salesOpptPwYn", LoginUtil.getSalesOpptPwYn());

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//        List<IdccRoleMgmtVO> users = idccRoleMgmtService.selectIdccRoleMgmtsByCondition(idccRoleMgmtSearchVO);

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//      List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR
        //List<UserVO> usersRoleCrmR03 = roleMappingService.selectUsersByRoleId("D", LoginUtil.getUserId(), "ROLE_SALES_ADVISOR");  // 판매고문 : ROLE_SALES_ADVISOR

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

        //List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
        List<UserVO> users = crmCommonService.selectCrmViewPlusRoleListByCondition("VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);

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
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cso/salesOpptProcessMgmt/selectEditStep04SalesOpptProcessPopup";
    }

    /**
     * 실패 시 타사 브랜드 조회
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectOtherBrandModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOtherBrandModel(@RequestBody SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception {

        searchVO.setsUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(salesOpptFailOtherBrandMgmtService.selectSalesOpptFailBrandMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptFailOtherBrandMgmtService.selectSalesOpptFailBrandMgmtsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 판매기회 카운트 조회
     * @param SalesOpptProcessMgmtVO - 판매기회 정보
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtsByConditionCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object>  selectSalesOpptProcessMgmtsByConditionCnt(@Validated @RequestBody SalesOpptProcessMgmtSearchVO searchVO)throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        int salesOpptCnt = salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByConditionCnt(searchVO);
        result.put("salesOpptCnt", salesOpptCnt);
        if ( salesOpptCnt == 1 ) {
            // 판매기회에서 이동전화 확인
            result.put("salesOpptVO", salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByKey(searchVO));
        };

        // 고객에서 이동전화 확인
        CustomerInfoSearchVO custSearchVO = new CustomerInfoSearchVO();
        custSearchVO.setsHpNo(searchVO.getsHpNo());
        result.put("custInfoCnt", customerInfoOutBoundService.selectCustomerInfoByConditionCnt(custSearchVO));

        return result;
    }

    /**
     * 판매기회프로세스 관리 목록 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectSalesOpptProcessMgmtExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectSalesOpptProcessMgmtExcelExportCnt(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        int year;
        int month;
        int day;

        if(searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null ){


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
                endCal.setTime(searchVO.getsRegDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsRegDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }

        if(searchVO.getsSubmitDtFrom() != null || searchVO.getsSubmitDtTo() != null ){

            if(searchVO.getsSubmitDtFrom() == searchVO.getsSubmitDtTo()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsSubmitDtFrom());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsSubmitDtFrom(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
            }else if(searchVO.getsSubmitDtTo() != null){
                // 종료일이 있는경우
                endCal.setTime(searchVO.getsSubmitDtTo());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsSubmitDtTo(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
            }
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/

        return salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByConditionCnt(searchVO);
    }

    /**
     * 차종에 따른 차관조회
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectFsc.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFsc(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        searchVO.setUseYn("Y");

        SearchResult result = new SearchResult();
        List<VehicleSpecVO> list = vehicleSpecComboCommService.selectModelTypeCombo(searchVO);

        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }

        return result;
    }

    /**
     * 중복 판매 기회 목록 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - SalesOpptProcessMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptProcessMgmt/selectLeadRepetitionExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectLeadRepetitionExcelExportCnt(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {

        return salesOpptProcessMgmtService.selectLeadRepetitionByConditionCnt(searchVO);
    }

}