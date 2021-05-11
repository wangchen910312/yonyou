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

import chn.bhmc.dms.cmm.sci.service.CountryService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CountrySaveVO;
import chn.bhmc.dms.cmm.sci.vo.CountrySearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 국가코드 관리 컨트롤러
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
public class CountryController extends HController {
    /**
     * 국가 관리 서비스
     */
    @Resource(name="countryService")
    CountryService countryService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 국가 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/country/selectCountryMain.do", method = RequestMethod.GET)
    public String selectCountryMain(Model model)  throws Exception {

        model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));

        return "/cmm/sci/country/selectCountryMain";
    }

    /**
     * 국가 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CountrySearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/country/selectCountries.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCountries(@RequestBody CountrySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(countryService.selectCountriesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(countryService.selectCountriesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 국가 정보를 등록한다.
     * @param saveVO - 국가정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/country/multiCountries.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiCountries(@Validated @RequestBody CountrySaveVO saveVO) throws Exception {
        countryService.multiCountries(saveVO);
        return true;

    }

    /**
     * 국가조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/country/selectCountryPopup.do", method = RequestMethod.GET)
    public String selectCountryPopup(Model model) throws Exception {

        model.addAttribute("langCd", LocaleContextHolder.getLocale().getLanguage());
        return "/cmm/sci/country/selectCountryPopup";
    }
}
