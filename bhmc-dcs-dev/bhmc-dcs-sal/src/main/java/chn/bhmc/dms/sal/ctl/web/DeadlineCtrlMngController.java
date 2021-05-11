package chn.bhmc.dms.sal.ctl.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSaveVO;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;

/**
 * 마감시간관리 컨트롤러
 *
 * @author Kim yewon
 * @since 2016. 4. 28.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                           수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.28            Kim yewon          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/ctl/ddlCtrl")
public class DeadlineCtrlMngController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 마감시간관리 관리 서비스
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;


    /**
     * 마감시간관리  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDeadlineCtrlMngMain.do", method = RequestMethod.GET)
    public String selectDeadlineCtrlMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String toDay = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("toDay", toDay);

        //통제그룹 공통코드 목록
        model.addAttribute("ctrlGrpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL034", null, langCd));

        //통제대상 공통코드 목록
        model.addAttribute("ctrlTargCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL035", null, langCd));

        //통제범위 공통코드 목록
        model.addAttribute("dlrCtrlRangeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL036", null, langCd));

        //통제여부 공통코드 목록
        model.addAttribute("ctrlYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL037", null, langCd));


        return "/sal/ctl/ddlCtrl/selectDeadlineCtrlMngMain";
    }



    /**
     * 마감시간통제 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/selectDeadlineCtrlMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeadlineCtrlMng(@RequestBody DeadlineCtrlMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = deadlineCtrlMngService.selectDeadlineCtrlMngByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(deadlineCtrlMngService.selectDeadlineCtrlMngByCondition(searchVO));
        }

        return result;

    }




    /**
     * 마감대상 딜러정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/selectTargetDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDealer(@RequestBody DeadlineCtrlMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = deadlineCtrlMngService.selectTargetDealerByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(deadlineCtrlMngService.selectTargetDealerByCondition(searchVO));
        }

        return result;

    }


    /**
     * 마감시간통제 정보를 등록한다.
     * @param saveVO - 마감시간통제 등록/수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiDeadlineCtrlMng.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiDeadlineCtrlMng(@Validated @RequestBody DeadlineCtrlMngSaveVO saveVO) throws Exception {

        deadlineCtrlMngService.multiDeadlineCtrlMng(saveVO);

        return true;

    }




    /**
     * 마감대상딜러 정보를 등록한다.
     * @param saveVO - 마감대상딜러 등록/수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiTargetDealer.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiTargetDealer(@Validated @RequestBody DeadlineCtrlMngSaveVO saveVO) throws Exception {

        deadlineCtrlMngService.multiTargetDealer(saveVO);

        return true;

    }


}
