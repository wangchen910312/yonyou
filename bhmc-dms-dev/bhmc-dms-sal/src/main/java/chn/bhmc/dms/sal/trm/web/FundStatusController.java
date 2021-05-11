package chn.bhmc.dms.sal.trm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.trm.service.FundStatusService;
import chn.bhmc.dms.sal.trm.vo.FundStatusSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerFundStatusController
 * @Description : 자금현황(딜러) Controller
 * @author Kim Jin Suk
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.    Kim Jin Suk             최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/trm/fundStatus")
public class FundStatusController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 자금현황 서비스
     */
    @Resource(name="fundStatusService")
    FundStatusService fundStatusService;


    /**
     * 자금현황 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectFundStatusMain.do", method = RequestMethod.GET)
    public String selectFundStatusMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/trm/fundStatus/selectFundStatusMain";
    }

    /**
     * 월별 자금현황을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFundStatusSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFundStatusSearch(@RequestBody FundStatusSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(fundStatusService.selectFundStatusByConditionCnt(searchVO));

        if(result.getTotal() == 0){
            String nYyMm  = DateUtil.getDate("yyyyMM");
            String sYyMm = searchVO.getsYy()+searchVO.getsMm();
            if(nYyMm.equals(sYyMm)){
                result.setTotal(1);
            }
        }

        if(result.getTotal() != 0){
            result.setData(fundStatusService.selectFundStatusByCondition(searchVO));
        }

        return result;
    }

    /**
     * 일별 자금현황을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFundStatusDaySearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFundStatusDaySearch(@RequestBody FundStatusSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        //result.setTotal(fundStatusService.selectFundStatusDaysByConditionCnt(searchVO));

        //if(result.getTotal() != 0){
            result.setData(fundStatusService.selectFundStatusDaysByCondition(searchVO));
        //}

        return result;
    }

}
