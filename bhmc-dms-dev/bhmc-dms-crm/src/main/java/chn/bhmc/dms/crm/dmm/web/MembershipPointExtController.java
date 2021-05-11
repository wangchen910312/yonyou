package chn.bhmc.dms.crm.dmm.web;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipPointExtService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;

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
     * 멤버십 포인트 이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 포인트 소멸관리(소멸예정화면 + 소멸이력화면) 메인화면을 출력한다.
     * 소멸 예정과  소멸 이력 화면은 따로 있었는데 하나도 합침
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExt/selectMembershipPointExtMngMain.do", method = RequestMethod.GET)
    public String selectMembershipPointExtMngMain(Model model) throws Exception {

        // 시작일 - 종료일 설정
        Calendar startCal = Calendar.getInstance();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        int year = startCal.get(Calendar.YEAR);
        int month = startCal.get(Calendar.MONTH);
        int day = startCal.get(Calendar.DATE);
        int lastDay = startCal.getActualMaximum(Calendar.DAY_OF_MONTH);

        startCal.set(year, month, day);
        String sStartDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sStartDt", sStartDt);

        startCal.set(year, month, lastDay);
        String sEndDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sEndDt", sEndDt);

        // 포인트 소멸 예정일 이전날짜 검색 못하게끔 처리
        model.addAttribute("year", year);
        model.addAttribute("month", month);
        model.addAttribute("day", day);
        model.addAttribute("lastDay", lastDay);

        return "/crm/dmm/membershipPointExt/selectMembershipPointExtMngMain";
    }

    /**
     * 포인트 소멸예정 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExt/selectMembershipPointExts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointExts(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsExtcDt() != null || searchVO.getsExtcEndDt() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsExtcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsExtcDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsExtcEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsExtcEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        SearchResult result = new SearchResult();

        result.setTotal(membershipPointHisService.selectMembershipPointExtsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipPointHisService.selectMembershipPointExtsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 포인트 소멸예정 대상고객수, 현시점 포인트, 소멸예상 포인트 수를 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExt/selectMembershipPointExtTotalCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> selectMembershipPointExtTotalCnt(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsExtcDt() != null || searchVO.getsExtcDt() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsExtcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsExtcDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsExtcEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsExtcEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("totalScore", membershipPointHisService.selectMembershipPointExtTotalCnt(searchVO));

        return result;
    }


    /**
     * 포인트 소멸예정 엑셀Export 수량 데이터를 조회한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExt/selectMembershipPointExtsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectMembershipPointExtsExcelExportCnt(@RequestBody MembershipPointHisSearchVO searchVO) throws Exception {

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsExtcDt() != null || searchVO.getsExtcEndDt() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsExtcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsExtcDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsExtcEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsExtcEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        return membershipPointHisService.selectMembershipPointExtsByConditionCnt(searchVO);
    }

}