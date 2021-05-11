package chn.bhmc.dms.crm.dmm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.CardIssueSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipTransService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisService;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransController.java
 * @Description : 멤버십 양도/양수 컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class MembershipTransController extends HController{
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 등급관리 서비스
     */
    @Resource(name="membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 시스템 컨피그 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 멤버십 양도/양수 서비스
     */
    @Resource(name="membershipTransService")
    MembershipTransService membershipTransService;

    /**
     * 결재양식관리 서비스
     */
    @Resource(name="signService")
    SignService signService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;

    /**
     * 고객정보 서비스
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 멤버십 포인트 이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 멤버십 카드발급이력 서비스
     */
    @Resource(name="cardIssueService")
    CardIssueService cardIssueService;

    /**
     * 멤버십 카드발급이력 서비스 ( Support )
     */
    @Resource(name="cardIssueSupportService")
    CardIssueSupportService cardIssueSupportService;

    /**
     * 패키지 쿠폰이력 서비스
     */
    @Resource(name="packageCouponHisService")
    PackageCouponHisService packageCouponHisService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 멤버십 양도관리 목록데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 membershipTransSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/selectMembershipTransMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipTransMngs(@RequestBody MembershipTransSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(membershipTransService.selectMembershipTransMngsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipTransService.selectMembershipTransMngsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 멤버십 양도가능 충전카드 목록데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 membershipTransSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/selectTransCards.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTransCards(@RequestBody MembershipTransSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        CardIssueSearchVO cisVO = new CardIssueSearchVO();
        cisVO.setsMembershipNo(searchVO.getsMembershipNo());
        cisVO.setsTrsfReceiveSeq(searchVO.getsTrsfReceiveSeq());

        //result.setTotal(cardIssueService.selectTransCardsByConditionCnt(cisVO));
        result.setTotal(cardIssueSupportService.selectRechargeCardsByConditionCnt(cisVO));

        if(result.getTotal() != 0){
            //result.setData(cardIssueService.selectTransCardsByCondition(cisVO));
            result.setData(cardIssueSupportService.selectRechargeCardsByCondition(cisVO));
        }

        return result;

    }

    @RequestMapping(value = "/crm/dmm/membershipTrans/selectMembershipCustInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public  Map<String, Object> selectExcelUploadStatus(@RequestBody MembershipTransSearchVO searchVO) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        MembershipSearchVO member = new MembershipSearchVO();
        CustomerInfoSearchVO customerVO = new CustomerInfoSearchVO();


        // TODO 20170308 selectMembershipInfoByKey list 로 변경시 처리.
        //1.양도자 Membership 정보
        member.setsMembershipNo(searchVO.getsTrsfMembershipNo());
        MembershipVO trsfVO = membershipSupportService.selectMembershipInfoByKey(member);
        result.put("trsfMember", trsfVO);
        //2.양도자 기본 고객정보
        if(trsfVO != null){
            customerVO.setsCustNo(trsfVO.getCustNo());
            result.put("trsfCustInfo", customerInfoOutBoundService.selectCustomerInfoByCondition(customerVO));
            result.put("trsfLastPointVal", trsfVO.getLastPointVal());
            result.put("trsfRealTotAmt", trsfVO.getRealTotAmt());

        }

        //3.양수자 Membership 정보
        member.setsMembershipNo(searchVO.getsReceiveMembershipNo());
        MembershipVO receiveVO = membershipSupportService.selectMembershipInfoByKey(member);
        result.put("receiveMember", receiveVO);
        //4.양수자 기본 고객정보
        if(receiveVO != null){
            customerVO.setsCustNo(receiveVO.getCustNo());
            result.put("receiveCustInfo", customerInfoOutBoundService.selectCustomerInfoByCondition(customerVO));
            result.put("receiveLastPointVal", receiveVO.getLastPointVal());
            result.put("receiveRealTotAmt", receiveVO.getRealTotAmt());

        }

        return result;
    }

    /**
     * 실제 결재선 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/selectSignLineExs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSignLineExs(@RequestBody SignLineSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        List<SignLineVO> signLineList = signService.selectSignLinesByCondition(searchVO);

        result.setTotal(signLineList.size());
        result.setData(signLineList);

        return result;
    }

    /**
     * 승인 [멤버십양도, 특별포인트]
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/updateSignLineEx.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSignLineEx(@Validated @RequestBody SignLineVO signLineVO, Model model) throws Exception {
        signService.updateSignLine(signLineVO);

        //[TODO] 최종결정권(승인권)자가 결재할때 승인하였을 경우 양도정보를 등록하는 프로시저 호출을 태운다.
        if(signLineVO.getSignStatCd().equals("03") && signLineVO.getSignRsltCd().equals("04") && signLineVO.getLastSignYn().equals("Y") ){
            /*MembershipTransVO membershipTransVO = new MembershipTransVO();
            membershipTransVO.setSignDocNo(signLineVO.getSignDocNo());
            SignLineVO signVO = new SignLineVO();
            signVO.setSignDocNo(signDocNo)*/
            membershipTransService.insertTransApprovalProcess(signLineVO.getSignDocNo());
        }
        return true;
    }

    /**************************************************멤버십 양도 신청 등록 관리 ver2*****************************************************/

    /**
     * 멤버십 양도관리  메인페이지로 이동한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipTransMngVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/selectMembershipTransMain.do", method = RequestMethod.GET)
    public String selectMembershipTransMain2(Model model
            , @RequestParam(value="trsfReceiveSeq", defaultValue = "0") int trsfReceiveSeq
    ) throws Exception {

        model.addAttribute("trsfReceiveSeq", trsfReceiveSeq);

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat")+" "+systemConfigInfoService.selectStrValueByKey("timeFormat"));
        model.addAttribute("sysDate", sysDate );

        //신분증유형
        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //양도사유
        model.addAttribute("trsfReasonCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM804", null, langCd));
        //양도-양수관계
        model.addAttribute("trsfReceiveRelCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM805", null, langCd));

        //결재유형(01:결재, 02:합의)
        List<CommonCodeVO> arrSignTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM009", null, langCd);
        model.addAttribute("arrSignTp", arrSignTp);

        //결재진행상태(01:대기, 02:진행, 03:결재, 04:반려)
        List<CommonCodeVO> arrSignStatCd = commonCodeService.selectCommonCodesByCmmGrpCd("COM010", null, langCd);
        model.addAttribute("arrSignStatCd", arrSignStatCd);

        //결재처리코드(01:미결, 02:반려, 03:합의, 04:결재)
        List<CommonCodeVO> arrSignProcCd = commonCodeService.selectCommonCodesByCmmGrpCd("COM011", null, langCd);
        model.addAttribute("arrSignProcCd", arrSignProcCd);

        //등급코드
        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());

        return "/crm/dmm/membershipTrans/selectMembershipTransMain";
    }

    /**
     * 양수자의 충전카드 목록을 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 카드 display 방지)
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/selectTrsfCardNoByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTrsfCardNoByCondition(@RequestBody CardIssueSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(cardIssueService.selectTrsfCardNoByCondition(searchVO));

        return result;
    }

    /**
     * 멤버십 양도 신청을 한다.(양수포인트, 양수금액, 쿠폰)
     *
     * @param MembershipTransVO - 멤버십양도관리 VO
     * @return MembershipTransVO
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/insertMembershipTransTemp.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertMembershipTrans(@RequestBody MembershipTransVO membershipTransVO) throws Exception {

        int count = 0;

        //[TODO] 결재 process를 태운다.
        count = membershipTransService.insertMembershipTransTemp(membershipTransVO);

        return count;
    }


    /**
     * 멤버십 양도관리 상세 정보를 조회한다.
     *
     * @param MembershipSearchVO - membersihpNo 필수.
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/selectMembershipTransMngByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public MembershipTransVO selectMembershipTransMngByKey(@RequestBody MembershipTransSearchVO searchVO) throws Exception {

        return membershipTransService.selectMembershipTransMngByKey(searchVO);
    }

}