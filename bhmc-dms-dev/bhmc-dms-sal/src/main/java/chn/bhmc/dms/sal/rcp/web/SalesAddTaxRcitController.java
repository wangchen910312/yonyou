
package chn.bhmc.dms.sal.rcp.web;

import java.util.Calendar;
import java.util.Date;
import java.util.Map;

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

import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitSaveVO;
import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitVO;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.sal.rcp.vo.SalesAddTaxRcitSearchVO;
import chn.bhmc.dms.sal.rcp.service.SalesAddTaxRcitService;
/**
 * <pre>
 * 영수증관리 > 부가세영수증관리
 * </pre>
 *
 * @ClassName   : SalesAddTaxRcitController.java
 * @Description : 영수증관리 > 부가세영수증관리
 * @author chibeom.song
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class SalesAddTaxRcitController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 부가세영수증관리 서비스
     */
    @Resource(name="salesAddTaxRcitService")
    SalesAddTaxRcitService salesAddTaxRcitService;

    /**
     * 영수증관리 > 부가세영수증관리
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectSalesAddTaxReceipt.do", method = RequestMethod.GET)
    public String selectSalesAddTaxReceipt(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

        model.addAttribute("dlrCd",              LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",           LoginUtil.getUserId());

        model.addAttribute("dstbChnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL200", null, langCd));
        model.addAttribute("secDlrGbList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL203", null, langCd));
        model.addAttribute("showYn", commonCodeService.selectCommonCodesByCmmGrpCd("SAF002", null, langCd));

        return "/sal/rcp/selectSalesAddTaxReceipt";
    }

    /**
     * 영수증관리 > 부가세 영수증관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesAddTaxRcitSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectSalesAddTaxReceiptSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesAddTaxReceiptSearch(@RequestBody SalesAddTaxRcitSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(salesAddTaxRcitService.selectSalesAddTaxReceiptSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesAddTaxRcitService.selectSalesAddTaxReceiptSearchData(searchVO));
        }

        return result;

    }
    
    /**
     * <p>Title:绑定车架号-查询增值税发票列表 </p >
     * @author TangWei 2021年4月15日 上午10:25:34
     * @param SalesAddTaxRcitSearchVO searchVO
     * @return SearchResult
     */
    @RequestMapping(value = "/sal/rcp/selectAddTaxReceiptList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAddTaxReceiptList(@RequestBody SalesAddTaxRcitSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(salesAddTaxRcitService.selectAddTaxReceiptListCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(salesAddTaxRcitService.selectAddTaxReceiptListData(searchVO));
        }
        return result;
    }
    
    /**
     * <p>Title:绑定车架号-提报功能 </p >
     * @author TangWei 2021年4月19日 上午10:21:03
     * @param Map<String,Map<String,Object>> map
     * @return
     */
    @RequestMapping(value = "/sal/rcp/multiAddTaxReceiptAndCarBinDingInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiAddTaxReceiptAndCarBinDingInfo(@RequestBody Map<String,Object> dataMap) throws Exception {
        salesAddTaxRcitService.multiAddTaxReceiptAndCarBinDingInfo(dataMap);
        return true;
    }
    
    /**
     * <p>Title:更改赠票的是否显示状态 </p >
     * @author TangWei 2021年4月20日 下午20:21:03
     * @param Map<String,Map<String,Object>> map
     * @return
     */
    @RequestMapping(value = "/sal/rcp/updateAddTaxReceiptShowYn.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateAddTaxReceiptShowYn(@RequestBody Map<String,Object> dataMap) throws Exception {
        salesAddTaxRcitService.updateAddTaxReceiptShowYn(dataMap);
        return true;
    }
    
    /**
     * <p>Title:增票明细-解绑功能 </p >
     * @author TangWei 2021年4月20日 下午2:32:21
     * @param Map<String, Object> map
     * @return
     */
    @RequestMapping(value = "/sal/rcp/unbundlingAddTaxReceiptAndCar.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean unbundlingAddTaxReceiptAndCar(@RequestBody Map<String, Object> map) throws Exception {
        salesAddTaxRcitService.unbundlingAddTaxReceiptAndCar(map);
        return true;
    }

    /**
     * 부가세영수증관리 > 부가세 영수증  데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/insertSalesAddTaxReceiptSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSalesVehicleCombineReceiptSave(@Validated @RequestBody SalesAddTaxRcitSaveVO saveVO) throws Exception {
        boolean result = false;
        result = salesAddTaxRcitService.insertSalesAddTaxReceiptSave(saveVO);
        return result;
    }

    /**
     * 부가세영수증관리 > 영수증 이미지를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesVhclCbinRcitSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/rcp/selectAddTaxReceiptImageSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SalesAddTaxRcitVO selectAddTaxReceiptImageSearch(@RequestBody SalesAddTaxRcitSearchVO searchVO) throws Exception {
        return salesAddTaxRcitService.selectAddTaxReceiptImageSearch(searchVO);
    }


}
