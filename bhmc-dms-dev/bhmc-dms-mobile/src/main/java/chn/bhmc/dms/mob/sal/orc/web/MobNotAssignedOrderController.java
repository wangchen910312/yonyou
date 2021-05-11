package chn.bhmc.dms.mob.sal.orc.web;

import java.util.Calendar;
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

import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;

import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;

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
@RequestMapping(value = "/mob/sal/orc/orderPlacement")
public class MobNotAssignedOrderController extends HController {

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

     /**
     * BTO 주문조회 서비스
     */
    @Resource(name="btoSearchOrderService")
    BtoSearchOrderService btoSearchOrderService;

     /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 미배정 오더조회 출력
     * @return
     */
    @RequestMapping(value = "/_selectNotAssignedOrderMain.do", method = RequestMethod.GET)
    public String _selectSumOrderCntDlrMain(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, LocaleContextHolder.getLocale().getLanguage()));

        //담보유형
        model.addAttribute("mortgageTp", commonCodeService.selectCommonCodesByCmmGrpCd("SAL204", null, LocaleContextHolder.getLocale().getLanguage()));


        //주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/mob/sal/orc/orderPlacement/selectNotAssignedOrderMain";
    }

    /**
     * 미배정 오더조회 출력
     * @return
     */
    @RequestMapping(value = "/selectNotAssignedOrderMain.do", method = RequestMethod.GET)
    public String selectSumOrderCntDlrMain(Model model) throws Exception{

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, LocaleContextHolder.getLocale().getLanguage()));

        //담보유형
        model.addAttribute("mortgageTp", commonCodeService.selectCommonCodesByCmmGrpCd("SAL204", null, LocaleContextHolder.getLocale().getLanguage()));


        //주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/orc/orderPlacement/baseJsp/selectNotAssignedOrderMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";

    }

        /**
     * 미배정 오더조회 리스트 출력
     * @return
     */
    @RequestMapping(value = "/selectNotAssignedOrderList.do", method = RequestMethod.GET)
    public String selectSumOrderCntDlrList(Model model) throws Exception{
        return "/mob/sal/orc/orderPlacement/selectNotAssignedOrderList";
    }
}
