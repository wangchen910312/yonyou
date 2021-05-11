package chn.bhmc.dms.par.rpt.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ParReportController.java
 * @Description : Par 레포투 컨트롤러
 * @author Eun Joo Kim
 * @since 2017.02.28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017.02.28.     Eun Joo Kim     최초 생성
 * </pre>
 */

@Controller
public class ParReportController extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
    /**
     * 부품구매통계
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectPartOrderReport.do", method = RequestMethod.GET)
    public String selectPartOrderReport(Model model) throws Exception {
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("purcOrdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("dateFormat", dateFormat);

        return "/par/rpt/selectPartOrderReport";
    }

    /**
     * 부품구매통계
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectPurStockReport.do", method = RequestMethod.GET)
    public String selectPurStockReport(Model model) throws Exception {
        //입고창고
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("dateFormat", dateFormat);

        return "/par/rpt/selectPurStockReport";
    }

    /**
     * 부품출고집계
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectPartReleaseReport.do", method = RequestMethod.GET)
    public String selectPartReleaseReport(Model model) throws Exception {
        //창고
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageList);
        model.addAttribute("dateFormat", dateFormat);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/rpt/selectPartReleaseReport";
    }

    /**
     * 부품출고집계
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectPartStockReport.do", method = RequestMethod.GET)
    public String selectPartStockReport(Model model) throws Exception {
        //창고
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageList);

        return "/par/rpt/selectPartStockReport";
    }

    /**
     * 입고현황리포트
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectReceiveListReport.do", method = RequestMethod.GET)
    public String selectReceiveListReport(Model model) throws Exception {
        //창고
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("dateFormat", dateFormat);

        return "/par/rpt/selectReceiveListReport";
    }

    /**
     * 입고재고현황
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectReceiveStockReport.do", method = RequestMethod.GET)
    public String selectReceiveStockReport(Model model) throws Exception {
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String searchDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -1), dateFormat);
        model.addAttribute("toDt", searchDtBf);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/par/rpt/selectReceiveStockReport";
    }

    /**
     * 입고현황리포트
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectPartPlanReport.do", method = RequestMethod.GET)
    public String selectPartPlanReport(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //임무 공통코드정보 조회.
        model.addAttribute("dstDstinTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR505", null, langCd));
        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("langCd", langCd);

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDateYY = DateUtil.getDate("YYYY");
        String sysDateMM = DateUtil.getDate("MM");
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);
        model.addAttribute("sysDateYY", sysDateYY);
        model.addAttribute("sysDateMM", sysDateMM);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("dateFormat", dateFormat);

        return "/par/rpt/selectPartPlanReport";
    }

    /**
     * 회전율분석
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectTurnOverRatioReport.do", method = RequestMethod.GET)
    public String selectTurnOverRatioReport(Model model) throws Exception {

        //String sysDate = DateUtil.getDate("yyyyMM");
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        //String sysDate = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -1), dateFormat);
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("sysDate", sysDate);

        //창고
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageList);

        return "/par/rpt/selectTurnOverRatioReport";
    }

    /**
     * 방치품집계
     * @return
     */
    @RequestMapping(value = "/par/rpt/selectLeaveItemReport.do", method = RequestMethod.GET)
    public String selectLeaveItemReport(Model model) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/par/rpt/selectLeaveItemReport";
    }
}
