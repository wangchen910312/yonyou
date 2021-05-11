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
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;



/**
 * VehicleSpec 차종 관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 19
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.19         Kim ye  won            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class VehicleSpecCarlineController extends HController {

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
     * VehicleSpec Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecCarlineMain.do", method = RequestMethod.GET)
    public String selectVehicleSpecCarlineMain(Model model) throws Exception {

        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        model.addAttribute("carlineNames", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        //승/상용 공통코드 목록
        model.addAttribute("pcDstinTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/veh/vehicleSpec/selectVehicleSpecCarlineMain";
    }


    /**
     * VehicleSpec 차종목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecCarline.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecCarline(@RequestBody VehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleSpecCarlineService.selectVehicleCarlineByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleSpecCarlineService.selectVehicleCarlineByCondition(searchVO));
        }

        return result;
    }


}
