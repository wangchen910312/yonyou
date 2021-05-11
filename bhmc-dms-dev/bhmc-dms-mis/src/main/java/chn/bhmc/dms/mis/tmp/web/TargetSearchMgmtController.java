package chn.bhmc.dms.mis.tmp.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mis.tmp.service.TargetSearchMgmtService;
import chn.bhmc.dms.mis.tmp.vo.TargetSearchMgmtVO;
/**
 * <pre>
 * [제조사] 년월간 목표 조회
 * </pre>
 *
 * @ClassName   : TargetSearchMgmtController.java
 * @Description : [제조사] 년월간 목표 조회
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
public class TargetSearchMgmtController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * [제조사] 년월간 목표 조회
     */
    @Resource(name="targetSearchMgmtService")
    TargetSearchMgmtService targetSearchMgmtService;

    /**
     * [제조사] 년월간 목표 조회  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetSearchMgmtMain.do", method = RequestMethod.GET)
    public String selectTargetSearchMgmtMain(Model model, TargetSearchMgmtVO searchVO) throws Exception {

        List<TargetSearchMgmtVO> sdptList = targetSearchMgmtService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<TargetSearchMgmtVO> officeList = targetSearchMgmtService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<TargetSearchMgmtVO> dealerList = targetSearchMgmtService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);


        return "/mis/tmp/selectTargetSearchMgmtMain";
    }

    /**
     * [제조사] 년간 목표 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetSearchMgmtVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetSearchMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetSearchMgmt(@RequestBody TargetSearchMgmtVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetSearchMgmtService.selectTargetSearchMgmtByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetSearchMgmtService.selectTargetSearchMgmtByCondition(searchVO));
        }

        return result;

    }

    /**
     * [제조사] 월간 목표 등록 사업부에 따른 사무소 조회
     */
    @RequestMapping(value = "/mis/tmp/selectTargetSearchMgmtOfficeCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetSearchMgmtOfficeCd(@RequestBody TargetSearchMgmtVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsSdptCd(searchVO.getsSdptCd());

        result.setTotal(targetSearchMgmtService.selectOfficeListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetSearchMgmtService.selectMonthOfficeList(searchVO));
        }

        return result;
    }

    /**
     * [제조사] 월간 목표 등록 사무소에 따른 딜러사 조회
     */
    @RequestMapping(value = "/mis/tmp/selectTargetSearchMgmtDealerCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetSearchMgmtDealerCd(@RequestBody TargetSearchMgmtVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsOfficeCd(searchVO.getsOfficeCd());

        result.setTotal(targetSearchMgmtService.selectDealerListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetSearchMgmtService.selectMonthDealerList(searchVO));
        }

        return result;
    }

}
