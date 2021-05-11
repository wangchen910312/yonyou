package chn.bhmc.dms.sal.acc.web;


import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.acc.service.AccessoryMasterService;
import chn.bhmc.dms.sal.acc.vo.AccessoryMasterVO;



/**
 * 용품 마스터
 *
 * @author HG Lee
 * @since 2017. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.18           HG Lee            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/acc/accessoryMaster")
public class AccessoryMasterController extends HController {

    /**
     * 용품마스터현황 서비스
     */
    @Resource(name="accessoryMasterService")
    private AccessoryMasterService accessoryMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 용품마스터현황 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAccessoryMasterMain.do", method = RequestMethod.GET)
    public String selectAccessoryConditionMain(Model model,
            @RequestParam(value="accessoryMngNo",    required = false, defaultValue="") String accessoryMngNo
    ) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        List<CommonCodeVO> par101List = commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd);

        model.addAttribute("par101List", par101List);

        return "/sal/acc/accessoryMaster/selectAccessoryMasterMain";
    }

    /**
     * 용풍마스터현황 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAccessoryMasterSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryMasterSearch(@RequestBody AccessoryMasterVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(accessoryMasterService.selectAccessoryMasterList(searchVO));


        return result;
    }

    /**
     * 용풍마스터현황 라인선택
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAccessoryMasterLineSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryMasterLineSearch(@Validated @RequestBody AccessoryMasterVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(accessoryMasterService.selectAccessoryMasterLineList(searchVO));

        return result;
    }

    /**
     * 용풍마스터현황 저장
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAccessoryMasterSave.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryMasterSave(@Validated @RequestBody AccessoryMasterVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        //result.setData(accessoryMasterService.selectAccessoryMasterLineList(searchVO));

        return result;
    }
}
