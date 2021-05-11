package chn.bhmc.dms.crm.dmm.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipTransService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipTransVO;

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
     * 멤버십 양도/양수 서비스
     */
    @Resource(name="membershipTransService")
    MembershipTransService membershipTransService;

    /**
     * 멤버십 양도/양수 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 멤버십 포인트 이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 멤버십 양도/양수신청 등록 메인페이지로 이동한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipTrans/selectMembershipTransMain.do", method = RequestMethod.GET)
    public String selectMembershipTransMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //신분증유형
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        //양도사유
        model.addAttribute("trsfReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM804", null, langCd));
        //양도-양수관계
        model.addAttribute("trsfReceiveRelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM805", null, langCd));
        //등급코드
        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));

        return "/crm/dmm/membershipTrans/selectMembershipTransMain";
    }

    /**
     * 멤버십 신청을 신규로 생성한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/cmm/membershipTrans/insertMembershipTrans.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertMembershipTrans(@RequestBody MembershipTransVO membershipTransVO) throws Exception {

        membershipTransVO.setRegUsrId(LoginUtil.getUserId());
        membershipTransVO.setDlrCd(LoginUtil.getDlrCd());
        int count = 0;

        //[TODO] 결재 process를 태운다.
        // 1. 고객기준 등록시
        count = membershipTransService.insertMembershipTrans(membershipTransVO);

        return count;
    }

    /**
     * 양도자의 양도 포인트 정보를 조회한다.
     *
     * @param MembershipVO - 멤버십 VO
     * @return MembershipVO
     */
    @RequestMapping(value = "/crm/cmm/membershipTrans/selectPointInfosCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> selectPointInfosCondition(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        //딜러코드는 필수, 고객번호, 멤버십 번호 택1
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("pointInfoList", membershipPointHisService.selectPointInfosCondition(searchVO));

        return result;
    }

}
