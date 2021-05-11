package chn.bhmc.dms.sal.veh.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.datatype.SearchResult;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.sal.veh.vo.ReceiptScanHistMgmtSearchVO;
import chn.bhmc.dms.sal.veh.service.ReceiptScanHistMgmtService;

/**
 * <pre>
 * 기준정보 > 영수증스캔이력관리
 * </pre>
 *
 * @ClassName   : ReceiptScanHistMgmtController.java
 * @Description : 기준정보 > 영수증스캔이력관리
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
public class ReceiptScanHistMgmtController extends HController {

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
    @Resource(name="receiptScanHistMgmtService")
    ReceiptScanHistMgmtService receiptScanHistMgmtService;

    /**
     * 기준정보 > 영수증스캔이력관리
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSalesReceiptScanHistMgmt.do", method = RequestMethod.GET)
    public String selectSalesReceiptScanHistMgmt(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        SimpleDateFormat sdf = new SimpleDateFormat("dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
        int intToday = Integer.parseInt(strToday) - 1;

        model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -intToday), dateFormat) );

        model.addAttribute("uploadStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL202", null, langCd));

        model.addAttribute("dlrCd",    LoginUtil.getDlrCd());

        return "/sal/veh/receipt/selectSalesReceiptScanHistMgmt";
    }

    /**
     * 기준정보 > 영수증스캔이력관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiptScanHistMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSalesReceiptScanHistMgmtSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesReceiptScanHistMgmtSearch(@RequestBody ReceiptScanHistMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(receiptScanHistMgmtService.selectSalesReceiptScanHistMgmtSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiptScanHistMgmtService.selectSalesReceiptScanHistMgmtSearchData(searchVO));
        }

        return result;

    }
}
