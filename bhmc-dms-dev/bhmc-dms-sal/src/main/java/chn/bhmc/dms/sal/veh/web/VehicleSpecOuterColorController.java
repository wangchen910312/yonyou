package chn.bhmc.dms.sal.veh.web;


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
import chn.bhmc.dms.sal.veh.service.VehicleSpecOuterColorService;
import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;



/**
 * VehicleSpec 외장색 관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.19         Kime ye won         최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class VehicleSpecOuterColorController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 외장색 관리
     */
    @Resource(name="vehicleSpecOuterColorService")
    VehicleSpecOuterColorService vehicleSpecOuterColorService;

    /**
     * VehicleSpec OuterColor Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecOuterColorMain.do", method = RequestMethod.GET)
    public String selectVehicleSpecOuterColorMain(Model model) throws Exception {

        VehicleColorSearchVO searchVO = new VehicleColorSearchVO();
        model.addAttribute("extColorNames", vehicleSpecOuterColorService.selectOuterColorByCondition(searchVO));

        //색상유형 공통코드 목록
        model.addAttribute("colorTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL123", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/veh/vehicleSpec/selectVehicleSpecOuterColorMain";
    }


    /**
     * VehicleSpec OuterColor 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecOuterColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecOuterColor(@RequestBody VehicleColorSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleSpecOuterColorService.selectOuterColorByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleSpecOuterColorService.selectOuterColorByCondition(searchVO));
        }

        return result;
    }


}
