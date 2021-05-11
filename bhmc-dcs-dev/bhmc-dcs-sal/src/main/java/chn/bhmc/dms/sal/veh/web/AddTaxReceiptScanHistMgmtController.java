package chn.bhmc.dms.sal.veh.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.sal.veh.vo.AddTaxReceiptScanHistMgmtSearchVO;
import chn.bhmc.dms.sal.veh.service.AddTaxReceiptScanHistMgmtService;
/**
 * <pre>
 * 기준정보 > 부가세영수증스캔이력관리
 * </pre>
 *
 * @ClassName   : AddTaxReceiptScanHistMgmtController.java
 * @Description : 기준정보 > 부가세영수증스캔이력관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class AddTaxReceiptScanHistMgmtController extends HController {
    
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    
    /**
     * 부가세영수증관리 서비스
     */
    @Resource(name="addTaxReceiptScanHistMgmtService")
    AddTaxReceiptScanHistMgmtService addTaxReceiptScanHistMgmtService;

    /**
     * 기준정보 > 부가세영수증스캔이력관리
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSalesAddTaxReceiptScanHistMgmt.do", method = RequestMethod.GET)
    public String selectSalesAddTaxReceiptScanHistMgmt(Model model) throws Exception {
        
        model.addAttribute("dlrCd",    LoginUtil.getDlrCd());

        return "/sal/veh/receipt/selectSalesAddTaxReceiptScanHistMgmt";
    }
    
    /**
     * 기준정보 > 부가세영수증스캔이력관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AddTaxReceiptScanHistMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSalesAddTaxReceiptScanHistMgmtSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesAddTaxReceiptScanHistMgmtSearch(@RequestBody AddTaxReceiptScanHistMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(addTaxReceiptScanHistMgmtService.selectSalesAddTaxReceiptScanHistMgmtSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(addTaxReceiptScanHistMgmtService.selectSalesAddTaxReceiptScanHistMgmtSearchData(searchVO));
        }

        return result;

    }

}
