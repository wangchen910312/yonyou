package chn.bhmc.dms.crm.cif.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.crm.cif.vo.CustChargeHistSearchVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustChargeMgmtService;
import chn.bhmc.dms.crm.cif.vo.CustChargeMstSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustChargeMgmtController.java
 * @Description : 고객 충전 관리
 * @author liu jing
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     liu jing                   최초 생성
 * </pre>
 */

@Controller
public class CustChargeMgmtController extends HController {


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="custChargeMgmtService")
    CustChargeMgmtService custChargeMgmtService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 고객 예치금 충전 조회 한다.
     *
     * @param searchVO
     *
     * @return
     */
    @RequestMapping(value = "/crm/cif/custChargeMgmt/selectCustChargeMgmtMain.do", method = RequestMethod.GET)
    public String selectCustomerChargeMgmtMain(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("rcptTp", commonCodeService.selectCommonCodesByCmmGrpCd("SER072", null, LocaleContextHolder.getLocale().getLanguage()));
        //model.addAttribute("paymMth",commonCodeService.selectCommonCodesByCmmGrpCd("SER061", null, LocaleContextHolder.getLocale().getLanguage())); by wushibin 20191128
        model.addAttribute("paymMth",commonCodeService.selectCommonCodesByCmmGrpCd("SER061", "Y", LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dcUseTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM052", null, langCd));
        return "/crm/cif/custChargeMgmt/selectCustChargeMgmtMain";
    }


    /**
     * 예치금 충전 결과 목록 데이터를 조회한다.
     * @param searchVO - CustChargeMstSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/custChargeMgmt/selectCustChargeMgmtMainResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustChargeMgmtMainResults(@RequestBody CustChargeMstSearchVO searchVO) throws Exception {


        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        SearchResult result = new SearchResult();

        result.setTotal(custChargeMgmtService.selectCustChargeMstByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(custChargeMgmtService.selectCustChargeMstByCondition(searchVO));
        }
        return result;
    }


    /**
     * 예치금 충전 상세 결과 목록 데이터를 조회한다.
     * @param searchVO - CustChargeHistSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/custChargeMgmt/selectCustChargeMgmtHistResults.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustChargeMgmtHistResults(@RequestBody CustChargeHistSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(custChargeMgmtService.selectCustChargeHistByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(custChargeMgmtService.selectCustChargeHistByCondition(searchVO));
        }
        return result;
    }



    @RequestMapping(value = "/crm/cif/custChargeMgmt/insertCustChargeMgmtHist.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertCustChargeHist(@RequestBody CustChargeHistVO custChargeHistVO) throws Exception {

        custChargeHistVO.setRegUsrId(LoginUtil.getUserId());
        custChargeHistVO.setDlrCd(LoginUtil.getDlrCd());
        return custChargeMgmtService.insertCustChargeHist(custChargeHistVO);
    }


    /**
     * 예치금 충전 결과 목록 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - CustChargeMstSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cif/custChargeMgmt/selectCustChargeMgmtMainResultsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectCustChargeMgmtMainResultsExcelExportCnt(@RequestBody CustChargeMstSearchVO searchVO) throws Exception {

        return custChargeMgmtService.selectCustChargeMstByConditionCnt(searchVO);
    }



}
