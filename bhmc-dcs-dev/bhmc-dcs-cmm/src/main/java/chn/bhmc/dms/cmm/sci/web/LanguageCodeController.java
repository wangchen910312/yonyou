package chn.bhmc.dms.cmm.sci.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.LanguageCodeService;
import chn.bhmc.dms.cmm.sci.vo.LanguageCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.LanguageCodeSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 언어코드 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class LanguageCodeController extends HController {
    /**
     * 언어코드 관리 서비스
     */
    @Resource(name="languageCodeService")
    LanguageCodeService languageCodeService;

    /**
     * 언어코드 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/languageCode/selectLanguageCodeMain.do", method = RequestMethod.GET)
    public String selectLanguageCodeMain() throws Exception {
        return "/cmm/sci/languageCode/selectLanguageCodeMain";
    }

    /**
     * 언어코드 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LanguageCodeSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/languageCode/selectLanguageCodes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLanguageCodes(@RequestBody LanguageCodeSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(languageCodeService.selectLanguageCodesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(languageCodeService.selectLanguageCodesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 언어코드 정보를 등록한다.
     * @param saveVO - 언어코드정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/languageCode/multiLanguageCodes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLanguageCodes(@Validated @RequestBody LanguageCodeSaveVO saveVO) throws Exception {
        languageCodeService.multiLanguageCodes(saveVO);
        return true;

    }
}
