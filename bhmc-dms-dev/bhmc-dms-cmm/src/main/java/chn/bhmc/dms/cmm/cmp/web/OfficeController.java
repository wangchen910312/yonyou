package chn.bhmc.dms.cmm.cmp.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.OfficeService;
import chn.bhmc.dms.cmm.cmp.vo.OfficeSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 사무소 관리 컨트롤러
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
public class OfficeController extends HController {

    /**
     * 사무소 관리 서비스
     */
    @Resource(name="officeService")
    OfficeService officeService;


    /**
     * 사무소 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/office/selectOfficeMain.do", method = RequestMethod.GET)
    public String selectOfficeMain() throws Exception {
        return "/cmm/cmp/office/selectOfficeMain";
    }

    /**
     * 사무소 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OfficeSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/office/selectOffices.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOffices(@RequestBody OfficeSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(officeService.selectOfficesByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(officeService.selectOfficesByCondition(searchVO));
        }

        return result;
    }
}
