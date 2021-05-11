package chn.bhmc.dms.crm.dmm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.CardIssueSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisSupportService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponStandbyService;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSaveVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbySaveVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbyVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleCustomerInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipController.java
 * @Description : 멤버십 등록 컨트롤러.
 * @author Kim Hyun Ho
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Controller
public class MembershipController extends HController{
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 멤버십 이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 멤버십 이력 서비스
     */
    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     * 등급 이력 서비스
     */
    @Resource(name="membershipGradeHisService")
    MembershipGradeHisService membershipGradeHisService;

    /**
     * 카드발급 이력 서비스
     */
    @Resource(name="cardIssueService")
    CardIssueService cardIssueService;

    /**
     * 카드발급 이력 서비스 ( Support )
     */
    @Resource(name="cardIssueSupportService")
    CardIssueSupportService cardIssueSupportService;

    /**
     * 차대번호(차량마스터) 서비스
     */
    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    /**
     * 멤버십 등급관리 서비스
     */
    @Resource(name="membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 패키지 쿠폰 마스터 관리 서비스
     */
    @Resource(name="packageCouponMasterMngService")
    PackageCouponMasterMngService packageCouponMasterMngService;

    /**
     * 패키지 쿠폰이력 서비스
     */
    @Resource(name="packageCouponHisService")
    PackageCouponHisService packageCouponHisService;

    /**
     * 패키지 쿠폰이력 서비스
     */
    @Resource(name="packageCouponHisSupportService")
    PackageCouponHisSupportService packageCouponHisSupportService;

    /**
     * 패키지 쿠폰 결재대기 서비스
     */
    @Resource(name="packageCouponStandbyService")
    PackageCouponStandbyService packageCouponStandbyService;

    /**
     * 시스템설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 고객정보관리 서비스
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;


    /**
     * 고객쿠폰관리서비스
     */
    @Resource(name="customerCouponMgmtService")
    CustomerCouponMgmtService customerCouponMgmtService;


    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;


    /**
     * 멤버십 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipManageMain.do", method = RequestMethod.GET)
    public String selectMembershipManageMain(Model model
            , @RequestParam(value="membershipNo", defaultValue="") String membershipNo
    ) throws Exception {

        model.addAttribute("membershipNo", membershipNo);

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("membershipGradeNoneAutoYn", LoginUtil.getMembershipGradeNoneAutoYn());  // 20170104 / 이인문 / 딜러정보 > CRM 옵션 설정 > crm.lbl.membershipGradeNoneAutoYn / 회원등급 수동 변경여부 가져오기
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));    //고객유형 custTpList (CRM001)
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));    //잠재,보유고객
        model.addAttribute("prefCommMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd)); //선호연락방법
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd)); //신분증유형
        model.addAttribute("pointCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd));   //포인트코드(자동차구매,제품판매,정비,특별포인트,대행서비스,정비,액세서리,양도,양수,소멸)
        model.addAttribute("cardTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));  //카드종류
        model.addAttribute("policy", LoginUtil.getMembershipPolicy());

        model.addAttribute("dcUseTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM052", null, langCd));   // 쿠폰 할인사용구분

        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));    //등급코드

        List<CommonCodeVO> arrSignTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, langCd);
        model.addAttribute("arrSignTp", arrSignTp); //결재유형(01:결재, 02:합의)

        List<CommonCodeVO> arrSignProcCd = commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, langCd);
        model.addAttribute("arrSignProcCd", arrSignProcCd); //결재처리코드(01:미결, 02:반려, 03:합의, 04:결재)

        /*
         *  [TODO] 맴버십 기준정보 필요
         *  1. 충전식,포인트식 선택 기준정보
         *  2. 상품권(충전권) 기준정보
         *  3. 고객인지 자동차 인지 기준정보
         *  4. 자동차 일경우 차대번호 DropDownList랑 차종명,모델명, 차량번호
         */

        // 시작일 - 종료일 설정
        Calendar startCal = Calendar.getInstance();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        int year = startCal.get(Calendar.YEAR);
        int month = startCal.get(Calendar.MONTH);
        int day = startCal.get(Calendar.DATE);

        startCal.set(year, month-6, day);
        String sStartDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sStartDt", sStartDt);

        startCal.set(year, month, day);
        String sEndDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sEndDt", sEndDt);


        return "/crm/dmm/membership/selectMembershipManageMain";
    }

    /**
     * VIN(차대번호) DropDownList 를 확인한다.
     * @param searchVO - VIN(차대번호) 조회 하는 SearchVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectVINDropDownList.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> selectVINDropDownList(@RequestBody MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        VehicleMasterSearchVO vinSearchVO = new VehicleMasterSearchVO();
        vinSearchVO.setsDlrCd(searchVO.getsDlrCd());
        vinSearchVO.setsCustNo(searchVO.getsCustNo());
        vinSearchVO.setsUseYn("Y");//현재보유

        Map<String, Object> result = new HashMap<String, Object>();
        int cnt = vehicleMasterService.selectVehicleCustomerInfoByConditionCnt(vinSearchVO);

        List<VehicleCustomerInfoVO> vinList = new ArrayList<VehicleCustomerInfoVO>();
        if(cnt > 0){
            vinList = vehicleMasterService.selectVehicleCustomerInfoByCondition(vinSearchVO);
        }
        if(vinList != null && vinList.size() != 0){
            result.put("vinList",vinList);
            result.put("vinListCnt",vinList.size());
        }else{
            result.put("vinListCnt",0);
        }
        return result;
    }

    /**
     * 멤버십 포인트 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipPointHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointHiss(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipPointHisSupportService.selectPointHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipPointHisSupportService.selectPointHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 멤버십 충전카드 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectRechargeCardList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRechargeCardList(@RequestBody CardIssueSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(cardIssueSupportService.selectRechargeCardsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cardIssueSupportService.selectRechargeCardsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 멤버십 등급 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipGradeHisSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipGradeHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipGradeHiss(@RequestBody MembershipGradeHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipGradeHisService.selectMembershipGradeHissByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipGradeHisService.selectMembershipGradeHissByCondition(searchVO));
        }

        return result;

    }

    /**
     * 멤버십 신청을 신규로 생성한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membership/multiMembership.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiMembership(@RequestBody MembershipVO membershipVO) throws Exception {

        membershipVO.setRegUsrId(LoginUtil.getUserId());
        membershipVO.setDlrCd(LoginUtil.getDlrCd());

        // custNo / vinNo 로 멤버십 가입 여부 확인.
        MembershipSearchVO searchVO = new MembershipSearchVO();
        //searchVO.setsMembershipStan(membershipVO.getStan());
        searchVO.setsCustNo(membershipVO.getCustNo());
        searchVO.setsVinNo(membershipVO.getVinNo());

        // 멤버십 가입 여부 확인
        MembershipVO mVO = membershipSupportService.selectMembershipInfoByKey(searchVO);

        int count = mVO.getMembershipInfoListCnt();

        if ( count == 0 ) {
            // 신규가입
            count = membershipService.insertMembership(membershipVO);
        } else {
            //멤버십 조회후 등록된 인원이 있을때 update
            count = membershipService.updateMembership(membershipVO);
        }

        return count;
    }

    /**
     * 멤버십 상세 정보를 조회한다.
     * TODO validation
     * @param MembershipSearchVO - membersihpNo 필수.
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipJoinByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public MembershipVO selectMembershipJoinByKey(@RequestBody MembershipSearchVO searchVO) throws Exception {
        return membershipSupportService.selectMembershipInfoByKey(searchVO);
    }

    /**
     *
     *      20170318 사용안함
     * 멤버십 수정 한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membership/updateMembership.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateMembership(@RequestBody MembershipVO membershipVO) throws Exception {

        membershipVO.setRegUsrId(LoginUtil.getUserId());
        membershipVO.setDlrCd(LoginUtil.getDlrCd());

        int count = 0;

        count = membershipService.updateMembership(membershipVO);
        if(count > 0){
            count = -1;
        }

        return count;
    }

    /**
     * 멤버십 가입 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMemberships.do", method = RequestMethod.POST)
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
     * 会员管理 Excle 下载功能统计 贾明 2018-9-28 
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/crm/dmm/membership/selectMembershipsListCnt.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectMembershipsListCnt(@RequestBody MembershipSearchVO searchVO) throws Exception {
    	 SearchResult result = new SearchResult();
         result.setTotal(membershipService.selectMembershipsByConditionCnt(searchVO));
         return result;
    }
    

    /**
     * 멤버십 번호조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipSearchPopup.do", method = RequestMethod.GET)
    public String selectMembershipSearchPopup(Model model) throws Exception {

        //로그인 정보 : 딜러코드 .  사업장 코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("policy", LoginUtil.getMembershipPolicy());

        return "/crm/dmm/membership/selectMembershipSearchPopup";
    }

    /**
     * 멤버십관리 > 멤버십 양도관리 > 양도/양수자 멤버십 조회
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipsPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipsPopup(@RequestBody MembershipSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsListTarget("T");   // 멤버십 양도에서는 전체 검색 & 금액(sum) 데이터가 필요없기 때문에 해당 변수로 금액(sum) 데이터는 if 처리
        result.setTotal(membershipService.selectMembershipsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipService.selectMembershipsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 패키지 쿠폰 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectPackageCouponHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageCouponHiss(@RequestBody PackageCouponHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(packageCouponHisSupportService.selectPackageCouponHissByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageCouponHisSupportService.selectPackageCouponHissByCondition(searchVO));
        }

        return result;
    }

    /**
     * 패키지 쿠폰 신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectPackageCouponPopup.do", method = RequestMethod.GET)
    public String selectPackageCouponPopup(Model model,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        PackageCouponMasterMngSearchVO searchVO = new PackageCouponMasterMngSearchVO();
        searchVO.setsDlrCd(request.getParameter("dlrCd"));
        searchVO.setsPkgUse("Y");
        model.addAttribute("packageCouponList", packageCouponMasterMngService.selectPackageCouponMasterMngsByCondition(searchVO));  //패키지 목록 packageCouponList

        model.addAttribute("cupnTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM810", null, langCd));  // 쿠폰타입
        model.addAttribute("dlrCd", request.getParameter("dlrCd")); //로그인 정보 : 딜러코드
        model.addAttribute("membershipNo", request.getParameter("membershipNo"));
        model.addAttribute("sysDate", DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")));

        return "/crm/dmm/membership/selectPackageCouponPopup";
    }

    /**
     * 패키지쿠폰 이력  정보를 등록한다.
     * @param saveVO - 패키지쿠폰 이력 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/multiPackageCouponHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPackageCouponHiss(@Validated @RequestBody PackageCouponHisSaveVO saveVO) throws Exception {

        PackageCouponMasterMngSearchVO pcmmSearchVO = new PackageCouponMasterMngSearchVO();
        pcmmSearchVO.setsDlrCd(saveVO.getDlrCd());
        pcmmSearchVO.setsPkgSeq(saveVO.getPkgSeq());

        PackageCouponMasterMngVO pcmmVO = packageCouponMasterMngService.selectPackageCouponMasterMngByKey(pcmmSearchVO);

        if(pcmmVO.getPkgAmt() == 0){        // 패키지쿠폰 값이 0원일 경우 쿠폰 결재대기 테이블로 insert함
            PackageCouponStandbySaveVO stdSaveVO = new PackageCouponStandbySaveVO();
            List<PackageCouponStandbyVO> insertList = new ArrayList<PackageCouponStandbyVO>() ;

            for(PackageCouponHisVO packageCouponHisVO : saveVO.getInsertList()){
                PackageCouponStandbyVO standbyVO = new PackageCouponStandbyVO();
                standbyVO.setDlrCd(packageCouponHisVO.getDlrCd());
                standbyVO.setMembershipNo(packageCouponHisVO.getMembershipNo());
                //standbyVO.setSignDocNo(signDocNo);
                standbyVO.setPkgSeq(packageCouponHisVO.getPkgSeq());
                standbyVO.setPkgNm(packageCouponHisVO.getPkgNm());
                standbyVO.setPkgAmt(packageCouponHisVO.getPkgAmt());
                standbyVO.setPkgCont(packageCouponHisVO.getPkgCont());
                standbyVO.setCupnSeq(packageCouponHisVO.getCupnSeq());
                standbyVO.setCupnNo(packageCouponHisVO.getCupnNo());
                standbyVO.setCupnNm(packageCouponHisVO.getCupnNm());
                standbyVO.setCupnCont(packageCouponHisVO.getCupnCont());
                standbyVO.setCupnExtcDt(packageCouponHisVO.getCupnDestDt());
                standbyVO.setCupnValidPrid(packageCouponHisVO.getCupnValidPrid());
                insertList.add(standbyVO);

            }
            if(insertList != null){
                stdSaveVO.setInsertList(insertList);
                packageCouponStandbyService.multiPackageCouponStandbys(stdSaveVO);
            }
        }else{        // 패키지쿠폰 값이 있을 경우 사용자패키지쿠폰 테이블로 insert함
            packageCouponHisService.multiPackageCouponHiss(saveVO);
        }
        return true;
    }


    /**
     * 충전카드 발급 신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipRechargeCardPopup.do", method = RequestMethod.GET)
    public String selectMembershipRechargeCardPopup(Model model,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", request.getParameter("dlrCd"));
        String membershipNo = request.getParameter("membershipNo");
        String rechargeCardNo = request.getParameter("cardNo");

        // 카드가 등록 되어있으면 충전 카드 등록시 충전카드번호는 빈값이다.
        CardIssueSearchVO searchVO = new CardIssueSearchVO();
        searchVO.setsMembershipNo(membershipNo);
        int cardResult = cardIssueSupportService.selectRechargeCardsByConditionCnt(searchVO);

        if ( cardResult > 0 ) {
            rechargeCardNo = "";
        }

        model.addAttribute("rechargeCardNo", rechargeCardNo);

        model.addAttribute("membershipNo", membershipNo);
        model.addAttribute("cardTpCd", "02");

        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));
        //포인트코드(자동차구매,제품판매,정비,특별포인트,대행서비스,정비,액세서리,양도,양수,소멸,충전)
        model.addAttribute("pointCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd));

        return "/crm/dmm/membership/selectMembershipRechargeCardPopup";
    }

    /**
     * 충전카드를 등록한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membership/insertRechargeCard.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertRechargeCard(@RequestBody MembershipPointHisVO hisVO) throws Exception {

        hisVO.setRegUsrId(LoginUtil.getUserId());
        hisVO.setDlrCd(LoginUtil.getDlrCd());

        int  result = 0;

        CardIssueVO cardIssueVO = new CardIssueVO();
        cardIssueVO.setRegUsrId(LoginUtil.getUserId());
        cardIssueVO.setDlrCd(hisVO.getDlrCd());
        cardIssueVO.setMembershipNo(hisVO.getMembershipNo());
        cardIssueVO.setCardTpCd(hisVO.getCardTpCd());
        cardIssueVO.setCardNo(hisVO.getCardNo());
        cardIssueVO.setOccrPointVal(hisVO.getOccrPointVal());
        cardIssueVO.setPointCd(hisVO.getPointCd());
        cardIssueVO.setUseYn("Y");

        // 카드발급이력에 등록
        result = cardIssueService.insertRechargeCardIssue(cardIssueVO);

        return result;
    }

    /**
     * 충전카드에 충전할 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipRechargePopup.do", method = RequestMethod.GET)
    public String selectMembershipRechargePopup(Model model,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", request.getParameter("dlrCd"));
        model.addAttribute("membershipNo", request.getParameter("membershipNo"));
        model.addAttribute("cardNo", request.getParameter("cardNo"));
        model.addAttribute("pointCd", request.getParameter("pointCd"));
        model.addAttribute("cardTpCd", "02");

        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));
        //포인트코드(자동차구매,제품판매,정비,특별포인트,대행서비스,정비,액세서리,양도,양수,소멸,충전)
        model.addAttribute("pointCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd));

        return "/crm/dmm/membership/selectMembershipRechargePopup";
    }

    /**
     * 충전카드 충전  정보를 등록한다.
     * @param membershipPointHisVO - 충전 이력 정보 등록
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/insertRechargeCradHis.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertRechargeCradHis(@Validated @RequestBody MembershipPointHisVO membershipPointHisVO) throws Exception {
        String result = "";
        membershipPointHisVO.setInsertFlag("01");//충전카드 충전일 경우
        result = membershipPointHisSupportService.insertRechargeAmtProc(membershipPointHisVO);
        return result;
    }

    /**
     * 딜러 멤버십 가입시 등록할 멤버십 번호를 자동생성한다.
     * @param membershipPointHisVO - 충전 이력 정보 등록
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipNoSetting.do", method = RequestMethod.POST)
    @ResponseBody
    public String selectMembershipNoSetting() throws Exception {
        //등록할 멤버십 번호 생성
        return membershipService.selectNextMembershipNo();
    }


    /**
     * 쿠폰 발행 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectCustCouponPublishInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustCouponPublishInfo(@RequestBody CustPublishInfoSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(customerCouponMgmtService.selectCouponCustConfigByConditionCnt(searchVO));
        if (result.getTotal() != 0) {
            result.setData(customerCouponMgmtService.selectCouponCustConfigByCondition(searchVO));
        }
        return result;
    }




}
