package chn.bhmc.dms.mis.rpt.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.mis.rpt.service.MisRptService;

/**
 * <pre>
 * [DMS] 경영관리 레포트
 * </pre>
 *
 * @ClassName   : MisRptController.java
 * @Description : [DMS] 경영관리 레포트
 * @author chibeom.song
 * @since 2017. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 11.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class MisRptController extends HController {

    @Resource(name="misRptService")
    MisRptService misRptService;

    /**
     * KPI FU표  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectKpiFuReportStatus.do", method = RequestMethod.GET)
    public String selectKpiFuReportStatus(Model model) throws Exception {

        return "/mis/totalMisRpt/selectKpiFuReportStatus";
    }

    /**
     * 판매고문360도 전체 분석 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectSalsesResultsAllAnalysis.do", method = RequestMethod.GET)
    public String selectSalsesResultsAllAnalysis(Model model) throws Exception {

        return "/mis/totalMisRpt/selectSalsesResultsAllAnalysis";
    }

    /**
     * 판매고문 거새 이율 종합 분석 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectSalesSynthesizeAnalysis.do", method = RequestMethod.GET)
    public String selectSalesSynthesizeAnalysis(Model model) throws Exception {

        return "/mis/totalMisRpt/selectSalesSynthesizeAnalysis";
    }

    /**
     * 파생 제품 침투율(판매고문별) 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectDerivationPerSales.do", method = RequestMethod.GET)
    public String selectDerivationPerSales(Model model) throws Exception {

        return "/mis/totalMisRpt/selectDerivationPerSales";
    }

    /**
     * 파생 제품 침투율(차종별) 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectDerivationPerCars.do", method = RequestMethod.GET)
    public String selectDerivationPerCars(Model model) throws Exception {

        return "/mis/totalMisRpt/selectDerivationPerCars";
    }



}
