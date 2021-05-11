package chn.bhmc.dms.crm.cif.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
//import chn.bhmc.dms.core.datatype.BaseSaveVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerGroupController.java
 * @Description : 고객그룹관리 컨트롤러
 * @author Kyo Jin Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Controller
public class CustomerGroupController extends HController{

    /**
     * Group Management Service
     */
    @Resource(name="customerGroupService")
    CustomerGroupService customerGroupService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 고객그룹관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerGroup/selectCustomerGroupMain.do", method = RequestMethod.GET)
    public String selectCustomerGroupMain() throws Exception {
        return "/crm/cif/customerGroup/selectCustomerGroupMain";
    }

    /**
     * 태그/그룹/취미 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerGroup/selectCustomerTagMain.do", method = RequestMethod.GET)
    public String selectCustomerTagMain(Model model) throws Exception {

        model.addAttribute("grpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM040", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/crm/cif/customerGroup/selectCustomerTagMain";
    }

    /**
     * 그룹관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGroupSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerGroup/selectCustomerGroup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerGroup(@RequestBody CustomerGroupSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(customerGroupService.selectCustomerGroupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerGroupService.selectCustomerGroupByCondition(searchVO));
        }
        return result;
    }

    /**
     * 그룹정보를 등록한다.
     * @param saveVO - 고객그룹정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     *
     */
    @RequestMapping(value = "/crm/cif/customerGroup/multiCustomerGroup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustomerGroup(@Validated @RequestBody BaseSaveVO<CustomerGroupVO> saveVO, BindingResult bindingResult) throws Exception {
        customerGroupService.multiCustomerGroup(saveVO);
        return true;
    }

    /**
     * 고객그룹 변경 정보를 등록한다.
     * @param saveVO - 고객그룹정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     *
     */
    @RequestMapping(value = "/crm/cif/customerGroup/multiCustomerGroupChg.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCustomerGroupChg(@Validated @RequestBody BaseSaveVO<CustomerGroupVO> saveVO, BindingResult bindingResult) throws Exception {
        customerGroupService.multiCustomerGroupChg(saveVO);
        return true;
    }

    /**
     * 선택 그룹에 속한 고객을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CustomerGroupSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerGroup/selectCustomerInGroup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustomerInGroup(@RequestBody CustomerGroupSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(customerGroupService.selectCustomerInGroupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerGroupService.selectCustomerInGroupByCondition(searchVO));
        }
        return result;
    }

    /**
     * 그룹 선택 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerGroup/selectGroupPopup.do", method = RequestMethod.GET)
    public String selectGroupPopup() throws Exception {
        return "/crm/cif/customerGroup/selectGroupPopup";
    }

    /**
     * 태그 선택 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cif/customerGroup/selectTagPopup.do", method = RequestMethod.GET)
    public String selectTagPopup() throws Exception {
        return "/crm/cif/customerGroup/selectTagPopup";
    }

}
