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
import chn.bhmc.dms.ser.svi.service.SubBpMasterService;
import chn.bhmc.dms.ser.svi.vo.SubBpMasterSaveVO;
import chn.bhmc.dms.ser.svi.vo.SubBpMasterSearchVO;

/**
 * <pre>
 * 외주거래처 관리 Controller
 * </pre>
 *
 * @ClassName   : SubBpMasterController.java
 * @Description : 외주거래처 관리 Controller
 * @author Yin Xueyuan
 * @since 2016. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 24.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Controller
public class SubBpMasterController extends HController {

    /**
     * 외주거래처 마스터 서비스
     */
    @Resource(name="subBpMasterService")
	SubBpMasterService subBpMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
	 * 외주거래처 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/subBpMaster/selectSubBpMasterMain.do", method=RequestMethod.GET)
	public String selectSubBpMasterMain(Model model) throws Exception {
	    //사용여부
        model.addAttribute("roTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, LocaleContextHolder.getLocale().getLanguage()));
		return "/ser/svi/subBpMaster/selectSubBpMasterMain";

	}

	/**
	 * 외주거래처 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/subBpMaster/selectSubBpMasters.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectSubBpMasters(@RequestBody SubBpMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(subBpMasterService.selectSubBpMasterByConditionCnt(searchVO));
        result.setData(subBpMasterService.selectSubBpMasterByCondition(searchVO));

        return result;

	}

    /**
     * 외주거래처 정보를 등록한다.
     * @param saveVO - 외주거래처 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/subBpMaster/multiSubBpMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSubBpMasters(@Validated @RequestBody SubBpMasterSaveVO saveVO) throws Exception{
        subBpMasterService.multiSubBpMasters(saveVO);
        return true;

    }

}