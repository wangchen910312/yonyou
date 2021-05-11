package chn.bhmc.dms.sal.svo.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.ReqTestDriveVehicleService;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSaveVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 시승차신청
 *
 * @author Bong
 * @since 2016. 3. 02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.02           Bong              최초 생성
 */

@Controller
@RequestMapping(value = "/sal/svo/testDriveVehicle")
public class ReqTestDriveVehicleController extends HController {

    /**
     * 시승차량 신청 서비스
     */
    @Resource(name="reqTestDriveVehicleService")
    private ReqTestDriveVehicleService reqTestDriveVehicleService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;


    /**
     * 시승차량 신청 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectReqTestDriveVehicleMain.do", method = RequestMethod.GET)
    public String selectReqTestDriveVehicleMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        // 상태 SAL183 : 2차 심사로 변경 [TOBE 2차 심사로 변경예정]
        model.addAttribute("approveCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL141", null, langCd));
        // 차량유형 SAL142 (시승차: N7 제외)
        model.addAttribute("tpCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, langCd));
        // 신청구분 SAL143
        model.addAttribute("reqTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL143", null, langCd));
        // 보충자료 SAL147
        model.addAttribute("fileYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL147", null, langCd));
        // 합격여부 SAL148
        model.addAttribute("evalRsltYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL148", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/svo/testDriveVehicle/selectReqTestDriveVehicleMain";
    }

    /**
     * 시승차량 신청 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectReqTestDriveVehicle.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReqTestDriveVehicle(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(reqTestDriveVehicleService.selectReqTestDriveVehicleByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(reqTestDriveVehicleService.selectReqTestDriveVehicleByCondition(searchVO));
        }

        return result;
    }


    /**
     * 구원차/대부차 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectReqTestDriveVehiclePopup.do", method = RequestMethod.GET)
    public String selectReqTestDriveVehiclePopup(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 차량유형 SAL142 (시승차: N7)
        model.addAttribute("tpCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, langCd));

        // 합격여부 SAL148
        model.addAttribute("evalRsltYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL148", null, langCd));


        return "/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopup";
    }

    /**
     * 구원차/대부차신청 팝업 내용조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectReqTestDriveVehiclePopupContain.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReqTestDriveVehiclePopupContain(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupContainCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupContain(searchVO));
        }

        return result;
    }


    /**
     * 시승차량 신청 팝업 차량유형 설명조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectReqTestDriveVehiclePopupCont.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReqTestDriveVehiclePopupCont(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupContsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupContsByCondition(searchVO));
        }
        return result;
    }




    /**
     * 구원차/대부차신청 팝업 차량정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectReqTestDriveVehiclePopupCars.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReqTestDriveVehiclePopupCars(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupCarsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupCarsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 시승차량 신청 팝업 심사정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectReqTestDriveVehiclePopupEvls.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReqTestDriveVehiclePopupEvls(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupEvlsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(reqTestDriveVehicleService.selectReqTestDriveVehiclePopupEvlsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 시승차 이전 내역
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectTestDriveBeforDtContain.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveBeforDtContain(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        if(searchVO.getsDlrCd() == null || "".equals(searchVO.getsDlrCd()) ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        }

        result.setData(reqTestDriveVehicleService.selectTestDriveBeforDtContain(searchVO));
        return result;
    }

    /**
     * 모델 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCarPopupEvls(@RequestBody CarInfoSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }

        return result;
    }

    /**
     * OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody CarInfoSearchVO searchVO) throws Exception{
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 시승차량신청 팝업 저장
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/multiReqTestDriveVehiclePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiReqTestDriveVehiclePopup(@Validated @RequestBody ReqTestDriveVehicleSaveVO saveVO) throws Exception {
        return reqTestDriveVehicleService.multiReqTestDriveVehiclePopups(saveVO);
    }

    /**
     * 시승차량신청 팝업 2차심사요청 저장
     */
    @RequestMapping(value = "/secondSaveReqTestDriveVehiclePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public int secondSaveReqTestDriveVehiclePopup(@Validated @RequestBody ReqTestDriveVehicleVO saveVO) throws Exception {
        return reqTestDriveVehicleService.secondSaveReqTestDriveVehiclePopup(saveVO);
    }

    /**
     * 시승차량신청 팝업 확정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/confirmReqTestDriveVehiclePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmReqTestDriveVehiclePopup(@Validated @RequestBody ReqTestDriveVehicleSearchVO confirmVO) throws Exception {
        reqTestDriveVehicleService.confirmReqTestDriveVehicle(confirmVO);
        return true;
    }


    /**
     * 시승차량신청 팝업 삭제
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/deleteReqTestDriveVehiclePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteReqTestDriveVehiclePopup(@Validated @RequestBody ReqTestDriveVehicleSearchVO deleteVO) throws Exception {

        reqTestDriveVehicleService.deleteReqTestDriveVehicle(deleteVO);
        return true;
    }
}
