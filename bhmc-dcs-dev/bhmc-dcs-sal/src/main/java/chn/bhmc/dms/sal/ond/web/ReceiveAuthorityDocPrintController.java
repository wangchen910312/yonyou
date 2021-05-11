package chn.bhmc.dms.sal.ond.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.cmm.service.SalesCommonService;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.ond.service.ReceiveAuthorityDocPrintService;
import chn.bhmc.dms.sal.ond.vo.ReceiveAuthorityDocPrintSearchVO;

/**
 * <pre>
 * 수령권한문서출력 화면
 * </pre>
 *
 * @ClassName   : ReceiveAuthorityDocPrintController.java
 * @Description : ReceiveAuthorityDocPrintController
 * @author Jin Choi
 * @since 2017. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 6.     Jin Choi     최초 생성
 * </pre>
 */

@Controller
public class ReceiveAuthorityDocPrintController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;

    /**
     * 수령권한문서출력 서비스
     */
    @Resource(name="receiveAuthorityDocPrintService")
    ReceiveAuthorityDocPrintService receiveAuthorityDocPrintService;


    /**
     * 수령권한문서출력 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/ond/selectReceiveAuthorityDocPrintMain.do", method = RequestMethod.GET)
    public String selectReceiveAuthorityDocPrintMain (Model model ) throws Exception {

        model.addAttribute("evalRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL207", "Y", LocaleContextHolder.getLocale().getLanguage()));

        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        model.addAttribute("shipToProvList", salesCommonService.selectDealerSung(dealerSearchVO));

        return "/sal/ond/selectReceiveAuthorityDocPrintMain";
    }

    /**
     * 수령권한문서출력 리스트 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveAuthorityDocPrintSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/ond/selectReceiveAuthorityDocPrintList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveAuthorityDocPrintList(@RequestBody ReceiveAuthorityDocPrintSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        result.setTotal(receiveAuthorityDocPrintService.selectReceiveAuthorityDocPrintListByCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveAuthorityDocPrintService.selectReceiveAuthorityDocPrintList(searchVO));
        }
        return result;
    }

}
