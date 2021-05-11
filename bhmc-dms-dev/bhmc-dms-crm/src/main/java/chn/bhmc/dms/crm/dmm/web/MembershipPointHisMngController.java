package chn.bhmc.dms.crm.dmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisMngService;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointHisMngController.java
 * @Description : 소멸포인트 이력 컨트롤러
 * @author Kim Hyun Ho
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class MembershipPointHisMngController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 포인트 소멸 서비스
     */
    @Resource(name="membershipPointHisMngService")
    MembershipPointHisMngService membershipPointHisMngService;

    /**
     * 포인트 소멸 이력을 출력한다.
     * @return
     */

    @RequestMapping(value = "/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointHisMngs(@RequestBody MembershipPointHisMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )kimhh
         ******************************************/
        if(searchVO.getsStartDt() != null || searchVO.getsEndDt() != null ){

            // 시작일
            startCal.setTime(searchVO.getsStartDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }

        result.setTotal(membershipPointHisMngService.selectMembershipPointHisMngsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipPointHisMngService.selectMembershipPointHisMngsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 포인트 소멸 이력 대상자 정보를 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngUsrs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointHisMngUsrs(@RequestBody MembershipPointHisMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if(searchVO.getsPointExtcDt() != null){

            // 시작일
            startCal.setTime(searchVO.getsPointExtcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsPointExtcDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }

        result.setTotal(membershipPointHisMngService.selectMembershipPointHisMngUsrsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(membershipPointHisMngService.selectMembershipPointHisMngUsrsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 포인트 소멸 이력 엑셀Export 수량 데이터를 조회한다.
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngUsrsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectMembershipPointHisMngUsrsExcelExportCnt(@RequestBody MembershipPointHisMngSearchVO searchVO) throws Exception {

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if(searchVO.getsPointExtcDt() != null){

            // 시작일
            startCal.setTime(searchVO.getsPointExtcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsPointExtcDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }

        return membershipPointHisMngService.selectMembershipPointHisMngUsrsByConditionCnt(searchVO);
    }

}