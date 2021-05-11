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
import chn.bhmc.dms.ser.svi.service.DcMasterService;
import chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterVO;

/**
 * <pre>
 * 할인 관리 Controller
 * </pre>
 *
 * @ClassName   : DcMasterController.java
 * @Description : 할인 관리 Controller
 * @author Yin Xueyuan
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Controller
public class DcMasterController extends HController {

    /**
     * 할인관리 마스터 서비스
     */
    @Resource(name="dcMasterService")
    DcMasterService dcMasterService;

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

	/**
	 * 할인관리 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/dcMaster/selectDcMasterMain.do", method=RequestMethod.GET)
	public String selectTechManFnMasterMain(Model model) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();

	     //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
         //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER904", null, langCd));
		return "/ser/svi/dcMaster/selectDcMasterMain";

	}


    /**
     * 할인관리 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/dcMaster/selectDcMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcMasters(@RequestBody DcMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(dcMasterService.selectDcMasterByConditionCnt(searchVO));
        result.setData(dcMasterService.selectDcMasterByCondition(searchVO));

        return result;

    }

    /**
     * 할인관리  정보를 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/dcMaster/insertDcMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertDcMaster(@Validated @RequestBody DcMasterVO dcMasterVO) throws Exception{

        dcMasterService.insertDcMaster(dcMasterVO);

        return true;
    }

    /**
     * 할인관리  정보를 삭제한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/dcMaster/deleteDcMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteDcMaster(@Validated @RequestBody DcMasterVO dcMasterVO) throws Exception{

        dcMasterService.deleteDcMaster(dcMasterVO);

        return true;
    }

    /**
     * 할인관리  정보를 수정한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/dcMaster/updateDcMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateDcMaster(@Validated @RequestBody DcMasterVO dcMasterVO) throws Exception{

        dcMasterService.updateDcMaster(dcMasterVO);

        return true;
    }


}