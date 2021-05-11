package chn.bhmc.dms.cmm.cmp.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DivisionService;
import chn.bhmc.dms.cmm.cmp.vo.DivisionSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 사업부 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class DivisionController extends HController {

    /**
     * 사업부 관리 서비스
     */
    @Resource(name="divisionService")
    DivisionService divisionService;


    /**
     * 사업부 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/division/selectDivisionMain.do", method = RequestMethod.GET)
    public String selectDivisionMain() throws Exception {
        return "/cmm/cmp/division/selectDivisionMain";
    }

    /**
     * 사업부 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DivisionSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/division/selectDivisions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDivisions(@RequestBody DivisionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(divisionService.selectDivisionsByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(divisionService.selectDivisionsByCondition(searchVO));
        }

        return result;
    }
}
