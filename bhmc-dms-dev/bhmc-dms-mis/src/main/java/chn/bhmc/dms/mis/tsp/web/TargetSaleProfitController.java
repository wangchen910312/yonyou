package chn.bhmc.dms.mis.tsp.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mis.tsp.service.TargetSaleProfitService;
import chn.bhmc.dms.mis.tsp.vo.TargetSaleProfitSaveVO;
import chn.bhmc.dms.mis.tsp.vo.TargetSaleProfitVO;

/**
 * <pre>
 * [딜러사] 판매이익
 * </pre>
 *
 * @ClassName   : TargetSaleProfitController.java
 * @Description : [딜러사] 판매이익
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetSaleProfitController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * [딜러사] 판매이익 서비스
     */
    @Resource(name="targetSaleProfitService")
    TargetSaleProfitService targetSaleProfitService;

    /**
     * [딜러사] 판매이익  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tsp/selectTargetSaleProfitMain.do", method = RequestMethod.GET)
    public String selectTargetSaleProfitMain(Model model) throws Exception {
        //model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        return "/mis/tsp/selectTargetSaleProfitMain";
    }

    /**
     * [제조사] 년간 목표 등록  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tsp/selectTargetSaleProfitSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetSaleProfitSearch(@RequestBody TargetSaleProfitVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetSaleProfitService.selectTargetSaleProfitByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetSaleProfitService.selectTargetSaleProfitByCondition(searchVO));
        }

        return result;

    }

    /**
     * [제조사] 년간 목표 등록  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tsp/selectCarlineProfitSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCarlineProfitSearch(@RequestBody TargetSaleProfitVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetSaleProfitService.selectCarlineProfitByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetSaleProfitService.selectCarlineProfitByCondition(searchVO));
        } else {
            targetSaleProfitService.insertCarlineProfitByCondition(searchVO);
        }
            result.setData(targetSaleProfitService.selectCarlineProfitByCondition(searchVO));

        return result;

    }

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param saveVO - [제조사] 년간 목표 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tsp/insertCarlineProfitSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertCarlineProfitSave(@Validated @RequestBody TargetSaleProfitSaveVO saveVO) throws Exception {

        targetSaleProfitService.multiCarlineProfitSave(saveVO);
        return true;
    }

    /**
     * [제조사] 년간 목표 등록  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tsp/selectProfitTargetSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectProfitTargetSearch(@RequestBody TargetSaleProfitVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetSaleProfitService.selectProfitTargetSearchByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetSaleProfitService.selectProfitTargetSearchByCondition(searchVO));
        } else {
            targetSaleProfitService.insertProfitTargetByCondition(searchVO);
        }

        result.setData(targetSaleProfitService.selectProfitTargetSearchByCondition(searchVO));
        return result;

    }

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param saveVO - [제조사] 년간 목표 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tsp/insertProfitTargetSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertProfitTargetSave(@Validated @RequestBody TargetSaleProfitSaveVO saveVO) throws Exception {

        targetSaleProfitService.multiProfitTargetSave(saveVO);
        return true;
    }


}
