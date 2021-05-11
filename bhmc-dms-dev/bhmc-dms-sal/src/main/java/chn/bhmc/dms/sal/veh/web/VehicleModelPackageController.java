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
import chn.bhmc.dms.sal.veh.service.VehicleModelPackageService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;



/**
 * 차량 모델 패키지 OCN 및 OCN 옵션 구성정보 (조회)
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
public class VehicleModelPackageController extends HController {

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 모델 패키지 서비스
     */
    @Resource(name="vehicleModelPackageService")
    VehicleModelPackageService vehicleModelPackageService;

    /**
     * 차량 모델 패키지  Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/modelPackage/selectModelPackageMain.do", method = RequestMethod.GET)
    public String selectModelPackageMain(Model model) throws Exception{

        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");

        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        return "/sal/veh/modelPackage/modelPackageMain";
    }


    /**
     * 차량 OCN 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleModelPackageVO
     * @return
     */
    @RequestMapping(value = "/modelPackage/selectModelPackageOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModelPackageOcn(@RequestBody VehicleModelPackageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vehicleModelPackageService.selectVehicleOcn(searchVO));

        return result;
    }

    /**
     * 차량 OCN의 옵션 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleModelPackageVO
     * @return
     */
    @RequestMapping(value = "/modelPackage/selectModelPackageOcnOption.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModelPackageOcnOption(@RequestBody VehicleModelPackageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vehicleModelPackageService.selectVehicleOcnOption(searchVO));

        return result;
    }
}
