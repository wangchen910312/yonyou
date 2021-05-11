package chn.bhmc.dms.sal.orc.web;

import java.util.Date;

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
import chn.bhmc.dms.sal.orc.service.DlrOrderSearchService;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 *
 *  딜러주문조회
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.03         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orc/dlrOrderSearch")
public class DlrOrderSearchController extends HController {

    /**
     * 딜러주문조회 서비스
     */
    @Resource(name="dlrOrderSearchService")
    DlrOrderSearchService dlrOrderSearchService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 딜러주문조회 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDlrOrderSearchMain.do", method = RequestMethod.GET)
    public String selectDlrOrderSearchMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nextMonthDay", nextMonthDay);

        // 주문유형 : SAL137 딜러용
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        // 오더상태 : SAL150
        model.addAttribute("ordStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

        // 주문조회용상태 : SAL198
        model.addAttribute("ordSrchStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL198", null, langCd));

        // detail 주문상태
        model.addAttribute("ordStatCdInfoDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL135", null, langCd));

        // 하치장 : SAL211
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL211", null, langCd));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/orc/dlrOrderSearch/selectDlrOrderSearchMain";
    }

    /**
     * 딜러주문조회 메인 그리드 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDlrOrderSearchs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrOrderSearchs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(dlrOrderSearchService.selectDlrOrderSearchsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(dlrOrderSearchService.selectDlrOrderSearchsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 딜러주문조회 세부조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDlrOrderSearchSubs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrOrderSearchSubs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(dlrOrderSearchService.selectDlrOrderSearchSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(dlrOrderSearchService.selectDlrOrderSearchSubsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 심사년월로 딜러오더종류 검색
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectMonthDlrOrderTypes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMonthDlrOrderTypes(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(dlrOrderSearchService.selectMonthDlrOrderTypes(searchVO));

        return result;
    }


}
