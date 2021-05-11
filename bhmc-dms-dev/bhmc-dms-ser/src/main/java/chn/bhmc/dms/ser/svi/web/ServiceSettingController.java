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
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSaveVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;

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
        model.addAttribute("keepResvTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER125", null, langCd));
        //예약어김
        model.addAttribute("nkeepResvTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER992", null, langCd));
        //예약간격
        model.addAttribute("resvInkTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER124", null, langCd));
        //보드기준
        model.addAttribute("boardTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER123", null, langCd));
        //보양시간
        model.addAttribute("freeHmTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER126", null, langCd));
        //보양 KM
        model.addAttribute("freeKmTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER127", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd)); by wushibin 服务参数设置
        model.addAttribute("paymMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //정산절사
        model.addAttribute("wonUnitCutCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER063", null, langCd));
        //정산제로
        model.addAttribute("demicalPointCutCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER064", null, langCd));
        //고객전화표시여부
        model.addAttribute("custTelYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER065", null, langCd));
        //부품수령가능여부
        model.addAttribute("partRcvYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER066", null, langCd));
        //예약서비스알람설정
        model.addAttribute("resvSerAlarmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER067", null, langCd));
        //자동수리시작여부
        model.addAttribute("autoWrkProcYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER068", null, langCd));
        //수불공임편집여부
        model.addAttribute("lbrHmEditYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER069", null, langCd));
        //프린트지역유형
        model.addAttribute("printAreaTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER993", null, langCd));

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
    @RequestMapping(value = "/ser/svi/serviceSetting/multiServiceSettings.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiServiceSettings(@Validated @RequestBody ServiceSettingSaveVO serviceSettingVO) throws Exception{
        serviceSettingService.multiServiceSettings(serviceSettingVO);
        return true;

    }

}