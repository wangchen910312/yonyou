package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 부품요청 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 4. 1.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class IssueReqController {

    /**
     * 부품요청 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 부품요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /**
     * 부품출고상세 서비스
     */
    @Resource(name="issuePartsOutDetailService")
    IssuePartsOutDetailService issuePartsOutDetailService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * SA 서비스
     */
    @Resource(name="issueReqTechManService")
    IssueReqTechManService issueReqTechManService;

    /**
     * ROLL Mapping User 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 출고요청 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqMain.do", method = RequestMethod.GET)
    public String selectIssueReqMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd));

        return "/par/ism/issueReq/selectIssueReqMain";
    }

    /**
     * 출고요청 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqes(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        //딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        //센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqService.selectIssueReqsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqService.selectIssueReqsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 출고요청 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueReqVO selectIssueReqByKey(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        return issueReqService.selectIssueReqByKey(LoginUtil.getDlrCd(), searchVO.getsParReqDocNo(), null, searchVO.getsParGiTp());

    }

    /**
     * 정비수령 부품요청상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqDetailes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqDetailes(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqDetailService.selectIssueReqDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqDetailService.selectIssueReqDetailsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 정비수령집계 부품요청상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqDetailStatues.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqDetailStatues(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqDetailService.selectIssueReqDetailStatusByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqDetailService.selectIssueReqDetailStatusByCondition(searchVO));
        }

        return result;
    }

    /**
     * 정비수령 부품요청상세 목록 프린터 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectPrintIssueReqDetailes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPrintIssueReqDetailes(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqDetailService.selectPrintIssueReqDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqDetailService.selectPrintIssueReqDetailsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 내부수령 부품요청상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqInnerDetailes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqInnerDetailes(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqDetailService.selectIssueReqDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqDetailService.selectIssueReqInnerDetailsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 부품요청 헤더,상세정보를 등록한다.
     * @param issueReqSaveVO - 저장정보를 포함하는 IssueReqSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/insertIssueReqes.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueReqSaveVO insertIssueReqes(@RequestBody IssueReqSaveVO issueReqSaveVO) throws Exception{

        issueReqService.insertIssueReq(issueReqSaveVO);

        return issueReqSaveVO;
    }

    /**
     * 출고요청 테스트 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqServiceMain.do", method = RequestMethod.GET)
    public String selectIssueReqServiceMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd));

        return "/par/ism/issueReq/selectIssueReqServiceMain";
    }

    /**
     * 정비수령조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqStatues.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqStatues(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issueReqService.selectIssueReqStatuesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueReqService.selectIssueReqStatuesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 정비수령(위탁확인,수리서비스) 작업 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqServiceWorkMain.do", method = RequestMethod.GET)
    public String selectIssueReqServiceWorkMain(Model model, HttpServletRequest request) throws Exception {

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
        //로그인 정보: 딜러명
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        //BHMC코드
        model.addAttribute("bhmcCd", "A07AA");
        //BHMC명
        model.addAttribute("bhmcNm", "BHMC");

        //userId
        model.addAttribute("usrId",LoginUtil.getUserId());
        //userNm
        model.addAttribute("usrNm",LoginUtil.getUserNm());

        //로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        //공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeVO = commonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeVO != null){
            parGiTpList.add(commonCodeVO);
        }
        model.addAttribute("parGiTpList", parGiTpList);
        //공통코드 : 위탁서 유형(부품예약)
        List<CommonCodeVO> parGiTpSrList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeSrVO = commonCodeService.selectCommonCodeByKey("PAR301" ,"SR");
        CommonCodeVO commonCodeQtVO = commonCodeService.selectCommonCodeByKey("PAR301" ,"OT");
        CommonCodeVO commonCodeSpVO = commonCodeService.selectCommonCodeByKey("PAR301" ,"SP");
        if(commonCodeVO != null){
            parGiTpSrList.add(commonCodeSrVO);
            parGiTpSrList.add(commonCodeQtVO);
            parGiTpSrList.add(commonCodeSpVO);
        }
        model.addAttribute("parGiTpSrList", parGiTpSrList);
        //공통코드 : 내부운용소분류
        model.addAttribute("etcGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR303", null, langCd));
        //공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", "Y", langCd));
        //공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //공통코드 : 정비차용상태
        model.addAttribute("borrowStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR305", null, langCd));
        //등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        //등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));
        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));
        //RO상태
        model.addAttribute("roStatusCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //정비수리유형
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
        List<UserVO> recipientUserVOList = roleMappingService.selectUsersByRoleId(sysCd, LoginUtil.getDlrCd(), null, null, "ROLE_RECIPIENT");
        //정비수령자 권한 사용자 리스트.
        model.addAttribute("tecCdList", recipientUserVOList);
        //정비 스위치
        model.addAttribute("partRcvYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER066", null, langCd));
        //캠페인유형코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));

        model.addAttribute("langCd", langCd);
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issueReq/selectIssueReqServiceWorkMain";
    }

    /**
     * 정비수령(위탁확인,수리서비스) 작업 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqServiceWorkAllMain.do", method = RequestMethod.GET)
    public String selectIssueReqServiceWorkAllMain(Model model, HttpServletRequest request) throws Exception {

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
        //로그인 정보: 딜러명
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        //BHMC코드
        model.addAttribute("bhmcCd", "A07AA");
        //BHMC명
        model.addAttribute("bhmcNm", "BHMC");

        //userId
        model.addAttribute("usrId",LoginUtil.getUserId());
        //userNm
        model.addAttribute("usrNm",LoginUtil.getUserNm());

        //로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        //공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeVO = commonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeVO != null){
            parGiTpList.add(commonCodeVO);
        }
        model.addAttribute("parGiTpList", parGiTpList);
        //공통코드 : 위탁서 유형(부품예약)
        List<CommonCodeVO> parGiTpSrList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeSrVO = commonCodeService.selectCommonCodeByKey("PAR301" ,"SR");
        CommonCodeVO commonCodeQtVO = commonCodeService.selectCommonCodeByKey("PAR301" ,"OT");
        CommonCodeVO commonCodeSpVO = commonCodeService.selectCommonCodeByKey("PAR301" ,"SP");
        if(commonCodeVO != null){
            parGiTpSrList.add(commonCodeSrVO);
            parGiTpSrList.add(commonCodeQtVO);
            parGiTpSrList.add(commonCodeSpVO);
        }
        model.addAttribute("parGiTpSrList", parGiTpSrList);
        //공통코드 : 내부운용소분류
        model.addAttribute("etcGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR303", null, langCd));
        //공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", "Y", langCd));
        //공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //공통코드 : 정비차용상태
        model.addAttribute("borrowStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR305", null, langCd));
        //등록시작일자
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysStartDate", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat));
        //등록종료일자
        model.addAttribute("sysEndDate", DateUtil.getDate(dateFormat));
        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));
        //RO상태
        model.addAttribute("roStatusCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        //정비수리유형
        model.addAttribute("lbrTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));

        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
        List<UserVO> recipientUserVOList = roleMappingService.selectUsersByRoleId(sysCd, LoginUtil.getDlrCd(), null, null, "ROLE_RECIPIENT");
        //정비수령자 권한 사용자 리스트.
        model.addAttribute("tecCdList", recipientUserVOList);
        //정비 스위치
        model.addAttribute("partRcvYnCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER066", null, langCd));
        //캠페인유형코드
        model.addAttribute("campaignDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM705", null, langCd));
        // 공통코드 : 결제유형
        model.addAttribute("paymTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));

        model.addAttribute("langCd", langCd);
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issueReq/selectIssueReqServiceWorkAllMain";
    }

    /**
     * 부품요청상세 정보를 저장한다.
     * @param saveVO - 저장 할 ItemGroupSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/multiIssueReqDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueReqDetails(@RequestBody IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception
    {
        issueReqDetailService.multiIssueReqDetails(issueReqDetailSaveVO);
        return true;

    }

    /**
     * 기타출고(내부유용)상세 정보를 저장한다.
     * @param saveVO - 저장 할 ItemGroupSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/multiIssueReqInnerDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public IssueReqSaveVO multiIssueReqInnerDetails(@RequestBody IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception
    {
        IssueReqSaveVO issueReqSaveVO = issueReqDetailService.multiIssueReqInnerDetails(issueReqDetailSaveVO);
        return issueReqSaveVO;

    }

    /**
     * 공용부번정보 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectShareItemPopup.do", method = RequestMethod.GET)
    public String selectShareItemPopup(Model model) throws Exception {

        return "/par/cmm/selectShareItemPopup";

    }

    /**
     * 입고정보을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectStockGrItemPopup.do", method = RequestMethod.GET)
    public String selectStockGiItemPopup(Model model) throws Exception {

        return "/par/cmm/selectStockGrItemPopup";
    }

    /**
     * 결품부품 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectReqItemPopup.do", method = RequestMethod.GET)
    public String selectReqItemPopup(Model model) throws Exception {

        return "/par/cmm/selectReqItemPopup";

    }

    /**
     * 부품패키지정보을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectIssuePackageWorkPopup.do", method = RequestMethod.GET)
    public String selectIssuePackageWorkPopup(Model model) throws Exception {

        return "/par/cmm/selectIssuePackageWorkPopup";
    }

    /**
     * 부품출고 마지막 출고번호정보를 조회한다.
     * @param issueReqSaveVO - 저장정보를 포함하는 IssueReqSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssuePartsOutDetailMaxGiDocNoByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public IssuePartsOutDetailVO selectIssuePartsOutDetailMaxGiDocNoByKey(@RequestBody IssuePartsOutDetailSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        IssuePartsOutDetailVO issuePartsOutDetailVO = issuePartsOutDetailService.selectIssuePartsOutDetailMaxGiDocNoByKey(searchVO);

        if(issuePartsOutDetailVO == null){
            issuePartsOutDetailVO = new IssuePartsOutDetailVO();
        }

        return issuePartsOutDetailVO;
    }

}
