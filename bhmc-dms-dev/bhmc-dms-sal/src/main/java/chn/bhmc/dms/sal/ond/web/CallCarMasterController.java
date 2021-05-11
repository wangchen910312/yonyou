package chn.bhmc.dms.sal.ond.web;

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

import chn.bhmc.dms.sal.ond.vo.GradeSearchVO;

import chn.bhmc.dms.sal.ond.vo.CallCarMasterSaveVO;

import chn.bhmc.dms.sal.ond.service.CallCarMasterService;
import chn.bhmc.dms.sal.ond.vo.CallCarMasterSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 *
 *
 * @author
 * @since
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *
 * </pre>
 */

@Controller
public class CallCarMasterController extends HController {


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="callCarMasterService")
    CallCarMasterService callCarMasterService;


    /**
     * 대교차 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/ond/callCarMaster/selectCallCarMasterMain.do", method = RequestMethod.GET)
    public String selectCallCarMasterMain(Model model) throws Exception{
        // 차종조회
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        return "/sal/ond/callCarMaster/selectCallCarMasterMain";
    }

    /**
     * 대교차 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CallCarMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/ond/callCarMaster/selectCallCarMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCallCarMaster(@RequestBody CallCarMasterSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();

        result.setTotal(callCarMasterService.selectCallCarMasterByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(callCarMasterService.selectCallCarMasterByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/sal/ond/callCarMaster/multiCallCarMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCallCarMaster(@Validated @RequestBody CallCarMasterSaveVO saveVO) throws Exception {

        callCarMasterService.multiCallCarMaster(saveVO);
        return true;

    }

    @RequestMapping(value = "/sal/ond/callCarMaster/selectGrade.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGrade(@RequestBody GradeSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(callCarMasterService.selectGradeByCondition(searchVO));

        return result;
    }



}
