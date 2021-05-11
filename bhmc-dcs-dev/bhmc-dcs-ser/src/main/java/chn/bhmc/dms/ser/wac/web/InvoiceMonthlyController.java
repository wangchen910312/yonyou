package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.wac.service.InvoiceMonthlyService;
import chn.bhmc.dms.ser.wac.vo.InvoiceMonthlySearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvoiceMonthlyController.java
 * @Description : 월별 인보이스 컨트롤러
 * @author Kwon ki hyun
 * @since 2016. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Controller
public class InvoiceMonthlyController extends HController {


    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="invoiceMonthlyService")
    InvoiceMonthlyService invoiceMonthlyService;

    /**
     *
     * 월별 인보이스 화면 메인
     *
     * @param model
     * @return 월별 인보이스 화면
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/invoice/selectInvoiceMonthlyMain.do",method=RequestMethod.GET)
    public String selectInvoiceMonthlyMain(Model model)throws Exception{

        model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM"));
        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM") );

        //클레임유형
        model.addAttribute("claimTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER091", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/ser/wac/invoice/selectInvoiceMonthlyMain";
    }


    /**
     *
     * 인보이스 목록 조회
     *
     * @param searchVO
     * @return 인보이스 목록
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/invoice/selectInvoiceMonthlyMains.do" , method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvoiceMonthlyMains(@RequestBody InvoiceMonthlySearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(invoiceMonthlyService.selectInvoiceMonthlyByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(invoiceMonthlyService.selectInvoiceMonthlyByCondition(searchVO));
        }

        return result;
    }

    /**
    *
    * 인보이스 상세 목록 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 상세 목록
    * @throws Exception
    */
    @RequestMapping(value="/ser/wac/invoice/selectInvoiceMonthlyDetail.do" , method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvoiceMonthlyDetailByCondition(@RequestBody InvoiceMonthlySearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(invoiceMonthlyService.selectInvoiceMonthlyDetailByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(invoiceMonthlyService.selectInvoiceMonthlyDetailByCondition(searchVO));
        }

        return result;
    }


    /**
    *
    * 인보이스 공제  목록 조회
    *
    * @param InvoiceMonthlySearchVO
    * @return 인보이스 공제 목록
    * @throws Exception
    */
    @RequestMapping(value="/ser/wac/invoice/selectInvoiceMonthlyDeduct.do" , method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvoiceMonthlyDeductByCondition(@RequestBody InvoiceMonthlySearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(invoiceMonthlyService.selectInvoiceMonthlyDeductByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;
    }
}
