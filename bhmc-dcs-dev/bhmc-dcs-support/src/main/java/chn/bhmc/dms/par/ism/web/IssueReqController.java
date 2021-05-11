package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.TempCodeMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;

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
     * 구매요청 서비스
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

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
     * 사용자코드 서비스(테스트용)
     */
    @Resource(name="tempCodeMasterService")
    TempCodeMasterService tempCodeMasterService;

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
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqes(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
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
     * 출고요청상세 목록 데이터를 조회한다.
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
        // TODO [심인보] 취소상태 조회.
        model.addAttribute("cancYnDs", tempCodeMasterService.selectTempCodePartsCancYnByCondition());

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
     * 정비부품투입 작업 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqServiceWorkMain.do", method = RequestMethod.GET)
    public String selectIssueReqServiceWorkMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));

        // 공통코드 : 위탁서 유형(부품예약)
        List<CommonCodeVO> parGiTpSrList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeVO = commonCodeService.selectCommonCodeByKey("SR", "PAR301");
        if(commonCodeVO != null){
            parGiTpSrList.add(commonCodeVO);
        }
        model.addAttribute("parGiTpSrList", parGiTpSrList);

        // 공통코드 : 내부운용소분류
        model.addAttribute("etcGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR303", null, langCd));

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

        return "/par/ism/issueReq/selectIssueReqServiceWorkMain";

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
}
