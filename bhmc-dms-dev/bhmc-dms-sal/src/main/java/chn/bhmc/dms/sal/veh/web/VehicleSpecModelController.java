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
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecModelService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;



/**
 * VehicleSpec 모델 관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  -------------   ------------    ---------------------------
 *   2016.01.19       Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class VehicleSpecModelController extends HController {
    /**
     * 모델 서비스
     */
    @Resource(name="vehicleSpecModelService")
    VehicleSpecModelService vehicleSpecModelService;

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
     * VehicleSpec Model Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelMain.do", method = RequestMethod.GET)
    public String selectVehicleSpecModelMain(Model model) throws Exception {

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //승/상용 공통코드 목록
        model.addAttribute("pcDstinTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, LocaleContextHolder.getLocale().getLanguage()));


        return "/sal/veh/vehicleSpec/selectVehicleSpecModelMain";
    }


    /**
     * VehicleSpec Model 차량모델 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecModel(@RequestBody VehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleSpecModelService.selectVehicleModelByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleSpecModelService.selectVehicleModelByCondition(searchVO));
        }

        return result;
    }


    /**
     * VehicleSpec Model 차량모델 목록 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecModelList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecModelList(@RequestBody VehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(vehicleSpecModelService.selectVehicleModelListByCondition(searchVO));

        return result;
    }


}
