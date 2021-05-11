package chn.bhmc.dms.cmm.apr.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocSaveVO;
import chn.bhmc.dms.cmm.apr.vo.DocSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 결재양식 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class DocController extends HController {

    /**
     * 결재양식 관리 서비스
     */
    @Resource(name="docService")
    DocService docService;

    /**
     * 결재양식 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/apr/doc/selectDocMain.do", method = RequestMethod.GET)
    public String selectDocMain(Model model) throws Exception {
        return "/cmm/apr/doc/selectDocMain";
    }

    /**
     * 결재양식 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DocSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/apr/doc/selectDocs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDocs(@RequestBody DocSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(docService.selectDocsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(docService.selectDocsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 결재양식 정보를 일괄적용한다.
     * @param saveVO - 결재양식정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/apr/doc/multiDocs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiDocs(@Validated @RequestBody DocSaveVO saveVO) throws Exception {
        docService.multiDocs(saveVO);
        return true;
    }

    /**
     * 결재라인 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DocSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/apr/doc/selectDocLines.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDocLines(@RequestBody DocLineSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(docService.selectDocLinesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(docService.selectDocLinesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 결재라인 정보를 일괄적용한다.
     * @param saveVO - 결재양식정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/apr/doc/deleteAndInsertDocLines.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAndInsertDocLines(@Validated @RequestBody DocVO docVO) throws Exception {
        docService.deleteAndInsertDocLines(docVO.getSignDocId(), docVO.getDocLineList());
        return true;
    }
}