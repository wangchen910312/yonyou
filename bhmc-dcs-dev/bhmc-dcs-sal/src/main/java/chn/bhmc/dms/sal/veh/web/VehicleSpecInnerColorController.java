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
import chn.bhmc.dms.sal.veh.vo.VehicleColorSearchVO;



/**
 * VehicleSpec 내장색 관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.11         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class VehicleSpecInnerColorController extends HController {
    /**
     * 차량 서비스
     */
    @Resource(name="vehicleSpecInnerColorService")
    VehicleSpecInnerColorService vehicleSpecInnerColorService;

    /**
     * VehicleSpec Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecInnerColorMain.do", method = RequestMethod.GET)
    public String selectVehicleSpecInnerColorMain(Model model) throws Exception {

        VehicleColorSearchVO searchVO = new VehicleColorSearchVO();
        model.addAttribute("intColorNames", vehicleSpecInnerColorService.selectVehicleInnerColorByCondition(searchVO));


        return "/sal/veh/vehicleSpec/selectVehicleSpecInnerColorMain";
    }


    /**
     * Vehicle 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecInnerColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecInnerColor(@RequestBody VehicleColorSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleSpecInnerColorService.selectVehicleInnerColorByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleSpecInnerColorService.selectVehicleInnerColorByCondition(searchVO));
        }

        return result;
    }


}
