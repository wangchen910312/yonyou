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

import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;

/**
 * 시승 관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016.02.11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/testDrive")
@Controller
public class TestDriveMgmtController extends HController {
    /**
     * 시승 관리 서비스
     */
    @Resource(name="testDriveMgmtService")
    TestDriveMgmtService testDriveMgmtService;

    /**
     * 시승 차량 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * Crm 공통 Service
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 시승 예약 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveMgmtMain.do", method = RequestMethod.GET)
    public String selectTestDriveMgmtMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10284", null, Constants.PERMISSION_SEARCHALL, null);
        model.addAttribute("users", users);


        TestDriveCarSearchVO searchVO = new TestDriveCarSearchVO();
        List<TestDriveCarVO> carIdList = testDriveCarService.selectTestDriveCarsByCondition(searchVO);
        model.addAttribute("carIdList", carIdList);

        model.addAttribute("tdrvHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM401", null, langCd));        // 시승 시간
        model.addAttribute("custStsfCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM406", null, langCd));      // 고객만족도
        model.addAttribute("saleFcstCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));      // 판매전망
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        model.addAttribute("custStsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM410", null, langCd));
        model.addAttribute("tdrvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM404", null, langCd));

        return "/crm/cso/testDrive/selectTestDriveMgmtMain";
    }


    /**
     * 시승 예약 상세조회
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/selectTestDriveMgmtByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public TestDriveResvVO selectTestDriveMgmtByKey(@RequestBody TestDriveResvSearchVO searchVO)throws Exception {
        return testDriveMgmtService.selectTestDriveMgmtByKey(searchVO);

    }


    /**
     * 시승 관리 목록 데이터를 조회한다.
     * @param MgmtId
     * @return
     */
    @RequestMapping(value = "/selectTestDriveMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveMgmts(@RequestBody TestDriveResvSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();
        if(searchVO.getsStartDt() != null || searchVO.getsEndDt() != null ){

            int year;
            int month;
            int day;

            if(searchVO.getsStartDt() == searchVO.getsEndDt()){
                // 시작일 = 종료일 동일한경우
                startCal.setTime(searchVO.getsStartDt());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndDt(startCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )
            }else if(searchVO.getsEndDt() != null){
                // 종료일이 있는경우
                Calendar endCal = Calendar.getInstance();
                endCal.setTime(searchVO.getsEndDt());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day+1, 00, 00, 00);
                searchVO.setsEndDt(endCal.getTime());               // 종료일 설정( 종료일 + 1일 )
            }
        }
        /******************************************
         *** 날짜 검색 조건 시작 ***********************
         ******************************************/

        searchVO.setsTdrvStat("Y");
        result.setTotal(testDriveMgmtService.selectTestDriveResvsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(testDriveMgmtService.selectTestDriveResvsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 시승 일지를 저장 한다.
     * @param testDriveResvVO - 시승 일지 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/updateTestDriveMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateTestDriveMgmt(@Validated(Modify.class) @RequestBody TestDriveResvVO testDriveResvVO)throws Exception {
        return testDriveMgmtService.updateTestDriveMgmt(testDriveResvVO);
    }

}