package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.DcMasterService;
import chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterVO;
import chn.bhmc.dms.ser.svi.vo.DcSaveVO;

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
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

	/**
	 * 할인관리 메인
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/ser/svi/dcMaster/selectDcMasterMain.do", method=RequestMethod.GET)
	public String selectTechManFnMasterMain(Model model, HttpServletRequest request) throws Exception {

	    String langCd = LocaleContextHolder.getLocale().getLanguage();
	    String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
	    
	    Device device = DeviceUtils.getCurrentDevice(request);
	    
	    model.addAttribute("today", DateUtil.getDate(dateFormat));

	     //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
         //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
         //할인구분
        model.addAttribute("dcDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        //할인대상구분
        model.addAttribute("dcPermTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER922", null, langCd));
        
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

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
        if(result.getTotal() != 0){
            result.setData(dcMasterService.selectDcMasterByCondition(searchVO));
        }

        return result;

    }

    /**
     * 할인관리대상  리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/dcMaster/selectDcMastersAuths.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcMastersAuths(@RequestBody DcMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(dcMasterService.selectDcAuthByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(dcMasterService.selectDcAuthByCondition(searchVO));
        }

        return result;

    }

    /**
     * 할인관리 상세 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/dcMaster/selectDcDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDcDetails(@RequestBody DcMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(dcMasterService.selectDcDetailByConditionCnt(searchVO));

        if(result.getTotal() !=0 ){
            result.setData(dcMasterService.selectDcDetailByCondition(searchVO));
        }


        return result;

    }

    /**
     * 할인관리  정보를 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/dcMaster/multiDcMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiDcMasters(@Validated @RequestBody DcSaveVO saveVO) throws Exception{

        return dcMasterService.multiDcMasters(saveVO);
    }

    /**
     * 할인관리  정보를 등록한다.(부품전용)
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/dcMaster/multiDcMastersForParts.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiDcMastersForParts(@Validated @RequestBody DcSaveVO saveVO) throws Exception{

        return dcMasterService.multiDcMastersForParts(saveVO);
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

    /**
     * 할인관리  직원정보를 등록한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/dcMaster/multiDcDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiDcDetails(@Validated @RequestBody DcSaveVO saveVO) throws Exception{

        return dcMasterService.multiDcDetails(saveVO);
    }

    /**
     * 기타할인 대상 리스트를 가져온다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/svi/dcMaster/selectEtcDcTarget.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectEtcDcTarget(@RequestBody DcMasterSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        result.setTotal(dcMasterService.selectEtcDcTargetByConditionCnt(searchVO));

        if(result.getTotal() !=0 ){
            result.setData(dcMasterService.selectEtcDcTargetByCondition(searchVO));
        }
        return result;

    }

    /**
     * 부품할인관리대상 최대할인률 정보
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/dcMaster/selectParMaxDcRate.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectParMaxDcRate(@RequestBody DcMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUserId(LoginUtil.getUserId());

        result.setTotal(dcMasterService.selectDcAuthByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(dcMasterService.selectParMaxDcRateByCondition(searchVO));
        }

        return result;

    }

}