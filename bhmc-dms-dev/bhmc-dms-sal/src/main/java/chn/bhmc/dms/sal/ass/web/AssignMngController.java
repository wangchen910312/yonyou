package chn.bhmc.dms.sal.ass.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ass.service.AssignMngService;
import chn.bhmc.dms.sal.ass.vo.AssignSearchVO;
import chn.bhmc.dms.sal.ass.vo.AssignVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * VehicleSpec 배정관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 3. 3
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.03           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/ass/vehicleAssign")
public class AssignMngController extends HController {


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;



    /**
     * 배정 서비스
     */
    @Resource(name="assignMngService")
    AssignMngService assignMngService;


    /**
     * 배정관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAssignMngMain.do", method = RequestMethod.GET)
    public String selectAssignMngMain(Model model,
            @RequestParam(value="contNo", required = false, defaultValue="") String contNo
    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 현재일자 DateUtil
        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("oneDay", DateUtil.getDate("yyyy-MM") + "-01");

        //판매유형 공통코드 목록
        model.addAttribute("contractTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //재고상태 공통코드 목록
        model.addAttribute("stockTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));
        //배정여부 SAL007 공통코드 목록
        model.addAttribute("assignList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL007", null, langCd));
        model.addAttribute("contNo", contNo);           // 계약번호로 조회

        return "/sal/ass/vehicleAssign/selectAssignMngMain";
    }


    /**
     * 배정목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAssignMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAssignMng(@RequestBody AssignSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(assignMngService.selectAssignByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(assignMngService.selectAssignByCondition(searchVO));
        }
        return result;
    }

    /**
     * 배정 팝업창 OPEN
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAssignPopup.do", method = RequestMethod.GET)
    public String selectAssignPopup(Model model) throws Exception {

        //재고상태 공통코드 목록
        model.addAttribute("stockTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/ass/vehicleAssign/selectAssignPopup";
    }



    /**
     * 배정팝업 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAssignPopupList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAssignPopupList(@RequestBody AssignSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        result.setTotal(assignMngService.selectAssignPopupListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(assignMngService.selectAssignPopupListByCondition(searchVO));
        }

        return result;
    }



    /**
     * 배정관리-배정팝업 -> 배정이벤트
     * @param <PromotionVO>
     * @param AapMngVO assignVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/vehicleAssign.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean vehicleAssign(@RequestBody AssignVO assignVO) throws Exception {
        assignVO.setRegUsrId(LoginUtil.getUserId());
        assignMngService.insertVehicleAssign(assignVO);

        return true;
    }



    /**
     * 배정관리-배정팝업 -> 배정취소 이벤트
     * @param <PromotionVO>
     * @param AapMngVO assignVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/vehicleAssignCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean vehicleAssignCancel(@RequestBody AssignVO assignVO) throws Exception {
        assignVO.setRegUsrId(LoginUtil.getUserId());
        assignMngService.cancelVehicleAssign(assignVO);

        return true;
    }



    /**
     * 차량교환 팝업창 OPEN
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehExchangePopup.do", method = RequestMethod.GET)
    public String selectVehExchangePopup(Model model) throws Exception {

        return "/sal/ass/vehicleAssign/selectVehExchangePopup";
    }



    /**
     * 차량교환
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/vehicleExchange.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean vehicleExchange(@RequestBody AssignVO assignVO) throws Exception {
        assignVO.setRegUsrId(LoginUtil.getUserId());
        assignMngService.vehicleExchange(assignVO);

        return true;
    }



    /**
     * 배정계약현황 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAssignSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAssignSts(@RequestBody AssignSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(assignMngService.selectAssignStsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(assignMngService.selectAssignStsByCondition(searchVO));
        }

        return result;
    }



    /**
     * 배정취소이력현황 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AssignSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAssignCancelSts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAssignCancelSts(@RequestBody AssignSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(assignMngService.selectAssignCancelStsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(assignMngService.selectAssignCancelStsByCondition(searchVO));
        }

        return result;
    }


}
