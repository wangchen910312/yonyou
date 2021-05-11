package chn.bhmc.dms.par.cpm.web;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService;
import chn.bhmc.dms.par.cpm.service.SkillAndQnaHeaderService;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaHeaderVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SkillQnaController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 6. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 1.     In Bo Shim     최초 생성
 * </pre>
 */
@Controller
public class SkillQnaController {

    /**
     * commonCodeService
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * carInfoService(carNo,model,OCN,local option)
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * skillAndQnaHeaderService
     */
    @Resource(name="skillAndQnaHeaderService")
    SkillAndQnaHeaderService skillAndQnaHeaderService;

    /**
     * skillAndQnaDetailService
     */
    @Resource(name="skillAndQnaDetailService")
    SkillAndQnaDetailService skillAndQnaDetailService;

    /**
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 기술자문 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/skillQna/selectSkillQnaMain.do", method = RequestMethod.GET)
    public String selectSkillQnaMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("plbmModelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR506", null, langCd));
        model.addAttribute("dlrPblmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR507", null, langCd));
        model.addAttribute("pblmStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR508", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/cpm/skillQna/selectSkillQnaMain";
    }

    /**
     * 기술자문헤더 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SkillAndQnaSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/skillQna/selectSkillQnaHeaders.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSkillQnaHeaders(@RequestBody SkillAndQnaSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(searchVO.getsDlrCd());
        result.setTotal(skillAndQnaHeaderService.selectSkillAndQnaHeadersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(skillAndQnaHeaderService.selectSkillAndQnaHeadersByCondition(searchVO));
        }

        return result;

    }

    /**
     * 기술자문상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SkillAndQnaSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/skillQna/selectSkillDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSkillDetails(@RequestBody SkillAndQnaSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(searchVO.getsDlrCd());
        result.setTotal(skillAndQnaDetailService.selectSkillAndQnaDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(skillAndQnaDetailService.selectSkillAndQnaDetailsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 기술자문 관리 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectSkillAndQnaPopup.do", method = RequestMethod.GET)
    public String selectSkillAndQnaPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("plbmModelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR506", null, langCd));
        model.addAttribute("dlrPblmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR507", null, langCd));
        model.addAttribute("pblmStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR508", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/cmm/selectSkillAndQnaPopup";

    }

    @RequestMapping(value = "/par/cpm/skillQna/insertSkillQnaHeader.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSkillQnaHeader(
            @RequestBody SkillAndQnaHeaderVO saveVO
            ) throws Exception {
            skillAndQnaHeaderService.insertSkillAndQnaHeader(saveVO);
        return true;
    }

    @RequestMapping(value = "/par/cpm/skillQna/updateSkillQnaHeader.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSkillQnaHeader(
            @RequestBody SkillAndQnaHeaderVO saveVO
            ) throws Exception {
            skillAndQnaHeaderService.updateSkillAndQnaHeader(saveVO);
        return true;
    }

    @RequestMapping(value = "/par/cpm/skillQna/selectSkillAndQnaHeaderByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SkillAndQnaHeaderVO selectSkillAndQnaHeaderByKey(
            @RequestBody SkillAndQnaSearchVO searchVO
            ) throws Exception {

            SkillAndQnaHeaderVO skillAndQnaHeaderVO = skillAndQnaHeaderService.selectSkillAndQnaHeaderByKey(LoginUtil.getDlrCd(), searchVO.getsPblmNo());

        return skillAndQnaHeaderVO;
    }



}
