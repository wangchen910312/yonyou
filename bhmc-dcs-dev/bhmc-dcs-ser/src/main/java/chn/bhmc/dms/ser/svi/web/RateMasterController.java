package chn.bhmc.dms.ser.svi.web;

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
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.RateMasterService;
import chn.bhmc.dms.ser.svi.vo.RateMasterSaveVO;
import chn.bhmc.dms.ser.svi.vo.RateMasterSearchVO;

/**
 * <pre>
 * 임률코드 관리 Controller
 * </pre>
 *
 * @ClassName   : RateMasterController.java
 * @Description : 임률코드 관리 Controller
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Controller
public class RateMasterController extends HController {

    /**
     * 임률코드 마스터 서비스
     */
    @Resource(name="rateMasterService")
	RateMasterService rateMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
	 * 임률코드 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/rateMaster/selectRateMasterMain.do", method=RequestMethod.GET)
	public String selectRateMasterMain(Model model) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	    //Ro유형 목록
        model.addAttribute("roTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //브랜드 목록
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

		return "/ser/svi/rateMaster/selectRateMasterMain";

	}

	/**
     * 임률코드 조회 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/rateMaster/selectRateMasterListMain.do", method=RequestMethod.GET)
    public String selectRateMasterListMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //Ro유형 목록
        model.addAttribute("roTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //브랜드 목록
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        return "/ser/svi/rateMaster/selectRateMasterListMain";

    }

	/**
	 * 임률코드 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/rateMaster/selectRateMasters.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectRateMasters(@RequestBody RateMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(rateMasterService.selectRateMasterByConditionCnt(searchVO));
        result.setData(rateMasterService.selectRateMasterByCondition(searchVO));

        return result;

	}

	/**
     *
     * 임률 정보 조회
     *
     * @param searchVO - 임률 정보 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/rateMaster/selectRates.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRates(@RequestBody RateMasterSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(rateMasterService.selectRates(searchVO));

        result.setTotal(result.getData().size());

        return result;
    }

    /**
     * 임률코드 정보를 등록한다.
     * @param saveVO - 임률코드 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/rateMaster/multiRateMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiRateMasters(@Validated @RequestBody RateMasterSaveVO saveVO ) throws Exception{
        rateMasterService.multiRateMasters(saveVO);
        return true;

    }

}