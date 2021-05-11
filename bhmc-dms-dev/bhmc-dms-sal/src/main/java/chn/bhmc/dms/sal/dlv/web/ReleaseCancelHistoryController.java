package chn.bhmc.dms.sal.dlv.web;


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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.dlv.service.ReleaseCancelHistoryService;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelHistoryVO;

/**
 *
 * @ClassName   : ReleaseCancelHistoryController.java
 * @Description : 출고취소이력을 조회한다.
 * @author
 * @since 2016. 10. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *       수정일                            수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.10.22         Yoon Se Ran          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dlv/cancelHistory")
public class ReleaseCancelHistoryController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 출고취소이력조회 서비스
     */
    @Resource(name="releaseCancelHistoryService")
    ReleaseCancelHistoryService releaseCancelHistoryService;

    /**
     * 출고취소 이력조회  Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectReleaseCancelHistoryMain.do", method = RequestMethod.GET)
    public String selectReleaseCancelHistoryMain(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //조작상태
        model.addAttribute("kmoptDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL187", null, langCd));

        //판매취소사유
        model.addAttribute("cnclDs", commonCodeService.selectCommonCodesByCmmGrpCd("SAL129", null, langCd));

        return "/sal/dlv/cancDelivery/selectReleaseCancelHistorytMain";
    }

    /**
     * 출고취소 이력 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectReleaseCancelHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReleaseCancelHistory(@RequestBody ReleaseCancelHistoryVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setDlrCd(LoginUtil.getDlrCd()); // 딜러코드

        result.setTotal(releaseCancelHistoryService.selectReleaseCancelHistoryByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(releaseCancelHistoryService.selectReleaseCancelHistoryByCondition(searchVO));
        }

        return result;
    }
}
