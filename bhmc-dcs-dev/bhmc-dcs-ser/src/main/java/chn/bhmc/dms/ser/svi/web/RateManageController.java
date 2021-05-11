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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.vo.RateManageSaveVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;

/**
 * <pre>
 * 임률코드 관리 Controller
 * </pre>
 *
 * @ClassName   : RateManageController.java
 * @Description : 임률코드 관리 Controller
 * @author Kwon Ki Hyun
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.   Kwon Ki Hyun      최초 생성
 * </pre>
 */

@Controller
public class RateManageController extends HController {

    /**
     * 임률코드 마스터 서비스
     */
    @Resource(name="rateManageService")
	RateManageService rateManageService;

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
	@RequestMapping(value = "/ser/svi/rateManage/selectRateManageMain.do", method=RequestMethod.GET)
	public String selectRateManageMain(Model model) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	   //수리 유형 목록
       model.addAttribute("rpirTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
       // 법인 딜러 구분코드
       model.addAttribute("dstinDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER950", null, langCd));
       //브랜드 목록
       model.addAttribute("brandDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
       //사용여부
       model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
       //보증 수리유형별 임률
       RateManageSearchVO searchVO = new RateManageSearchVO();
       searchVO.setsDstinCd("H");
       searchVO.setsDlrCd("A07AA");
       model.addAttribute("rateDs", rateManageService.selectRateManageByCondition(searchVO));
       //딜러코드
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());

	   return "/ser/svi/rateManage/selectRateManageMain";

	}


	/**
	 * 임률코드 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/rateManage/selectRateManages.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectRateManages(@RequestBody RateManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(rateManageService.selectRateManageByCondition(searchVO));
        result.setTotal( result.getData().size());

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
    @RequestMapping(value="/ser/svi/rateManage/selectRates.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRates(@RequestBody RateManageSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(rateManageService.selectRates(searchVO));

        result.setTotal(result.getData().size());

        return result;
    }

    /**
     * 임률코드 정보를 등록한다.
     * @param saveVO - 임률코드 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/rateManage/multiRateManages.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiRateManages(@Validated @RequestBody RateManageSaveVO saveVO ) throws Exception{
        rateManageService.multiRateManages(saveVO);
        return true;

    }

}