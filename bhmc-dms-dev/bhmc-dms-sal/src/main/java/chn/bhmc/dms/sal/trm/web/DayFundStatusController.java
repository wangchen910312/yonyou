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
import chn.bhmc.dms.sal.trm.service.DayFundStatusService;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusSearchVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusVO;
import chn.bhmc.dms.sal.trm.vo.DayFundStatusViewVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DayFundStatusController
 * @Description : 일 자금현황
 * @author Kim Jin Suk
 * @since 2016. 08. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 17.    Kim Jin Suk                최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/sal/trm/dayFundStatus")
public class DayFundStatusController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 일 자금현황 서비스
     */
    @Resource(name="dayFundStatusService")
    DayFundStatusService dayFundStatusService;


    /**
     * 일자금현황 View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDayFundStatusMain.do", method = RequestMethod.GET)
    public String selectDayFundStatusConditionMain(Model model) throws Exception {

        // 현재일자 DateUtil
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("toMonth", DateUtil.getDate("yyyyMM"));
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //주문유형(오더유형)
        //model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138"));

        return "/sal/trm/dayFundStatus/selectDayFundStatusMain";
    }


    /**
     * 일자금현황 일자 목록을 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDayFundStatusDaySearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDayFundStatusDaySearch(@RequestBody DayFundStatusVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(dayFundStatusService.selectDayFundStatusLastDaySearch(searchVO));
        result.setData(dayFundStatusService.selectDayFundStatusDaysByCondition(searchVO));
        return result;
    }

    /**
     * 일자금현황 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDayFundStatusSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public DayFundStatusViewVO selectDayFundStatusSearch(@RequestBody DayFundStatusSearchVO searchVO) throws Exception {
        return dayFundStatusService.selectDayFundStatusByCondition(searchVO);
    }


}
