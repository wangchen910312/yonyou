package chn.bhmc.dms.crm.cso.web;

import java.util.List;

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

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.service.TestDriveClineService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;

/**
 * 시승 예약 관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/testDrive")
@Controller
public class TestDriveResvController extends HController {

    /**
     * 시승 예약 관리 서비스
     */
    @Resource(name="testDriveMgmtService")
    TestDriveMgmtService testDriveMgmtService;

    /**
     * 시승 차량 관리 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;

    /**
     * 시승 노선 관리 서비스
     */
    @Resource(name="testDriveClineService")
    TestDriveClineService testDriveClineService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 시승 예약 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveResvMain.do", method = RequestMethod.GET)
    public String selectTestDriveResvMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("sysDate", sysDate);
        model.addAttribute("saleOpptStepCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM211", null, langCd));      // 판매기회단계
        model.addAttribute("tdrvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM404", null, langCd));          // 시승 상태

        return "/crm/cso/testDrive/selectTestDriveResvMain";
    }

    /**
     * 시승 예약 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return
     */
    @RequestMapping(value = "/selectTestDriveResvs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveResvs(@RequestBody TestDriveResvSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 스케줄러에서.. 당일 검색 )
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
        day = startCal.get(Calendar.DATE);

        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsStartDt(startCal.getTime());             // 시작일 설정

        startCal.set(year, month, day+1, 00, 00, 00);
        searchVO.setsEndDt(startCal.getTime());               // 종료일 설정( 시작일 + 1일 )
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/


        result.setTotal(testDriveMgmtService.selectTestDriveResvsByConditionCnt(searchVO));

        if(result.getTotal() != 0){

            List<TestDriveResvVO> selectTestDriveResvsByCondition = testDriveMgmtService.selectTestDriveResvsByCondition(searchVO);

            /*
            // 고객명은 로그인한 SC 고객일경우에만 보인다.
            for (TestDriveResvVO testDriveResvVO : selectTestDriveResvsByCondition) {
                if(!LoginUtil.getUserId().equals(testDriveResvVO.getScId())){
                    testDriveResvVO.setCustNm("***");
                }
            }
             */

            result.setData(selectTestDriveResvsByCondition);
        }

        return result;

    }


    /**
     * 시승 차량 목록 데이터를 조회한다.
     * @param carId
     * @return
     */
    @RequestMapping(value = "/selectTestDriveResvCars.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveResvCars(@RequestBody TestDriveCarSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsUseYn("Y");        // 시승 예약에 뿌려지는 데이터는 사용가능한것만.

        result.setTotal(testDriveCarService.selectTestDriveCarsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(testDriveCarService.selectTestDriveCarsByCondition(searchVO));
        }

        return result;

    }


    /**
     * 시승 예약 상세조회
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/selectTestDriveResvByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public TestDriveResvVO selectTestDriveResvByKey(@RequestBody TestDriveResvSearchVO searchVO)throws Exception {
        return testDriveMgmtService.selectTestDriveMgmtByKey(searchVO);

    }

    /**
     * 시승 예약 정보를 저장 한다.
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiTestDriveResvs.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertTestDriveResvs(@Validated(Draft.class) @RequestBody TestDriveResvVO testDriveResvVO)throws Exception {

        return testDriveMgmtService.multiTestDriveResvs(testDriveResvVO);

    }


    /**
     * 시승 예약 중복을 확인한다.
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/selectTdrvResvByKeyCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public Boolean selectTdrvResvByKeyCnt(@RequestBody TestDriveResvVO testDriveResvVO)throws Exception {

        if(testDriveMgmtService.selectTdrvResvByKeyCnt(testDriveResvVO) > 0){
            return false;
        }else{
            return true;
        }

    }


    /**
     * 시승 예약 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveResvPopup.do", method = RequestMethod.GET)
    public String selectTestDriveResvPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        TestDriveClineSearchVO searchVO = new TestDriveClineSearchVO();
        searchVO.setsUseYn("Y");
        List<TestDriveClineVO> tdrvClineCdList = testDriveClineService.selectTestDriveClinesByCondition(searchVO);
        model.addAttribute("tdrvClineCdList", tdrvClineCdList);                                               // 시승노선

        model.addAttribute("tdrvHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM401", null, langCd));          // 시승 시간
        model.addAttribute("tdrvPathCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM402", null, langCd));        // 시승 출처
        model.addAttribute("tdrvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM403", null, langCd));          // 시승 타입

        return "/crm/cso/testDrive/selectTestDriveResvPopup";
    }

    /**
     * 시승 예약 정보를 취소 한다.
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cancelTestDriveResv.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelTestDriveResvs(@RequestBody TestDriveResvVO testDriveResvVO)throws Exception {


        // 예약 취소시 상태값 변경
        testDriveResvVO.setTdrvStatCd("02");
        testDriveResvVO.setUpdtUsrId(LoginUtil.getUserId());

        return testDriveMgmtService.cancelTestDriveResv(testDriveResvVO);

    }
}