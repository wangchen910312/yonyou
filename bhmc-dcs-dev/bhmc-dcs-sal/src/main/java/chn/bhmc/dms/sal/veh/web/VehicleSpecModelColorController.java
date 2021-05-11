package chn.bhmc.dms.sal.veh.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.veh.service.VehicleSpecInnerColorService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecModelColorService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecModelService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecOuterColorService;
import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;



/**
 * VehicleSpec 모델컬러 관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                수정내용
 *  --------------  ------------    ---------------------------
 *   2016.01.18       Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class VehicleSpecModelColorController extends HController {
    /**
     * 모델컬러 서비스
     */
    @Resource(name="vehicleSpecModelColorService")
    VehicleSpecModelColorService vehicleSpecModelColorService;

    /**
     * 모델 서비스
     */
    @Resource(name="vehicleSpecModelService")
    VehicleSpecModelService vehicleSpecModelService;

    /**
     * 외장색 서비스
     */
    @Resource(name="vehicleSpecOuterColorService")
    VehicleSpecOuterColorService vehicleSpecOuterColorService;


    /**
     * 내장색 서비스
     */
    @Resource(name="vehicleSpecInnerColorService")
    VehicleSpecInnerColorService vehicleSpecInnerColorService;



    /**
     * VehicleSpec Model Color Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelColorMain.do", method = RequestMethod.GET)
    public String selectVehicleSpecModelColorMain(Model model) throws Exception {

        VehicleSearchVO searchVO = new VehicleSearchVO();
        VehicleColorSearchVO colorSearchVO = new VehicleColorSearchVO();
        model.addAttribute("modelNames", vehicleSpecModelService.selectVehicleModelByCondition(searchVO) );
        model.addAttribute("extColorNames", vehicleSpecOuterColorService.selectOuterColorByCondition(colorSearchVO));
        model.addAttribute("intColorNames", vehicleSpecInnerColorService.selectVehicleInnerColorByCondition(colorSearchVO));

        return "/sal/veh/vehicleSpec/selectVehicleSpecModelColorMain";
    }


    /**
     * VehicleSpec ModelColor 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecModelColor(@RequestBody VehicleColorSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleSpecModelColorService.selectVehicleModelColorByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleSpecModelColorService.selectVehicleModelColorByCondition(searchVO));
        }

        return result;
    }


}
