package chn.bhmc.dms.crm.cso.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCalendarVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;

/**
 * 시승캘린더 컨트롤러
 *
 * @author in moon lee
 * @since 2016.05.09.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.09         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/testDrive")
@Controller
public class TestDriveCalendarController extends HController {

    /**
     * 시승 예약 관리 서비스
     */
    @Resource(name="testDriveMgmtService")
    TestDriveMgmtService testDriveMgmtService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 시승 차량 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;



    /**
     * 시승캘린더 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveCalendarMain.do", method = RequestMethod.GET)
    public String selectTestDriveCalendarMain(Model model) throws Exception {

        UserSearchVO userSearchVO = new UserSearchVO();
        List<UserVO> users = userService.selectUsersByCondition(userSearchVO);
        model.addAttribute("users", users);

        // TODO 시승모델 검색조건. 차량마스터에서 가져와야 하나.. 아니면 시승 차량 에서 가져와야하나..?
        TestDriveCarSearchVO searchVO = new TestDriveCarSearchVO();
        List<TestDriveCarVO> carIdList = testDriveCarService.selectTestDriveCarsByCondition(searchVO);
        model.addAttribute("carIdList", carIdList);

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);


        return "/crm/cso/testDrive/selectTestDriveCalendarMain";
    }

    /**
     * 시승캘린더 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return
     */
    @RequestMapping(value = "/selectTestDriveCalendars.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveCalendars(@RequestBody TestDriveResvSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 활동 스케줄러에서.. 당월 검색 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(searchVO.getsStartDt() == null ){
            searchVO.setsStartDt(startCal.getTime());
        }

        int year;
        int month;
        int day;

        startCal.setTime(searchVO.getsStartDt());
        year = startCal.get(Calendar.YEAR);
        month = startCal.get(Calendar.MONTH);
        day = 1;

        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsStartDt(startCal.getTime());             // 시작일 설정 (매월 1일)

        startCal.set(year, month+1, day, 00, 00, 00);
        searchVO.setsEndDt(startCal.getTime());               // 종료일 설정 (시작월 + 1달)
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        searchVO.setsTdrvStat("N");     // 예약/시승 인것만
        result.setTotal(testDriveMgmtService.selectTestDriveCalendarsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<TestDriveCalendarVO> selectTestDriveResvsByCondition = testDriveMgmtService.selectTestDriveCalendarsByCondition(searchVO);
            result.setData(selectTestDriveResvsByCondition);
        }

        return result;

    }

}