package chn.bhmc.dms.crm.dmm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinHistoryService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinHistorySupportService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsAndCopnRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCouponRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfPaymentRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipSearchVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipController.java
 * @Description : 블루멤버십 가입컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class BlueMembershipJoinController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 블루멤버십 관리 서비스
     */
    @Resource(name="blueMembershipJoinService")
    BlueMembershipJoinService blueMembershipJoinService;

    /**
     * 블루멤버십 인증 히스토리 서비스
     */
    @Resource(name="blueMembershipJoinHistoryService")
    BlueMembershipJoinHistoryService blueMembershipJoinHistoryService;

    /**
     * 블루멤버십 인증 히스토리 서비스 Support
     */
    @Resource(name="blueMembershipJoinHistorySupportService")
    BlueMembershipJoinHistorySupportService blueMembershipJoinHistorySupportService;

    /**
     * 블루멤버십 관리 서비스
     */
    @Resource(name="blueMembershipJoinSupportService")
    BlueMembershipJoinSupportService blueMembershipJoinSupportService;

    /**
     * 블루멤버십 인터페이스 서비스
     */
    @Resource(name="blueMembershipInterfaceService")
    BlueMembershipInterfaceService blueMembershipInterfaceService;

    /**
     * 서비스 공통용 고객및차량정보 구현 서비스
     */
    @Resource(name="vehOfCustInfoService")
    VehOfCustInfoService vehOfCustInfoService;

    /**
     * 서비스 공통용 고객및차량정보 구현 서비스
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 블루멤버십 가입신청 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinMain.do", method = RequestMethod.GET)
    public String selectSatisFactionScoreMngMain(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //고객유형
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //신분증유형
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //블루멤버십 회원등급 유형
        model.addAttribute("mLevelList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        //비용지불포인트취득상태
        model.addAttribute("paymentAccessPointsStatusList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM811", null, langCd));

        return "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinMain";
    }

    /**
     * 블루멤버십 가입 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoins.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipCards(@RequestBody BlueMembershipJoinSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(blueMembershipJoinService.selectBlueMembershipJoinsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(blueMembershipJoinService.selectBlueMembershipJoinsByCondition(searchVO));
        }

        return result;
    }

    /**
     * CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 贾明 2018-10-22 
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinsByConditionCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipJoinsByConditionCnt(@RequestBody BlueMembershipJoinSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(blueMembershipJoinService.selectBlueMembershipJoinsByConditionCnt(searchVO));
        return result;
    }
    

    /**
     * 블루멤버십 가입 가능 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinTodos.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipJoinTodos(@RequestBody VehOfCustInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(vehOfCustInfoService.selectVehOfCustInfoByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(vehOfCustInfoService.selectVehOfCustInfoByCondition(searchVO));
        }

        return result;
    }

    /**
     * 블루멤버십 가입 가능 목록을 출력한다.
     * 고객조회 팝업 > 차량정보 기준 고객 목록 > 보유고객 && 개인 && !타사차량 && 신분증유형 : 신분증 인 목록.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoin.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipJoin(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(customerInfoOutBoundService.selectCustomerAndCarInfoByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(customerInfoOutBoundService.selectCustomerAndCarInfoByCondition(searchVO));
        }

        return result;
    }


    /**
     * 블루멤버십 가입신청 정보를 등록/수정한다.
     * @param BlueMembershipJoinSearchVO - 등록/수정할 정보가 담긴 BlueMembershipJoinSearchVO
     * @return 등록된 목록수
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/insertBlueMembershipJoin.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertBlueMembershipJoin(@Validated @RequestBody BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        blueMembershipJoinVO.setRegUsrId(LoginUtil.getUserId());
        //등록된 회원이 있을경우 주소만 수정가능하다.
        blueMembershipJoinService.insertBlueMembershipJoin(blueMembershipJoinVO);
        return true;
    }


    /**
     * 블루멤버십 가입신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinPopup.do", method = RequestMethod.GET)
    public String selectBlueMembershipJoinPopup(Model model,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("membershipNo",  request.getParameter("membershipNo"));
        model.addAttribute("cardNo",  request.getParameter("cardNo"));
        model.addAttribute("cardTpCd",  request.getParameter("cardTpCd"));

        //고객유형
        List<CommonCodeVO> listCcVO = commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd);
        List<CommonCodeVO> custTpList = new ArrayList<CommonCodeVO>();
        for(int i=0;i<listCcVO.size();i++){
            if(listCcVO.get(i).getRemark2() != null && listCcVO.get(i).getRemark2() != ""){
                CommonCodeVO custTp = new CommonCodeVO();
                custTp.setCmmGrpCd(listCcVO.get(i).getCmmGrpCd());
                custTp.setCmmGrpCdNm(listCcVO.get(i).getCmmGrpCdNm());
                custTp.setCmmCd(listCcVO.get(i).getCmmCd());
                custTp.setCmmCdNm(listCcVO.get(i).getCmmCdNm());
                custTpList.add(custTp);
            }
        }
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));       // 고객유형

        //신분증유형
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        //블루멤버십 회원등급 유형
        model.addAttribute("mLevelList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));

        //블루멤버십 가입 지불 금액
        model.addAttribute("amountList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM809", null, langCd));


        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinPopup";
    }

    /*
     ************************************* 블루 멤버십 InterFace  ******************************************
     **/

    /**
     * 딜러 One Click회원 가입 (딜러에서 차량을 구매하고 가입하는 경우, 보통 버튼 Click한번으로 가입이 됨으로 OneClick회원가입이라 한다.)
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/insertCreateMembership.do",method=RequestMethod.POST)
    @ResponseBody
    public HashMap<String, String> insertCreateMembership(@RequestBody BlueMembershipJoinVO joinVO) throws Exception{
        //Map<String,Object> result = new HashMap<String,Object>();

        //딜러 One Click회원 가입 (딜러에서 차량을 구매하고 가입하는 경우, 보통 버튼 Click한번으로 가입이 됨으로 OneClick회원가입이라 한다.)
        HashMap<String, String> hm = blueMembershipJoinService.insertCreateMembership(joinVO);
        return hm;
    }

    /**
     * 블루멤버십 회원 포인트 조회
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/selectMemberUserintegralInfo.do",method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfInfoRapVO selectMemberUserintegralInfo(@RequestBody BlueMembershipJoinVO paramVO) throws Exception{

        //회원 포인트 조회
        BlueMembershipIfInfoRapVO dataVO = blueMembershipJoinSupportService.selectMemberUserIntegralInfo(paramVO);

        return dataVO;
    }

    /**
     * 블루멤버십 가입 정보를 확인 및 출력한다.
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/selectBlueMembershipByIdentityNumber.do",method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfInfoRapVO selectBlueMembershipByIdentityNumber(@RequestBody BlueMembershipJoinVO paramVO) throws Exception{
        //블루멤버십 회원정보조회 인터페이스
        return blueMembershipJoinService.selectBlueMembershipByIdentityNumber(paramVO);
    }

    /**
     * 블루멤버십 딜러 인증 심사( 고객이 APP, 홈페이지에서 가입을 하고 온 경우 )
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/insertMembershipApproval.do",method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfInfoRapVO insertMembershipApproval(@RequestBody BlueMembershipJoinVO paramVO) throws Exception{
        return blueMembershipJoinService.insertMembershipApproval(paramVO);
    }

    /**
     * 블루멤버십 포인트 소비 신규 [ 20170114 - index_crm.jsp 에서만 URL 호출함. 서비스는 판매 정비 등에서 호출. ]
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/insertAddMembersConsume.do",method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfConsumeRapVO insertAddMembersConsume(@RequestBody BlueMembershipJoinVO joinVO) throws Exception{
        //블루멤버십 포인트 소비 신규 인터페이스
        BlueMembershipIfConsumeRapVO consumeRapVO = blueMembershipJoinSupportService.insertAddMembersConsume(joinVO);
        return consumeRapVO;
    }

    /**
     * 블루멤버십 BM 회원 포인트 명세
     * @return Map<String,Object>
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/selectAddORConsumeintegralList.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult BlueMembershipIfConsumeList(@RequestBody BlueMembershipJoinVO joinVO) throws Exception{

        //블루멤버십 BM 회원 포인트 명세 인터페이스
        SearchResult result = new SearchResult();
        BlueMembershipIfConsumeListRapVO rapVO = blueMembershipJoinService.blueMembershipIfConsumeList(joinVO);
        result.setData(rapVO.getDataList());

        return result;
    }

    /**
     * 블루멤버십 쿠폰 사용 여부 조회
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/selectCustomCardCodeInfoByDMSInfo.do",method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfCouponRapVO selectCustomCardCodeInfoByDMSInfo(@RequestBody BlueMembershipJoinVO joinVO) throws Exception{
        //블루멤버십 쿠폰 사용 여부 조회 인터페이스
        BlueMembershipIfCouponRapVO rapVO = blueMembershipJoinSupportService.selectCustomCardCodeInfoByDMSInfo(joinVO);
        return rapVO;
    }

    /**
     * 블루멤버십 쿠폰 사용
     * @return Map<String,Object>
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/updateUserAwardCustomCardInfo.do",method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfCouponRapVO updateUserAwardCustomCardInfo(@RequestBody BlueMembershipJoinVO joinVO) throws Exception{
        return blueMembershipJoinSupportService.updateUserAwardCustomCardInfo(joinVO);
    }

    /**
     * 블루멤버십 인증목록
     * @return c
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectPaymentAccessPoints.do", method = RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfPaymentRapVO selectPaymentAccessPoints(@RequestBody BlueMembershipIfParamVO bmVO) throws Exception {
        return blueMembershipInterfaceService.selectPaymentAccessPoints(bmVO);
    }



    /**
     * 블루멤버십 인증 히스토리 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinHistorys.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipJoinHistorys(@RequestBody BlueMembershipJoinSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(blueMembershipJoinHistorySupportService.selectBlueMembershipJoinHistorysByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(blueMembershipJoinHistorySupportService.selectBlueMembershipJoinHistorysByCondition(searchVO));
        }

        return result;
    }
    
    /**
     *  CRM_蓝缤入会管理_缴费获取积分记录 新增Excel 下载  贾明 2018-10-22 
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipJoinHistorysByConditionCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipJoinHistorysByConditionCnt(@RequestBody BlueMembershipJoinSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(blueMembershipJoinHistorySupportService.selectBlueMembershipJoinHistorysByConditionCnt(searchVO));
        return result;
    }
    


    /**
     * 블루멤버십 인증 히스토리 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/updateBlueMembershipInfoSync.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateBlueMembershipInfoSync() throws Exception {

        //BM 회원 포인트 SYNC
        return blueMembershipJoinSupportService.updateBlueMembershipInfoSync();

    }

    /**
     * 블루멤버십 쿠폰 사용 여부 조회
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/updateUseCardAndAddConsume.do",method=RequestMethod.POST)
    @ResponseBody
    public BlueMembershipIfConsAndCopnRapVO updateUseCardAndAddConsume(@RequestBody BlueMembershipJoinVO joinVO) throws Exception{
        //블루멤버십 쿠폰 사용 여부 조회 인터페이스
        BlueMembershipIfConsAndCopnRapVO rapVO = blueMembershipJoinSupportService.updateUseCardAndAddConsume(joinVO);
        return rapVO;
    }

    /**
     * 블루멤버십 가입 현황
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipMain.do", method = RequestMethod.GET)
    public String selectBlueMembershipMain(Model model) throws Exception {
        //블루멤버십 등급코드
        model.addAttribute("gradeList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, LoginUtil.getLangCd()));
        return "/crm/dmm/blueMembershipJoin/selectBlueMembershipMain";
    }

    /**
     * 블루멤버십 가입 현황 조회
     * @return Map<String,Object> - 완료
     */
    @RequestMapping(value="/crm/dmm/blueMembershipJoin/selectBlueMembershipList.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBlueMembershipList(@RequestBody BlueMembershipSearchVO searchVO) throws Exception{
        SearchResult result = new SearchResult();

        searchVO.setsLangCd(LoginUtil.getLangCd());
        result.setTotal(blueMembershipJoinService.selectBlueMembershipByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(blueMembershipJoinService.selectBlueMembershipByCondition(searchVO));
        }
        return result;
    }


    /**
     * BM회원현황 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/blueMembershipJoin/selectBlueMembershipListExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectBlueMembershipListExcelExportCnt(@RequestBody BlueMembershipSearchVO searchVO, Model model) throws Exception {
        searchVO.setsLangCd(LoginUtil.getLangCd());
        return blueMembershipJoinService.selectBlueMembershipByConditionCnt(searchVO);
    }


}
