package chn.bhmc.dms.sal.veh.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.LocalOptionMappingService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;



/**
 * 로컬옵션가격정보 관리(조회)
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.22         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/localOptionMapping")
public class LocalOptionMappingController extends HController {

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 로컬옵션-모델맵핑정보 서비스
     */
    @Resource(name="localOptionMappingService")
    LocalOptionMappingService localOptionMappingService;

    /**
     * 차량,모델,옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * LocalOptionMapping Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLocalOptionMappingMain.do", method = RequestMethod.GET)
    public String selectLocalOptionMappingMain(Model model) throws Exception {

        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");
        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        // 로컬옵션코드 리스트
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setOptionTp("L");       // 로컬옵션 코드
        model.addAttribute("salesOptionList", carInfoService.selectOptionListsByCondition(carInfoSearchVO));

        return "/sal/veh/localOptionMapping/selectLocalOptionMappingMain";
    }


    /**
     * LocalOptionMapping 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectLocalOptionMappings.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocalOptionMappings(@RequestBody LocalOptionMappingSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(localOptionMappingService.selectLocalOptionMappingsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(localOptionMappingService.selectLocalOptionMappingsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 등록한다.
     * @param saveVO - 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiLocalOptionMappings.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLocalOptionMappings(@Validated @RequestBody BaseSaveVO<LocalOptionMappingVO> saveVO, BindingResult bindingResult) throws Exception{
        localOptionMappingService.multiLocalOptionMappings(saveVO);
        return true;

    }


}
