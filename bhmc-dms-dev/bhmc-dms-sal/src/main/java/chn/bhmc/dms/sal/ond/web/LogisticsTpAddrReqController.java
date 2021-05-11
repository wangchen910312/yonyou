package chn.bhmc.dms.sal.ond.web;

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

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.ond.service.LogisticsTpAddrReqService;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSaveVO;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrReqController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 3.         HG                      최초 생성
 * </pre>
 */

@Controller
public class LogisticsTpAddrReqController extends HController {

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

     /**
     * 물류운송주소 서비스
     */
    @Resource(name="logisticsTpAddrReqService")
    LogisticsTpAddrReqService logisticsTpAddrReqService;

    /**
     * 판매 공통 - 사업부, 사무소, 성, 도시 조회 서비스
     */
    @Resource(name="salesCommonService")
    SalesCommonService salesCommonService;

     /**
     * 물류운송주소 신청 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/ond/transportAddress/selectLogisticsTpAddrReqMain.do", method = RequestMethod.GET)
    public String selectLogisticsTpAddrReqMain(Model model) throws Exception  {
        model.addAttribute("evalRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL207", "Y", LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("shipToProvList", salesCommonService.selectDealerSung(new DealerSearchVO()));

        return "/sal/ond/transportAddress/selectLogisticsTpAddrReqMain";
    }

    /**
     * 수령권한문서 파일 업로드 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/ond/transportAddress/selectFileUploadPopup.do", method = RequestMethod.GET)
    public String selectFileUploadPopup(Model model) throws Exception  {
        return "/sal/ond/transportAddress/selectFileUploadPopup";
    }

    /**
     * 물류운송주소 리스트 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 logisticsTpAddrReqVO
     * @return
     */
    @RequestMapping(value = "/sal/ond/transportAddress/selectLogisticsTpAddrReqList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLogisticsTpAddrReqList(@RequestBody LogisticsTpAddrReqSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        result.setData(logisticsTpAddrReqService.selectLogisticsTpAddrReqList(searchVO));

        return result;
    }

     /**
     * 물류운송주소 정보를 등록한다.
     * @param saveVO -
     * @return
     */
    @RequestMapping(value = "/sal/ond/transportAddress/saveLogisticsTpAddrReqList.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveLogisticsTpAddrReqList(@Validated @RequestBody LogisticsTpAddrReqSaveVO saveVO) throws Exception {

        logisticsTpAddrReqService.saveLogisticsTpAddrReqList(saveVO);
        return true;
    }

}
