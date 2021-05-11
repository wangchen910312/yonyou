package chn.bhmc.dms.par.pcm.web;

import java.util.ArrayList;
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

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.ClaimService;
import chn.bhmc.dms.par.pcm.vo.ClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.ClaimVO;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcListVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimItemVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimListVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSaveVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimListVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 클레임 관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 02. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */
@Controller
public class ClaimController extends HController {

    /**
     * 클레임 서비스
     */
    @Resource(name="claimService")
    ClaimService claimService;

    /**
     * 거래처 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 로케이션 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 클레임등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectClaimRegMain.do", method = RequestMethod.GET)
    public String selectClaimRegMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",        LoginUtil.getUserId());
        model.addAttribute("pltCd",           LoginUtil.getPltCd());
        model.addAttribute("invcUnitList",    invcUnitList);
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("clTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR222", null, langCd));  //클레임 사유
        model.addAttribute("clTargetTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR221", null, langCd));  //클레임대상

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);


        return "/par/pcm/claim/selectClaimRegMain";

    }

    /**
     * 클레임정보를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/claim/insertClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int createOrd(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        int resultCnt = 0;
        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();




        resultCnt = claimService.createClaim(list, invcVO);

        if(resultCnt > 0){
            resultCnt = 1;
        }

        return resultCnt;
    }

    /**
     * 클레임대상 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectClaimItemByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimItemByCondition(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(claimService.selectClaimItemByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimService.selectClaimItemByCondition(searchVO));
        }

        return result;

    }

    /**
     * 클레임 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectClaimManageMain.do", method = RequestMethod.GET)
    public String selectClaimManageMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",        LoginUtil.getUserId());
        model.addAttribute("pltCd",           LoginUtil.getPltCd());
        model.addAttribute("invcUnitList",    invcUnitList);
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("clTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR222", null, langCd));  //클레임 사유
        model.addAttribute("clTargetTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR221", null, langCd));  //클레임대상

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("claimStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR224", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/par/pcm/claim/selectClaimManageMain";

    }

    /**
     * 클레임 관리  부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectClaimManageItemByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectClaimManageItemByCondition(@RequestBody ClaimSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(claimService.selectClaimManageItemByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimService.selectClaimManageItemByCondition(searchVO));
        }

        return result;

    }

    /**
     * 클레임정보를 수정한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/claim/updateClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateClaim(@Validated @RequestBody List<ClaimVO> claimListVO)  throws Exception {

        int resultCnt = 0;

        resultCnt = claimService.updateClaimCnfm(claimListVO);

        return resultCnt;
    }

    /**
     * 기술품질 클레임 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectTechQualityClaimMain.do", method = RequestMethod.GET)
    public String selectTechQualityClaimMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",                 LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",              LoginUtil.getUserId());
        model.addAttribute("pltCd",                 LoginUtil.getPltCd());
        model.addAttribute("clCarlineList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR226", null, langCd));  //클레임 차형코드
        model.addAttribute("clTpList",              commonCodeService.selectCommonCodesByCmmGrpCd("PAR227", null, langCd));  //클레임 유형
        model.addAttribute("clWayList",             commonCodeService.selectCommonCodesByCmmGrpCd("PAR228", null, langCd));  //클레임 방식
        model.addAttribute("prcCodeList",           commonCodeService.selectCommonCodesByCmmGrpCd("PAR229", null, langCd));  //클레임 화물발송창고
        model.addAttribute("deliveryTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR230", null, langCd));  //클레임 배송방식
        model.addAttribute("clStatusList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR231", null, langCd));  //클레임 상태
        model.addAttribute("isCheckList",           commonCodeService.selectCommonCodesByCmmGrpCd("PAR232", null, langCd));  //클레임 탁송여부
        model.addAttribute("statusList",            commonCodeService.selectCommonCodesByCmmGrpCd("PAR233", null, langCd));  //클레임 처리상태
        model.addAttribute("compensationWayList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR234", null, langCd));  //클레임 배상방식
        model.addAttribute("dealMarkList",          commonCodeService.selectCommonCodesByCmmGrpCd("PAR235", null, langCd));  //클레임 배상표기
        model.addAttribute("hasSubmitList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR236", null, langCd));  //변상수령증
        model.addAttribute("hasArrivedList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR237", null, langCd));  //클레임 도착여부
        model.addAttribute("claiCategoryList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR241", null, langCd));  //클레임 유형표기
        model.addAttribute("responsibilityList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR242", null, langCd));  //클레임 책임표기
        model.addAttribute("toDt",                  sysDate);
        model.addAttribute("sevenDtBf",             sevenDtBf);

        return "/par/pcm/claim/selectTechQualityClaimMain";

    }


    /**
     * 과부족클레임 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectExcessClaimMgrList.do", method = RequestMethod.GET)
    public String selectExcessClaimMgrList(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        model.addAttribute("claimStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR239", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/par/pcm/claim/selectExcessClaimMgrList";

    }

    /**
     * 품질클레임  부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 QualityClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectQualityClaimByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectQualityClaimByCondition(@RequestBody QualityClaimSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(claimService.selectQualityClaimByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimService.selectQualityClaimByCondition(searchVO));
        }

        return result;

    }

    /**
     * Key에 해당하는 품질클레임  부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 QualityClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectQualityClaimByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public QualityClaimVO selectQualityClaimByKey(@RequestBody QualityClaimSearchVO searchVO)  throws Exception  {

        QualityClaimVO qualityClaimVO = new QualityClaimVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());


        qualityClaimVO = claimService.selectQualityClaimByKey(searchVO);

        return qualityClaimVO;

    }

    /**
     * 기술품질클레임정보를 수정한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/claim/updateQualityClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public QualityClaimVO updateQualityClaim(@Validated @RequestBody QualityClaimVO qualityClaimVO)  throws Exception {

        qualityClaimVO = claimService.updateQualityClaim(qualityClaimVO);

        qualityClaimVO.setResultYn(true);
        return qualityClaimVO;
    }

    /**
     * 기술품질클레임정보를 전송한다.(신규)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendCreateQualityClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendCreateQualityClaim(@Validated @RequestBody QualityClaimVO qualityClaimVO)  throws Exception {


        qualityClaimVO.setRegUsrId(LoginUtil.getUserId());
        qualityClaimVO.setDlrCd(LoginUtil.getDlrCd());

        int resultCnt = 0;

        resultCnt = claimService.sendCreateQualityClaim(qualityClaimVO);

        return resultCnt;
    }

    /**
     * 기술품질클레임 전송정보를 수정 한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendUpdateQualityClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendUpdateQualityClaim(@Validated @RequestBody QualityClaimVO qualityClaimVO)  throws Exception {


        qualityClaimVO.setRegUsrId(LoginUtil.getUserId());
        qualityClaimVO.setDlrCd(LoginUtil.getDlrCd());

        int resultCnt = 0;

        resultCnt = claimService.sendUpdateQualityClaim(qualityClaimVO);

        return resultCnt;
    }

    /**
     * 기술품질클레임 전송정보를 삭제 한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendDeleteQuelityClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendDeleteQuelityClaim(@Validated @RequestBody QualityClaimVO qualityClaimVO)  throws Exception {


        qualityClaimVO.setRegUsrId(LoginUtil.getUserId());
        qualityClaimVO.setDlrCd(LoginUtil.getDlrCd());

        int resultCnt = 0;

        resultCnt = claimService.sendDeleteQuelityClaim(qualityClaimVO);

        return resultCnt;
    }

    /**
     * 기술품질클레임건 상태정보를 전송한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendQuelityClaimStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendQuelityClaimStatus(@Validated @RequestBody QualityClaimListVO qualityClaimListVO)  throws Exception {

        List<QualityClaimVO> list = qualityClaimListVO.getQualityClaimList();

        int resultCnt = 0;

        resultCnt = claimService.sendQuelityClaimStatus(list);

        return resultCnt;
    }

    /**
     * 기술품질클레임건 탁송표기정보를 전송한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendQuelityClaimIsCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendQuelityClaimIsCheck(@Validated @RequestBody QualityClaimListVO qualityClaimListVO)  throws Exception {

        List<QualityClaimVO> list = qualityClaimListVO.getQualityClaimList();

        int resultCnt = 0;

        resultCnt = claimService.sendQuelityClaimIsCheck(list);

        return resultCnt;
    }

    /**
     * 기술품질클레임건 회수운송장정보를 전송한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendReClaimOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendReClaimOrder(@Validated @RequestBody QualityClaimListVO qualityClaimListVO)  throws Exception {

        List<QualityClaimVO> list = qualityClaimListVO.getQualityClaimList();

        int resultCnt = 0;

        resultCnt = claimService.sendReClaimOrder(list);

        return resultCnt;
    }

    /**
     * 기술품질클레임건 영수증정보를 전송한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendQualityClaimBillNo.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendQualityClaimBillNo(@Validated @RequestBody QualityClaimListVO qualityClaimListVO )  throws Exception {

        List<QualityClaimVO> list = qualityClaimListVO.getQualityClaimList();

        int resultCnt = 0;

        resultCnt = claimService.sendQualityClaimBillNo(list);

        return resultCnt;
    }

    /**
     * 과부족클레임  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectOversAndShortsClaimByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOversAndShortsClaimByCondition(@RequestBody OversAndShortsClaimSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(claimService.selectOversAndShortsClaimByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(claimService.selectOversAndShortsClaimByCondition(searchVO));
        }

        return result;

    }

    /**
     * 과부족클레임  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectOversAndShortsClaimByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public OversAndShortsClaimVO selectOversAndShortsClaimByKey(@RequestBody OversAndShortsClaimSearchVO searchVO)  throws Exception  {

        OversAndShortsClaimVO result = new OversAndShortsClaimVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result = claimService.selectOversAndShortsClaimByKey(searchVO);

        return result;

    }

    /**
     * 과부족클레임 수신 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectOversAndShortsClaimInfcByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public OversAndShortsClaimVO selectOversAndShortsClaimInfcByKey(@RequestBody OversAndShortsClaimSearchVO searchVO)  throws Exception  {

        OversAndShortsClaimVO result = new OversAndShortsClaimVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result = claimService.selectOversAndShortsClaimInfcByKey(searchVO);

        return result;

    }

    /**
     * 과부족클레임 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectOversAndShortsClaimItemsByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOversAndShortsClaimItemsByKey(@RequestBody OversAndShortsClaimSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(claimService.selectOversAndShortsClaimItemsByKey(searchVO));

        return result;

    }

    /**
     * 과부족클레임 수신 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 OversAndShortsClaimSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/selectOversAndShortsClaimInfcItemsByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOversAndShortsClaimInfcItemsByKey(@RequestBody OversAndShortsClaimSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(claimService.selectOversAndShortsClaimInfcItemsByKey(searchVO));

        return result;

    }

    /**
     * 과부족클레임 정보를 수정한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/claim/multiOversAndShortsClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public OversAndShortsClaimVO multiOversAndShortsClaim(@Validated @RequestBody OversAndShortsClaimSaveVO saveVO)  throws Exception {

        OversAndShortsClaimVO oversAndShortsClaimVO = new OversAndShortsClaimVO();
        oversAndShortsClaimVO = saveVO.getOversAndShortsClaimVO();
        oversAndShortsClaimVO = claimService.multiOversAndShortsClaim(saveVO, oversAndShortsClaimVO);

        oversAndShortsClaimVO.setResultYn(true);
        return oversAndShortsClaimVO;
    }

    /**
     * 과부족클레임정보를 전송한다.(신규)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendCreateOversAndShortsClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendCreateOversAndShortsClaim(@Validated @RequestBody OversAndShortsClaimListVO listVO)  throws Exception {


        OversAndShortsClaimVO oversAndShortsClaimVO = new OversAndShortsClaimVO();
        oversAndShortsClaimVO = listVO.getOversAndShortsClaimVO();
        List<OversAndShortsClaimItemVO> list = listVO.getOversAndShortsClaimItemList();
        oversAndShortsClaimVO.setRegUsrId(LoginUtil.getUserId());
        oversAndShortsClaimVO.setDlrCd(LoginUtil.getDlrCd());

        int resultCnt = 0;

        resultCnt = claimService.sendCreateOversAndShortsClaim(oversAndShortsClaimVO, list);

        return resultCnt;
    }

    /**
     * 과부족클레임 전송정보를 수정 한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendUpdateOversAndShortsClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendUpdateOversAndShortsClaim(@Validated @RequestBody OversAndShortsClaimListVO listVO)  throws Exception {


        OversAndShortsClaimVO oversAndShortsClaimVO = new OversAndShortsClaimVO();
        oversAndShortsClaimVO = listVO.getOversAndShortsClaimVO();
        List<OversAndShortsClaimItemVO> list = listVO.getOversAndShortsClaimItemList();
        oversAndShortsClaimVO.setRegUsrId(LoginUtil.getUserId());
        oversAndShortsClaimVO.setDlrCd(LoginUtil.getDlrCd());

        int resultCnt = 0;

        resultCnt = claimService.sendUpdateOversAndShortsClaim(oversAndShortsClaimVO, list);

        return resultCnt;
    }

    /**
     * 과부족클레임 전송정보를 삭제 한다.(수정)
     * @return
     */
    @RequestMapping(value = "/par/pcm/claim/sendDeleteOversAndShortsClaim.do", method = RequestMethod.POST)
    @ResponseBody
    public int sendDeleteOversAndShortsClaim(@Validated @RequestBody OversAndShortsClaimVO oversAndShortsClaimVO)  throws Exception {


        oversAndShortsClaimVO.setRegUsrId(LoginUtil.getUserId());
        oversAndShortsClaimVO.setDlrCd(LoginUtil.getDlrCd());

        int resultCnt = 0;

        resultCnt = claimService.sendDeleteOversAndShortsClaim(oversAndShortsClaimVO);

        return resultCnt;
    }


}
