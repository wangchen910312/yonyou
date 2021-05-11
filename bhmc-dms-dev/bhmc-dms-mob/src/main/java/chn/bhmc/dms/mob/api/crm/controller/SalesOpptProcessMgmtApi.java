package chn.bhmc.dms.mob.api.crm.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.icu.util.Calendar;

import able.com.web.HController;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.ass.service.AssignService;
import chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.ContactHistoryService;
import chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesActiveMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService;
import chn.bhmc.dms.crm.cso.service.TraceGradeMgmtService;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptShowRoomMgmtService;
import chn.bhmc.dms.mob.api.crm.service.CrmViewMappingService;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptShowRoomMgmtSearchVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;
import io.swagger.annotations.Api;

@RestController
@RequestMapping(value = "api/crm/salesOpptProcessMgmt")
@Api("CRM商机管理/潜客DB相关接口")
public class SalesOpptProcessMgmtApi extends HController {

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
    
    @Resource(name="CrmSalesOpptShowRoomMgmtService")
    CrmSalesOpptShowRoomMgmtService CrmSalesOpptShowRoomMgmtService;

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
     *VOC 배정 서비스
     */
    @Resource(name="assignService")
    AssignService assignService;
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
     * 추적 관리 서비스
     */
    @Resource(name="salesOpptTraceMgmtService")
    SalesOpptTraceMgmtService salesOpptTraceMgmtService;
    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;
    /**
     * 판매기회 실패 시 브랜드 관리 서비스
     */
    @Resource(name="salesOpptFailOtherBrandMgmtService")
    SalesOpptFailOtherBrandMgmtService salesOpptFailOtherBrandMgmtService;
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
     * 차량스펙 설정관리 서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;
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
    
    @Resource(name="CrmviewMappingService")
    CrmViewMappingService CrmviewMappingService;

    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 추적등급 설정관리 서비스
     */
    @Resource(name="traceGradeMgmtService")
    TraceGradeMgmtService traceGradeMgmtService;
    /**
     * 보험가입정보관리 서비스 - 주소지: 성, 시, 구 호출
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;
    /**
     *@author sll
     *@description 商机管理页面跳转URL
     *@return BaseJSON
     */
    @RequestMapping(value = "/selectSalesOpptProcessMgmtMain.do", method = RequestMethod.GET)
    public BaseJSON selectSalesOpptProcessMgmtMain(Model model
            , @RequestParam(value="custNo", defaultValue="") String custNo
            , @RequestParam(value="leadStatCd", defaultValue="") String leadStatCd
            ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        BaseJSON baseJSON =new BaseJSON();
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

      List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10322", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

      List<UserVO> users = new ArrayList<UserVO>();
      
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", users);
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
        baseJSON.setResult(model);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 商机管理条件查询-(全部/线索导入/线索邀约/预约清单/跟踪促成)
     *@description 商机管理条件查询-战败-(查询)
     *@description 商机管理条件查询-提交上一状态-(查询)
     *@description 商机管理条件查询-转出-(查询)
     *@description 商机管理条件查询-提交下一状态-01-(查询)
     *@description 商机管理条件查询-提交下一状态-02-(查询)
     *@description 商机管理条件查询-提交下一状态-03-(查询)
     *@description 商机管理条件查询-提交下一状态-04-(查询)
     *@description 潜客DB(查询)-战败
     *@description
     */
    @RequestMapping(value = "/selectSalesOpptProcessMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON  selectSalesOpptProcessMgmt(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        BaseJSON baseJSON =new BaseJSON();
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
        result.setTotal(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByConditionCnt(searchVO));
        if(result.getTotal() != 0){

            result.setData(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }


    /**
     *@author sll
     *@description  商机管理条件查询-(展厅客流)
     * @param searchVO - 조회 조건을 포함하는 SalesOpptShowRoomMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptShowRoomMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSalesOpptShowRoomMgmt(@RequestBody SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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

        result.setTotal(CrmSalesOpptShowRoomMgmtService.selectSalesOpptShowRoomMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmSalesOpptShowRoomMgmtService.selectSalesOpptShowRoomMgmtsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 展厅客流添加跳转URL
     */
    @RequestMapping(value = "/mob/selectNewSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public BaseJSON selectNewSalesOpptShowRoomPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
        List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10648", LoginUtil.getDlrCd(), "READ,SEARCHIND");
        List<UserVO> users = new ArrayList<UserVO>();
        for(UserVO user : usersRoleCrmR03){
            if ( "N".equals(user.getSysUserYn()) ) {
            	users.add(user);
            }
        }
        //users.addAll(usersRoleCrmR03);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", users);
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

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectNewSalesOpptShowRoomPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }



    /**
     *@author sll
     *@description jsp 页面 dataTable === "SHOWROOM"的时候跳转URL(提交至下一状态)
     * 판매기회프로세스 관리 전시장흐름 step04를 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/selectStep04NextSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public BaseJSON selectStep04NextSalesOpptShowRoomPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
        List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR03 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10649", LoginUtil.getDlrCd(), "READ,SEARCHIND");

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//      idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//      idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//      List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
      List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10648", LoginUtil.getDlrCd(), "READ,SEARCHIND");

      List<chn.bhmc.dms.mob.api.crm.vo.UserVO> users = new ArrayList<chn.bhmc.dms.mob.api.crm.vo.UserVO>();
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

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectStep04NextSalesOpptShowRoomPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }


    /**
     *@author sll
     *@descrpition 商机录入跳转URL
     *@return
     */
    @RequestMapping(value = "/mob/selectNewSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectNewSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // Today
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        // 관리SCID - mngScId
        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_02");
        List<IdccRoleMgmtVO> usersRoleCrmR02 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR03 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10649", LoginUtil.getDlrCd(), "READ,SEARCHIND");

        idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
        List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
        List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10648", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

        List<chn.bhmc.dms.mob.api.crm.vo.UserVO> users = new ArrayList<chn.bhmc.dms.mob.api.crm.vo.UserVO>();
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

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectNewSalesOpptProcessPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }


    /**
     *@author sll
     *@description 线索状态=其他/提交至下一状态跳转URL
     *@description 商机修改跳转URL
     * 고객등록 팝업 화면을 출력한다. (수정용)
     * @return
     */
    @RequestMapping(value = "/mob/selectEditSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectEditSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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

//         idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//         idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//         List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
         List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

         idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
         idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
         List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//       idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//       idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//       List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
         List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

         List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);
         List<UserVO> usersList = new ArrayList<UserVO>();
         
         for(UserVO user : users){
             if ( "N".equals(user.getSysUserYn()) ) {
            	 usersList.add(user);
             }
         }
         model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
         model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
         model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
         model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);

         model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));  // 고객유형 - custTp CRM001
         model.addAttribute("mngScIdList", usersList);
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
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectEditSalesOpptProcessPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;

    }



    /**
     *@author sll
     *@description 增加跟踪跳转URL（商机管理/潜客DB）
     * @return
     */
    @RequestMapping(value = "/selectSalesOpptProcessMgmtActivePopup.do", method = RequestMethod.GET)
    public BaseJSON selectSalesOpptProcessMgmtActivePopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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

        //return "/mob/selectSalesOpptProcessMgmtActivePopup";
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectSalesOpptProcessMgmtActivePopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 线索状态=线索导入/提交至下一状态跳转URL
     * @return
     */
    @RequestMapping(value = "/mob/selectStep01NextSalesOpptProcessPopup.do", method = RequestMethod.POST)
    public BaseJSON selectStep01NextSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
      //users.addAll(usersRoleCrmR03);
      //users.addAll(usersRoleCrmR18);
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }
      model.addAttribute("usersRoleCrmR03", users);
      
      for(UserVO user : usersRoleCrmR18){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }
        model.addAttribute("usersRoleCrmR18", usersRoleCrmR18);
	    model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
	    model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
        

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

        baseJSON.setResult(model);
        return baseJSON;
    }


    /**
     *@author sll
     *@description 线索状态=线索邀约/提交至下一状态跳转URL
     * @return
     */
    @RequestMapping(value = "/mob/selectStep02NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectStep02NextSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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

//         idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//         idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//         List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
         List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

         idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
         idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
         List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//       idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//       idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//       List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
       List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

       List<UserVO> users = new ArrayList<UserVO>();
       //users.addAll(usersRoleCrmR03);
       //users.addAll(usersRoleCrmR18);
       for(UserVO user : usersRoleCrmR03){
           if ( "N".equals(user.getSysUserYn()) ) {
           	users.add(user);
           }
       }
       
       model.addAttribute("usersRoleCrmR03", users);
       for(UserVO user : usersRoleCrmR18){
           if ( "N".equals(user.getSysUserYn()) ) {
           	users.add(user);
           }
       }

         model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
         
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
        baseJSON.setResult(model);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 线索状态=预约清单/提交至下一状态跳转URL
     *@return
     */
    @RequestMapping(value = "/mob/selectStep03NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectStep03NextSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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

//         idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//         idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_03");
//         List<IdccRoleMgmtVO> usersRoleCrmR03 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
         List<UserVO> usersRoleCrmR03 = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR

         idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
         idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_17");
         List<IdccRoleMgmtVO> usersRoleCrmR17 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);

//       idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
//       idccRoleMgmtSearchVO.setsRoleId("ROLE_CRM_R_18");
//       List<IdccRoleMgmtVO> usersRoleCrmR18 = idccRoleMgmtService.selectIdccRoleMgmtsByRole(idccRoleMgmtSearchVO);
       List<UserVO> usersRoleCrmR18 = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null);

       List<UserVO> users = new ArrayList<UserVO>();
       //users.addAll(usersRoleCrmR03);
       //users.addAll(usersRoleCrmR18);
       for(UserVO user : usersRoleCrmR03){
           if ( "N".equals(user.getSysUserYn()) ) {
           	users.add(user);
           }
       }
       model.addAttribute("usersRoleCrmR03", users);
       for(UserVO user : usersRoleCrmR18){
           if ( "N".equals(user.getSysUserYn()) ) {
           	users.add(user);
           }
       }

         model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
         
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

        baseJSON.setResult(model);
        return baseJSON;
    }
    /**
     *@author sll
     *@description 线索状态=跟踪促成/提交至下一状态跳转URL
     *@return
     */
    @RequestMapping(value = "/mob/selectStep04NextSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectStep04NextSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
      //users.addAll(usersRoleCrmR03);
      //users.addAll(usersRoleCrmR18);
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }
      model.addAttribute("usersRoleCrmR03", users);
      for(UserVO user : usersRoleCrmR18){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        //model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
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
        baseJSON.setResult(model);
        return baseJSON;
    }

    /**
     *@author sll
     *@description 转出跳转URL
     * @return
     */
    @RequestMapping(value = "/mob/selectStep04NextFailSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectStep04NextFailSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
      List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10322", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

      List<UserVO> users = new ArrayList<UserVO>();
      //users.addAll(usersRoleCrmR03);
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }
      model.addAttribute("usersRoleCrmR03", users);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        //model.addAttribute("usersRoleCrmR03", usersRoleCrmR03);
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
        baseJSON.setResult(model);
        return baseJSON;
    }



    /**
     *@author sll
     *@descrpition  上一状态跳转的页面
     *
     * @return
     */
    @RequestMapping(value = "/mob/selectStep03PrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON  selectStep03PrevSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
      List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10322", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

      List<UserVO> users = new ArrayList<UserVO>();
      //users.addAll(usersRoleCrmR03);
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", users);
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

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectStep03PrevSalesOpptProcessPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }


    /**
     *@author sll
     *@description 战败跳转URL
     * @return
     */
    @RequestMapping(value = "/selectStepPrevSalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectStepPrevSalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
      List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10322", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

      List<UserVO> users = new ArrayList<UserVO>();
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", users);
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
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectStepPrevSalesOpptProcessPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }

    /**
     *@author sll
     *@descrpition 潜客DB跳转URL
     *@return
     */
    @RequestMapping(value = "/mob/selectSalesOpptProcessMgmtFailMain.do", method = RequestMethod.GET)
    public BaseJSON selectSalesOpptProcessMgmtFailMain(Model model
            , @RequestParam(value="custNo", defaultValue="") String custNo
            , @RequestParam(value="leadStatCd", defaultValue="") String leadStatCd
            ) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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

      List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10322", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

      List<UserVO> users = new ArrayList<UserVO>();
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", users);
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

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectSalesOpptProcessMgmtFailMain.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }
    /**
     * @author sll
     * @descrption 潜客DB-潜客详细的操作（不通过，线索导入，线索邀约，跟踪促成）
     * @param salesOpptProcessMgmtVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/updateSalesOpptProcessMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON updateSalesOpptProcessMgmt(@RequestBody SalesOpptProcessMgmtVO salesOpptProcessMgmtVO)throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
    	baseJSON.setResult(salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessAndInsertHist(salesOpptProcessMgmtVO));
    	return baseJSON;
    }

    /**
     *@author sll
     *@description 潜客DB-线索导入跳转URL
     *@description 潜客DB-线索邀约跳转URL
     */
    @RequestMapping(value = "/mob/selectEditStep09SalesOpptProcessPopup.do", method = RequestMethod.GET)
    public BaseJSON selectEditStep09SalesOpptProcessPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
        List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10322", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

        List<UserVO> users = new ArrayList<UserVO>();
        for(UserVO user : usersRoleCrmR03){
            if ( "N".equals(user.getSysUserYn()) ) {
            	users.add(user);
            }
        }

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", users);
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

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectEditStep09SalesOpptProcessPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }

    /**
     *@author sll
     *@descrption 潜客DB修改跳转
     * @return
     */
    @RequestMapping(value = "/selectEditSalesOpptProcessFailPopup.do", method = RequestMethod.GET)
    public BaseJSON selectEditSalesOpptProcessFailPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
        List<chn.bhmc.dms.mob.api.crm.vo.UserVO> usersRoleCrmR18 = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10322", LoginUtil.getDlrCd(), Constants.PERMISSION_READ);

        List<UserVO> users = new ArrayList<UserVO>();
        for(UserVO user : usersRoleCrmR03){
            if ( "N".equals(user.getSysUserYn()) ) {
            	users.add(user);
            }
        }

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR03", users);
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
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/baseJsp/selectEditSalesOpptProcessFailPopup.jsp");
        baseJSON.setResult(model);
        return baseJSON;
    }
    /**
     *@author sll
     *@description 无使用者密码 mngScIdCtrl ！= "N" 验证后直接提交
     *@description 战败(提交至潜客数据库)
     *@description 提交上一状态(提交至线索邀约)
     *@description 转出(转出)
     *@description 提交上一状态-01(提交至线索邀约)
     *@description 提交上一状态-02(提交至预约清单)
     *@description 提交上一状态-03(提交至跟踪促成)
     *@description 提交上一状态-04(提交至提交合同)
     *@description 商机修改
     *@description 商机录入
     *@description 商机分配验证
     *@description 潜客DB-修改验证
     *@return
     */
    @RequestMapping(value = "/selectUserPassWordCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectUserPassWordCheck(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
    	baseJSON.setResult(userService.isValidPassword(LoginUtil.getUserId(), searchVO.getsPassword()));
        return baseJSON;
    }

    /**
     *@author sll
     *@description mngScIdCtrl == "N" 直接提交
     *@description 战败(提交至潜客数据库)
     *@description 提交上一状态(提交至线索邀约)
     *@description 转出(转出)
     *@description 提交上一状态-01(提交至线索邀约)
     *@description 提交上一状态-02(提交至预约清单)
     *@description 提交上一状态-03(提交至跟踪促成)
     *@description 提交上一状态-04(提交至提交合同)
     *@description 商机修改
     *@description 商机录入
     *@description 潜客DB-保存
     *@return
     */
    @RequestMapping(value = "/multiSalesOpptProcess.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON multiSalesOpptProcess(@Validated @RequestBody SalesOpptProcessMgmtSaveVO saveVO, BindingResult bindingResult)throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
    	baseJSON.setResult(salesOpptProcessMgmtService.multiSalesOpptProcMgmts(saveVO));
    	return baseJSON;
    }

    /**
     *@author sll
     *@description 新增跟踪-保存（商机管理/潜客DB）
     * @param SalesOpptProcessMgmtVO - 판매기회 정보
     * @return
     */
    @RequestMapping(value = "/multiSalesOpptTraceMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON multiSalesOpptTraceMgmts(@Validated @RequestBody SalesOpptTraceMgmtVO saveVO)throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
    	baseJSON.setResult(salesOpptTraceMgmtService.multiSalesOpptTraceMgmts(saveVO));
        return baseJSON;
    }
    /**
     *@author sll
     *@description 商机分配
     * @param SalesOpptProcessMgmtVO - 판매기회 정보
     * @return
     */
    @RequestMapping(value = "/updateSalesOpptAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON updateSalesOpptAssign(@RequestBody SalesOpptProcessSaveVO saveVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
    	assignService.updateSalesOpptAssign(saveVO);
    	baseJSON.setResult(true);
        return baseJSON;

    }
    /**
     *@author sll
     *@description 展厅客流-增加-提交至跟踪促成
     *@description 展厅客流-增加-确认
     *@param
     *
     *@return
     */
    @RequestMapping(value = "/multiSalesOpptShowRoom.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON multiSalesOpptShowRoom(@Validated @RequestBody SalesOpptShowRoomMgmtSaveVO saveVO)throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
    	baseJSON.setResult(salesOpptShowRoomMgmtService.multiSalesOpptShowRoomMgmts(saveVO));

        return baseJSON;
    }

    /**
     *@author sll
     *@description 车款
     *@description
     *@param
     *
     *@return
     */
    @RequestMapping(value = "/selectFsc.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectFsc(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        searchVO.setUseYn("Y");
        BaseJSON baseJSON=new BaseJSON();
        SearchResult result = new SearchResult();
        List<VehicleSpecVO> list = vehicleSpecComboCommService.selectModelTypeCombo(searchVO);
        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }
        baseJSON.setResult(result);
        return baseJSON;
    }
    /**
     *@author sll
     *@description 其他车种
     *@description
     *@param
     *
     *@return
     */
    @RequestMapping(value = "/selectOtherBrandModel.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectOtherBrandModel(@RequestBody SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
        searchVO.setsUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(salesOpptFailOtherBrandMgmtService.selectSalesOpptFailBrandMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptFailOtherBrandMgmtService.selectSalesOpptFailBrandMgmtsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

    }

    /**
     *@author sll
     *@description 城市
     *@description
     *@param
     *
     *@return
     */
    @RequestMapping(value = "/selectCity.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectCity(@RequestBody IncJoinInfoVO vo) throws Exception{
    	BaseJSON baseJSON=new BaseJSON();
        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectCityCd(vo));
        baseJSON.setResult(result);
        return baseJSON;
    }
    /**
     *@author sll
     *@description 县城
     *@description
     *@param
     *
     *@return
     */
    @RequestMapping(value = "/selectDist.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectDist(@RequestBody IncJoinInfoVO vo) throws Exception{
    	BaseJSON baseJSON=new BaseJSON();
        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectDistCd(vo));

        baseJSON.setResult(result);
        return baseJSON;
    }
    /**
     * 정보유형 상세조회
     */
    @RequestMapping(value = "/selectHoldTpDetl.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectHoldTpDetl(@RequestBody SalesOpptHoldTypeMgmtSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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

        baseJSON.setResult(result);
        return baseJSON;
    }

    /**
     * 离店页面跳转
     * @return
     */
    @RequestMapping(value = "/selectEditSalesOpptShowRoomPopup.do", method = RequestMethod.GET)
    public BaseJSON selectEditSalesOpptShowRoomPopup(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
      //users.addAll(usersRoleCrmR03);
      //users.addAll(usersRoleCrmR18);
      for(UserVO user : usersRoleCrmR03){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }
      model.addAttribute("usersRoleCrmR03", users);
      for(UserVO user : usersRoleCrmR18){
          if ( "N".equals(user.getSysUserYn()) ) {
          	users.add(user);
          }
      }
      model.addAttribute("usersRoleCrmR18", users);

        model.addAttribute("usersRoleCrmR02", usersRoleCrmR02);
        model.addAttribute("usersRoleCrmR17", usersRoleCrmR17);
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
        baseJSON.setResult(model);
        return baseJSON;
    }
    
    @RequestMapping(value = "/selectSalesOpptProcessMgmtIng.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectSalesOpptProcessMgmtIng(@RequestBody SalesOpptProcessMgmtSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
        SearchResult result = new SearchResult();

        result.setTotal(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsIngByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptProcessMgmtService.selectSalesOpptProcessMgmtsIngByCondition(searchVO));
        }
        baseJSON.setResult(result);

        return baseJSON;
    }

}