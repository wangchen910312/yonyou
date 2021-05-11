package chn.bhmc.dms.mob.sal.stm.web;


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
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.stm.service.CorporateAvailabilityService;
import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilitySearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

/**
 * BTO 주문생성(C.R.U.D)
 *
 * @author Park Sung sin
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16         Park Sung sin            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/stm/corporateAvailability")
public class MobCorporateAvailabilityController extends HController {

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 법인재고현황 서비스
     */
    @Resource(name="corporateAvailabilityService")
    CorporateAvailabilityService corporateAvailabilityService;

    /**
     * 법인 재고현황 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCorporateAvailabilityMain.do", method = RequestMethod.GET)
    public String selectCorPorateAvailabilityMain(Model model) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy/MM");
        //String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("sysDate", sysDate);

        //하치장
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, LocaleContextHolder.getLocale().getLanguage()));

        //차종 콤보 조회
        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");
        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        return "/mob/sal/stm/corporateAvailability/selectCorporateAvailabilityMain";
    }

    /**
     * 법인 재고현황 리스트 조회
     * @return
     */
    @RequestMapping(value = "/selectCorporateAvailabilityList.do", method = RequestMethod.GET)
    public String selectCorporateAvailabilityList(Model model) throws Exception{
        return "/mob/sal/stm/corporateAvailability/selectCorporateAvailabilityList";
    }


    /**
     * 법인 재고 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CorporateAvaliabilitySearchVO
     * @return
     */
    @RequestMapping(value = "/selectCorporateAvailability.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCorporateAvailability(@RequestBody CorporateAvailabilitySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(corporateAvailabilityService.selectCorporateAvailabilityByCondition(searchVO));

        return result;
    }


}
