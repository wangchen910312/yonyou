package chn.bhmc.dms.crm.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;

/**
 * 고객추출 마스터 컨트롤러
 *
 * @author hyoung jun an
 * @since 2016. 4. 28.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.28         hyoung jun an            최초 생성
 * </pre>
 */

@Controller
public class CrmTargExtractMasterController extends HController {

    /**
     * 고객추출 서비스
     */
    @Resource(name="crmTargExtractService")
    CrmTargExtractService crmTargExtractService;


    /**
     * 고객추출 마스터 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractMasterMain.do", method = RequestMethod.GET)
    public String selectCrmTargExtractMasterMain(Model model) throws Exception {

        return "/crm/cmm/crmTargExtract/selectCrmTargExtractMasterMain";
    }

    /**
     * 고객추출 마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmTargExtractMasters(@RequestBody CrmTargExtractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = crmTargExtractService.selectCrmTargExtractMastersByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(crmTargExtractService.selectCrmTargExtractMastersByCondition(searchVO));
        }

        return result;

    }

    /**
     * 고객추출 상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmTargExtractDetails(@RequestBody CrmTargExtractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = crmTargExtractService.selectCrmTargExtractDetailsByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(crmTargExtractService.selectCrmTargExtractDetailsByCondition(searchVO));
        }

        return result;

    }
}