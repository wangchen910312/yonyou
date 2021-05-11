package chn.bhmc.dms.sal.uco.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.bsc.service.FinancialProductsManagementService;
import chn.bhmc.dms.sal.uco.service.UsedCarContractService;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractPayInfoSaveVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractSaveVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractSearchVO;
import chn.bhmc.dms.sal.uco.vo.UsedCarContractVO;

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
@RequestMapping(value = "/sal/uco/usedCarContract")
public class UsedCarContractController extends HController {

    /**
     * 중고차 계약 서비스
     */
    @Resource(name="usedCarContractService")
    UsedCarContractService usedCarContractService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;


    /**
     * 금융상품관리 서비스
     */
    @Resource(name="financialProductsManagementService")
    FinancialProductsManagementService financialProductsManagementService;



    /**
     * 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectUsedCarContractMain.do", method = RequestMethod.GET)
    public String selectUsedCarContractMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
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

        // 판매사원 리스트
        model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));

        //지불방식 : SAL071
        model.addAttribute("amtPayTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        //계약상태 : SAL002
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        // 자사차량구분 SAL118
        model.addAttribute("corpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL118", null, langCd));
        // 브랜드 COM019
        model.addAttribute("carBrandDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));


        // 차량등록지역 : SAL086
        model.addAttribute("regDistCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL086", null, langCd));

        // 보험회사 : SAL127
        model.addAttribute("incCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));

        // 보험유형 : SAL019, SAL088
        List<CommonCodeVO> incTpList = new ArrayList<CommonCodeVO>();
        incTpList.addAll(commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd));
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL088", null, langCd)){if(StringUtils.isBlank(vo.getRemark1())){incTpList.add(vo);}}
        model.addAttribute("insTpDS", incTpList);

        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));

        // 금융상품 : SA_0117T
        model.addAttribute("fincItemDS", financialProductsManagementService.selectFinancialProductAmtListsByCondition(""));

        // 수납유형 : SAL011
        model.addAttribute("rectTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL011", null, langCd));

        // 입출금유형 : SAL012
        model.addAttribute("ioTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL012", null, langCd));

        // 입출금대상유형 : SAL013
        model.addAttribute("ioTargetTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL013", null, langCd));

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));


        return "/sal/uco/usedCarContract/selectUsedCarContractMain";
    }


    /**
     * 중고차 계약 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectUsedCarContractSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedCarContractSearch(@RequestBody UsedCarContractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(usedCarContractService.selectUsedCarContractsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(usedCarContractService.selectUsedCarContractsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 중고차 계약 저장
     */
    @RequestMapping(value = "/multiContractRes.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiContractRes(@Validated @RequestBody UsedCarContractSaveVO saveVO) throws Exception {
        saveVO.getUsedCarContractVO().setDlrCd(LoginUtil.getDlrCd());
        return usedCarContractService.multiContracts(saveVO);
    }


    /**
     * 계약별 입/출금내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectUsedPayInfoSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedPayInfoSearch(@RequestBody UsedCarContractSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(usedCarContractService.selectPayInfoListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(usedCarContractService.selectPayInfoListsByCondition(searchVO));
       }
        return result;
    }

    // 계약별 입/출금내역 저장
    @RequestMapping(value = "/savePayInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public int savePayInfo(@RequestBody UsedCarContractPayInfoSaveVO payInfoVO) throws Exception {
        return usedCarContractService.savePayInfo(payInfoVO);
    }


    /**
     * 계약별 보험내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectIncSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncSearch(@RequestBody UsedCarContractSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(usedCarContractService.selectIncListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(usedCarContractService.selectIncListsByCondition(searchVO));
       }
        return result;
    }


    /**
     * 계약별 부가비용 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectOptionSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOptionSearch(@RequestBody UsedCarContractSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();
       result.setTotal(usedCarContractService.selectOptionListsByConditionCnt(searchVO));

       if(result.getTotal() != 0){
           result.setData(usedCarContractService.selectOptionListsByCondition(searchVO));
       }
        return result;
    }

    // 계약 생성
    @RequestMapping(value = "/approval.do", method = RequestMethod.POST)
    @ResponseBody
    public String approval(@RequestBody UsedCarContractVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return usedCarContractService.approval(contVO);
    }

    // 계약삭제 : 승인전
    @RequestMapping(value = "/deleteContract.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteContract(@RequestBody UsedCarContractVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return usedCarContractService.deleteContract(contVO);
    }

    // 계약취소 : 승인후
    @RequestMapping(value = "/cancelContract.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelContract(@RequestBody UsedCarContractVO contVO) throws Exception {
        contVO.setDlrCd(LoginUtil.getDlrCd());
        return usedCarContractService.cancelContract(contVO);
    }

    /**
     * 메시지 팝업 호출
     * @param model
     * @return
     */
    @RequestMapping(value = "/contractMessagePopup.do", method = RequestMethod.GET)
    public String contractMessagePopup(Model model) throws Exception{
        return "/sal/cnt/contract/contractMessagePopup";
    }

}
