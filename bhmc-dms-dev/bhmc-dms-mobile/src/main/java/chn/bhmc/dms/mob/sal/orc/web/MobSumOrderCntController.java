package chn.bhmc.dms.mob.sal.orc.web;

import java.util.Calendar;
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

import chn.bhmc.dms.sal.veh.service.VehicleSpecModelService;

import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;

import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.orc.service.SumOrderCntService;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.service.BtoSearchOrderService;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 종합오더현황
 *
 * @author Kim In
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2016.03.18       Kim In          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/orc/sumOrderCnt")
public class MobSumOrderCntController extends HController {

    /**
     * 종합오더현황-딜러
     */
    @Resource(name="sumOrderCntService")
    private SumOrderCntService sumOrderCntService;

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
     * 금융 상품 관리 서비스
     */
    @Resource(name="btoCreateOrderService")
    BtoCreateOrderService btoCreateOrderService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * BTO 주문조회 서비스
     */
    @Resource(name="btoSearchOrderService")
    BtoSearchOrderService btoSearchOrderService;

    /**
     * 차량 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 모델 서비스
     */
    @Resource(name="vehicleSpecModelService")
    VehicleSpecModelService vehicleSpecModelService;

    /**
     * 종합오더현황-딜러 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/__selectSumOrderCntDlrMain.do", method = RequestMethod.GET)
    public String __selectSumOrderCntDlrMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);


        // 주문유형 : SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        // 주문상태 : SAL150
        model.addAttribute("ordStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

        // BTO주문상태 : SAL135
        model.addAttribute("btoOrdStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL196", null, langCd));

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

     // 주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        /*VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();

        model.addAttribute("carlineNames", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));
        model.addAttribute("modelNames", vehicleSpecModelService.selectVehicleModelByCondition(vehicleSearchVO) );*/

        return "/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrMain";
    }

    /**
     * 종합오더현황-딜러 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrMain.do", method = RequestMethod.GET)
    public String selectSumOrderCntDlrMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);
        // 주문유형 : SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
        // 주문상태 : SAL150
        model.addAttribute("ordStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));
        // BTO주문상태 : SAL135
        model.addAttribute("btoOrdStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL196", null, langCd));
        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));
     // 주차정보
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoSearchOrderService.selectWeekRemark(searchVO));
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/orc/sumOrderCnt/baseJsp/selectSumOrderCntDlrMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 종합오더현황-딜러 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrList.do", method = RequestMethod.GET)
    public String selectSumOrderCntDlrList(Model model) throws Exception{
        return "/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrList";
    }

    /**
     * 종합오더현황-딜러 상세목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrSubList.do", method = RequestMethod.GET)
    public String selectSumOrderCntDlrSubList(Model model) throws Exception{
        return "/mob/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubList";
    }

    /**
     * 종합오더현황-딜러 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSumOrderCntDlrs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        //searchVO.setsDlrCd(mobLoginVO.getDlrCd());      // 딜러코드

        result.setTotal(sumOrderCntService.selectSumOrderCntDlrsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(sumOrderCntService.selectSumOrderCntDlrsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 종합오더현황-딜러 세부조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntDlrSubs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSumOrderCntDlrSubs(@RequestBody SumOrderCntSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(sumOrderCntService.selectSumOrderCntDlrSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(sumOrderCntService.selectSumOrderCntDlrSubsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 종합오더현황-법인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectSumOrderCntCorpMain.do", method = RequestMethod.GET)
    public String selectSumOrderCntCorpMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 주문유형 : SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));

        // 주문상태 : SAL150
        model.addAttribute("ordStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd));

        // 하치장 : SAL152
        model.addAttribute("vinmVlocDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL152", null, langCd));

        // 주차
        BtoCreateOrderSearchVO searchVO = new BtoCreateOrderSearchVO();
        searchVO.setsOrdTp("N1");
        model.addAttribute("ordYyMmPridInfo", btoCreateOrderService.selectWeekRemark(searchVO));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/mob/sal/orc/sumOrderCnt/selectSumOrderCntCorpMain";
    }

}
