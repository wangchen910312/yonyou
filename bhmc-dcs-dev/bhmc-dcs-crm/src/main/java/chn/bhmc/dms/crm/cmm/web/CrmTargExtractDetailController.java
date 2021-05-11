package chn.bhmc.dms.crm.cmm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSaveVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmTargExtractDetailController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author hyoung jun an
 * @since 2016. 4. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 28.   hyoung jun an     최초 생성
 * </pre>
 */
@Controller
public class CrmTargExtractDetailController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 고객추출 정보 서비스
     */
    @Resource(name="crmTargExtractService")
    CrmTargExtractService crmTargExtractService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 판매기회 정보유입 서비스
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * 딜러회원 서비스
     */
    @Resource(name="membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 고객추출 상세 정보 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain.do", method = RequestMethod.GET)
    public String selectCrmTargExtractDetailMain(Model model
            ,@RequestParam(value="sDlrCd", defaultValue="") String sDlrCd
            ,@RequestParam(value="sCustExtrTermNo", defaultValue="") String sCustExtrTermNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //고객추출 상세내역
        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();
        searchVO.setsDlrCd(sDlrCd);
        searchVO.setsCustExtrTermNo(sCustExtrTermNo);

        // boolean crmTargExtractKeyUsedYn = false; kjlee

        int crmTargExtractUsedCnt = crmTargExtractService.selectCrmTargExtractDeleteByConditionCnt(searchVO);

        List<CrmTargExtractVO> targExtractKeyList = (List<CrmTargExtractVO>)crmTargExtractService.selectCrmTargExtractDetailKeys(searchVO);
        List<CrmTargExtractVO> targExtractList = (List<CrmTargExtractVO>)crmTargExtractService.selectCrmTargExtractDetails(searchVO);

        model.addAttribute("crmTargExtractUsedCnt", crmTargExtractUsedCnt);
        model.addAttribute("targExtractKeyList", targExtractKeyList);
        model.addAttribute("targExtractList", targExtractList);
        model.addAttribute("custHoldTps", commonCodeService.selectCommonCodesByCmmGrpCd("CRM095", null, langCd)); //고객출처
        model.addAttribute("intentionClass", commonCodeService.selectCommonCodesByCmmGrpCd("CRM363", null, langCd)); //의향등급
        model.addAttribute("expcPurcHmCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM372", null, langCd)); //구매희망시기 EXPC_PURC_HM_CD
        model.addAttribute("lbrTps", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd)); //정비위탁유형
        model.addAttribute("rePairTps", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd)); //수리유형
        model.addAttribute("activeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd)); // 활동 형태(판매기회 추적)
        model.addAttribute("bmMbrGradeList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM806", null, langCd)); // BM회원등급

        //회원등급
        MembershipGradeMngSearchVO membershipGradeMngSearchVO = new MembershipGradeMngSearchVO();
        model.addAttribute("dlrMbrGradeList", membershipGradeMngService.selectGradeCodesByCondition(membershipGradeMngSearchVO));
        //성코드
        CrmTargExtractSearchVO crmTargExtractSearchVO = new CrmTargExtractSearchVO();
        model.addAttribute("cityCdInfo", crmTargExtractService.selectCityListByCondition(crmTargExtractSearchVO));

        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //캠페인정보
        SalesOpptHoldTypeMgmtSearchVO holdTpsearchVO = new SalesOpptHoldTypeMgmtSearchVO();
        holdTpsearchVO.setsHoldTp("03");
        model.addAttribute("campaignList", salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(holdTpsearchVO));

       //추출사용여부 체크



        // 로그인 정보 : 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailMain";
    }

    /**
     * 대상자 고객을 추출한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectTargetExtractSaveExcel.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectTargetExtractSaveExcel(@RequestBody CrmTargExtractSaveVO crmTargExtractVO)throws Exception {

        Map<String,Object> result = new HashMap<String,Object>();

        CrmTargExtractVO saveVO = new CrmTargExtractVO();
        String custExtrTermNo;

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(saveVO.getDlrCd())){saveVO.setDlrCd(LoginUtil.getDlrCd());}

        saveVO.setRegUsrId(LoginUtil.getUserId());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        custExtrTermNo = crmTargExtractService.multiTargExtracts(crmTargExtractVO).getCustExtrTermNo();
        saveVO.setCustExtrTermNo(custExtrTermNo);

        saveVO = crmTargExtractService.selectTargetExtractSaveExcel(saveVO);
        result.put("custExtrTermNo", saveVO.getCustExtrTermNo());
        result.put("result", saveVO.getResult());
        result.put("seq", saveVO.getSeq());
        return result;

    }

    /**
     * 지역코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 CrmTargExtractSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectDistCdList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDistCdList(@RequestBody CrmTargExtractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(crmTargExtractService.selectDistListByCondition(searchVO));

        return result;
    }

    /**
     * 추출조건을 등록/수정한다.
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/multiTargExtracts.do", method = RequestMethod.POST)
    @ResponseBody
    public CrmTargExtractVO multiTargExtracts(@Validated @RequestBody CrmTargExtractSaveVO saveVO) throws Exception {

        return crmTargExtractService.multiTargExtracts(saveVO);
    }

    /**
     * 대상자 고객을 추출한다.
     * @param marketingCampaignVO - 마케팅 캠페인 정보
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/deleteTargExtract.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteTargExtract(@RequestBody CrmTargExtractVO crmTargExtractVO)throws Exception {

        crmTargExtractService.deleteTargExtract(crmTargExtractVO);
        return true;

    }

    /**
     * 추출마스터를 수정한다.
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/updateCrmTargExtractMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateCrmTargExtractMaster(@Validated @RequestBody CrmTargExtractVO crmTargExtractVO) throws Exception {

        return crmTargExtractService.updateCrmTargExtractMaster(crmTargExtractVO);
    }

    /**
     * 추출조건 상세 대상자 미리보기 팝업을 연다.
     * @param saveVO - 대상자추출 정보 조회
     * @param
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailPopup.do", method = RequestMethod.GET)
    public String selectCrmTargExtractDetailPopup(Model model) throws Exception {
        return "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailPopup";
    }

    /**
     * 추출조건 상세 대상자 미리보기 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailPopups.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmTargExtractDetailPopups(@RequestBody CrmTargExtractSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(crmTargExtractService.selectTargExtractsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(crmTargExtractService.selectTargExtractsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 추출조건 상세 대상자 미리보기 엑셀Export 수량 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/crmTargExtract/selectCrmTargExtractDetailPopupsExcelExportCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int selectCrmTargExtractDetailPopupsExcelExportCnt(@RequestBody CrmTargExtractSearchVO searchVO) throws Exception {

        return crmTargExtractService.selectTargExtractsByConditionCnt(searchVO);

    }

}