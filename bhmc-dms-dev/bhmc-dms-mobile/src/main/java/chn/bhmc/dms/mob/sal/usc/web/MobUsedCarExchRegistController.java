package chn.bhmc.dms.mob.sal.usc.web;

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

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.usc.service.ExchResultService;
import chn.bhmc.dms.sal.usc.vo.ExchResultSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobUsedCarExchRegistController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class MobUsedCarExchRegistController extends HController {
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
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;

    /**
     * 중고차치환판매심사결과조회 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/sal/usc/exchRslt/selectExchRegistMain.do", method = RequestMethod.GET)
    public String selectExchRegistMain(@RequestParam(value="sysCd", defaultValue="I") String sysCd,Model model) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        DealerVO dealerVO ;
        DealerSearchVO searchVO = new DealerSearchVO();
        if(!Constants.SYS_CD_CORP.equals(sysCd)){

            searchVO.setsDlrCd(mobLoginVO.getDlrCd());
            dealerVO = salesCommonService.selectDealerInfo(searchVO);
            model.addAttribute("dealerVO", dealerVO);
        }else {
            //사업부 리스트
            model.addAttribute("sdptCdList", salesCommonService.selectDealerSdpt(searchVO));
        }

        model.addAttribute("sysCd", sysCd);

        String dlrCd = mobLoginVO.getDlrCd();
        String usrId = mobLoginVO.getUserId();
        String usrNm = mobLoginVO.getUserNm();
        model.addAttribute("dlrCd", dlrCd);
        model.addAttribute("usrId", usrId);
        model.addAttribute("usrNm", usrNm);
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        return "/mob/sal/usc/exchRslt/selectExchRegistMain";
    }

    /**
     * 중고차치환판매심사결과조회 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mob/sal/usc/exchRslt/selectExchRegistList.do", method = RequestMethod.GET)
    public String selectExchRegistList(Model model) throws Exception {
        return "/mob/sal/usc/exchRslt/selectExchRegistList";
    }

    /**
     * 중고차치환판매심사결과 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/sal/usc/exchRslt/selectExchResultList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExchResultList(@RequestBody ExchResultSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();

        result.setTotal(exchResultService.selectExchResultByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(exchResultService.selectExchResultByCondition(searchVO));
        }

        return result;
    }
}