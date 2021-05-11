package chn.bhmc.dms.mob.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VenderMasterController.java
 * @Description : 거래처 관리 컨트롤러
 * @author JongHee Lim
 * @since 2016. 4. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 5.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobVenderMasterController extends HController {

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 거래처목록 팝업
     */
    @RequestMapping(value = "/mob/par/pmm/venderMaster/selectVenderMasterPopup.do", method = RequestMethod.GET)
    public String selectVenderMasterPopup(Model model) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        // 거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/mob/par/pmm/venderMaster/selectVenderMasterPopup";
    }


    /**
     * 거래처목록
     */
    @RequestMapping(value = "/mob/par/pmm/venderMaster/selectVenderMasterList.do", method = RequestMethod.GET)
    public String selectVenderMasterList(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        // 거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/mob/par/pmm/venderMaster/selectVenderMasterList";
    }


    /**
     * 거래처 목록 [조회]
     */
    @RequestMapping(value = "/mob/par/pmm/venderMaster/selectVenderMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVenderMasters(@RequestBody VenderMasterSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 딜러코드 검색 VO
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setTotal(venderMasterService.selectVenderMastersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(venderMasterService.selectVenderMastersByCondition(searchVO));
        }
        return result;
    }




}
