package chn.bhmc.dms.mob.api.crm.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ibm.icu.util.Calendar;

import able.com.web.HController;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Modify;
import chn.bhmc.dms.crm.cso.service.TestDriveClineService;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.service.CrmCommonCodeService;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveCarService;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveMgmtService;
import chn.bhmc.dms.mob.api.crm.service.CrmViewMappingService;
import chn.bhmc.dms.mob.api.crm.vo.CrmTestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.UserVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;


@RestController
@RequestMapping(value = "api/crm/testDriveMgmt")
@Api("试驾管理相关接口")
public class TestDriveMgmtApi extends HController {
    /**
     * 시승 관리 서비스
     */
    @Resource(name="testDriveMgmtService")
    TestDriveMgmtService testDriveMgmtService;
    
    @Resource(name="CrmTestDriveMgmtService")
    CrmTestDriveMgmtService CrmTestDriveMgmtService;

    /**
     * 시승 차량 서비스
     */
    @Resource(name="CrmtestDriveCarService")
    CrmTestDriveCarService CrmtestDriveCarService;

    /**
     * 시승 노선 관리 서비스
     */
    @Resource(name="testDriveClineService")
    TestDriveClineService testDriveClineService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="CrmcommonCodeService")
    CrmCommonCodeService CrmcommonCodeService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="CrmviewMappingService")
    CrmViewMappingService CrmviewMappingService;

    /**
     * @author sll
     * @descption 试驾管理跳转URL
     * @return
     */
    @RequestMapping(value = "/selectTestDriveMgmtMain.do", method = RequestMethod.GET)
    public BaseJSON selectTestDriveMgmtMain(Model model) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        //VIEW-D-10284 : 화면 : CRM>판매기회관리>시승관리
        List<UserVO> users = CrmviewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10284", LoginUtil.getDlrCd(), Constants.PERMISSION_SEARCHALL);
        model.addAttribute("users", users);

        // TODO 시승모델 검색조건. 차량마스터에서 가져와야 하나.. 아니면 시승 차량 에서 가져와야하나..?
        TestDriveCarSearchVO searchVO = new TestDriveCarSearchVO();
        searchVO.setsUseYn("Y"); 
        List<TestDriveCarVO> carIdList = CrmtestDriveCarService.selectTestDriveCarsByCondition(searchVO);
        model.addAttribute("carIdList", carIdList);

        model.addAttribute("tdrvHmCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM401", null, langCd));        // 시승 시간
        model.addAttribute("custStsfCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM406", null, langCd));      // 고객만족도
        model.addAttribute("saleFcstCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));      // 판매전망
        model.addAttribute("custStsfStatCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM410", null, langCd));  // 상태

        model.addAttribute("toDt", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("sevenDtBf", DateUtil.getDate("yyyy-MM-dd", Calendar.MONTH, -1));

        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/crm/cso/testDriveMgmt/baseJsp/selectTestDriveMgmtMain.jsp");
        baseJSON.setResult(model);
        return baseJSON;
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
     * @author sll
     * #descpirtion 试驾管理查询URL
     * 시승 관리 목록 데이터를 조회한다.
     * @param MgmtId
     * @return
     */
    @RequestMapping(value = "/selectTestDriveMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectTestDriveMgmts(@RequestBody TestDriveResvSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
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
        result.setTotal(CrmTestDriveMgmtService.selectTestDriveResvsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmTestDriveMgmtService.selectTestDriveResvsByCondition(searchVO));
        }
        baseJSON.setResult(result);
        return baseJSON;

    }

    /**
     * @author sll
     * @descrition 试驾日志保存URL
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
     * @author sll
     * @description 试驾管理-条目点击查询URL
     * 시승 예약 상세조회
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/selectTestDriveResvByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectTestDriveResvByKey(@RequestBody TestDriveResvSearchVO searchVO)throws Exception {
    	BaseJSON baseJSON=new BaseJSON();
    	CrmTestDriveResvVO CrmTestDriveResvVO = new CrmTestDriveResvVO();
    	CrmTestDriveResvVO = CrmTestDriveMgmtService.selectTestDriveMgmtByKey(searchVO);
    	baseJSON.setResult(CrmTestDriveResvVO);
    	return baseJSON;

    }


}