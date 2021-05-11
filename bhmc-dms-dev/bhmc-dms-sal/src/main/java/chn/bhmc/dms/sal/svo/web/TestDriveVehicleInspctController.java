package chn.bhmc.dms.sal.svo.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.TestDriveVehicleInspctService;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupCarVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.TestDriveVehicleInspctSaveVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 구원차/대부차신청
 *
 * @author Bong
 * @since 2016. 3. 02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.02         Bong              최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/svo/testDriveVehicle")
public class TestDriveVehicleInspctController extends HController {

    /**
     * 시승차량 신청 서비스
     */
    @Resource(name="testDriveVehicleInspctService")
    TestDriveVehicleInspctService testDriveVehicleInspctService;

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
     * 시승차량 심사 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveVehicleInspctMain.do", method = RequestMethod.GET)
    public String selectTestDriveVehicleInspctMain(Model model) throws Exception{

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

        // 심사상태 SAL141
        model.addAttribute("stateTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL141", null, langCd));

        // 차량유형 SAL142
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, langCd));

        // 신청구분(특수차량) SAL143
        model.addAttribute("askGubunTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL143", null, langCd));

        // 판매지역 SAL146
        model.addAttribute("distCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL146", null, langCd));

        // 보충자료 SAL147
        model.addAttribute("fileYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL147", null, langCd));

        // 합격여부 SAL148
        model.addAttribute("evalRsltYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL148", null, langCd));

        return "/sal/svo/testDriveVehicle/selectTestDriveVehicleInspctMain";
    }

    /**
     * 시승차량 심사 목록 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectTestDriveVehicleInspct.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveVehicleInspct(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        result.setTotal(testDriveVehicleInspctService.selectTestDriveVehicleInspctByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(testDriveVehicleInspctService.selectTestDriveVehicleInspctByCondition(searchVO));
        }

        return result;
    }

    /**
     * 시승차량 심사 팝업(2) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveVehicleInspctPopup.do", method = RequestMethod.GET)
    public String selectTestDriveVehicleInspctPopup(Model model) throws Exception{

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 차량유형
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, LocaleContextHolder.getLocale().getLanguage()));
        // 합격여부 SAL148
        model.addAttribute("evalRsltYnInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL148", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/svo/testDriveVehicle/selectTestDriveVehicleInspctPopup";
    }

    /**
     * 시승차량 심사 팝업(2) 내용조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectTestDriveVehicleInspctPopupContain.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveVehicleInspctPopupContain(@RequestBody ReqTestDriveVehicleSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if("".equals(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        }
        result.setTotal(testDriveVehicleInspctService.selectTestDriveVehicleInspctPopupContainCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(testDriveVehicleInspctService.selectTestDriveVehicleInspctPopupContain(searchVO));
        }

        return result;
    }


    /**
     * 시승차량 - 정책입력 팝업(1) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPolicyInputPopup.do", method = RequestMethod.GET)
    public String selectPolicyInputPopup(Model model) throws Exception{
        // 차량유형 SAL142 (시승차: N7 제외)
        model.addAttribute("typeTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL142", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/svo/testDriveVehicle/selectPolicyInputPopup";
    }

    /**
     * 시승차량  심사 팝업 차량유형 - 정책입력
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/confirmPolicyInputPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmPolicyInputPopup(@RequestBody ReqTestDriveVehiclePopupCarVO saveVO) throws Exception {
        testDriveVehicleInspctService.confirmPolicyInputPopup(saveVO);
        return true;
    }

    /**
     * 시승차량 심사 팝업 확정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/confirmTestDriveVehicleInspctPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmTestDriveVehicleInspctPopup(@Validated @RequestBody TestDriveVehicleInspctSaveVO confirmVO) throws Exception {
        testDriveVehicleInspctService.confirmTestDriveVehicleInspct(confirmVO);
        return true;
    }

    /**
     * 시승차량 심사 합격여부 저장
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/secondConfirmTestDriveVehiclePopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean secondConfirmTestDriveVehiclePopup(@Validated @RequestBody TestDriveVehicleInspctSaveVO confirmVO) throws Exception {
        testDriveVehicleInspctService.secondConfirmTestDriveVehiclePopup(confirmVO);
        return true;
    }



}
