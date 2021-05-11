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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.LocalOptionPriceService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceVO;



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
 *   2016.01.11         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/localOptionPrice")
public class LocalOptionPriceController extends HController {

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 차량,모델,옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;



    /**
     * 로컬옵션가격정보 서비스
     */
    @Resource(name="localOptionPriceService")
    LocalOptionPriceService localOptionPriceService;

    /**
     * LocalOptionPrice Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLocalOptionPriceMain.do", method = RequestMethod.GET)
    public String selectLocalOptionPriceMain(Model model) throws Exception {

        // 검색일자
        String sysDate     = DateUtil.getDate("yyyy-MM-dd");
        String oneDay = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 전체차종 조회
        //VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        //vehicleSearchVO.setUseYn("Y");
        //model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        // 모델별 로컬옵션 맵핑  Table의 등록되어 사용중인 차종만 가져옴.
        CarInfoSearchVO mappingCarVO = new CarInfoSearchVO();
        mappingCarVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        mappingCarVO.setOptionTp("L");                    // 로컬옵션 코드
        model.addAttribute("carLineCdInfo", carInfoService.selectLocalMappingCarListsByCondition(mappingCarVO));

        // 로컬옵션코드 리스트
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setOptionTp("L");       // 로컬옵션 코드
        model.addAttribute("salesOptionList", carInfoService.selectOptionListsByCondition(carInfoSearchVO));

        return "/sal/veh/localOptionPrice/selectLocalOptionPriceMain";
    }

    /**
     * 모델별 로컬옵션 맵핑 Table의 등록된 차종들의 모델 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CarInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectLocalMappingModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocalMappingModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setOptionTp("L");                    // 로컬옵션 코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectLocalMappingModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectLocalMappingModelListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 모델별 로컬옵션 맵핑 Table의 등록된 차종-모델들의 옵션 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CarInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectLocalMappingOption.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocalMappingOption(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setOptionTp("L");                    // 로컬옵션 코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectLocalMappingOptionListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectLocalMappingOptionListsByCondition(searchVO));
        }

        return result;
    }


    /**
     * LocalOptionPrice 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectLocalOptionPrices.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocalOptionPrices(@RequestBody LocalOptionPriceSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(localOptionPriceService.selectLocalOptionPricesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(localOptionPriceService.selectLocalOptionPricesByCondition(searchVO));
        }

        return result;
    }


    /**
     * 등록한다.
     * @param saveVO - 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiLocalOptionPrices.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLocalOptionPrices(@Validated @RequestBody BaseSaveVO<LocalOptionPriceVO> saveVO, BindingResult bindingResult) throws Exception{
        localOptionPriceService.multiLocalOptionPrices(saveVO);
        return true;

    }



    /**
     * LocalOption (Popup) Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLocalOptionPricePopupMain.do", method = RequestMethod.GET)
    public String selectLocalOptionPopupMain(Model model) throws Exception{
        return "/sal/veh/localOptionPrice/selectLocalOptionPricePopupMain";
    }

    /**
     * 로컬옵션의 상품리스트 조회 [팝업용]
     * 모델별로 로컬옵션들의 가격 조회
     */
    @RequestMapping(value = "/selectLocalOptionPricePopupLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocalOptionPricePopupLists(@RequestBody LocalOptionPriceSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(localOptionPriceService.selectLocalOptionPriceListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(localOptionPriceService.selectLocalOptionPriceListsByCondition(searchVO));
        }

        return result;
    }



}
