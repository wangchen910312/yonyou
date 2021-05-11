package chn.bhmc.dms.sal.veh.web;

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

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtSearchVO;
import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtSaveVO;
import chn.bhmc.dms.sal.veh.service.ReceiptUploadTimeMgmtService;

/**
 * <pre>
 * 기준정보 > 영수증업로드시간대관리
 * </pre>
 *
 * @ClassName   : ReceiptUploadTimeMgmtController.java
 * @Description : 기준정보 > 영수증업로드시간대관리
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
public class ReceiptUploadTimeMgmtController extends HController {
    
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    
    /**
     * 기준정보 > 영수증업로드시간대관리 서비스
     */
    @Resource(name="receiptUploadTimeMgmtService")
    ReceiptUploadTimeMgmtService receiptUploadTimeMgmtService;

    /**
     * 기준정보 > 영수증업로드시간대관리
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSalesReceiptUploadTimeMgmt.do", method = RequestMethod.GET)
    public String selectSalesReceiptUploadTimeMgmt(Model model) throws Exception {
        
        model.addAttribute("dlrCd",    LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("receiptTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL205", null, langCd));
        model.addAttribute("controlChkList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL206", null, langCd));

        return "/sal/veh/receipt/selectSalesReceiptUploadTimeMgmt";
    }
    
    /**
     * 기준정보 > 영수증업로드시간대관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiptUploadTimeMgmtSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSalesReceiptUploadTimeMgmtSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesReceiptUploadTimeMgmtSearch(@RequestBody ReceiptUploadTimeMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(receiptUploadTimeMgmtService.selectSalesReceiptUploadTimeMgmtSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiptUploadTimeMgmtService.selectSalesReceiptUploadTimeMgmtSearchData(searchVO));
        }

        return result;
    }
    
    /**
     * 기준정보 > 영수증업로드시간대관리 데이터를 등록한다.
     * @param saveVO - 영수증업로드시간대관리 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/multiSalesReceiptUploadTimeSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSalesReceiptUploadTimeSave(@Validated @RequestBody ReceiptUploadTimeMgmtSaveVO saveVO) throws Exception {

        receiptUploadTimeMgmtService.multiSalesReceiptUploadTimeSave(saveVO);
        return true;
    }

}
