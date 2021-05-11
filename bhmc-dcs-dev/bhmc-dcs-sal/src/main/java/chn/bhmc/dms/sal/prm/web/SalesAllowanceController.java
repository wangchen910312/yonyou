package chn.bhmc.dms.sal.prm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.prm.service.SalesAllowanceService;
import chn.bhmc.dms.sal.prm.vo.SalesAllowanceSearchVO;

/**
 *
 * Sales Allowance
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.26         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/prm/salesAllowance")
public class SalesAllowanceController extends HController {

    /**
     * Sales Allowance 서비스
     */
    @Resource(name="salesAllowanceService")
    private SalesAllowanceService salesAllowanceService;


    /**
     * Sales Allowance 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSalesAllowanceMain.do", method = RequestMethod.GET)
    public String selectSalesAllowanceMain(Model model) throws Exception{
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        return "/sal/prm/salesAllowance/selectSalesAllowanceMain";
    }

    /**
     * Sales Allowance 메인 그리드 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesAllowanceSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesAllowanceSearch(@RequestBody SalesAllowanceSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(salesAllowanceService.selectSalesAllowanceMainsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesAllowanceService.selectSalesAllowanceMainsByCondition(searchVO));
        }

        return result;
    }


    /**
     * Sales Allowance 서브 그리드 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSalesAllowanceSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesAllowanceSub(@RequestBody SalesAllowanceSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(salesAllowanceService.selectSalesAllowanceSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesAllowanceService.selectSalesAllowanceSubsByCondition(searchVO));
        }

        return result;
    }


}
