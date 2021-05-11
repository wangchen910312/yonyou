package chn.bhmc.dms.crm.dmm.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.SpecialPointService;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.crm.dmm.vo.SpecialPointSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialPointController.java
 * @Description : 멤버십 특별포인트 컨트롤러.
 * @author Lee In Moon
 * @since 2016.09.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.05.     Lee In Moon     최초 생성
 * </pre>
 */

@Controller
public class SpecialPointController extends HController{

    /**
     * 특별포인트 서비스
     */
    @Resource(name="specialPointService")
    SpecialPointService specialPointService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 20160905 / 이인문
     * 특별포인트  목록을 조회한다.
     * @param SpecialPointSearchVO - 딜러코드, 멤버쉽번호
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membership/selectMembershipSpecialPoints.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipSpecialPoints(@RequestBody SpecialPointSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(specialPointService.selectSpecialPointsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(specialPointService.selectSpecialPointsByCondition(searchVO));
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
        model.addAttribute("specialPointTp",  request.getParameter("specialPointTp"));

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
        int result = specialPointService.insertSpecialPoint(membershipVO);
        return true;
    }


}
