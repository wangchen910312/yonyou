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
import chn.bhmc.dms.sal.veh.service.LocalOptionService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionVO;

/**
 * LocalOption 관리(C.R.U.D)
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class LocalOptionController extends HController {

    /**
     * 로컬옵션 서비스
     */
    @Resource(name="localOptionService")
    LocalOptionService localOptionService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * LocalOption Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectLocalOptionMain.do", method = RequestMethod.GET)
    public String selectLocalOptionMain(Model model) throws Exception{
        // 셋팅 일자
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 로컬옵션코드 리스트
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setOptionTp("L");       // 로컬옵션 코드
        model.addAttribute("salesOptionList", carInfoService.selectOptionListsByCondition(carInfoSearchVO));

        return "/sal/veh/vehicleSpec/selectLocalOptionMain";
    }


    /**
     * LocalOption 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectLocalOptions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocalOptions(@RequestBody LocalOptionSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(localOptionService.selectLocalOptionsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(localOptionService.selectLocalOptionsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 등록한다.
     * @param saveVO - 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiLocalOptions.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLocalOptions(@Validated @RequestBody BaseSaveVO<LocalOptionVO> saveVO, BindingResult bindingResult) throws Exception{
        localOptionService.multiLocalOptions(saveVO);
        return true;

    }

}
