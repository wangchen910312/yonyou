package chn.bhmc.dms.ser.ro.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.PreCheckService;
import chn.bhmc.dms.ser.ro.vo.PreCheckSaveVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckVO;
import chn.bhmc.dms.ser.svi.service.PDIChkAtcService;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.service.RateManageService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : PreCheckController.java
 * @Description : 사전점검 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class PreCheckController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name = "preCheckService")
    PreCheckService preCheckService;

    @Resource(name = "pDIChkAtcService")
    PDIChkAtcService pDIChkAtcService;

    /**
     * 시스템 설정정보
     */
    @Resource(name = "systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
    
    @Autowired
    RateManageService rateManageService;

    /**
     * 사전점검 메인 화면을 출력한다.//태블릿 분기 khs
     *
     * @return
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectPreCheckMain.do", method = RequestMethod.GET)
    public String selectPreCheckMain(Model model,
            @RequestParam(value = "diagDocNo", defaultValue = "") String diagDocNo,
            @RequestParam(value = "vinNo", defaultValue = "") String vinNo,
            @RequestParam(value = "infoType", defaultValue = "") String infoType, HttpServletRequest request)
            throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        Device device = DeviceUtils.getCurrentDevice(request);

        log.debug("device.isTablet() : " + device.isTablet());

        /*
         * if (device.isNormal()) {
         * } else if (device.isMobile()) {
         * } else if (device.isTablet()) {
         * }
         */

        // 공통코드 : 예약구분
        model.addAttribute("resvTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER013", null, langCd));
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        model.addAttribute("preFixId", "PC");

        // 차량 점검 항목 구분
        PDIChkAtcSearchVO searchVO = new PDIChkAtcSearchVO();
        // searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsCarChkCd("01");
        model.addAttribute("pdiChkList", pDIChkAtcService.selectPDIChkAtcByCondition(searchVO));
        //임률코드 정보
        RateManageSearchVO rmSearchVO = new RateManageSearchVO();
        model.addAttribute("rateDs", rateManageService.selectRates(rmSearchVO));
        // 입고점검유형
        model.addAttribute("carAcptTp", commonCodeService.selectCommonCodesByCmmGrpCd("SER911", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 구원유형
        model.addAttribute("rescueTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER111", null, langCd));
        // 공통코드 : 견적유형
        model.addAttribute("estTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 브랜드 코드
        model.addAttribute("brandCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 캠페인 구분코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList",
                commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList",
                commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 성별
        model.addAttribute("sexCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM017", null, langCd));
        // 공통코드 : 여부
        model.addAttribute("useYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 공통코드 : 승/상용 구분
        model.addAttribute("carDstinTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        // 공통코드 : 블루멤버쉽등급
        model.addAttribute("bmMemberGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));
        // 소유자관계 코드
        model.addAttribute("ownerRelCdDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER219", null, langCd));
        // 공통코드 : 고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        // 고객전화표시여부
        model.addAttribute("custTelYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER065", null, langCd));
        // 사전점검상태
        model.addAttribute("diagStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER023", null, langCd));
        // 할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
        // 할인구분
        model.addAttribute("dsDistCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        // 카드종류
        model.addAttribute("cardTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));

        model.addAttribute("diagDocNo", diagDocNo);
        model.addAttribute("vinNo", vinNo);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("infoType", infoType);
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
       // if (device.isTablet()) {
        if (device.isTablet()||device.isMobile()) {
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
            return "/mob/waSer/ro/preCheck/selectPreCheckMain";
        } else {
            return "/ser/ro/preCheck/selectPreCheckMain";
        }

    }

    /**
     *
     * 사전점검 항목 정보를 등록한다.
     *
     * @param saveVO
     *            - 사전점검 항목 등록/수정 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/multiPreChecks.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiPreChecks(@Validated @RequestBody PreCheckSaveVO saveVO, HttpServletRequest request)
            throws Exception {
        String diagDocNo = "";
        Device device = DeviceUtils.getCurrentDevice(request);
        String deviceType = "";
        // PreCheckVO preCheckVO = new PreCheckVO();
        if (device.isNormal()) {
            deviceType = "pc";
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        /*} else if (device.isMobile()) {
            deviceType = "mob";
        } else if (device.isTablet()) {*/
        }else{
            deviceType = "pad";
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        }
        // preCheckVO.setUserEqui(deviceType);

        diagDocNo = preCheckService.multiPreChecks(saveVO,deviceType);

        return diagDocNo;
    }

    /**
     *
     * 사전점검 항목 인도 체크 정보를 수정한다.
     *
     * @param saveVO
     *            - 사전점검 항목 인도 체크 정보를 수정 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/updatePreCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public int updatePreCheck(@Validated @RequestBody PreCheckVO preCheckVO) throws Exception {

        return preCheckService.updatePreCheck(preCheckVO);
    }

    /**
     * 사전점검 간반 컬럼 정보를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectPreChkKanbanRows.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreChkKanbanRows(@RequestBody PreCheckSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        SearchResult result = new SearchResult();

        result.setData(preCheckService.selectPreChkKanbanRowsByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     *
     * 사전점검 간반보드 정보 조회
     *
     * @param searchVO
     *            - 사전점검 간반보드 정보 조회
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectPreChkKanbans.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreChkKanbans(@RequestBody PreCheckSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(preCheckService.selectPreChkKanbanByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 사전점검 정보를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectPreCheckByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public PreCheckVO selectPreCheckByKey(@RequestBody PreCheckSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        PreCheckVO resultVO = preCheckService.selectPreCheckByKey(searchVO);

        if (resultVO == null) {
            resultVO = new PreCheckVO();
        }

        return resultVO;

    }

    /**
     * 사전점검 상세 정보를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectReserveDetailInfoByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReserveDetailInfoByKey(@RequestBody PreCheckSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(preCheckService.selectReserveDetailInfoByKey(searchVO));

        result.setTotal(result.getData().size());

        return result;
    }

    /**
     * 사전점검 정보를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectPreChkMappingInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreChkMappingInfo(@RequestBody PreCheckSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(preCheckService.selectVehOfPreCheckInfoByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;
    }

    /**
     * 사전점검 정보를 조회한다.
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectPreChkMappingCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPreChkMappingCnt(@RequestBody PreCheckSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(preCheckService.selectPreCheckListByConditionCnt(searchVO));

        return result;
    }

    /**
     * 사전점검 취소 팝업 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/ser/ro/preCheck/selectPreCheckCancelPopup.do", method = RequestMethod.GET)
    public String selectPreChkCancelPopup(Model model) throws Exception {

        // 공통코드 : 취소사유코드
        model.addAttribute("preChkCancCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER024", null,
                LocaleContextHolder.getLocale().getLanguage()));
        return "/ser/ro/preCheck/selectPreCheckCancelPopup";
    }

}
