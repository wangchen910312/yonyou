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

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.crm.cso.service.TestDriveMgmtService;
import chn.bhmc.dms.crm.cso.vo.TestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.service.CrmCommonCodeService;
import chn.bhmc.dms.mob.api.crm.service.CrmSystemConfigInfoService;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveCarService;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveClineService;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.CrmTestDriveResvVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveClineSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveClineVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveResvSearchVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

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
@RestController
@RequestMapping(value = "api/crm/testDriveResv")
@Api("CRM预约试驾相关接口")
public class TestDriveResvApi extends HController {

    /**
     * 시승 예약 관리 서비스
     */
    @Resource(name="CrmTestDriveMgmtService")
    CrmTestDriveMgmtService CrmTestDriveMgmtService;

    @Resource(name="testDriveMgmtService")
    TestDriveMgmtService testDriveMgmtService;
    
    @Resource(name="CrmTestDriveClineService")
    CrmTestDriveClineService CrmTestDriveClineService;
    
    /**
     * 시승 차량 관리 서비스
     */
    @Resource(name="CrmtestDriveCarService")
    CrmTestDriveCarService CrmtestDriveCarService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="CrmcommonCodeService")
    CrmCommonCodeService CrmcommonCodeService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="CrmsystemConfigInfoService")
    CrmSystemConfigInfoService CrmsystemConfigInfoService;


    /**
     * 시승 예약 관리 메인 화면을 출력한다.预约试驾列表数据查询
     * @return
     */
    @ApiOperation("跳转预约试驾走的方法")
    @ResponseBody
    @RequestMapping(value = "/selectTestDriveResvMain.do", method = RequestMethod.GET)
    public BaseJSON selectTestDriveResvMain(Model model) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("sysDate", DateUtil.getDate(CrmsystemConfigInfoService.selectStrValueByKey("dateFormat")));
        model.addAttribute("saleOpptStepCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd));      // 판매기회단계
        model.addAttribute("tdrvStatCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM404", null, langCd));          // 시승 상태

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        baseJSON.setResult(model);
        return baseJSON;
       // return "/crm/cso/testDrive/selectTestDriveResvMain";
    }
    
    @ApiOperation("筛选预约试驾走的方法")
    @ResponseBody
    @RequestMapping(value = "/selectTestDriveResvPopup.do", method = RequestMethod.GET)
    public BaseJSON selectTestDriveResvPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        BaseJSON baseJSON = new BaseJSON();
        TestDriveClineSearchVO searchVO = new TestDriveClineSearchVO();
        searchVO.setsUseYn("Y");
        List<TestDriveClineVO> tdrvClineCdList = CrmTestDriveClineService.selectTestDriveClinesByCondition(searchVO);
        model.addAttribute("tdrvClineCdList", tdrvClineCdList);                                               // 시승노선

        model.addAttribute("tdrvHmCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM401", null, langCd));          // 시승 시간
        model.addAttribute("tdrvPathCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM402", null, langCd));        // 시승 출처
        model.addAttribute("tdrvTpCdList", CrmcommonCodeService.selectCommonCodesByCmmGrpCd("CRM403", null, langCd));          // 시승 타입
        baseJSON.setResult(model);
        return baseJSON;
        //return "/crm/cso/testDrive/selectTestDriveResvPopup";
    }

    /**
     * 시승 예약 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TestDriveResvSearchVO
     * @return
     */
    @ApiOperation("预约试驾列表数据查询")
    @ResponseBody
    @RequestMapping(value = "/selectTestDriveResvs.do", method = RequestMethod.POST)
    public BaseJSON selectTestDriveResvs(@RequestBody TestDriveResvSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        SearchResult result = new SearchResult();
//        Calendar startCal = Calendar.getInstance();
//        if(searchVO.getsStartDt() == null ){
//            searchVO.setsStartDt(startCal.getTime());
//        }
//        int year;
//        int month;
//        int day;
//        startCal.setTime(searchVO.getsStartDt());
//        year = startCal.get(Calendar.YEAR);
//        month = startCal.get(Calendar.MONTH);
//        day = startCal.get(Calendar.DATE);
//        startCal.set(year, month, day, 00, 00, 00);
//        searchVO.setsStartDt(startCal.getTime());             // 시작일 설정
//        startCal.set(year, month, day+1, 00, 00, 00);
//        searchVO.setsEndDt(startCal.getTime());               // 종료일 설정( 시작일 + 1일 )
        result.setTotal(CrmTestDriveMgmtService.selectTestDriveResvsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            List<CrmTestDriveResvVO> selectTestDriveResvsByCondition = CrmTestDriveMgmtService.selectTestDriveResvsByCondition(searchVO);
            result.setData(selectTestDriveResvsByCondition);
            baseJSON.setResult(result);
        }

        return baseJSON;

    }


    /**
     * 시승 차량 목록 데이터를 조회한다.
     * @param carId
     * @return
     */
    @ApiOperation("预约试驾试乘车型数据查询")
    @RequestMapping(value = "/selectTestDriveResvCars.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectTestDriveResvCars(@RequestBody TestDriveCarSearchVO searchVO) throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        SearchResult result = new SearchResult();

        searchVO.setsUseYn("Y");        // 시승 예약에 뿌려지는 데이터는 사용가능한것만.

        result.setTotal(CrmtestDriveCarService.selectTestDriveCarsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(CrmtestDriveCarService.selectTestDriveCarsByCondition(searchVO));
            baseJSON.setResult(result);
        }

        return baseJSON;

    }

    /**
     * 최근 시승 날짜 조회
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @ApiOperation("预约试驾选择客户之后把客户信息转化成保存所需要的信息")
    @RequestMapping(value = "/selectTestDriveLastTimeDrivByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectTestDriveLastTimeDrivByKey(@RequestBody TestDriveResvSearchVO searchVO)throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
        TestDriveResvVO testDriveResvVO = new TestDriveResvVO();
        testDriveResvVO = CrmTestDriveMgmtService.selectTestDriveLastTimeDrivByKey(searchVO);
        if ( testDriveResvVO == null) {
        	testDriveResvVO = new TestDriveResvVO();
        }
        
        baseJSON.setResult(testDriveResvVO);
        return baseJSON;
    }

    /**
     * 시승 예약 정보를 저장 한다.
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiTestDriveResvs.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("预约试驾详情和新增页面的保存按钮走的方法")
    public BaseJSON insertTestDriveResvs(@Validated(Draft.class) @RequestBody TestDriveResvVO testDriveResvVO)throws Exception {
    	BaseJSON baseJSON = new BaseJSON();
    	int result = testDriveMgmtService.multiTestDriveResvs(testDriveResvVO);
    	if(result <= 0) {
    		baseJSON.setResultCode(1);
    		baseJSON.setResultMsg("操作失败");
    	}
        return baseJSON;

    }

    /**
     * 시승 예약 정보를 취소 한다.
     * @param testDriveResvVO - 시승 예약 정보
     * @param bindingResult
     * @return
     */
    @ApiOperation("预约试驾新增页面的取消按钮")
    @RequestMapping(value = "/cancelTestDriveResv.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON cancelTestDriveResvs(@RequestBody TestDriveResvVO testDriveResvVO)throws Exception {

    	BaseJSON baseJSON = new BaseJSON();
        testDriveResvVO.setTdrvStatCd("02");
        testDriveResvVO.setUpdtUsrId(LoginUtil.getUserId());
        int result = testDriveMgmtService.cancelTestDriveResv(testDriveResvVO);
        if(result <= 0) {
        	baseJSON.setResultCode(1);
        	baseJSON.setResultMsg("操作失败");
        }
        return baseJSON;

    }
}