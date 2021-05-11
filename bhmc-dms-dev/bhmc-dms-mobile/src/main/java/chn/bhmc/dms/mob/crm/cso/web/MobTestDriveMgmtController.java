package chn.bhmc.dms.mob.crm.cso.web;

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

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.service.TestDriveClineService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

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

@RequestMapping("/mob/crm/cso/testDrive")
@Controller
public class MobTestDriveMgmtController extends HController {
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
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

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
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        //VIEW-D-10284 : 화면 : CRM>판매기회관리>시승관리
        List<UserVO> users = crmCommonService.selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10284", null, Constants.PERMISSION_SEARCHALL, null);
        model.addAttribute("users", users);

        // TODO 시승모델 검색조건. 차량마스터에서 가져와야 하나.. 아니면 시승 차량 에서 가져와야하나..?
        TestDriveCarSearchVO searchVO = new TestDriveCarSearchVO();
        List<TestDriveCarVO> carIdList = testDriveCarService.selectTestDriveCarsByCondition(searchVO);
        model.addAttribute("carIdList", carIdList);

        model.addAttribute("tdrvHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM401", null, langCd));        // 시승 시간
        model.addAttribute("custStsfCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM406", null, langCd));      // 고객만족도
        model.addAttribute("saleFcstCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));      // 판매전망
        model.addAttribute("custStsfStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM410", null, langCd));  // 상태

        model.addAttribute("toDt", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("sevenDtBf", DateUtil.getDate("yyyy-MM-dd", Calendar.MONTH, -1));

        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/testDriveMgmt/baseJsp/selectTestDriveMgmtMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 시승 관리 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveMgmtsList.do", method = RequestMethod.GET)
    public String selectTestDriveMgmtsList(Model model) throws Exception {
        return "/mob/crm/cso/testDriveMgmt/selectTestDriveMgmtList";
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


}