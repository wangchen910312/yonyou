package chn.bhmc.dms.mis.tpm.web;

import java.util.Calendar;
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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mis.tpm.service.TargetPcsMnrService;
import chn.bhmc.dms.mis.tpm.vo.TargetPcsMnrSearchVO;


/**
 * <pre>
 * 과정 모니터링
 * </pre>
 *
 * @ClassName   : TargetPcsMnrController.java
 * @Description : 과정 모니터링
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetPcsMnrController extends HController {

    /**
     * 과정 모니터링 서비스
     */
    @Resource(name="targetPcsMnrService")
    TargetPcsMnrService targetPcsMnrService;

    /**
     * 과정 모니터링 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tpm/selectTargetPcsMnrMain.do", method = RequestMethod.GET)
    public String selectTargetPcsMnrMain(TargetPcsMnrSearchVO SearchVO, Model model) throws Exception {

        //searchVO.setTabNo(searchVO.getTabNo());

        //model.addAttribute("searchVO", searchVO);

        return "/mis/tpm/selectTargetPcsMnrMain";
    }

    /**
     * 과정 모니터링 - 딜러현황(집객달성현황) 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tpm/selectDealerCustAchieveSearch.do", method = RequestMethod.GET)
    public String selectDealerCustAchieveSearch(Model model) throws Exception {

        return "/mis/tpm/selectDealerCustAchieveSearch";
    }

    /**
     * 과정 모니터링 - 딜러현황(집객달성현황) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tpm/selectDealerCustAchieveGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerCustAchieveGrid(@RequestBody TargetPcsMnrSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(targetPcsMnrService.selectDealerCustAchieveGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetPcsMnrService.selectDealerCustAchieveGrid(searchVO));
        }

        return result;
    }

    /**
     * 과정 모니터링 - 과정관리 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tpm/selectProcessMgmtSearch.do", method = RequestMethod.GET)
    public String selectProcessMgmtSearch(Model model) throws Exception {

        return "/mis/tpm/selectProcessMgmtSearch";
    }

    /**
     * 과정 모니터링 - 과정관리(판매) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tpm/selectDealerSaleProcessGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerSaleProcessGrid(@RequestBody TargetPcsMnrSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetPcsMnrService.selectDealerSaleProcessGrid(searchVO));

        return result;
    }

    /**
     * 과정 모니터링 - 과정관리(집객) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tpm/selectDealerCustProcessGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealerCustProcessGrid(@RequestBody TargetPcsMnrSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetPcsMnrService.selectDealerCustProcessGrid(searchVO));

        return result;
    }

    /**
     * KPI 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tpm/selectDealerKpiSearch.do")
    public String selectDealerKpiSearch(Model model, TargetPcsMnrSearchVO targetPcsMnrSearchVO) throws Exception {
        String offCd = LoginUtil.getDistOfficeCd();
        targetPcsMnrSearchVO.setOffCd(offCd);

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        String newStatusDate = "";

        targetPcsMnrSearchVO.setsMonitorKpiDate(targetPcsMnrSearchVO.getsMonitorKpiDate());

        TargetPcsMnrSearchVO searchListVO = new TargetPcsMnrSearchVO();

        if(targetPcsMnrSearchVO.getsMonitorKpiDate() == null || targetPcsMnrSearchVO.getsMonitorKpiDate() == ""){

            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }

            if(statusDate < 10 ) {
                newStatusDate = "0" + String.valueOf(statusDate);
            } else {
                newStatusDate = String.valueOf(statusDate);
            }

            searchListVO.setsMonitorKpiDate(String.valueOf(statusYear)+newStatusMonth+newStatusDate);

        } else {
            searchListVO.setsMonitorKpiDate(targetPcsMnrSearchVO.getsMonitorKpiDate());
        }

        List<TargetPcsMnrSearchVO> kpiList = targetPcsMnrService.selectDealerKpiSearch(targetPcsMnrSearchVO);

        if(kpiList != null){
            targetPcsMnrSearchVO = kpiList.get(0);
        }

        model.addAttribute("targetPcsMnrSearchVO", targetPcsMnrSearchVO);
        model.addAttribute("searchListVO", searchListVO);

        return "/mis/tpm/selectDealerKpiSearch";
    }

}
