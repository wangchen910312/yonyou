package chn.bhmc.dms.sal.svo.web;

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

import chn.bhmc.dms.sal.cmm.service.SalesCommonService;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoSearchVO;
import chn.bhmc.dms.sal.svo.service.AskHelpCarService;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarJudgeSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupCarVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSearchVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 구원차/대부차신청
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.23         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/svo/askHelpCar")
public class AskHelpCarController extends HController {

    /**
     * 구원차/대부차 서비스
     */
    @Resource(name="askHelpCarService")
    private AskHelpCarService askHelpCarService;

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
     * BTO 서비스
     */
    @Resource(name="btoCreateOrderService")
    BtoCreateOrderService btoCreateOrderService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;

    /**
     * 구원차/대부차신청 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarMain.do", method = RequestMethod.GET)
    public String selectAskHelpCarMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }


        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 상태 SAL141
        model.addAttribute("stateTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL141", null, langCd));
        // 차량유형 SAL142 (시승차: N7 제외)
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, langCd));
        // 신청구분 SAL143
        model.addAttribute("askGubunTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL143", null, langCd));

        return "/sal/svo/askHelpCar/selectAskHelpCarMain";
    }

    /**
     * 구원차/대부차신청 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCars.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCars(@RequestBody AskHelpCarSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(askHelpCarService.selectAskHelpCarsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(askHelpCarService.selectAskHelpCarsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 구원차/대부차 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarPopup.do", method = RequestMethod.GET)
    public String selectAskHelpCarPopup(Model model) throws Exception{

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


        // 차량유형 SAL142 (시승차: N7 제외)
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/svo/askHelpCar/selectAskHelpCarPopup";
    }

    /**
     * 구원차/대부차신청 팝업 내용조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarPopupContain.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCarPopupContain(@RequestBody AskHelpCarSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(askHelpCarService.selectAskHelpCarPopupContainsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(askHelpCarService.selectAskHelpCarPopupContainsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 구원차/대부차신청 팝업 차량유형 설명조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarPopupCont.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCarPopupCont(@RequestBody AskHelpCarSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(askHelpCarService.selectAskHelpCarPopupContsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(askHelpCarService.selectAskHelpCarPopupContsByCondition(searchVO));
        }
        return result;
    }




    /**
     * 구원차/대부차신청 팝업 차량정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarPopupCars.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCarPopupCars(@RequestBody AskHelpCarSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(askHelpCarService.selectAskHelpCarPopupCarsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(askHelpCarService.selectAskHelpCarPopupCarsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 구원차/대부차신청 팝업 심사정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarPopupEvls.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCarPopupEvls(@RequestBody AskHelpCarSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(askHelpCarService.selectAskHelpCarPopupEvlsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(askHelpCarService.selectAskHelpCarPopupEvlsByCondition(searchVO));
        }
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
    public SearchResult selectOcn(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception{
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(btoCreateOrderService.selectBtoOcnListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoCreateOrderService.selectBtoOcnListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(btoCreateOrderService.selectBtoExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoCreateOrderService.selectBtoExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody BtoCarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(btoCreateOrderService.selectBtoIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(btoCreateOrderService.selectBtoIntColorListsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 구원차/대부차신청 팝업 저장
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/multiAskHelpCarPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiAskHelpCarPopup(@Validated @RequestBody AskHelpCarSaveVO saveVO) throws Exception {
        return askHelpCarService.multiAskHelpCarPopups(saveVO);
    }

    /**
     * 구원차/대부차신청 팝업 확정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/confirmAskHelpCarPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmAskHelpCarPopup(@Validated @RequestBody AskHelpCarSearchVO confirmVO) throws Exception {
        askHelpCarService.confirmAskHelpCars(confirmVO);
        return true;
    }


    /**
     * 구원차/대부차신청 팝업 삭제
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/deleteAskHelpCarPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAskHelpCarPopup(@Validated @RequestBody AskHelpCarSearchVO deleteVO) throws Exception {

        askHelpCarService.deleteAskHelpCars(deleteVO);
        return true;
    }


    /**
     * 구원차/대부차신청 차량등록 관련 서류 갱신
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateCarRegDoc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCarRegDoc(@Validated @RequestBody AskHelpCarVO updateVO) throws Exception {
        askHelpCarService.updateCarRegDoc(updateVO);
        return true;
    }

    /**
     * 구원차/대부차신청 갱신심사 서류 갱신
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateCarRcpDoc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCarRcpDoc(@Validated @RequestBody AskHelpCarVO updateVO) throws Exception {
        askHelpCarService.updateCarRcpDoc(updateVO);
        return true;
    }

    /**
     * 구원차/대부차신청 인수차량 이미지 갱신
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateCarImgDoc.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateCarImgDoc(@Validated @RequestBody AskHelpCarVO updateVO) throws Exception {
        askHelpCarService.updateCarImgDoc(updateVO);
        return true;
    }


    /**
     * 구원차/대부차심사 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarJudgeMain.do", method = RequestMethod.GET)
    public String selectAskHelpCarJudgeMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());      // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 심사상태 SAL141
        model.addAttribute("stateTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL141", null, langCd));

        // 심사여부 SAL145
        model.addAttribute("approveDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL145", null, langCd));

        // 차량유형 SAL142 (시승차: N7 제외)
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, langCd));

        // 신청구분(특수차량) SAL143
        model.addAttribute("askGubunTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL143", null, langCd));

        // 판매지역 SAL146
        model.addAttribute("distCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL146", null, langCd));

        //사업부
        model.addAttribute("sdptList", salesCommonService.selectDealerSdpt(new DealerSearchVO()));

        //로그인 사용자 심사단계
        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();
        String wrkDstinCd = "06";
        model.addAttribute("usrEvalGrade", salesCommonService.selectUserEvalGrade(dlrCd,userId,wrkDstinCd));

        return "/sal/svo/askHelpCar/selectAskHelpCarJudgeMain";
    }

    /**
     * 구원차/대부차 심사 목록 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarJudges.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCarJudges(@RequestBody AskHelpCarSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsUserId(LoginUtil.getUserId());

        result.setTotal(askHelpCarService.selectAskHelpCarJudgesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(askHelpCarService.selectAskHelpCarJudgesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구원차/대부차 심사 팝업(2) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarJudgePopup.do", method = RequestMethod.GET)
    public String selectAskHelpCarJudgePopup(Model model) throws Exception{

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);


        // 차량유형 SAL142 (시승차: N7 제외)
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/svo/askHelpCar/selectAskHelpCarJudgePopup";
    }

    /**
     * 구원차/대부차 심사 팝업(2) 내용조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectAskHelpCarJudgePopupContain.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAskHelpCarJudgePopupContain(@RequestBody AskHelpCarSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        searchVO.setsUserId(LoginUtil.getUserId());

        result.setTotal(askHelpCarService.selectAskHelpCarJudgePopupContainCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(askHelpCarService.selectAskHelpCarJudgePopupContain(searchVO));
        }

        return result;
    }


    /**
     * 구원차/대부차 - 정책입력 팝업(1) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPolicyInputPopup.do", method = RequestMethod.GET)
    public String selectPolicyInputPopup(Model model) throws Exception{
        // 차량유형 SAL142 (시승차: N7 제외)
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/svo/askHelpCar/selectPolicyInputPopup";
    }

    /**
     * 구원차/대부차신청 팝업 차량유형 - 정책입력
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/confirmPolicyInputPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmPolicyInputPopup(@RequestBody AskHelpCarPopupCarVO saveVO) throws Exception {
        askHelpCarService.confirmPolicyInputPopup(saveVO);
        return true;
    }

    /**
     * 구원차/대부차 심사 팝업 확정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/confirmAskHelpCarJudgePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmAskHelpCarJudgePopup(@Validated @RequestBody AskHelpCarJudgeSaveVO confirmVO) throws Exception {
        askHelpCarService.confirmAskHelpCarJudge(confirmVO);
        return true;
    }

}
