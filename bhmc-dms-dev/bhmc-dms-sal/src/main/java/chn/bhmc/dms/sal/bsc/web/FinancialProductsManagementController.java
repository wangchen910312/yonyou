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
import chn.bhmc.dms.sal.bsc.service.FinancialProductsManagementService;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementSearchVO;
import chn.bhmc.dms.sal.bsc.vo.FinancialProductsManagementVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 금융 상품 관리(할부/리스)(C.R.U.D)
 *
 * @author Bong
 * @since 2016. 2. 1.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/bsc/financialProductsManagement")
public class FinancialProductsManagementController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 금융 상품 관리 서비스
     */
    @Resource(name="financialProductsManagementService")
    FinancialProductsManagementService financialProductsManagementService;

    /**
     * Financial Products Management Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectFinancialProductsManagementMain.do", method = RequestMethod.GET)
    public String selectFinancialProductsManagementMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("fincCmpCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));
        model.addAttribute("fincItemTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL056", null, langCd));
        model.addAttribute("fincItemPridInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL004", null, langCd));
        model.addAttribute("creditGradeCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL078", null, langCd));
        // 금융상품종류 SAL160
        model.addAttribute("fincItemKindCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL160", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineNames", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/bsc/financialProductsManagement/selectfinancialProductsManagementMain";
    }


    /**
     * Financial Products Management 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectFinancialProductsManagement.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFinancialProductsManagement(@RequestBody FinancialProductsManagementSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(financialProductsManagementService.selectFinancialProductsManagementByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(financialProductsManagementService.selectFinancialProductsManagementByCondition(searchVO));
        }

        return result;
    }


    /**
     * 등록,수정,삭제 한다.
     * @param saveVO - 등록/수정/삭제 목록을 포함하는 VehicleSettlementOrderSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/saveFinancialProductsManagement.do", method = RequestMethod.POST)
    @ResponseBody
    public FinancialProductsManagementVO multiVehicleSettlementOrder(@Validated @RequestBody FinancialProductsManagementVO saveVO) throws Exception {
        return financialProductsManagementService.saveFinancialProductsManagement(saveVO);
    }

    /**
     * 차종에 따른 모델내역 조회
     */
    @RequestMapping(value = "/selectModelGridSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModelGridSearch(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        //searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
    }


    @RequestMapping(value = "/selectFincTargetModelSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFincTargetModelSearch(@RequestBody FinancialProductsManagementSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(financialProductsManagementService.selectFincTargetModelSearchsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(financialProductsManagementService.selectFincTargetModelSearchsByCondition(searchVO));
        }

        return result;
    }







}
