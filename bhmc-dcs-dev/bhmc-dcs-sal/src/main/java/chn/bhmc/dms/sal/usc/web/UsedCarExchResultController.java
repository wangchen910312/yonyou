package chn.bhmc.dms.sal.usc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.DivisionService;
import chn.bhmc.dms.cmm.cmp.service.OfficeService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.usc.service.ExchResultService;
import chn.bhmc.dms.sal.usc.vo.ExchResultSearchVO;



/**
 * 중고차치환판매심사결과조회
 *
 * @author Kim yewon
 * @since 2016. 6. 10
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 10           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/exchRslt")
public class UsedCarExchResultController extends HController {

    /**
     * 중고차치환판매심사결과조회
     */
    @Resource(name="exchResultService")
    ExchResultService exchResultService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 사업부 관리 서비스
     */
    @Resource(name="divisionService")
    DivisionService divisionService;


    /**
     * 사무소 관리 서비스
     */
    @Resource(name="officeService")
    OfficeService officeService;


    /**
     * 보험가입정보관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;



    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;



    /**
     * 중고차치환판매심사결과조회 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectExchResultMain.do", method = RequestMethod.GET)
    public String selectExchResultMain(@RequestParam(value="sysCd", defaultValue="I") String sysCd,Model model) throws Exception {
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        DealerVO dealerVO ;
        DealerSearchVO searchVO = new DealerSearchVO();
        if(!Constants.SYS_CD_CORP.equals(sysCd)){

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            dealerVO = salesCommonService.selectDealerInfo(searchVO);
            model.addAttribute("dealerVO", dealerVO);
        }else {
            //사업부 리스트
            model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));
        }

        model.addAttribute("sysCd", sysCd);
        return "/sal/usc/exchRslt/selectExchResultMain";
    }



    /**
     * 중고차치환판매심사결과 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectExchResultList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExchResultList(@RequestBody ExchResultSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();
        
        result.setTotal(exchResultService.selectExchResultByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(exchResultService.selectExchResultByCondition(searchVO));
        }

        return result;
    }






}
