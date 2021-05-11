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
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecModelOcnPriceService;
import chn.bhmc.dms.sal.veh.vo.VehicleModelPackageSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;



/**
 * VehicleSpec 모델OCN price 관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  -------------   ------------    ---------------------------
 *   2016.01.22       Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class VehicleSpecModelOcnPriceController extends HController {

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 차량 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;


    /**
     * 모델별 OCN PRICE 서비스
     */
    @Resource(name="vehicleSpecModelOcnPriceService")
    VehicleSpecModelOcnPriceService vehicleSpecModelOcnPriceService;

    /**
     * 모델 패키지 서비스
     */
    @Resource(name="vehicleModelPackageService")
    VehicleModelPackageService vehicleModelPackageService;


    /**
     * VehicleSpec Model Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelOcnPriceMain.do", method = RequestMethod.GET)
    public String selectVehicleSpecModelOcnPriceMain(Model model) throws Exception {

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/veh/vehicleSpec/selectVehicleSpecModelOcnPriceMain";
    }


    /**
     * VehicleSpec Model 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelOcnPrice.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecModelOcnPrice(@RequestBody VehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleSpecModelOcnPriceService.selectVehicleModelOcnPriceCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleSpecModelOcnPriceService.selectVehicleModelOcnPrice(searchVO));
        }

        return result;
    }

    /**
     * 차량 OCN의 옵션 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelOcnOption.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModelPackageOcnOption(@RequestBody VehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        VehicleModelPackageSearchVO mpSearchVO = new VehicleModelPackageSearchVO();
        mpSearchVO.setsModelCd(searchVO.getModelCd());
        mpSearchVO.setsOcnCd(searchVO.getOcnCd());
        mpSearchVO.setSort(searchVO.getSort());

        result.setData(vehicleModelPackageService.selectVehicleOcnOption(mpSearchVO));

        return result;
    }



    /**
     * 차량 OCN의 외색 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelOcnExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecModelOcnExtColor(@RequestBody VehicleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(vehicleSpecModelOcnPriceService.selectVehicleSpecModelOcnExtColorCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(vehicleSpecModelOcnPriceService.selectVehicleSpecModelOcnExtColor(searchVO));
        }

        return result;
    }

   /**
    * 차량 OCN의 외색 데이터를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
    * @return
    */
   @RequestMapping(value = "/selectVehicleSpecModelOcnIntColor.do", method = RequestMethod.POST)
   @ResponseBody
   public SearchResult selectVehicleSpecModelOcnIntColor(@RequestBody VehicleSearchVO searchVO) throws Exception {

       SearchResult result = new SearchResult();

       result.setTotal(vehicleSpecModelOcnPriceService.selectVehicleSpecModelOcnIntColorCnt(searchVO));
       if(result.getTotal() != 0){
           result.setData(vehicleSpecModelOcnPriceService.selectVehicleSpecModelOcnIntColor(searchVO));
       }
       return result;
   }


}
