package chn.bhmc.dms.crm.dmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgController.java
 * @Description : 멤버십 등급변경 컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Controller
public class MembershipGradeChgController extends HController {
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 등급변경 서비스
     */
    @Resource(name="membershipGradeChgService")
    MembershipGradeChgService membershipGradeChgService;

    /**
     * 멤버십 등급관리 서비스
     */
    @Resource(name="membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipGradeHisService")
    MembershipGradeHisService membershipGradeHisService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 멤버십 등급설정 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeChg/selectMembershipGradeChgMain.do", method = RequestMethod.GET)
    public String selectMembershipGradeChgMain(Model model) throws Exception {

        //등급코드
        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));


        // 시작일 - 종료일 설정
        Calendar startCal = Calendar.getInstance();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        int year = startCal.get(Calendar.YEAR);
        int month = startCal.get(Calendar.MONTH);
        int lastDay = startCal.getActualMaximum(Calendar.DAY_OF_MONTH);

        startCal.set(year, month, 1);
        String sStartDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sStartDt", sStartDt);

        startCal.set(year, month, lastDay);
        String sEndDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sEndDt", sEndDt);


        return "/crm/dmm/membershipGradeChg/selectMembershipGradeChgMain";
    }

    /**
     * 멤버십 등급 변경 이력 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipGradeChg/selectMembershipGradeChgHis.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipGradeChgHis(@RequestBody MembershipGradeHisSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipGradeHisService.selectMembershipGradeChgHissByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipGradeHisService.selectMembershipGradeChgHissByCondition(searchVO));
        }

        return result;
    }

}