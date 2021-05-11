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
import chn.bhmc.dms.sal.veh.service.VehicleOcnService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleOcnSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;



/**
 * OCN 구성정보 (조회)
 *
 * @author Bong
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh")
public class VehicleOcnController extends HController {
    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * OCN 서비스
     */
    @Resource(name="vehicleOcnService")
    VehicleOcnService vehicleOcnService;

    /**
     * 차량 OCN 구성정보 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/ocn/selectOcnMain.do", method = RequestMethod.GET)
    public String selectOcnMain(Model model) throws Exception{

        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");

        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        return "/sal/veh/ocn/ocnMain";
    }


    /**
     * 차량 OCN 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleOcnVO
     * @return
     */
    @RequestMapping(value = "/ocn/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleOcn(@RequestBody VehicleOcnSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vehicleOcnService.selectVehicleOcn(searchVO));

        return result;
    }

    /**
     * 차량 OCN의 옵션 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleOcnVO
     * @return
     */
    @RequestMapping(value = "/ocn/selectOcnOption.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleOcnOption(@RequestBody VehicleOcnSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vehicleOcnService.selectVehicleOcnOption(searchVO));

        return result;
    }
}
