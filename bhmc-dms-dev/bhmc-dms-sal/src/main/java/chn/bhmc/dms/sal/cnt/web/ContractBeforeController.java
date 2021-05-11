package chn.bhmc.dms.sal.cnt.web;

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

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.cnt.service.ContractBeforeService;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 전략출고(선출고관리)
 * @author Kim Jin Suk
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.09.01         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractBefore")
public class ContractBeforeController extends HController {

    /**
     * 전략출고(선출고관리)
     */
    @Resource(name="contractBeforeService")
    private ContractBeforeService contractBeforeService;

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
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 위치 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;


    /**
     * 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContractBeforeMain.do", method = RequestMethod.GET)
    public String selectContractBeforeMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 판매사원 리스트
        model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));

        // CRM001 : 고객유형 (01:개인, 02:법인)
        model.addAttribute("custTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        //지불방식 : SAL071
        model.addAttribute("amtPayTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        // 차량상태 SAL001
        model.addAttribute("carStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        // 보유상태 SAL149 (배정여부)
        model.addAttribute("ownStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
        // 오더상세유형(오더유형) SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));



        return "/sal/cnt/contractBefore/selectContractBeforeMain";
    }

    /**
     * 전략출고(선출고관리) 내역 조회
     */
    @RequestMapping(value = "/selectcontractBeforeSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectcontractBeforeSearch(@RequestBody ContractBeforeSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(contractBeforeService.selectcontractBeforesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractBeforeService.selectcontractBeforesByCondition(searchVO));
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
        //searchVO.setUseYn("Y");                       // 사용여부

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

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 선출고 확정 한다.
     */

    @RequestMapping(value = "/multiContractBefore.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiContractBefore(@Validated @RequestBody ContractBeforeSaveVO saveVO) throws Exception {
        saveVO.getBeforeVO().setDlrCd(LoginUtil.getDlrCd());
        return contractBeforeService.multiContractBefore(saveVO);
    }


    /**
     * 개별 선출고 삭제 한다.
     */
    /*
    @RequestMapping(value = "/deleteContractPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteContractPackage(@RequestBody ContractPackageVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractBeforeService.deleteContractPackage(contVO);
    }
    */

    /**
     * 집단판매 차량 item 내역 조회
     */

    @RequestMapping(value = "/selectcontractBeforeItemSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectcontractBeforeItemSearch(@RequestBody ContractBeforeSearchVO searchVO) throws Exception{

        if(searchVO.getsDlrCd() == null || "".equals(searchVO.getsDlrCd()) ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        }

       SearchResult result = new SearchResult();
       result.setTotal(contractBeforeService.selectcontractBeforeItemSearchCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractBeforeService.selectcontractBeforeItemSearch(searchVO));
       }
        return result;
    }

}
