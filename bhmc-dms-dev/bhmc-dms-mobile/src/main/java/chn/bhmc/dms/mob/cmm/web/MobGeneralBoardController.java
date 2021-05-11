package chn.bhmc.dms.mob.cmm.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.bbs.service.BoardMasterService;
import chn.bhmc.dms.cmm.bbs.service.GeneralBoardService;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobSelectGeneralBoardController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 23.     Kwon ki hyun     최초 생성
 * </pre>
 */

@Controller
public class MobGeneralBoardController {

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


    @RequestMapping(value = "/mob/cmm/bbs/generalBoard/selectBoardMain.do", method = RequestMethod.GET)
    public String selectGeneralBoardMain(Model model, @Param("sBbsId") String sBbsId) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        List<CommonCodeVO> arrNttCat = commonCodeService.selectCommonCodesByCmmGrpCd("COM032", null, LocaleContextHolder.getLocale().getLanguage());

        model.addAttribute("arrNttCat",arrNttCat);
        ///model.addAttribute("boardMaster", boardMasterService.selectBoardMasterByKey(searchVO));

        return "/mob/cmm/bbs/generalBoard/selectBoardMain";
    }
    /**
     * 게시판 목록 리스트 조회
     * @return
     */
    @RequestMapping(value = "/mob/cmm/bbs/generalBoard/selectBoardList.do", method = RequestMethod.GET)
    public String selectBoardList(@RequestParam("isFromBoardMain") String isFromBoardMain, @RequestParam("hasRoleId") String hasRoleId, Model model) throws Exception{

        model.addAttribute("isFromBoardMain", isFromBoardMain);
        model.addAttribute("hasRoleId", hasRoleId);

        return "/mob/cmm/bbs/generalBoard/selectBoardList";
    }

    @RequestMapping(value = "/mob/cmm/bbs/generalBoard/selectBoardSubList.do", method = RequestMethod.GET)
    public String selectBoardSubList(Model model) throws Exception{

        return "/mob/cmm/bbs/generalBoard/selectBoardSubList";
    }
    
    @RequestMapping(value = "/mob/cmm/bbs/generalBoard/selectGeneralBoard.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGeneralBoard(@RequestBody GeneralBoardSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(generalBoardService.selectGeneralBoardByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(generalBoardService.selectGeneralBoardByCondition(searchVO));
        }

        return result;
    }

}
