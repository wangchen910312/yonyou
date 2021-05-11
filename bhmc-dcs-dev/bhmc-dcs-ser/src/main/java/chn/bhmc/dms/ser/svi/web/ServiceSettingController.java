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
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingVO;

/**
 * <pre>
 * 서비스설정 관리 Controller
 * </pre>
 *
 * @ClassName   : ServiceSettingController.java
 * @Description : 서비스설정 관리 Controller
 * @author Yin Xueyuan
 * @since 2016. 7. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Controller
public class ServiceSettingController extends HController {

    /**
     * 서비스설정 마스터 서비스
     */
    @Resource(name="serviceSettingService")
	ServiceSettingService serviceSettingService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
	 * 서비스설정 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/serviceSetting/selectServiceSettingMain.do", method=RequestMethod.GET)
	public String selectServiceSettingMain(Model model) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	    //예약준수
        model.addAttribute("keepResvTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER121", null, langCd));
        //예약간격
        model.addAttribute("resvInkTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER122", null, langCd));
        //보드기준
        model.addAttribute("boardTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER123", null, langCd));
		return "/ser/svi/serviceSetting/selectServiceSettingMain";

	}

	/**
	 * 서비스설정 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/serviceSetting/selectServiceSettings.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectServiceSettings(@RequestBody ServiceSettingSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(serviceSettingService.selectServiceSettingByConditionCnt(searchVO));
        result.setData(serviceSettingService.selectServiceSettingByCondition(searchVO));

        return result;

	}

    /**
     * 서비스설정 정보를 등록한다.
     * @param saveVO - 서비스설정 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/serviceSetting/insertServiceSetting.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiServiceSettings(@Validated @RequestBody ServiceSettingVO serviceSettingVO) throws Exception{
        serviceSettingService.insertServiceSetting(serviceSettingVO);
        return true;

    }

}