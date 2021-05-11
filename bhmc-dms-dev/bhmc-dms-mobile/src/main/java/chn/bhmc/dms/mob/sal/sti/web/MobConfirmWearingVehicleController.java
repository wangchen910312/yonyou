package chn.bhmc.dms.mob.sal.sti.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.veh.service.CarInfoService;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.sti.service.ConfirmWearingVehicleService;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSaveVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

/**
 * 완성차 입고확정(C.U)
 *
 * @author Bong
 * @since 2016. 3. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.14         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/sti/confirmWearingVehicle")
public class MobConfirmWearingVehicleController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 완성차 입고확정 서비스
     */
    @Resource(name="confirmWearingVehicleService")
    ConfirmWearingVehicleService confirmWearingVehicleService;
    
    /**
     * 차량 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 완성차 입고확정 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectConfirmWearingVehicleMain.do", method = RequestMethod.GET)
    public String selectConfirmWearingVehicleMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //오더유형
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));
        //하치장
        model.addAttribute("carDumpCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));
        //차량상태
        model.addAttribute("carStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));

        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String toDay        = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", toDay);
        model.addAttribute("oneDay", oneDay);

        //자금유형구분
        model.addAttribute("usedAmtTypeInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL191", null, langCd));

        //차종 콤보 조회
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleMain";
    }


    /**
     * 완성차 입고확정 목록
     * @return
     */
    @RequestMapping(value = "/selectConfirmWearingVehicleList.do", method = RequestMethod.GET)
    public String selectConfirmWearingVehicleList(Model model)  throws Exception  {

        return "/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleList";
    }


    /**
     * 완성차 입고 대상 목록
     * @return
     */
    @RequestMapping(value = "/selectConfirmWearingVehicleSelList.do", method = RequestMethod.GET)
    public String selectConfirmWearingVehicleSelList(Model model)  throws Exception  {

        return "/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleSelList";
    }
    
    
    /**
     * 완성차입고대상 토탈
     * @return
     */
    @RequestMapping(value = "/selectConfirmWearingVehicleTotalList.do", method = RequestMethod.GET)
    public String selectConfirmWearingVehicleTotalList(Model model)  throws Exception  {

        return "/mob/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicleTotalList";
    }



























    /**
     * ConfirmWearingVehicle 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ConfirmWearingVehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectConfirmWearingVehicle.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectConfirmWearingVehicle(@RequestBody ConfirmWearingVehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());      // 딜러코드 원래 빠져있었음 khs

        result.setTotal(confirmWearingVehicleService.selectConfirmWearingVehicleByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(confirmWearingVehicleService.selectConfirmWearingVehicleByCondition(searchVO));
        }

        return result;
    }

    /**
     * 입고확정 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectConfirmWearingVehiclePopupMain.do", method = RequestMethod.GET)
    public String selectConfirmWearingVehiclePopup(Model model) throws Exception{


        return "/mob/sal/sti/confirmWearingVehicle/ConfirmWearingVehiclePopup";
    }

    /**
     * 완성차 입고확정 및 확정취소 처리를 한다.
     * @param saveVO - 수정 목록을 포함하는 ConfirmWearingVehicleSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/updateConfirmWearingVehicle.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateConfirmWearingVehicle(@Validated @RequestBody ConfirmWearingVehicleSaveVO saveVO) throws Exception {
        for(ConfirmWearingVehicleVO confirmWearingVehicleVO : saveVO.getUpdateList()){
            confirmWearingVehicleService.updateConfirmWearingVehicle(confirmWearingVehicleVO, saveVO);
        }
        return true;

    }

    /**
     * 입고확정 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ConfirmWearingVehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectConfirmWearingVehiclePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectConfirmWearingVehiclePopup(@RequestBody ConfirmWearingVehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setData(confirmWearingVehicleService.selectConfirmWearingVehiclePopup(searchVO));

        return result;
    }



    /**
     * 완성차 입고 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     * @param PurcEvalSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/retVehicleInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult retVehicleInfo(@RequestBody ConfirmWearingVehicleSearchVO saveVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(confirmWearingVehicleService.retVehicleInfosByCondition(saveVO));

        return result;

    }


}
