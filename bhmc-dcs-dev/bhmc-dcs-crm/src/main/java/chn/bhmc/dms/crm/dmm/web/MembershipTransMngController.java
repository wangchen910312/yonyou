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
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.apr.service.SignService;
import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipTransService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransMngController.java
 * @Description : 멤버십 양도 관리
 * @author Kim Hyun Ho
 * @since 2016. 5. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 4.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class MembershipTransMngController extends HController {
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
     * 멤버십 양도관리  메인페이지로 이동한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipTransMngVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTransMng/selectMembershipTransMngMain.do", method = RequestMethod.GET)
    public String selectMembershipTransMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //신분증유형
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //양도사유
        model.addAttribute("trsfReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM804", null, langCd));
        //양도-양수관계
        model.addAttribute("trsfReceiveRelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM805", null, langCd));

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

        return "/crm/dmm/membershipTransMng/selectMembershipTransMngMain";
    }

    /**
     * 멤버십 양도관리 목록데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 membershipTransSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTransMng/selectMembershipTransMngs.do", method = RequestMethod.POST)
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

    @RequestMapping(value = "/crm/dmm/membershipTransMng/selectMembershipCustInfo.do", method=RequestMethod.POST)
    @ResponseBody
    public  Map<String, Object> selectExcelUploadStatus(@RequestBody MembershipTransSearchVO searchVO) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        MembershipSearchVO member = new MembershipSearchVO();
        CustomerInfoSearchVO customerVO = new CustomerInfoSearchVO();

        //1.양도자 Membership 정보
        member.setsMembershipNo(searchVO.getsTrsfMembershipNo());
        MembershipVO trsfVO = membershipService.selectMembershipInfoByKey(member);
        result.put("trsfMember", trsfVO);
        //2.양도자 기본 고객정보
        if(trsfVO != null){
            customerVO.setsCustNo(trsfVO.getCustNo());
            result.put("trsfCustInfo", customerInfoService.selectCustomerInfoByCondition(customerVO));

            MembershipPointHisSearchVO hisSearchVO = new MembershipPointHisSearchVO();
            hisSearchVO.setsDlrCd(searchVO.getsDlrCd());
            hisSearchVO.setsMembershipNo(searchVO.getsTrsfMembershipNo());
            result.put("pointInfoList", membershipPointHisService.selectPointInfosCondition(hisSearchVO));

        }

        //3.양수자 Membership 정보
        member.setsMembershipNo(searchVO.getsReceiveMembershipNo());
        MembershipVO receiveVO = membershipService.selectMembershipInfoByKey(member);
        result.put("receiveMember", receiveVO);
        //4.양수자 기본 고객정보
        if(receiveVO != null){
            customerVO.setsCustNo(receiveVO.getCustNo());
            result.put("receiveCustInfo", customerInfoService.selectCustomerInfoByCondition(customerVO));
        }

        return result;
    }

    /**
     * 멤버십 양도에서 양도신청 포인트 정보를 수정한다.
     * @param MembershipTransMngVO - 멤버십 양도 정보수정을 포함하는 MembershipTransMngVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTransMng/updateMembershipTransPointVal.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateMembershipTransPointVal(@Validated @RequestBody MembershipTransVO transVO) throws Exception {

        /*
         * [TODO] 포인트 정보 수정시 결재가 완료되거나 진행중인 건은 수정할 수 없다.
         */

        membershipTransService.updateMembershipTransPointVal(transVO);
        return true;
    }

    /**
     * 실제 결재선 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTransMng/selectSignLineExs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSignLineExs(@RequestBody SignLineSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<SignLineVO> signLines = signService.selectSignLinesByCondition(searchVO);

        result.setTotal(signLines.size());
        result.setData(signLines);

        return result;
    }

    /**
     * 심사 및 반려
     * @return
     * @throws Exception
     *
     */
    @RequestMapping(value = "/crm/dmm/membershipTransMng/updateSignLineEx.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSignLineEx(@Validated @RequestBody SignLineVO signLineVO, Model model) throws Exception {
        signService.updateSignLine(signLineVO);

        //[TODO] 최종결정권(승인권)자가 결재할때 승인하였을 경우 양도정보를 등록하는 프로시저 호출을 태운다.
        if(signLineVO.getSignStatCd().equals("03") && signLineVO.getSignRsltCd().equals("04") && signLineVO.getLastSignYn().equals("Y") ){
            MembershipTransVO membershipTransVO = new MembershipTransVO();
            membershipTransVO.setSignDocNo(signLineVO.getSignDocNo());
            membershipTransService.insertTransPointProcedure(membershipTransVO);
        }
        return true;
    }
}
