package chn.bhmc.dms.mob.sal.orc.web;

import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.sal.veh.service.CarInfoService;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 종합오더현황
 *
 * @author HG
 * @since 2017. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2017.02.17       HG              최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/orc/dlrOrderSearch")
public class MobDlrOrderSearchController extends HController {

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
     * 딜러주문조회 메인 출력
     * @return
     */
    @RequestMapping(value = "/__selectDlrOrderSearchMain.do", method = RequestMethod.GET)
    public String __selectSumOrderCntDlrMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

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

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/mob/sal/orc/dlrOrderSearch/selectDlrOrderSearchMain";
    }


    @RequestMapping(value = "/selectDlrOrderSearchMain.do", method = RequestMethod.GET)
    public String selectDlrOrderSearchMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

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

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/orc/dlrOrderSearch/baseJsp/selectDlrOrderSearchMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    @RequestMapping(value = "/_selectDlrOrderSearchMainPage.do", method = RequestMethod.GET)
    public String _selectDlrOrderSearchMainPage(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

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

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        return "/mob/sal/orc/dlrOrderSearch/_selectDlrOrderSearchMainPage";
    }

     /**
     * 딜러주문조회 리스트 출력
     * @return
     */
    @RequestMapping(value = "/selectDlrOrderSearchList.do", method = RequestMethod.GET)
    public String selectSumOrderCntDlrList(Model model) throws Exception{
        return "/mob/sal/orc/dlrOrderSearch/selectDlrOrderSearchList";
    }

}
