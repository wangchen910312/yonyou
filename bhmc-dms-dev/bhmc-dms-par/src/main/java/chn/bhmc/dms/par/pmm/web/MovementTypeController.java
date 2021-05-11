package chn.bhmc.dms.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
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
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.MovementTypeVO;

/**
 * 수불유형 컨트롤러
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
public class MovementTypeController extends HController {

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
     * 수불유형 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/movementType/selectMovementTypeMain.do", method = RequestMethod.GET)
    public String selectMovementTypeMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 입출고구분(수불입출고구분) 공통코드정보 조회.
        model.addAttribute("mvtGrGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR001", null, langCd));
        // 재고계산식 공통코드정보 조회.
        model.addAttribute("stockCalcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR002", null, langCd));
        // 상대수불유형.[저장된 수불유형 리스트 가져오기]
        MovementTypeSearchVO searchVO = new MovementTypeSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUseYn("Y"); // 사용가능
        if(movementTypeService.selectMovementTypesByConditionCnt(searchVO) > 0)
        {
            model.addAttribute("combiMvtTpList", movementTypeService.selectMovementTypesByCondition(searchVO));
        }

        // 프로세스구분(수불관련계정유형) 정의 및 연결 해야 함.
        model.addAttribute("processTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR003", null, langCd));

        return "/par/pmm/movementType/selectMovementTypeMain";

    }

    /**
     * 수불유형 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/movementType/selectMovementTypes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMovementTypesList(@RequestBody MovementTypeSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(movementTypeService.selectMovementTypesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(movementTypeService.selectMovementTypesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 수불유형 추가/수정 한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/movementType/multiMovementTypes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiMovementTypes(@Validated @RequestBody BaseSaveVO<MovementTypeVO> saveVO, BindingResult bindingResult) throws Exception
    {
        movementTypeService.multiMovementTypes(saveVO);
        return true;
    }
}
