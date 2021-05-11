package chn.bhmc.dms.sal.bsc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.bsc.service.FinancialProductMngService;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;

/**
 * 금융상품관리(v.2)
 *
 * @author Kim Jin Suk
 * @since 2017.01.12
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                     수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.12         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/bsc/financialProductMng")
public class FinancialProductMngController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 금융 상품 관리 서비스
     */
    @Resource(name="financialProductMngService")
    FinancialProductMngService financialProductMngService;

    
    /**
     * Financial Products Management Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectFinancialProductMngMain.do", method = RequestMethod.GET)
    public String selectFinancialProductMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //금융사
        model.addAttribute("fincCmpCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));
        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        
        return "/sal/bsc/financialProductMng/selectFinancialProductMngMain";
    }

    /**
     * Financial Products Management 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectFinancialProductMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFinancialProductMng(@RequestBody FinancialProductsManagementSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(financialProductMngService.selectFinancialProductMngByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(financialProductMngService.selectFinancialProductMngByCondition(searchVO));
        }

        return result;
    }


    /**
     * 등록,수정,삭제 한다.
     * @param saveVO - 등록/수정/삭제 목록을 포함하는 VehicleSettlementOrderSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/saveFinancialProductMng.do", method = RequestMethod.POST)
    @ResponseBody
    public FinancialProductsManagementVO saveFinancialProductMng(@Validated @RequestBody FinancialProductsManagementVO saveVO) throws Exception {
        return financialProductMngService.saveFinancialProductMng(saveVO);
    }


}
