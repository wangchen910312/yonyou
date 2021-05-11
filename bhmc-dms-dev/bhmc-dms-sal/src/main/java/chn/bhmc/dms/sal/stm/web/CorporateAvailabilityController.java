package chn.bhmc.dms.sal.stm.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.stm.service.CorporateAvailabilityService;
import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilitySearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 법인재고현황
 *
 * @author Kim Jin Suk
 * @since 2016. 8. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.08.16         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/stm/corporateAvailability")
public class CorporateAvailabilityController extends HController {

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 법인재고현황 서비스
     */
    @Resource(name="corporateAvailabilityService")
    CorporateAvailabilityService corporateAvailabilityService;

    /**
     * 법인 재고현황 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCorporateAvailabilityMain.do", method = RequestMethod.GET)
    public String selectCorPorateAvailabilityMain(Model model) throws Exception {

        //하치장
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/stm/corporateAvailability/selectCorporateAvailabilityMain";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        //searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 차종과 모델에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody CarInfoSearchVO searchVO) throws Exception{

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 법인 재고 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CorporateAvaliabilitySearchVO
     * @return
     */
    @RequestMapping(value = "/selectCorporateAvailability.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCorporateAvailability(@RequestBody CorporateAvailabilitySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(corporateAvailabilityService.selectCorporateAvailabilityByCondition(searchVO));

        return result;
    }


}
