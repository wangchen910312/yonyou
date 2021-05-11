package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqResvService;
import chn.bhmc.dms.par.ism.service.IssueReqResvStatusService;
import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailResvSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqResvSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IssueReserveController.java
 * @Description : 부품예약 컨트롤러.
 * @author In Bo Shim
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     In Bo Shim     최초 생성
 * </pre>
 */
@Controller
public class IssueReserveController extends HController {

    /**
     * 구매요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

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
     * ABC Class
     */
    @Resource(name="abcClassService")
    AbcClassService abcClassService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 부번별 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterItemService")
    BinLocationMasterItemService binLocationMasterItemService;

    /**
     * 부품수령 서비스
     */
    @Resource(name="issueReqResvService")
    IssueReqResvService issueReqResvService;

    /**
     * 부품예약현황 서비스
     */
    @Resource(name="issueReqResvStatusService")
    IssueReqResvStatusService issueReqResvStatusService;


    /**
     * SA 서비스
     */
    @Resource(name="issueReqTechManService")
    IssueReqTechManService issueReqTechManService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 부품예약 작업 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReserve/selectIssuePartsReserveMain.do", method = RequestMethod.GET)
    public String selectIssuePartsReserveMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        // 등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        // 등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        return "/par/ism/issueReserve/selectIssuePartsReserveMain";

    }

    /**
     * 부품예약유보 작업 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReserve/selectIssuePartsReserveHesitationMain.do", method = RequestMethod.GET)
    public String selectIssuePartsReserveHesitationMain(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 준비수령상태
        model.addAttribute("readyStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR304", null, langCd));

        //등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        //등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        return "/par/ism/issueReserve/selectIssuePartsReserveHesitationMain";

    }

    /**
     * 준비수령 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReserve/selectIssuePartsReserveReadyMain.do", method = RequestMethod.GET)
    public String selectIssuePartsReserveReadyMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR301");
        commonCodeSearchVO.setsRemark1("01");
        commonCodeSearchVO.setsLangCd(langCd);
        model.addAttribute("parGiTpResvList", commonCodeService.selectCommonCodesByCmmGrpCd(commonCodeSearchVO));

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", "Y", LocaleContextHolder.getLocale().getLanguage()));
        // 공통코드 : 준비수령상태
        model.addAttribute("readyStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR304", null, langCd));
        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : RO상태
        model.addAttribute("roStatusCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        // 공통코드 : 정비인도상태
        model.addAttribute("dlStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        // 등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        // 등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsLocCond("02");//LOC CD IS NOT NULL
        model.addAttribute("locCdList", binLocationMasterItemService.selectBinLocationMasterItemsByCondition(locationSearchVO));

        // 공통코드 : 예약상태
        model.addAttribute("resvStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER011", null, langCd));

        return "/par/ism/issueReserve/selectIssuePartsReserveReadyMain";

    }

    /**
     * 예약인 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReservePrintPopup.do", method = RequestMethod.GET)
    public String selectIssueReservePrintPopup(Model model) throws Exception {

        return "/par/ism/issueReq/selectIssueReservePrintPopup";
    }

    /**
     * 부품예류 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReserve/selectIssuePartsReserveReadyActMain.do", method = RequestMethod.GET)
    public String selectIssuePartsReserveReadyActMain(Model model
            ,@RequestParam(value="resvDocNo", defaultValue="") String resvDocNo
            ,@RequestParam(value="parGiTp", defaultValue="") String parGiTp
    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

        //로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        //로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        //공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));
        //공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd));
        //공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //공통코드 : 준비수령상태
        model.addAttribute("readyStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR304", null, langCd));

        //등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        //등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        //로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsLocCond("02");//LOC CD IS NOT NULL
        model.addAttribute("locCdList", binLocationMasterItemService.selectBinLocationMasterItemsByCondition(locationSearchVO));

        model.addAttribute("resvDocNo", resvDocNo);
        model.addAttribute("parGiTp", parGiTp);

        //SA 리스트.
        IssueReqTechManSearchVO searchVO = new IssueReqTechManSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<String> sRoleIdList = new ArrayList<String>();
        sRoleIdList.add("ROLE_RECIPIENT");//정비수령 권한
        searchVO.setsRoleIdList(sRoleIdList);

        model.addAttribute("tecCdList", issueReqTechManService.selectTechManFnMasterUseresByCondition(searchVO));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issueReserve/selectIssuePartsReserveReadyActMain";

    }

    /**
     * 부품수령 정보를 저장한다.
     * @param issueReqSaveVO - 저장 할 IssueReqSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReserve/updateIssuePartsResves.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateIssuePartsResves(@RequestBody IssueReqResvSaveVO issueReqResvSaveVO) throws Exception
    {
        issueReqResvService.updateIssuePartsResves(issueReqResvSaveVO);
        return true;
    }

    /**
     * 부품수령리스트 정보를 수정한다.
     * @param issueReqSaveVO - 저장 할 IssueReqSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReserve/multiIssuePartsResves.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssuePartsResves(@RequestBody BaseSaveVO<IssueReqVO> issueReqSaveVO) throws Exception
    {
        issueReqResvService.multiIssuePartsResves(issueReqSaveVO);
        return true;
    }

    /**
     * 부품예류상세 정보를 저장한다.
     * @param saveVO - 저장 할 IssueReqDetailSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReserve/multiIssueResvReadyDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueResvReadyDetails(@RequestBody IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception
    {
        issueReqDetailService.multiIssueResvReadyDetails(issueReqDetailSaveVO, true);
        return true;

    }

    /**
     * 기타예류상세 정보를 저장한다.
     * @param saveVO - 저장 할 IssueReqDetailSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReserve/multiIssueResvOtherReadyDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueResvOtherReadyDetails(@RequestBody IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception
    {
        issueReqDetailService.multiIssueOtherReadyDetails(issueReqDetailSaveVO);
        return true;

    }

    /**
     * 부품예류 팝업 화면을 출력한다.
     *
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReserveReadyCheckPopup.do", method = RequestMethod.GET)
    public String selectIssueReserveReadyCheckPopup(Model model
            ,@Param("sReadyUsrId") String sReadyUsrId
            ,@Param("sReadyUsrNm") String sReadyUsrNm
            ,@Param("sReadyStatCd") String sReadyStatCd
        ) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //현재일자
        model.addAttribute("sysNowDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, +0), dateFormat+" HH:mm:ss"));
        //예류종료일자(다음일)
        model.addAttribute("sysEndDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, +2), dateFormat+" HH:00:00"));
        //로그인 사용자정보.
        if("03".equals(sReadyStatCd) || "05".equals(sReadyStatCd)){//부품예류:03 /부품예류취소 : 05
            if(StringUtils.isNotEmpty(sReadyUsrId)){
                model.addAttribute("userId", sReadyUsrId);
            }else{
                model.addAttribute("userId", LoginUtil.getUserId());
            }

            if(StringUtils.isNotEmpty(sReadyUsrNm)){
                model.addAttribute("userNm", sReadyUsrNm);
            }else{
                model.addAttribute("userNm", LoginUtil.getUserNm());
            }

        }else{
            model.addAttribute("userId", LoginUtil.getUserId());
            model.addAttribute("userNm", LoginUtil.getUserNm());
        }

        return "/par/ism/issueReq/selectIssueReserveReadyCheckPopup";
    }

    /**
     * 부품예류  목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqDetailResves.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqDetailResves(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqResvService.selectIssueReqDetailResvesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqResvService.selectIssueReqDetailResvesByCondition(searchVO));
        }

        return result;
    }


    /**
     * 부품예약현황조회 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReserve/selectIssuePartsReserveStatusMain.do", method = RequestMethod.GET)
    public String selectIssuePartsReserveStatusMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // 로그인 정보: 언어코드
        model.addAttribute("langCd", langCd);

        // 공통코드 : 위탁서 유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR301");
        commonCodeSearchVO.setsRemark1("01");
        commonCodeSearchVO.setsLangCd(langCd);
        model.addAttribute("parGiTpResvList", commonCodeService.selectCommonCodesByCmmGrpCd(commonCodeSearchVO));

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));

        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd));
        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 준비수령상태
        model.addAttribute("readyStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR304", null, langCd));
        // 등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        // 등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        return "/par/ism/issueReserve/selectIssuePartsReserveStatusMain";

    }

    /**
     * 부품예약현황 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReserve/selectIssueReqReserveStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqReserveStatus(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqResvStatusService.selectIssueReqResvStatusByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqResvStatusService.selectIssueReqResvStatusByCondition(searchVO));
        }

        return result;

    }

    /**
     * 부품예류 정보를 출고요청정보로 등록한다.
     * @param issueReqDetailResvSaveVO - 저장정보를 포함하는 IssueReqDetailResvSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/insertIssueResvDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueReqDetailResvSaveVO insertIssueResvDetails(@RequestBody IssueReqDetailResvSaveVO issueReqDetailResvSaveVO) throws Exception{

        issueReqDetailService.insertIssueReqDetailResv(issueReqDetailResvSaveVO, false);

        return issueReqDetailResvSaveVO;

    }

    /**
     * 부품예정 정보를 가져온다..
     * @param issueReqSearchVO - 저장 할 IssueReqSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReserve/selectIssueReqResvByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueReqVO selectIssueReqResvByKey(@RequestBody IssueReqSearchVO issueReqSearchVO) throws Exception
    {
        IssueReqVO issueReqVO;

        issueReqVO = issueReqResvService.selectIssueReqResvByKey(issueReqSearchVO);

        if(issueReqVO == null){
            issueReqVO = new IssueReqVO();
        }

        return issueReqVO;
    }


}
