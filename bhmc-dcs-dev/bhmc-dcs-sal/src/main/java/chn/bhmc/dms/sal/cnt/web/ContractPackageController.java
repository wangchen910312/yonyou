package chn.bhmc.dms.sal.cnt.web;

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
import chn.bhmc.dms.sal.cmm.service.UserInfoService;
import chn.bhmc.dms.sal.cnt.service.ContractPackageService;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 *
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.0X.XX         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cnt/contractPackage")
public class ContractPackageController extends HController {

    /**
     * 집단판매 서비스
     */
    @Resource(name="contractPackageService")
    private ContractPackageService contractPackageService;

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
     * 사용자 관리 서비스 - 판매사원
     */
    @Resource(name="userInfoService")
    UserInfoService userInfoService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContractPackageMain.do", method = RequestMethod.GET)
    public String selectContractPackagesMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate      = DateUtil.getDate("yyyy-MM-dd");
        String oneDay       = DateUtil.getDate("yyyy-MM") + "-01";
        String sevenDtBf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), "yyyy-MM-dd");
        String lastDay      = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtBf);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nextMonthDay", nextMonthDay);

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
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 영업대표 [TOBE]

        // 판매사원 리스트
        model.addAttribute("saleEmpDSInfo", userInfoService.selectUserInfoListsByCndition(LoginUtil.getDlrCd(), "13"));

        // 계약유형 : SAL003
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        // CRM001 : 고객유형 (01:개인, 02:법인)
        model.addAttribute("custTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        // 집단 계약상태 SAL029
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL029", null, langCd));

        //지불방식 : SAL071
        model.addAttribute("amtPayTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        return "/sal/cnt/contractPackage/selectContractPackageMain";
    }

    /**
     * 집단판매 내역 조회
     */
    @RequestMapping(value = "/selectContractPackageSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContractPackageSearch(@RequestBody ContractPackageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(contractPackageService.selectContractPackagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contractPackageService.selectContractPackagesByCondition(searchVO));
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
     * 내장색조회
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
     * 저장/수정 한다.
     */
    @RequestMapping(value = "/multiContractPackages.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiContractPackages(@Validated @RequestBody ContractPackageSaveVO saveVO) throws Exception {
        saveVO.getPackageVO().setDlrCd(LoginUtil.getDlrCd());
        return contractPackageService.multiContractPackages(saveVO);
    }

    /**
     * 집단판매 확정 한다.
     */
    @RequestMapping(value = "/approvalPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public String approval(@RequestBody ContractPackageVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractPackageService.approvalPackage(contVO);
    }

    /**
     * 계약을 삭제(승인전) 한다.
     */
    @RequestMapping(value = "/deleteContractPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteContractPackage(@RequestBody ContractPackageVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return contractPackageService.deleteContractPackage(contVO);
    }

    /**
     * 집단판매 차량 item 내역 조회
     */
    @RequestMapping(value = "/selectPackageItemSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageItemSearch(@RequestBody ContractPackageSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractPackageService.selectPackageItemSearchCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractPackageService.selectPackageItemSearch(searchVO));
       }
        return result;
    }


    /**
     * 프로모션 팝업 Open
     */
    @RequestMapping(value = "/selectCntPackagePromotionPopup.do", method = RequestMethod.GET)
    public String selectCntPackagePromotionPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 계약유형 : SAL003
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        // 프로모션 적용방법 : SAL132
        model.addAttribute("applyTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL132", null, langCd));

        return "/sal/cnt/contractPackage/selectCntPackagePromotionPopup";
    }

    /**
     * 프로모션 내역 조회
     **/
    @RequestMapping(value = "/selectCntPackagePromotionSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCntPackagePromotionSearch(@RequestBody ContractReSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(contractPackageService.selectCntPackagePromotionSearchCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(contractPackageService.selectCntPackagePromotionSearch(searchVO));
       }
        return result;
    }


}
