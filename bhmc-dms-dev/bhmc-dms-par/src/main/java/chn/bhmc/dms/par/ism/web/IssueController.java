package chn.bhmc.dms.par.ism.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsAvlbService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutAutoService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutDetailService;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssuePartsResvService;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailItemVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsResvVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.par.ism.vo.ReceiveEtcItemTrdSupportVO;
import chn.bhmc.dms.par.ism.vo.ReceiveEtcVerThdSupportSearchVO;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 출고관리 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 2. 15.
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
public class IssueController extends HController {

    /**
     * 부품예약 서비스
     */
    @Resource(name="issuePartsResvService")
    IssuePartsResvService issuePartsResvService;

    /**
     * 부품가용 서비스
     */
    @Resource(name="issuePartsAvlbService")
    IssuePartsAvlbService issuePartsAvlbService;

    /**
     * 출고등록 서비스
     */
    @Resource(name="issuePartsOutService")
    IssuePartsOutService issuePartsOutService;

    /**
     * 출고등록상세 서비스
     */
    @Resource(name="issuePartsOutDetailService")
    IssuePartsOutDetailService issuePartsOutDetailService;

    /**
     * 출고자동등록 서비스
     */
    @Resource(name="issuePartsOutAutoService")
    IssuePartsOutAutoService issuePartsOutAutoService;

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
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

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
     * 부품요청상세 서비스
     */
    @Resource(name="issueReqDetailService")
    IssueReqDetailService issueReqDetailService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    Logger logger = LoggerFactory.getLogger(IssueController.class);

    /**
     * 부품예약 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issuePartsResv/multiIssuePartsResves.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssuePartsResves(@Validated @RequestBody BaseSaveVO<IssuePartsResvVO> issuePartsResvVO, BindingResult bindingResult) throws Exception
    {
        issuePartsResvService.multiIssuePartsResves(issuePartsResvVO);
        return true;

    }

    /**
     * 위탁서 부품예약 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issuePartsResv/multiIssueReqDetailPartsResves.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueReqDetailPartsResves(@Validated @RequestBody BaseSaveVO<IssueReqDetailVO> issueReqDetailVO, BindingResult bindingResult) throws Exception
    {
        issuePartsResvService.multiIssueReqDetailPartsResves(issueReqDetailVO);
        return true;

    }

    /**
     * 위탁서 부품가용 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issuePartsAvlb/multiIssueReqDetailPartsAvlbes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueReqDetailPartsAvlbes(@Validated @RequestBody BaseSaveVO<IssueReqDetailVO> issueReqDetailVO, BindingResult bindingResult) throws Exception
    {
        issuePartsAvlbService.multiIssueReqDetailPartsAvlbes(issueReqDetailVO);
        return true;

    }


    /**
     * 정비수령조회 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqStatusMain.do", method = RequestMethod.GET)
    public String selectIssueReqStatusMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeRoVO = commonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeRoVO != null){
            parGiTpList.add(commonCodeRoVO);
        }
        // 공통코드 : 위탁서 유형(IN) : 내부운용
        CommonCodeVO commonCodeInVO = commonCodeService.selectCommonCodeByKey("PAR301", "IN");
        if(commonCodeInVO != null){
            parGiTpList.add(commonCodeInVO);
        }
        model.addAttribute("parGiTpList", parGiTpList);
        // 공통코드 : 정비차용상태
        model.addAttribute("borrowStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR305", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", null, langCd));

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
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("carLineList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/par/ism/issueReq/selectIssueReqStatusMain";

    }

    /**
     * 정비수령 정비수령/정비반품 처리.
     * @param issuePartsOutSaveVO - 저장정보를 포함하는 IssuePartsOutSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/insertIssuePartsOutInves.do", method = RequestMethod.POST)
    @ResponseBody
    public synchronized IssuePartsOutSaveVO insertIssuePartsOutInves(@RequestBody IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception{
    	//update by lyy 上方方法定义增加同步synchronized，避免同时执行该方法 2018-08-15 start
    	issuePartsOutService.insertIssuePartsOut(issuePartsOutSaveVO);
    	//update by lyy 上方方法定义增加同步synchronized，避免同时执行该方法 2018-08-15 end
        return issuePartsOutSaveVO;

    }

    /**
     * 기초재고입고 부품자동출고 처리한다.
     * @param issueReqSaveVO - 저장정보를 포함하는 IssueReqSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/insertIssuePartsOutAutoInves.do", method = RequestMethod.POST)
    @ResponseBody
    public IssuePartsOutSaveVO insertIssuePartsOutAutoInves(@RequestBody IssueReqSearchVO searchVO) throws Exception{

        IssuePartsOutSaveVO issuePartsOutSaveVO = new IssuePartsOutSaveVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        //기초재고입고 V3 정비수령 정보 조회.
        ReceiveEtcVerThdSupportSearchVO searchVO01 = new ReceiveEtcVerThdSupportSearchVO();
        searchVO01.setsDlrCd(LoginUtil.getDlrCd());
        searchVO01.setsApplyGiYn("N");
        //기초재고V3 정비수령 RO번호 조회.
        List<ReceiveEtcItemTrdSupportVO> roDocList = issuePartsOutAutoService.selectReceiveEtcVerSupportThdesRoDocNoByCondition(searchVO01);

        //기초재고V3 정비수령 행 처리. : 에러발생해도 다음 RO 작업을 진행함.
        for(ReceiveEtcItemTrdSupportVO receiveEtcItemTrdSupportVO : roDocList){
            try{
                issuePartsOutSaveVO = issuePartsOutAutoService.insertIssuePartsOutAutoRow(searchVO, receiveEtcItemTrdSupportVO);
            }catch(Exception ex){
                logger.error("Controller Area : PT_0501T AND SE_0300T is not Exist roDocNo : "+receiveEtcItemTrdSupportVO.getRoDocNo());
            }
        }

        return issuePartsOutSaveVO;
    }


    /**
     * 내부수령 정비수령/정비반품 처리.
     * @param issuePartsOutSaveVO - 저장정보를 포함하는 IssuePartsOutSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/insertIssuePartsOutInnerInves.do", method = RequestMethod.POST)
    @ResponseBody
    public IssuePartsOutSaveVO insertIssuePartsOutInnerInves(@RequestBody IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception{

        issuePartsOutService.insertIssuePartsOutInner(issuePartsOutSaveVO);

        return issuePartsOutSaveVO;

    }

    /**
     * 출고등록 헤더,상세정보를 반품한다.
     * @param issuePartsOutSaveVO - 저장정보를 포함하는 IssuePartsOutSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/insertIssuePartsOutReturnInves.do", method = RequestMethod.POST)
    @ResponseBody
    public IssuePartsOutSaveVO insertIssuePartsOutReturnInves(@RequestBody IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception{

        issuePartsOutService.insertIssuePartsOutReturn(issuePartsOutSaveVO);

        return issuePartsOutSaveVO;

    }

    /**
     * 출고확정 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqConfirmMain.do", method = RequestMethod.GET)
    public String selectIssueReqConfirmMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형
        model.addAttribute("parGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR301", null, langCd));
        // 공통코드 : 부품출고상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR311", null, langCd));

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        return "/par/ism/issueReq/selectIssueReqConfirmMain";

    }

    /**
     * 출고확정 헤더 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqConfirms.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqConfirms(@RequestBody IssuePartsOutSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(issuePartsOutService.selectIssuePartsOutsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issuePartsOutService.selectIssuePartsOutsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 출고확정 상세 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqDetailConfirms.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueReqDetailConfirms(@RequestBody IssuePartsOutDetailSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 센터코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(issuePartsOutDetailService.selectIssuePartsOutDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issuePartsOutDetailService.selectIssuePartsOutDetailsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 출고확정/취소 상세 목록 데이터를 저장한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/multiIssueReqDetailConfirms.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueReqDetailConfirms(@Validated @RequestBody BaseSaveVO<IssuePartsOutDetailVO> issuePartsOutDetailVO, BindingResult bindingResult) throws Exception
    {
        issuePartsOutDetailService.multiIssuePartsOutDetails(issuePartsOutDetailVO);
        return true;

    }

    /**
     * 출고확정취소 상세 목록 데이터를 저장한다.
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/multiIssueReqPartsOutCancDetails.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiIssueReqPartsOutCancDetails(@Validated @RequestBody BaseSaveVO<IssueReqDetailVO> issueReqDetailVO, BindingResult bindingResult) throws Exception
    {
        issuePartsOutDetailService.multiIssueReqPartsOutDetails(issueReqDetailVO);
        return true;

    }

    /**
     * 출고현황 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqConfirmStatusMain.do", method = RequestMethod.GET)
    public String selectIssueReqConfirmStatusMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 공통코드 : 위탁서 유형(RO)
        List<CommonCodeVO> parGiTpList = new ArrayList<CommonCodeVO>();
        CommonCodeVO commonCodeRoVO = commonCodeService.selectCommonCodeByKey("PAR301", "RO");
        if(commonCodeRoVO != null){
            parGiTpList.add(commonCodeRoVO);
        }
        // 공통코드 : 위탁서 유형(IN) : 내부운용
        CommonCodeVO commonCodeInVO = commonCodeService.selectCommonCodeByKey("PAR301", "IN");
        if(commonCodeInVO != null){
            parGiTpList.add(commonCodeInVO);
        }
        // 공통코드 : 위탁서 유형(BR) : 정비차용
        CommonCodeVO commonCodeBrVO = commonCodeService.selectCommonCodeByKey("PAR301", "BR");
        if(commonCodeBrVO != null){
            parGiTpList.add(commonCodeBrVO);
        }
        model.addAttribute("parGiTpList", parGiTpList);
        // 공통코드 : 정비차용상태
        model.addAttribute("borrowStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR305", null, langCd));
        // 공통코드 : 부품출고요청상태
        model.addAttribute("partsParReqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR302", "Y", langCd));
        //RO상태
        model.addAttribute("roStatusCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd));
        //RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));
        // 공통코드 : 준비수령상태
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
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        //SA 리스트.
        IssueReqTechManSearchVO searchVO = new IssueReqTechManSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("tecCdList", issueReqTechManService.selectTechManFnMasterByCondition(searchVO));
        //브랜드(부품품종) 리스트.
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        return "/par/ism/issueReq/selectIssueReqConfirmStatusMain";
    }

    /**
     * 부품판매 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issue/selectIssueMain.do", method = RequestMethod.GET)
    public String selectIssueMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

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
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        // 배송PDC
        model.addAttribute("dlPdcCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        // 할인(vat)
        model.addAttribute("vatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        // 상태
        model.addAttribute("statusCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR311", null, langCd));

        // BMP 거래처코드
        VenderMasterVO venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());
        if(venderMasterVO != null){
            model.addAttribute("bmpBpCd", venderMasterVO.getBpCd());
        }else{
            model.addAttribute("bmpBpCd", "A10AA001");
        }
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());

        return "/par/ism/issue/selectIssueMain";

    }

    @RequestMapping(value = "/par/cmm/selectIssuePartsInfoExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectIssuePartsInfoExcelUploadPopup(Model model) throws Exception {

        return "/par/cmm/selectIssuePartsInfoExcelUploadPopup";
    }

    @RequestMapping(value = "/par/ism/issue/insertIssuePartsInfoExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertIssuePartsInfoExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        /*List<PurcOrdItemVO> list = new ArrayList<PurcOrdItemVO>();
        List<PurcOrdItemVO> resultList = new ArrayList<PurcOrdItemVO>();
        PurcOrdItemVO       chkPurcOrdItem = new PurcOrdItemVO();
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());*/

        //업로드상태 정보를 세션에 저장한다.
        //WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            /*try{
                ExcelReader<PurcOrdItemVO> excelReader = new ExcelReader<PurcOrdItemVO>(PurcOrdItemVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);


                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    chkPurcOrdItem = new PurcOrdItemVO();
                    errors         = new ArrayList<ExcelUploadError>();

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt = totErrCnt + 1;
                       resultList.add(list.get(i));
                   }else{

                       list.get(i).setDlrCd(LoginUtil.getDlrCd());
                       list.get(i).setBpCd(venderMasterVO.getBpCd());

                       chkPurcOrdItem =   purcOrdService.selectPurcOrdItemExcelUploadByKey(list.get(i));

                       //부품마스터에 없는 부품인경우
                       if(chkPurcOrdItem  == null){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage(
                                   "global.info.emptyParamInfo"
                                   , new String[]{
                                           messageSource.getMessage("ser.title.itemInfo", null, LocaleContextHolder.getLocale())
                                   }
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                           continue;
                       }

                       //공급처가  없는 부품인경우
                       if(chkPurcOrdItem.getBpCd() == null){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage(
                                   "global.err.chkBpCdIsBMP"
                                   , new String[]{}
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                           continue;
                       }

                       list.get(i).setGrStrgeCd(chkPurcOrdItem.getGrStrgeCd());
                       list.get(i).setItemNm(chkPurcOrdItem.getItemNm());
                       list.get(i).setPurcItemTp(chkPurcOrdItem.getPurcItemTp());
                       list.get(i).setPurcItemStatCd(chkPurcOrdItem.getPurcItemStatCd());
                       list.get(i).setPurcUnitCd(chkPurcOrdItem.getPurcUnitCd());
                       list.get(i).setPurcQty(chkPurcOrdItem.getPurcQty());
                       list.get(i).setPurcPrc(chkPurcOrdItem.getPurcPrc());
                       list.get(i).setPurcAmt(chkPurcOrdItem.getPurcAmt());
                       list.get(i).setPurcLeadHm(chkPurcOrdItem.getPurcLeadHm());

                      // resultList.add(chkPurcOrdItem);
                      resultList.add(list.get(i));
                   }
                }

                //엑셀 업로드 시 에러 라인이 존재할 경우
                if(totErrCnt > 0){
                    result.setTotal(resultList.size());
                    result.setData(resultList);

                //엑셀 업로드 시 에러 라인이 없는 경우
                }else{
                    result.setTotal(-999);
                    result.setData(resultList);
                }
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }*/
        }

        return result;

    }

    @RequestMapping(value = "/par/ism/issueReq/selectIssueReqCheckPopup.do", method = RequestMethod.GET)
    public String selectIssueReqCheckPopup(Model model) throws Exception {

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/par/ism/issueReq/selectIssueReqCheckPopup";
    }

    @RequestMapping(value = "/par/ism/issueReq/selectIssueReceiveCheckPopup.do", method = RequestMethod.GET)
    public String selectIssueReceiveCheckPopup(Model model, HttpServletRequest request) throws Exception {

        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
        //정비수령자 권한 사용자 리스트.
        List<UserVO> recipientUserVOList = roleMappingService.selectUsersByRoleId(sysCd, LoginUtil.getDlrCd(), null, null, "ROLE_RECIPIENT");

        model.addAttribute("tecCdList", recipientUserVOList);

        return "/par/ism/issueReq/selectIssueReceiveCheckPopup";
    }


    @RequestMapping(value = "/par/ism/issueReq/selectIssueReceiveCheckDetailPopup.do", method = RequestMethod.GET)
    public String selectIssueReceiveCheckDetailPopup(Model model, HttpServletRequest request) throws Exception {

        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
        //정비수령자 권한 사용자 리스트.
        List<UserVO> recipientUserVOList = roleMappingService.selectUsersByRoleId(sysCd, LoginUtil.getDlrCd(), null, null, "ROLE_RECIPIENT");

        model.addAttribute("tecCdList", recipientUserVOList);

        return "/par/ism/issueReq/selectIssueReceiveCheckDetailPopup";
    }

    /**
     * 정비수령 수령인목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectUsersByRoleRecipientes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsersByRoleRecipientes(@RequestBody IssueReqSearchVO searchVO, HttpServletRequest request) throws Exception{

        SearchResult result = new SearchResult();
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
        //정비수령자 권한 사용자 리스트.
        List<UserVO> recipientUserVOList = roleMappingService.selectUsersByRoleId(sysCd, LoginUtil.getDlrCd(),searchVO.getsEmpNo(), searchVO.getsUsrNm(), "ROLE_RECIPIENT");

        result.setData(recipientUserVOList);
        result.setTotal(recipientUserVOList.size());

        return result;
    }


    @RequestMapping(value = "/par/ism/issueReq/selectIssueReceivePrintPopup.do", method = RequestMethod.GET)
    public String selectIssueReceivePrintPopup(Model model) throws Exception {
        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        //로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        return "/par/ism/issueReq/selectIssueReceivePrintPopup";
    }

    @RequestMapping(value = "/par/ism/issueReq/selectIssueReceivePartsOutPrintPopup.do", method = RequestMethod.GET)
    public String selectIssueReceivePartsOutPrintPopup(Model model) throws Exception {
        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        //로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        //SA 리스트.
        IssueReqTechManSearchVO searchVO = new IssueReqTechManSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<String> sRoleIdList = new ArrayList<String>();
        sRoleIdList.add("ROLE_RECIPIENT");//정비수령 권한코드
        searchVO.setsRoleIdList(sRoleIdList);

        model.addAttribute("tecCdList", issueReqTechManService.selectTechManFnMasterUseresByCondition(searchVO));

        return "/par/ism/issueReq/selectIssueReceivePartsOutPrintPopup";
    }

    @RequestMapping(value = "/par/ism/issueReq/selectIssueReturnCheckPopup.do", method = RequestMethod.GET)
    public String selectIssueReturnCheckPopup(Model model) throws Exception {

        //SA 리스트.
        IssueReqTechManSearchVO searchVO = new IssueReqTechManSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<String> sRoleIdList = new ArrayList<String>();
        sRoleIdList.add("ROLE_RECIPIENT");//정비수령 권한코드
        searchVO.setsRoleIdList(sRoleIdList);

        model.addAttribute("tecCdList", issueReqTechManService.selectTechManFnMasterUseresByCondition(searchVO));

        return "/par/ism/issueReq/selectIssueReturnCheckPopup";
    }

    @RequestMapping(value = "/par/ism/issueReq/selectIssueReturnCheckDetailPopup.do", method = RequestMethod.GET)
    public String selectIssueReturnCheckDetailPopup(Model model, HttpServletRequest request) throws Exception {

        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");
        //정비수령자 권한 사용자 리스트.
        List<UserVO> recipientUserVOList = roleMappingService.selectUsersByRoleId(sysCd, LoginUtil.getDlrCd(), null, null, "ROLE_RECIPIENT");

        model.addAttribute("tecCdList", recipientUserVOList);

        return "/par/ism/issueReq/selectIssueReturnCheckDetailPopup";
    }

    @RequestMapping(value = "/par/ism/issueReq/selectIssueReturnCheckUserPopup.do", method = RequestMethod.GET)
    public String selectIssueReturnCheckUserPopup(Model model, HttpServletRequest request) throws Exception {

        return "/par/ism/issueReq/selectIssueReturnCheckUserPopup";
    }


    @RequestMapping(value = "/par/ism/issueReq/selectIssueReturnPrintPopup.do", method = RequestMethod.GET)
    public String selectIssueReturnPrintPopup(Model model) throws Exception {

        return "/par/ism/issueReq/selectIssueReturnPrintPopup";
    }

    @RequestMapping(value = "/par/ism/issueReq/selectIssueReturnCheckUseYnPopup.do", method = RequestMethod.GET)
    public String selectIssueReturnCheckUseYnPopup(Model model) throws Exception {

        return "/par/ism/issueReq/selectIssueReturnCheckUseYnPopup";
    }

    /**
     * 출고부품 세부정보를 반환한다.
     * @param issuePartsOutSaveVO - 저장정보를 포함하는 IssuePartsOutSaveVO
     * @return
     */
    @RequestMapping(value = "/par/ism/issueReq/selectIssuePartsOutDetailInfoByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public IssuePartsOutDetailItemVO selectIssuePartsOutDetailInfoByKey(@RequestBody IssuePartsOutDetailSearchVO searchVO) throws Exception{

        return issuePartsOutDetailService.selectIssuePartsOutDetailInfoByKey(LoginUtil.getDlrCd(), searchVO.getsItemCd());

    }


    /**
     * 정산 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issue/selectCalculateMain.do", method = RequestMethod.GET)
    public String selectCalculateMain(Model model, @RequestParam(value="pParSalesOrdNo", defaultValue="") String pParSalesOrdNo,@RequestParam(value="pParSalesEstimateNo", defaultValue="") String pParSalesEstimateNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList        = new ArrayList<UnitInfoVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList  = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);


        // 공통코드 : 결제유형//부품판매는 '04' 고객
        model.addAttribute("paymTpCdList",          commonCodeService.selectCommonCodesByCmmGrpCd("SER060", null, langCd));
        //브랜드 코드
        model.addAttribute("brandCdDs",             commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));
        // 증서유형 코드
        model.addAttribute("mathDocTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));
        // 메인연락방법 코드
        model.addAttribute("prefContactMthCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("CRM038", null, langCd));
        // 메인연락시간 코드
        model.addAttribute("prefContactTimeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM027", null, langCd));
        // 수리유형(정비유형)
        model.addAttribute("lbrTpCdList",           commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 기타유형
        model.addAttribute("etcTpCdList",           commonCodeService.selectCommonCodesByCmmGrpCd("SER017", null, langCd));
        //영수증유형
        model.addAttribute("rcptTpCdList",          commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, langCd));
        //지불방식
        //model.addAttribute("paymMthCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, langCd));by wushibin 20191128
        model.addAttribute("paymMthCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", langCd));
        //지불기한
        model.addAttribute("paymPridCdList",        commonCodeService.selectCommonCodesByCmmGrpCd("SER062", null, langCd));

        model.addAttribute("loginUsrId", LoginUtil.getUserId());
        model.addAttribute("pParSalesEstimateNo", pParSalesEstimateNo); /* 인자 : 부품견적번호  */
        model.addAttribute("pSendParSalesOrdNo", pParSalesOrdNo);           /* 인자 : 부품판매번호  */
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("preFixId", "CA");
        model.addAttribute("toDt",               sysDate);
        model.addAttribute("sevenDtBf",          sevenDtBf);
        model.addAttribute("unitCdList",         unitCdList);
        model.addAttribute("storageList",        storageList);
        model.addAttribute("custTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("saleTpList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));
        model.addAttribute("ordStatCdList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
        //정산절사
        model.addAttribute("wonUnitCutCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER063", null, langCd));
        //정산제로
        model.addAttribute("demicalPointCutCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER064", null, langCd));
      //할인대상구분
        model.addAttribute("dcPermTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER922", null, langCd));
        model.addAttribute("bmMemberGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd));

      //BM쿠폰유형
        model.addAttribute("bmCupnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER073", null, langCd));

      //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
        //할인구분
        model.addAttribute("dsDistCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        //카드종류
        model.addAttribute("cardTpCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("CRM081", null, langCd));

        return "/par/ism/issue/selectCalculateMain";

    }

    /**
     * 부품 할인권한 화면을 출력한다.(서비스 할인권한 이용)
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issue/selectDcMasterMain.do", method = RequestMethod.GET)
    public String selectDcMasterMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

         //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));
         //사용여부
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SER904", null, langCd));
         //할인구분
        model.addAttribute("dcDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER921", null, langCd));
        //할인대상구분
        model.addAttribute("dcPermTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER922", null, langCd));

        return "/par/ism/issue/selectDcMasterMain";

    }

    /**
     * 판매 즉시입출고 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issue/selectSaleNowGrgiMain.do", method = RequestMethod.GET)
    public String selectSaleNowGrgiMain(Model model) throws Exception {
        return "/par/ism/issue/selectSaleNowGrgiMain";
    }

    /**
     * 정비 즉시입출고 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/ism/issue/selectServiceNowGrgiMain.do", method = RequestMethod.GET)
    public String selectServiceNowGrgiMain(Model model) throws Exception {
        return "/par/ism/issue/selectServiceNowGrgiMain";
    }

}