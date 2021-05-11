package chn.bhmc.dms.dply.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.service.JobScheduleService;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleSaveVO;
import chn.bhmc.dms.dply.cmm.vo.JobScheduleSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JobSchMngController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     Cheolman Man Oh     최초 생성
 * </pre>
 */

@Controller
public class JobSchMngController extends HController {

    /**
     * Job Schedule 관리 서비스
     */
    @Resource(name="jobScheduleService")
    JobScheduleService jobScheduleService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 형상관리 공통업무 관리 서비스
     */
    @Resource(name="dplyCmmService")
    DplyCmmService dplyCmmService;


    /**
     * JobSchedule 등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/jobSchMng/selectJobSchMngMain.do", method = RequestMethod.GET)
    public String selectSpecMngMain(Model model) throws Exception {

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // 스케줄유형코드
        model.addAttribute("scheduleTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM031", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/dply/cmm/jobSchMng/selectJobSchMngMain";
    }

    /**
     * JobSchedule List를 조회한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/jobSchMng/selectJobSchedule.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectJobSchedule(@RequestBody JobScheduleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(jobScheduleService.selectJobScheduleByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(jobScheduleService.selectJobScheduleByCondition(searchVO));
        }

        return result;

    }

    // Job Schedule 신규 등록, 수정
    @RequestMapping(value = "/dply/cmm/jobSchMng/multiJobSchedule.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiSpecMng(@RequestBody JobScheduleSaveVO saveVO) throws Exception {
        return jobScheduleService.multiJobSchedule(saveVO);

    }

    /**
     * JobSchedule List를 조회한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/jobSchMng/selectJobScheduleExecHistByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectJobScheduleExecHistByCondition(@RequestBody JobScheduleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(jobScheduleService.selectJobScheduleExecHistByCondition(searchVO));

        return result;

    }



}
