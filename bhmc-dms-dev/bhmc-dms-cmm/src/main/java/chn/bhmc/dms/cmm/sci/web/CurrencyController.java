package chn.bhmc.dms.cmm.sci.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CurrencyService;
import chn.bhmc.dms.cmm.sci.vo.CurrencySaveVO;
import chn.bhmc.dms.cmm.sci.vo.CurrencySearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * 통화코드 관리 컨트롤러
 * </pre>
 *
 * @ClassName   : CurrencyController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class CurrencyController extends HController {

    /**
     * 통화코드 관리 서비스
     */
    @Resource(name="currencyService")
    CurrencyService currencyService;


    /**
     * 통화코드 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/currency/selectCurrencyMain.do", method = RequestMethod.GET)
    public String selectCurrencyMain() throws Exception {
        return "/cmm/sci/currency/selectCurrencyMain";
    }

    /**
     * 통화코드 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CurrencySearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/currency/selectCurrencies.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCurrencies(@RequestBody CurrencySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(currencyService.selectCurrenciesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(currencyService.selectCurrenciesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 통화코드 정보를 등록/수정/삭제 한다.
     * @param saveVO - 통화코드 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/currency/multiCurrencies.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCurrencies(@Validated @RequestBody CurrencySaveVO saveVO) throws Exception {

        currencyService.multiCurrencies(saveVO);
        return true;

    }
}
