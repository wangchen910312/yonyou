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
import chn.bhmc.dms.ser.svi.service.PDIChkAtcService;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcSearchVO;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcVO;

/**
 * <pre>
 * PDI점검항목 관리 Controller
 * </pre>
 *
 * @ClassName   : PDIChkAtcController.java
 * @Description : PDI점검항목 관리 Controller
 * @author Yin Xueyuan
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Controller
public class PDIChkAtcController extends HController {

    /**
     * PDI점검항목 마스터 서비스
     */
    @Resource(name="pDIChkAtcService")
	 PDIChkAtcService pDIChkAtcService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
	 * PDI점검항목 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/pDIChkAtc/selectPDIChkAtcMain.do", method=RequestMethod.GET)
	public String selectPDIChkAtcMain(Model model) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	    //분류유형 목록
        model.addAttribute("carTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER910", null, langCd));
        //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER904", null, langCd));
        //분류유형 목록
        model.addAttribute("carChkCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER960", null, langCd));

		return "/ser/svi/pDIChkAtc/selectPDIChkAtcMain";

	}

	/**
	 * PDI점검항목 리스트
	 * @param
	 * @return SearchResult
	 */
	@RequestMapping(value = "/ser/svi/pDIChkAtc/selectPDIChkAtcs.do", method = RequestMethod.POST)
	@ResponseBody
	public SearchResult selectPDIChkAtcs(@RequestBody PDIChkAtcSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(pDIChkAtcService.selectPDIChkAtcByConditionCnt(searchVO));
        result.setData(pDIChkAtcService.selectPDIChkAtcByCondition(searchVO));

        return result;

	}

    /**
     * PDI점검항목  정보를 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/pDIChkAtc/insertPDIChkAtc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertPDIChkAtc(@Validated @RequestBody PDIChkAtcVO pDIChkAtcVO) throws Exception{

        pDIChkAtcService.insertPDIChkAtc(pDIChkAtcVO);

        return true;
    }

    /**
     * PDI점검항목  정보를 삭제한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/pDIChkAtc/deletePDIChkAtc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deletePDIChkAtc(@Validated @RequestBody PDIChkAtcVO pDIChkAtcVO) throws Exception{

        pDIChkAtcService.deletePDIChkAtc(pDIChkAtcVO);

        return true;
    }

    /**
     * PDI점검항목  정보를 수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/pDIChkAtc/updatePDIChkAtc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updatePDIChkAtc(@Validated @RequestBody PDIChkAtcVO pDIChkAtcVO) throws Exception{

        pDIChkAtcService.updatePDIChkAtc(pDIChkAtcVO);

        return true;
    }

}