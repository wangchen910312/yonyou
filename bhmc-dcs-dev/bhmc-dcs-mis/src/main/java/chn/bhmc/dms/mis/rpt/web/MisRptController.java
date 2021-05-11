package chn.bhmc.dms.mis.rpt.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;

import chn.bhmc.dms.mis.rpt.vo.MisRptVO;
import chn.bhmc.dms.mis.rpt.service.MisRptService;

/**
 * <pre>
 * [DCS] 경영관리 레포트
 * </pre>
 *
 * @ClassName   : MisRptController.java
 * @Description : [DCS] 경영관리 레포트
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
     * [DCS] KPI리포트  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectKpiReportStatus.do", method = RequestMethod.GET)
    public String selectKpiReportStatus(Model model, MisRptVO searchVO) throws Exception {

        List<MisRptVO> sdptList = misRptService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<MisRptVO> officeList = misRptService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<MisRptVO> dealerList = misRptService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);

        return "/mis/totalMisRpt/selectKpiReportStatus";
    }

    /**
     * 사무소 조회
     */
    @RequestMapping(value = "/mis/rpt/selectTargetMonthRegOfficeCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetMonthRegOfficeCd(@RequestBody MisRptVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsSdptCd(searchVO.getsSdptCd());

        result.setTotal(misRptService.selectOfficeListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(misRptService.selectMonthOfficeList(searchVO));
        }

        return result;
    }

    /**
     * 딜러사 조회
     */
    @RequestMapping(value = "/mis/rpt/selectTargetMonthRegDealerCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetMonthRegDealerCd(@RequestBody MisRptVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsOfficeCd(searchVO.getsOfficeCd());

        result.setTotal(misRptService.selectDealerListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(misRptService.selectMonthDealerList(searchVO));
        }

        return result;
    }

    /**
     * KPI FU표  화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectKpiFuReportStatus.do", method = RequestMethod.GET)
    public String selectKpiFuReportStatus(Model model, MisRptVO searchVO) throws Exception {

        List<MisRptVO> sdptList = misRptService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<MisRptVO> officeList = misRptService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<MisRptVO> dealerList = misRptService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);

        return "/mis/totalMisRpt/selectKpiFuReportStatus";
    }

    /**
     * 판매고문360도 전체 분석 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectSalsesResultsAllAnalysis.do", method = RequestMethod.GET)
    public String selectSalsesResultsAllAnalysis(Model model, MisRptVO searchVO) throws Exception {

        List<MisRptVO> sdptList = misRptService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<MisRptVO> officeList = misRptService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<MisRptVO> dealerList = misRptService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);

        return "/mis/totalMisRpt/selectSalsesResultsAllAnalysis";
    }

    /**
     * 판매고문 거새 이율 종합 분석 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectSalesSynthesizeAnalysis.do", method = RequestMethod.GET)
    public String selectSalesSynthesizeAnalysis(Model model, MisRptVO searchVO) throws Exception {

        List<MisRptVO> sdptList = misRptService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<MisRptVO> officeList = misRptService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<MisRptVO> dealerList = misRptService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);

        return "/mis/totalMisRpt/selectSalesSynthesizeAnalysis";
    }

    /**
     * 파생 제품 침투율(판매고문별) 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectDerivationPerSales.do", method = RequestMethod.GET)
    public String selectDerivationPerSales(Model model, MisRptVO searchVO) throws Exception {

        List<MisRptVO> sdptList = misRptService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<MisRptVO> officeList = misRptService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<MisRptVO> dealerList = misRptService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);

        return "/mis/totalMisRpt/selectDerivationPerSales";
    }

    /**
     * 파생 제품 침투율(차종별) 리포트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/rpt/selectDerivationPerCars.do", method = RequestMethod.GET)
    public String selectDerivationPerCars(Model model, MisRptVO searchVO) throws Exception {

        List<MisRptVO> sdptList = misRptService.selectSdptList(searchVO);
        model.addAttribute("sdptList", sdptList);

        List<MisRptVO> officeList = misRptService.selectOfficeList(searchVO);
        model.addAttribute("officeList", officeList);

        List<MisRptVO> dealerList = misRptService.selectDealerList(searchVO);
        model.addAttribute("dealerList", dealerList);

        return "/mis/totalMisRpt/selectDerivationPerCars";
    }



}
