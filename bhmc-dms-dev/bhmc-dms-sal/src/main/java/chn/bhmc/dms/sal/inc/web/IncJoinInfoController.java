package chn.bhmc.dms.sal.inc.web;

import java.util.ArrayList;
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
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.service.IncPackageService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.inc.vo.IncPackageSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncProcessSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncProcessVO;

/**
 * 보험가입정보관리 컨트롤러
 *
 * @author Kim yewon
 * @since 2016. 5. 3.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                           수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.03            Kim yewon          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inc/incJoinInfo")
public class IncJoinInfoController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * 보험패키지 서비스
     */
    @Resource(name="incPackageService")
    IncPackageService incPackageService;

    /**
     * 보험가입정보관리  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectIncJoinInfoMain.do", method = RequestMethod.GET)
    public String selectIncJoinInfoMain(Model model,
            @RequestParam(value="incNo", required = false, defaultValue="") String incNo
    ) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String[] toDayArry = toDay.split("-");
        String year = toDayArry[0];
        String month = toDayArry[1];
        String date = toDayArry[2];

        String nextYearDay = Integer.toString(Integer.parseInt(year)+1) + month + date;
        model.addAttribute("toDay", toDay);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("nextYearDay", nextYearDay);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());

        //보험종류 SAL176, SAL087
        List<CommonCodeVO> incCsList = new ArrayList<CommonCodeVO>();
        incCsList.addAll(commonCodeService.selectCommonCodesByCmmGrpCd("SAL176", null, langCd));
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL087", null, langCd)){if(StringUtils.isBlank(vo.getRemark1())){incCsList.add(vo);}}
        model.addAttribute("incCSList", incCsList);
        //보험유형 SAL019, SAL088
        List<CommonCodeVO> incTpList = new ArrayList<CommonCodeVO>();
        incTpList.addAll(commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd));
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL088", null, langCd)){if(StringUtils.isBlank(vo.getRemark1())){incTpList.add(vo);}}
        model.addAttribute("incTpList", incTpList);

        //보험회사코드 목록
        model.addAttribute("incCmpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));
        //보험종류코드 목록
        model.addAttribute("regTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL126", null, langCd));
        // 3자보험유형 - 금액
        model.addAttribute("threeIncTpAmtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL197", null, langCd));
        //고객유형 목록
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));
        //보험상태 SAL177
        model.addAttribute("incStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL177", null, langCd));
        // 금융사 : SAL055
        model.addAttribute("fincCmpCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd));
        //성코드
        IncJoinInfoVO vo = new IncJoinInfoVO();
        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(vo));

        model.addAttribute("incNo", incNo);

        return "/sal/inc/incJoinInfo/selectIncJoinInfoMain";
    }


    /**
     * 보험가입정보관리  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectIncJoinInfoMain2.do", method = RequestMethod.GET)
    public String selectIncJoinInfoMain2(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String[] toDayArry = toDay.split("-");
        String year = toDayArry[0];
        String month = toDayArry[1];
        String date = toDayArry[2];

        String nextYearDay = Integer.toString(Integer.parseInt(year)+1) + month + date;
        model.addAttribute("toDay", toDay);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("nextYearDay", nextYearDay);

        //보험회사코드 목록
        model.addAttribute("incCmpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));

        //보험종류코드 목록
        model.addAttribute("regTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL126", null, langCd));

        //성코드
        IncJoinInfoVO vo = new IncJoinInfoVO();
        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(vo));

        return "/sal/inc/incJoinInfo/selectIncJoinInfoMain2";
    }




    /**
     * 보험가입정보관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIncJoinInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncJoinInfo(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        int total = incJoinInfoService.selectIncJoinInfoByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(incJoinInfoService.selectIncJoinInfoByCondition(searchVO));
        }

        return result;

    }




    /**
     * 성에 해당하는 도시를 조회.
     */
    @RequestMapping(value = "/selectCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCity(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();

        result.setData(incJoinInfoService.selectCityCd(vo));

        return result;
    }


    /**
     * 성에 해당하는 도시를 조회.
     */
    @RequestMapping(value = "/selectDist.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDist(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();

        result.setData(incJoinInfoService.selectDistCd(vo));

        return result;
    }




    /**
     * 보험가입정보관리 저장-완성
     */
    @RequestMapping(value = "/multiSaveIncJoinInfo.do", method = RequestMethod.POST)
    public @ResponseBody IncJoinInfoVO multiSaveIncJoinInfo(@RequestBody IncJoinInfoSaveVO saveVO) throws Exception {
        return incJoinInfoService.multiSaveIncJoinInfo(saveVO);
    }

    /**
     * 보험가입정보관리 퇴보
     */
    @RequestMapping(value = "/updateSateIncJoinInfo.do", method = RequestMethod.POST)
    public @ResponseBody String updateSateIncJoinInfo(@RequestBody IncJoinInfoVO saveVO) throws Exception {
        return incJoinInfoService.updateSateIncJoinInfo(saveVO);
    }


    /**
     * 선택한 고객이 인도한 차량 VIN NO 조회.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustContractNo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustContractNo(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        SearchResult result = new SearchResult();

        //int total = incJoinInfoService.selectCustContractNoCnt(searchVO);

        List<IncJoinInfoVO> rList = incJoinInfoService.selectCustContractNo(searchVO);
        result.setTotal(rList.size());
        result.setData(rList);

        return result;
    }

    /**
     * 보험신청명세(ITEM)목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIncDetailItem.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncDetailItem(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = incJoinInfoService.selectIncDetailItemCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(incJoinInfoService.selectIncDetailItem(searchVO));
        }

        return result;

    }



    /**
     * 보험가입정보관리 상세
     * @param searchVO
     * @return 조회 조건을 만족하는 중고 차량정보를 반환한다.
     */
    @RequestMapping(value="selectIncDetail.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectIncDetail(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        //평가매입정보
        IncJoinInfoVO incDetailDs = incJoinInfoService.selectIncDetail(searchVO);

        result.put("incDetailDs", incDetailDs);

        return result;

    }


    /**
     * 보험item조회 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectIncItemPopup.do", method = RequestMethod.GET)
    public String selectIncItemPopup(Model model) throws Exception{
        //String langCd = LocaleContextHolder.getLocale().getLanguage();

        return "/sal/inc/incJoinInfo/selectIncItemPopup";
    }
    /**
     * 보험 item 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectIncItemSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncItemSearch() throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        List<CommonCodeVO> list = new ArrayList<CommonCodeVO>();
        list.addAll(commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", "Y", langCd));
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL088", null, langCd)){if(StringUtils.isBlank(vo.getRemark1())){list.add(vo);}}
        SearchResult result = new SearchResult();
        result.setTotal(list.size());

        if(result.getTotal() != 0){
            result.setData(list);
        }
        return result;
    }

    /**
     * 보험패키지관리  메인목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectIncPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncPackage(@RequestBody IncPackageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(incPackageService.selectIncPackagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(incPackageService.selectIncPackagesByCondition(searchVO));
        }

        return result;

    }

    // 보험패키지관리 서브목록을 조회한다.
    @RequestMapping(value = "/selectIncDetailPackage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncDetailPackage(@RequestBody IncPackageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(incPackageService.selectIncDetailPackagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(incPackageService.selectIncDetailPackagesByCondition(searchVO));
        }

        return result;

    }


    /**
     * 보험추적 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectIncProcessPopup.do", method = RequestMethod.GET)
    public String selectIncProcessPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("toDay", sysDate);

        //추적방식 CRM377
        model.addAttribute("traceMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM377", null, langCd));
        //추적등급 SAL209
        model.addAttribute("traceGradeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL209", null, langCd));

        return "/sal/inc/incJoinInfo/selectIncProcessPopup";
    }


    /**
     * 보험 추적조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectIncProcessPopupSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIncProcessPopupSearch(@RequestBody IncProcessSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(incJoinInfoService.selectIncProcessByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(incJoinInfoService.selectIncProcessByCondition(searchVO));
        }

        return result;
    }

    /**
     * 보험 추적을 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/multiIncProcess.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiIncProcess(@Validated @RequestBody IncProcessVO saveVO) throws Exception {
        return incJoinInfoService.multiIncProcess(saveVO);
    }

}
