package chn.bhmc.dms.cmm.sci.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSaveVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 단위정보 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.17         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class UnitInfoController extends HController {
    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 단위정보 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/unitInfo/selectUnitInfoMain.do", method = RequestMethod.GET)
    public String selectUnitInfoMain(Model model) throws Exception {

        //단위유형 목록
        model.addAttribute("unitTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM001", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/sci/unitInfo/selectUnitInfoMain";
    }

    /**
     * 단위정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UnitInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/unitInfo/selectUnitInfos.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUnitInfos(@RequestBody UnitInfoSearchVO searchVO)throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(unitInfoService.selectUnitInfosByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(unitInfoService.selectUnitInfosByCondition(searchVO));
        }

        return result;

    }

    /**
     * 단위정보 정보를 등록한다.
     * @param saveVO - 단위정보정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/unitInfo/multiUnitInfos.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiUnitInfos(@Validated @RequestBody UnitInfoSaveVO saveVO) throws Exception {
        unitInfoService.multiUnitInfos(saveVO);
        return true;

    }
}
