package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.TechManFnMasterService;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterVO;

/**
 * <pre>
 * 테크멘 기능관리 관리 Controller
 * </pre>
 *
 * @ClassName   : TechManFnMasterController.java
 * @Description : 테크멘 기능관리 관리 Controller
 * @author Yin Xueyuan
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Controller
public class TechManFnMasterController extends HController {

    /**
     * 테크멘 기능관리 마스터 서비스
     */
    @Resource(name="techManFnMasterService")
	TechManFnMasterService techManFnMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
	 * 테크멘 기능관리 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/techManFnMaster/selectTechManFnMasterMain.do", method=RequestMethod.GET)
	public String selectTechManFnMasterMain(Model model, HttpServletRequest request) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	    Device device = DeviceUtils.getCurrentDevice(request);

	    //기능유형 목록
        model.addAttribute("fnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER940", null, langCd));
        //업무구분
        model.addAttribute("wrkTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER056", null, langCd));

      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
      //model.addAttribute("isTablet", device.isTablet());
      model.addAttribute("isTablet", device.isTablet()||device.isMobile());
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

		return "/ser/svi/techManFnMaster/selectTechManFnMasterMain";

	}

	/**
	 * 테크멘 기능관리 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/techManFnMaster/selectTechManFnMasters.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectTechManFnMasters(@RequestBody TechManFnMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(techManFnMasterService.selectTechManFnMasterByConditionCnt(searchVO));
        result.setData(techManFnMasterService.selectTechManFnMasterByCondition(searchVO));

        return result;

	}

    /**
     * 테크멘 기능관리 정보를 등록한다.
     * @param saveVO - 테크멘 기능관리 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/techManFnMaster/multiTechManFnMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTechManFnMasters(@Validated @RequestBody BaseSaveVO<TechManFnMasterVO> saveVO, BindingResult bindingResult) throws Exception{
        techManFnMasterService.multiTechManFnMasters(saveVO);
        return true;

    }

}