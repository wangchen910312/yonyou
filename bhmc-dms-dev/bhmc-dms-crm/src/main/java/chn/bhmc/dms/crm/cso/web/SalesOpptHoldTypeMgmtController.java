package chn.bhmc.dms.crm.cso.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;

/**
 * 판매기회 확보유형 관리 컨트롤러
 *
 * @author kyo jin lee
 * @since 2016.07.10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.10         kyo jin lee            최초 생성
 * </pre>
 */

@Controller
public class SalesOpptHoldTypeMgmtController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 판매기회유입유형 관리 서비스
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * 판매기회 확보유형 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptHoldTypeMgmt/selectSalesOpptHoldTypeMgmtMain.do", method = RequestMethod.GET)
    public String selectSalesOpptHoldTypeMgmtMain(Model model ) throws Exception {

        model.addAttribute("holdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM008", null, LocaleContextHolder.getLocale().getLanguage()));


        return "/crm/cso/salesOpptHoldTypeMgmt/selectSalesOpptHoldTypeMgmtMain";
    }

    @RequestMapping(value = "/crm/cso/salesOpptHoldTypeMgmt/selectSalesOpptHoldType.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptHoldType(@RequestBody SalesOpptHoldTypeMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(searchVO));
        }
        return result;
    }

    @RequestMapping(value = "/crm/cso/salesOpptHoldTypeMgmt/multiSalesOpptHoldType.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSalesOpptHoldType(@RequestBody BaseSaveVO<SalesOpptHoldTypeMgmtVO> saveVO) throws Exception {
        salesOpptHoldTypeMgmtService.multiSalesOpptHoldType(saveVO);
        return true;
    }

}