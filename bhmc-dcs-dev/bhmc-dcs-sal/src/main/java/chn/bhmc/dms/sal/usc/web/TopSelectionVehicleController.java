package chn.bhmc.dms.sal.usc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.sal.usc.service.TopSelectionService;
import chn.bhmc.dms.sal.usc.vo.TopSelectionSearchVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionVO;



/**
 * 중고차 수선시스템 - 차량정보
 *
 * @author Kim yewon
 * @since 2016.06.07
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                    수정자                               수정내용
 *  -------------    ------------    ---------------------------
 *   2016.06.07       Kim yewon             최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/topSelection")
public class TopSelectionVehicleController extends HController {


    /**
     * 중고차 수선시스템 서비스
     */
    @Resource(name="topSelectionService")
    TopSelectionService topSelectionService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 중고차수선시스템 - 차량정보  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleMain.do", method = RequestMethod.GET)
    public String selectVehicleMain(Model model,
            @Param("carId") String carId,@Param("id") String id) throws Exception {

        //차량정보
        TopSelectionSearchVO searchVO = new TopSelectionSearchVO();
        searchVO.setsCarId(carId);
        searchVO.setsId(id);
        TopSelectionVO topSelectionVO = topSelectionService.selectVehicleInfo(searchVO);

        //고객유형 SAL041
        model.addAttribute("ownerTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL041", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("topSelectionVO", topSelectionVO);
        model.addAttribute("carId", carId);
        model.addAttribute("id", id);

        return "/sal/usc/topSelection/selectVehicleMain";
    }





}
