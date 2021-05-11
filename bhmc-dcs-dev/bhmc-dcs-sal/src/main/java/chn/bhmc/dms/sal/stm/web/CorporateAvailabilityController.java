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
import chn.bhmc.dms.sal.stm.service.CorporateAvailabilityService;
import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilitySearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

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
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    //@Resource(name="carInfoService")
    //CarInfoService carInfoService;


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
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/stm/corporateAvailability/selectCorporateAvailabilityMain";
    }

    /**
     * 차관콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectModelTypeCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFscList(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectModelTypeCombo(searchVO));
        return result;
    }


    /**
     * OCN콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectOcnCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFscOcnList(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectOcnCombo(searchVO));
        return result;
    }

    /**
     * 외색콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectExtColorCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNewCarLooksExtClrListByCondition(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectExtColorCombo(searchVO));
        return result;
    }

    /**
     * 내색콤보에 넣을 데이터를 검색한다.
     */
    @RequestMapping(value = "/selectIntColorCombo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNewCarLooksIntClrListByCondition(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectIntColorCombo(searchVO));
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
