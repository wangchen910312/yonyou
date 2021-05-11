package chn.bhmc.dms.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.IssueTypeService;
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.vo.IssueTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.IssueTypeVO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO;

/**
 * 출고유형 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. xx. xx.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

@Controller
public class IssueTypeController extends HController {

    /**
     * 출고유형 서비스
     */
    @Resource(name="issueTypeService")
    IssueTypeService issueTypeService;

    /**
     * 수불유형 서비스
     */
    @Resource(name="movementTypeService")
    MovementTypeService movementTypeService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 출고유형 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/issueType/selectIssueTypeMain.do", method = RequestMethod.GET)
    public String selectIssueTypeMain(Model model){

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 상대수불유형.[저장된 수불유형 리스트 가져오기]
        MovementTypeSearchVO searchVO = new MovementTypeSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUseYn("Y"); // 사용가능
        if(movementTypeService.selectMovementTypesByConditionCnt(searchVO) > 0)
        {
            model.addAttribute("combiMvtTpList", movementTypeService.selectMovementTypesByCondition(searchVO));
        }

        return "/par/pmm/issueType/selectIssueTypeMain";

    }

    /**
     * 출고유형 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueTypeSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/issueType/selectIssueTypes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueTypes(@RequestBody IssueTypeSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(issueTypeService.selectIssueTypesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueTypeService.selectIssueTypesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 출고유형 추가/수정 한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/issueType/multiIssueTypes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueTypes(@Validated @RequestBody BaseSaveVO<IssueTypeVO> saveVO, BindingResult bindingResult) throws Exception
    {
        issueTypeService.multiIssueTypes(saveVO);
        return true;
    }
}
