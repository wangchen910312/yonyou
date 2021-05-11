package chn.bhmc.dms.crm.dmm.web;

import java.util.Calendar;
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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipPointExtService;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointExtSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointExtController.java
 * @Description : 포인트 소멸 컨트롤러.
 * @author Kim Hyun Ho
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class MembershipPointExtController extends HController {
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 포인트 소멸 서비스
     */
    @Resource(name="membershipPointExtService")
    MembershipPointExtService membershipPointExtService;

    /**
     * 포인트 소멸예정 메인화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExt/selectMembershipPointExtMain.do", method = RequestMethod.GET)
    public String selectMembershipPointExtMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));
        //카드형태
        model.addAttribute("cardFormCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM082", null, langCd));

        return "/crm/dmm/membershipPointExt/selectMembershipPointExtMain";
    }

    /**
     * 포인트 소멸예정 대상고객수, 현시점 포인트, 소멸예상 포인트 수를 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExt/selectMembershipPointExtTotalScore.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> selectMembershipPointExtTotalScore(@RequestBody MembershipPointExtSearchVO searchVO) throws Exception {
        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsPointExtcExpcDt() != null || searchVO.getsPointExtcExpcDt() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsPointExtcExpcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsPointExtcExpcDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("totalScore", membershipPointExtService.selectMembershipPointExtTotalScore(searchVO));

        return result;
    }

    /**
     * 포인트 소멸예정 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExt/selectMembershipPointExts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointExts(@RequestBody MembershipPointExtSearchVO searchVO) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsPointExtcExpcDt() != null || searchVO.getsPointExtcExpcDt() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsPointExtcExpcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsPointExtcExpcDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        SearchResult result = new SearchResult();

        result.setTotal(membershipPointExtService.selectMembershipPointExtsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipPointExtService.selectMembershipPointExtsByCondition(searchVO));
        }

        return result;
    }
}
