package chn.bhmc.dms.sal.ond.web;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalSaveVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.ond.service.LogisticsTpAddrEvalService;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrEvalController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 3. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 8.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Controller
public class LogisticsTpAddrEvalController {
    
     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    
     /**
     * 물류운송주소 심사 서비스
     */
    @Resource(name="logisticsTpAddrEvalService")
    LogisticsTpAddrEvalService logisticsTpAddrEvalService;
    
     /**
     * 물류운송주소 심사 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/ond/transportAddress/selectLogisticsTpAddrEvalMain.do", method = RequestMethod.GET)
    public String selectLogisticsTpAddrReqMain(Model model) throws Exception  {
        model.addAttribute("evalRsltCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL207", "Y", LocaleContextHolder.getLocale().getLanguage()));
        return "/sal/ond/transportAddress/selectLogisticsTpAddrEvalMain";
    }
    
    /**
     * 물류운송주소 심사 리스트 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 logisticsTpAddrReqVO
     * @return
     */
    @RequestMapping(value = "/sal/ond/transportAddress/selectLogisticsTpAddrEvalList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLogisticsTpAddrEvalList(@RequestBody LogisticsTpAddrEvalSearchVO searchVO)  throws Exception  {
        
        SearchResult result = new SearchResult();
        
        result.setData(logisticsTpAddrEvalService.selectLogisticsTpAddrEvalList(searchVO));
        
        return result;
    }
    
     /**
     * 물류운송주소 심사 리스트 데이터를 비준한다.
     **/
    @RequestMapping(value = "/sal/ond/transportAddress/confirmLogisticsTpAddrEvalList.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmLogisticsTpAddrEvalList(@RequestBody LogisticsTpAddrEvalSaveVO saveVO) throws Exception {
        
        logisticsTpAddrEvalService.confirmLogisticsTpAddrEvalList(saveVO);
        return true;
    }
    
     /**
     * 물류운송주소 심사 리스트 데이터를 거절한다.
     **/
    @RequestMapping(value = "/sal/ond/transportAddress/denyLogisticsTpAddrEvalList.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean denyLogisticsTpAddrEvalList(@RequestBody LogisticsTpAddrEvalSaveVO saveVO) throws Exception {
        
        logisticsTpAddrEvalService.denyLogisticsTpAddrEvalList(saveVO);
        return true;
    }
    
     /**
     * 물류운송주소 심사 리스트 데이터를 폐기한다.
     **/
    @RequestMapping(value = "/sal/ond/transportAddress/terminateLogisticsTpAddrEvalList.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean terminateLogisticsTpAddrEvalList(@RequestBody LogisticsTpAddrEvalSaveVO saveVO) throws Exception {
        
        logisticsTpAddrEvalService.terminateLogisticsTpAddrEvalList(saveVO);
        return true;
    }

}
