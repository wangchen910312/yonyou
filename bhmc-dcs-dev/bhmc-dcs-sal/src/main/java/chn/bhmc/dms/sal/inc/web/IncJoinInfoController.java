package chn.bhmc.dms.sal.inc.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;

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
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * 보험가입정보관리  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectIncJoinInfoMain.do", method = RequestMethod.GET)
    public String selectIncJoinInfoMain(Model model) throws Exception {

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

        //보험회사코드 목록
        model.addAttribute("incCmpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd));
        //보험종류코드 목록
        model.addAttribute("regTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL126", null, langCd));
        //보험유형
        model.addAttribute("incTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL019", null, langCd));

        //고객유형 목록
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        //성코드
        IncJoinInfoVO vo = new IncJoinInfoVO();
        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(vo));

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
     * 보험가입정보관리 저장
     */
    @RequestMapping(value = "/multiSaveIncJoinInfo.do", method = RequestMethod.POST)
    public @ResponseBody Boolean multiSaveIncJoinInfo(@RequestBody IncJoinInfoSaveVO saveVO) throws Exception {

        incJoinInfoService.multiSaveIncJoinInfo(saveVO);

        return true;
    }



    /**
     * 선택한 고객이 인도한 차량 VIN NO 조회.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCustContractNo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCustContractNo(@RequestBody IncJoinInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        int total = incJoinInfoService.selectCustContractNoCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(incJoinInfoService.selectCustContractNo(searchVO));
        }

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

}
