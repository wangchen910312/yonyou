package chn.bhmc.dms.cmm.bbs.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.bbs.service.BoardMasterService;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSaveVO;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSearchVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BoardMasterController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class BoardMasterController extends HController {
    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 게시판 관리 서비스
     */
    @Resource(name="boardMasterService")
    BoardMasterService boardMasterService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 게시판 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/boardMaster/selectBoardMasterMain.do", method = RequestMethod.GET)
    public String selectBoardMasterMain(Model model) throws Exception {
        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        return "/cmm/bbs/boardMaster/selectBoardMasterMain";
    }

    @RequestMapping(value = "/cmm/bbs/boardMaster/selectBoardMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBoardMaster(@RequestBody BoardMasterSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(boardMasterService.selectBoardMasterByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(boardMasterService.selectBoardMasterByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/bbs/boardMaster/multiBoardMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBoardMaster(@Validated @RequestBody BoardMasterSaveVO saveVO) throws Exception {
        boardMasterService.multiBoardMaster(saveVO);

        return true;
    }
}