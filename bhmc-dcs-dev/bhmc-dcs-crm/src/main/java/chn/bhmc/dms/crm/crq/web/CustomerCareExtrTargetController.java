package chn.bhmc.dms.crm.crq.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.crq.service.CustomerCareExtrTargetService;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;

/**
 * 고객케어 대상자 컨트롤러
 *
 * @author in moon lee
 * @since 2016.05.25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.25         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/crq/customerCare")
@Controller
public class CustomerCareExtrTargetController extends HController {

    /**
     * 고객케어 대상자 관리 서비스
     */
    @Resource(name="customerCareExtrTargetService")
    CustomerCareExtrTargetService customerCareExtrTargetService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 고객케어 대상자 목록 데이터를 조회한다.
     * @param CustomerExtrTargetSearchVO - 고객케어번호
     * @return
     */
    @RequestMapping(value = "/selectCustomerCareExtrTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerCareExtrTargets(@RequestBody CustomerCareExtrTargetSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(customerCareExtrTargetService.selectCustomerCareExtrTargetsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerCareExtrTargetService.selectCustomerCareExtrTargetsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 고객케어 대상자 목록 - 콜센터 전송. ( 사용안함. 대상자 추출시, 실행유형이 전화일경우 자동 전송 )
     * @param CustomerExtrTargetSearchVO -
     * @return
     */
    @RequestMapping(value = "/insertExtrTargetTrsfCallCenter.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertExtrTargetTrsfCallCenter(@RequestBody CustomerCareExtrTargetVO saveVO) throws Exception {

        customerCareExtrTargetService.insertExtrTargetTrsfCallCenter(saveVO);

        return true;

    }

}