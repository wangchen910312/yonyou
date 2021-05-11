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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponMasterMngService;
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
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO;
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
     * 멤버십 등록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipMain.do", method = RequestMethod.GET)
    public String selectMembershipMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        //선호연락방법
        model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        //신분증유형
        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //등급코드
        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));
        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));

        /*
         *  [TODO] 맴버십 기준정보 필요
         *  1. 충전식,포인트식 선택 기준정보
         *  2. 상품권(충전권) 기준정보
         *  3. 고객인지 자동차 인지 기준정보
         *  4. 자동차 일경우 차대번호 DropDownList랑 차종명,모델명, 차량번호
         */

        return "/crm/dmm/membership/selectMembershipMain";
    }

    /**
     * 멤버십 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipManageMain.do", method = RequestMethod.GET)
    public String selectMembershipManageMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //고객유형 custTpList (CRM001)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //잠재,보유고객
        model.addAttribute("custCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        //model.addAttribute("custCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("CRM023", null, langCd));
        //선호연락방법
        model.addAttribute("prefCommMthCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM022", null, langCd));
        //신분증유형
        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //포인트코드(자동차구매, 제품판매, 정비, 특별포인트, 대행서비스, 액세서리)
        model.addAttribute("pointCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, langCd));

        //등급코드
        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));
        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));


        //model.addAttribute("gradeCdList", selectGradeCdList());

        /*
         *  [TODO] 맴버십 기준정보 필요
         *  1. 충전식,포인트식 선택 기준정보
         *  2. 상품권(충전권) 기준정보
         *  3. 고객인지 자동차 인지 기준정보
         *  4. 자동차 일경우 차대번호 DropDownList랑 차종명,모델명, 차량번호
         */

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
        //searchVO.getsDlrCd();
        //vinSearchVo
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
        result.setTotal(membershipPointHisService.selectPointHistorysByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipPointHisService.selectPointHistorysByCondition(searchVO));
        }

        return result;

    }

    /**
     * 멤버십 포인트 이력 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipCardHiss.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipCardHiss(@RequestBody CardIssueSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(cardIssueService.selectCardHissByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cardIssueService.selectCardHissByCondition(searchVO));
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
        result.setTotal(cardIssueService.selectRechargeCardsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cardIssueService.selectRechargeCardsByCondition(searchVO));
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
     * 특별포인트 신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectSpecialPointPopup.do", method = RequestMethod.GET)
    public String selectSpecialPointPopup(Model model,HttpServletRequest request) throws Exception {

        model.addAttribute("membershipNo",  request.getParameter("membershipNo"));
        model.addAttribute("cardNo",  request.getParameter("cardNo"));
        model.addAttribute("cardTpCd",  request.getParameter("cardTpCd"));

        //포인트 코드 pointCdList (CRM802)
        model.addAttribute("pointCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM802", null, LocaleContextHolder.getLocale().getLanguage()));

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/dmm/membership/selectSpecialPointPopup";
    }

    /**
     * 특별포인트를 신청한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/insertSpecialPoint.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSpecialPoint(@RequestBody MembershipVO membershipVO) throws Exception {

        /*
         * [TODO] 포인트 등록, 수정시 계산하는 프로시저 로직을 무조건 태워 CR_0101T와 CR_0803T에 update할 수 있도록 한다.
         */
        int result = membershipService.insertSpecialPoint(membershipVO);
        return true;
    }

    /**
     * 멤버십 신청을 신규로 생성한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membership/insertMembership.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertMembership(@RequestBody MembershipVO membershipVO) throws Exception {

        membershipVO.setRegUsrId(LoginUtil.getUserId());
        membershipVO.setDlrCd(LoginUtil.getDlrCd());

        // 1. 고객기준 등록시
        MembershipSearchVO searchVO = new MembershipSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsCustNo(membershipVO.getCustNo());
        searchVO.setsVinNo(membershipVO.getVinNo());
        searchVO.setsStan(membershipVO.getStan());
        int count = 0;
        if( StringUtils.isNotEmpty(membershipVO.getStan())&& membershipVO.getStan().equals("01")){
            count = membershipService.selectMembershipJoinUserCnt(searchVO);
            if(count == 0){
                membershipService.insertMembership(membershipVO);
                count = -1;
            }
        }

        // 2. 자동차 기준(차대번호) 등록시
        if( StringUtils.isNotEmpty(membershipVO.getStan()) && membershipVO.getStan().equals("02")){
            //count = membershipService.insertMembership(membershipVO);
            count = membershipService.selectMembershipJoinUserCnt(searchVO);
            if(count == 0){
                membershipService.insertMembership(membershipVO);
                count = -1;
            }
        }

        return count;
    }

    /**
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
     * 멤버십 번호조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipSearchPopup.do", method = RequestMethod.GET)
    public String selectMembershipSearchPopup(Model model) throws Exception {

        //로그인 정보 : 딜러코드 .  사업장 코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/dmm/membership/selectMembershipSearchPopup";
    }

    /**
     * 멤버십 가입 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipsPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipsPopup(@RequestBody MembershipSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipService.selectMembershipsPopupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipService.selectMembershipsPopupByCondition(searchVO));
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
        result.setTotal(packageCouponHisService.selectPackageCouponHissByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageCouponHisService.selectPackageCouponHissByCondition(searchVO));
        }

        return result;
    }

    /**
     * 패키지 쿠폰 신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectPackageCouponPopup.do", method = RequestMethod.GET)
    public String selectPackageCouponPopup(Model model,HttpServletRequest request) throws Exception {

        PackageCouponMasterMngSearchVO searchVO = new PackageCouponMasterMngSearchVO();
        searchVO.setsDlrCd(request.getParameter("dlrCd"));


        //패키지 목록 packageCouponList
        model.addAttribute("packageCouponList", packageCouponMasterMngService.selectPackageCouponMasterMngsByCondition(searchVO));

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", request.getParameter("dlrCd"));
        model.addAttribute("membershipNo", request.getParameter("membershipNo"));

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

        packageCouponHisService.multiPackageCouponHiss(saveVO);
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
        model.addAttribute("membershipNo", request.getParameter("membershipNo"));
        model.addAttribute("cardTpCd", "02");

        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));

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

        // 1. 고객기준 등록시
        /*MembershipSearchVO searchVO = new MembershipSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsCustNo(hisVO.getCustNo());*/

        CardIssueVO cardIssueVO = new CardIssueVO();
        cardIssueVO.setRegUsrId(LoginUtil.getUserId());
        cardIssueVO.setDlrCd(hisVO.getDlrCd());
        cardIssueVO.setMembershipNo(hisVO.getMembershipNo());
        cardIssueVO.setCardTpCd(hisVO.getCardTpCd());
        cardIssueVO.setCardNo(hisVO.getCardNo());
        cardIssueVO.setOccrPointVal(hisVO.getOccrPointVal());
        cardIssueVO.setRealTotAmt(hisVO.getOccrPointVal());
        cardIssueVO.setUseYn("Y");

        // 카드발급이력에 등록
        result = cardIssueService.insertRechargeCardIssue(cardIssueVO);

        /*// 포인트 발급 이력에 충전금액 등록
        if(result > 0){
            result = membershipPointHisService.insertRechargeAmt(hisVO);
        }*/

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
        model.addAttribute("cardTpCd", "02");

        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));

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
    public int insertRechargeCradHis(@Validated @RequestBody MembershipPointHisVO membershipPointHisVO) throws Exception {
        int result = 0;
        membershipPointHisVO.setInsertFlag("01");//충전카드 충전일 경우
        result = membershipPointHisService.insertRechargeAmt(membershipPointHisVO);
        return result;
    }
}
