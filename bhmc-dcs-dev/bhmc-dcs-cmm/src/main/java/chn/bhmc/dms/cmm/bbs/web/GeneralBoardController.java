package chn.bhmc.dms.cmm.bbs.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.bbs.service.BoardMasterService;
import chn.bhmc.dms.cmm.bbs.service.GeneralBoardService;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSaveVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GeneralBoardController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class GeneralBoardController extends HController {
    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 게시판 관리 서비스
     */
    @Resource(name="boardMasterService")
    BoardMasterService boardMasterService;

    /**
     * 게시판 관리 서비스
     */
    @Resource(name="generalBoardService")
    GeneralBoardService generalBoardService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 게시판 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/generalBoard/selectGeneralBoardMain.do", method = RequestMethod.GET)
    public String selectGeneralBoardMain(Model model, @Param("sBbsId") String sBbsId) throws Exception {

        BoardMasterSearchVO searchVO = new BoardMasterSearchVO();
        searchVO.setsBbsId(sBbsId);

        List<CommonCodeVO> arrNttCat = commonCodeService.selectCommonCodesByCmmGrpCd("COM032", null, LocaleContextHolder.getLocale().getLanguage());

        model.addAttribute("arrNttCat",arrNttCat);
        model.addAttribute("boardMaster", boardMasterService.selectBoardMasterByKey(searchVO));

        return "/cmm/bbs/generalBoard/selectGeneralBoardMain";
    }

    @RequestMapping(value = "/cmm/bbs/generalBoard/selectGeneralBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGeneralBoard(@RequestBody GeneralBoardSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(generalBoardService.selectGeneralBoardByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(generalBoardService.selectGeneralBoardByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/bbs/generalBoard/selectGeneralBoardByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public GeneralBoardVO selectGeneralBoardByKey(@RequestBody GeneralBoardSearchVO searchVO) throws Exception {
        GeneralBoardVO result = new GeneralBoardVO();

        result = generalBoardService.selectGeneralBoardByKey(searchVO);

        return result;
    }

    @RequestMapping(value = "/cmm/bbs/generalBoard/selectGeneralBoardWritePopup.do", method = RequestMethod.GET)
    public String selectGeneralBoardWritePopup(HttpServletRequest request, Model model) throws Exception {
        return "/cmm/board/generalBoard/selectGeneralBoardWritePopup";
    }

    @RequestMapping(value = "/cmm/bbs/generalBoard/inertGeneralBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean inertGeneralBoard(@Validated @RequestBody GeneralBoardVO saveVO) throws Exception {
        if (!"I".equals(saveVO.getFlag())) {
            generalBoardService.updateGeneralBoardSort(saveVO);
        }

        generalBoardService.insertGeneralBoard(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/bbs/generalBoard/updateGeneralBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateGeneralBoard(@Validated @RequestBody GeneralBoardVO saveVO) throws Exception {
        generalBoardService.updateGeneralBoard(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/bbs/generalBoard/deleteGeneralBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteGeneralBoard(@Validated @RequestBody GeneralBoardVO saveVO) throws Exception {
        generalBoardService.deleteGeneralBoard(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/bbs/generalBoard/multiGeneralBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiGeneralBoard(@Validated @RequestBody GeneralBoardSaveVO saveVO) throws Exception {
        generalBoardService.multiGeneralBoard(saveVO);

        return true;
    }
}