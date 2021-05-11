package chn.bhmc.dms.par.pmm.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.par.pmm.service.SupplyRuleService;
import chn.bhmc.dms.par.pmm.vo.SupplyRuleSearchVO;
import chn.bhmc.dms.par.pmm.vo.SupplyRuleVO;

/**
 * SupplyRule Controller
 *
 * @author In Bo Shim
 * @since 2016. 09. 09.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 9. 09.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class SupplyRuleController extends HController {

    /**
     * 공급률 서비스
     */
    @Resource(name="supplyRuleService")
    SupplyRuleService supplyRuleService;

    /**
     * 공급률 데이타를 가져온다.
     * @param SupplyRuleSearchVO - 적정재고 검색 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/supplyRule/selectSupplyRulesPivotByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSupplyRulesPivotByCondition(@RequestBody SupplyRuleSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        List<SupplyRuleVO> supplyList = supplyRuleService.selectSupplyRulesPivotByCondition(searchVO);
        result.setData(supplyList);
        result.setTotal(supplyList.size());

        return result;
    }


}
