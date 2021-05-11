package chn.bhmc.dms.bat.mgr.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.web.HController;

import org.quartz.JobKey;
import org.quartz.SchedulerException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.mgr.service.BatchOperService;
import chn.bhmc.dms.bat.mgr.service.BatchResultService;
import chn.bhmc.dms.bat.mgr.service.BatchScheduleService;
import chn.bhmc.dms.bat.mgr.service.BatchScheduler;
import chn.bhmc.dms.bat.mgr.vo.BatchOperSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchOperSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchResultSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSaveVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 배치 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class BatchController extends HController {

	/**
	 * 배치작업 관리 서비스
	 */
	@Resource(name="batchOperService")
	BatchOperService batchOperService;

	/**
     * 배치스케쥴 관리 서비스
     */
    @Resource(name="batchScheduleService")
    BatchScheduleService batchScheduleService;

    /**
     * 배치결과 관리 서비스
     */
    @Resource(name="batchResultService")
    BatchResultService batchResultService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 배치 스케쥴러
     */
    @Resource(name="batchScheduler")
    BatchScheduler batchScheduler;

	/**
	 * 타임존 관리 서비스
	 */
//	@Autowired
//	TimeZoneService timeZoneService;



	/**
	 * 배치작업 정보 메인 화면을 출력한다.
	 * @return
	 */
	@RequestMapping(value = "/bat/mgr/batchOper/selectBatchOperMain.do", method = RequestMethod.GET)
	public String selectBatchOperMain(Model model) throws Exception {

//		TimeZoneSearchVO timeZoneSearch = new TimeZoneSearchVO();
//		timeZoneSearch.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
//		timeZoneSearch.setsUseYn("Y");
//		timeZoneSearch.setFirstIndex(-1);
//		timeZoneSearch.setLastIndex(-1);
//
//		List<TimeZoneVO> timeZoneList = (List<TimeZoneVO>)timeZoneService.select(timeZoneSearch);
//
//		model.addAttribute("timeZoneList", timeZoneList);

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	    //배치유형
	    List<CommonCodeVO> batTpList = commonCodeService.selectCommonCodesByCmmGrpCd("COM002", null, langCd);

	    //배치수행상태
	    List<CommonCodeVO> batOperRsltCdList = commonCodeService.selectCommonCodesByCmmGrpCd("COM003", null, langCd);

	    model.addAttribute("batTpList", batTpList);
	    model.addAttribute("batOperRsltCdList", batOperRsltCdList);

		return "/bat/mgr/batchOper/selectBatchOperMain";
	}

	/**
	 * 배치작업 리스트
	 * @return
	 */
	@RequestMapping(value = "/bat/mgr/batchOper/selectBatchOpers.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectBatchOpers(@RequestBody BatchOperSearchVO searchVO) throws Exception {
		SearchResult result = new SearchResult();

		result.setTotal(batchOperService.selectBatchOpersByConditionCnt(searchVO));
		if(result.getTotal() != 0){
			result.setData(batchOperService.selectBatchOpersByCondition(searchVO));
		}

		return result;
	}

	/**
     * 신규 배치작업ID를 반환한다.
     * @return
     */
    @RequestMapping(value = "/bat/mgr/batchOper/selectNextBatchOperId.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> selectNextBatchOperId() throws Exception {
        Map<String, String> result = new HashMap<String, String>();
        result.put("batOperId", batchOperService.selectNextBatchOperId());

        return result;
    }

	/**
	 *  배치작업 정보를 저장,수정,삭제 한다.
	 * @return
	 */
	@RequestMapping(value = "/bat/mgr/batchOper/multiBatchOpers.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean multiBatchOpers(@Validated @RequestBody BatchOperSaveVO saveVO) throws Exception {
	    batchOperService.multiBatchOpers(saveVO);
        return true;
	}

    /**
     * 배치스케쥴 리스트
     * @return
     */
    @RequestMapping(value = "/bat/mgr/batchSchedule/selectBatchSchedules.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBatchSchedules(@RequestBody BatchScheduleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(batchScheduleService.selectBatchSchedulesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(batchScheduleService.selectBatchSchedulesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 신규 배치스케쥴ID를 반환한다.
     * @return
     */
    @RequestMapping(value = "/bat/mgr/batchSchedule/selectNextBatchScheduleId.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> selectNextBatchScheduleId() throws Exception {
        Map<String, String> result = new HashMap<String, String>();
        result.put("batScheduleId", batchScheduleService.selectNextBatchScheduleId());

        return result;
    }

    /**
     *  배치스케쥴 정보를 저장,수정,삭제 한다.
     * @return
     */
    @RequestMapping(value = "/bat/mgr/batchSchedule/multiBatchSchedules.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBatchSchedules(@Validated @RequestBody BatchScheduleSaveVO saveVO) throws Exception {
        batchScheduleService.multiBatchSchedules(saveVO);
        return true;
    }

    /**
     *  배치를 즉시 실행한다.
     * @return
     */
    @RequestMapping(value = "/bat/mgr/batchSchedule/updateExecuteImmediatelyBatchSchedule.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateExecuteImmediatelyBatchSchedule(@RequestParam("batScheduleId") String batScheduleId) throws Exception {
        try{
            JobKey jobKey = JobKey.jobKey(batScheduleId);
            batchScheduler.getScheduler().triggerJob(jobKey);
        }catch(SchedulerException e){
            log.error(e.getMessage());
            throw new BizException(e.getMessage());
        }

        return true;
    }

    /**
     * 배치결과 목록을 조회한다.
     * @return
     */
    @RequestMapping(value = "/bat/mgr/batchResult/selectBatchResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBatchResults(@RequestBody BatchResultSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(batchResultService.selectBatchResultsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(batchResultService.selectBatchResultsByCondition(searchVO));
        }

        return result;
    }

    /**
     *  배치결과를 삭제한다.
     * @return
     */
    @RequestMapping(value = "/bat/mgr/batchResult/deleteBatchResults.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteBatchResults(@RequestBody BatchResultSaveVO saveVO) throws Exception {
        batchResultService.multiBatchResults(saveVO);
        return true;
    }
}
