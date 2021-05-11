package chn.bhmc.dms.sal.fim.web;


import java.util.Calendar;
import java.util.Date;

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
import chn.bhmc.dms.sal.bsc.service.FinancialProductsManagementService;
import chn.bhmc.dms.sal.fim.service.FincInfoMngService;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngSearchVO;
import chn.bhmc.dms.sal.fim.vo.FincInfoMngVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 금융정보관리
 *
 * @author Kim Jin Suk
 * @since 2016. 6. 09
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.09           Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/fim/fincInfoMng")
public class FincInfoMngController extends HController {

    /**
     * 금융정보관리 서비스
     */
    @Resource(name="fincInfoMngService")
    private FincInfoMngService fincInfoMngService;


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
     * 금융상품관리 서비스
     */
    @Resource(name="financialProductsManagementService")
    FinancialProductsManagementService financialProductsManagementService;


    /**
     * 금융정보관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectFincInfoMngMain.do", method = RequestMethod.GET)
    public String selectFincInfoMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 현재일자 DateUtil
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

        //금융신청상태 : SAL042
        model.addAttribute("fincStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL042", null, langCd));

        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));

        // 금융상품 : SA_0117T
        model.addAttribute("fincItemDS", financialProductsManagementService.selectFinancialProductAmtListsByCondition(""));

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        // 금융상품종류 SAL160
        model.addAttribute("fincItemKindCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL160", null, langCd));

        return "/sal/fim/fincInfoMng/selectFincInfoMngMain";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

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
     * 차종과 모델에 따른 OCN조회
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
     * 모델에 따른 외장색조회
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
     * 모델에 따른 내장색조회
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
     * 금융정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFincInfoMngSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFincInfoMngSearch(@RequestBody FincInfoMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(fincInfoMngService.selectFincInfoMngsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(fincInfoMngService.selectFincInfoMngsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/multiFincInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiFincInfo(@Validated @RequestBody FincInfoMngVO saveVO) throws Exception {
        saveVO.setDlrCd(LoginUtil.getDlrCd());
        return fincInfoMngService.updateFincInfo(saveVO);
    }

    /**
     * 금융견적팝업 호출
     * @param model
     * @return
     */
    @RequestMapping(value = "/selectfincEstimatePopup.do", method = RequestMethod.GET)
    public String selectfincEstimatePopup(Model model) throws Exception{
        // 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/fim/fincInfoMng/selectfincEstimatePopup";
    }

    /**
     * 금융견적 팝업 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFincInfoPopupSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFincInfoPopupSearch(@RequestBody FincInfoMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(fincInfoMngService.selectFincInfoPopupsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(fincInfoMngService.selectFincInfoPopupsByCondition(searchVO));
        }

        return result;
    }


}
