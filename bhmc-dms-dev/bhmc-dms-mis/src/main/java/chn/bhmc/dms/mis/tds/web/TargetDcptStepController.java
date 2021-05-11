package chn.bhmc.dms.mis.tds.web;

import java.util.*;

import javax.annotation.*;
import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.annotation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.util.*;

import able.com.web.*;
import chn.bhmc.dms.core.datatype.*;
import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.mis.tds.service.*;
import chn.bhmc.dms.mis.tds.vo.*;
import chn.bhmc.dms.mis.tmp.service.*;
import chn.bhmc.dms.mis.tmp.vo.*;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepController.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetDcptStepController extends HController {

    /**
     * 목표 분해 공구 서비스
     */
    @Resource(name="targetDcptStepService")
    TargetDcptStepService targetDcptStepService;



    /**
     * [제조사] 동종업계 참조
     */
    @Resource(name="targetReferSameBsnsService")
    TargetReferSameBsnsService targetReferSameBsnsService;



    /**
     * 목표 분해 공구 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptStepMain.do", method = RequestMethod.GET)
    public String selectTargetDcptStepMain(TargetDcptStepSearchVO searchVO, Model model) throws Exception {

        searchVO.setTabNo(searchVO.getTabNo());

        model.addAttribute("searchVO", searchVO);

        return "/mis/tds/selectTargetDcptStepMain";
    }

    /**
     * 목표 차종 설정 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptCarlineSearch.do", method = RequestMethod.GET)
    public String selectTargetDcptCarlineSearch(Model model) throws Exception {

        return "/mis/tds/selectTargetDcptCarlineSearch";
    }

    /**
     * 목표 차종 설정 탭 데이터를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptCarlineGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptCarlineGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptStepService.selectTargetDcptCarlineGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptStepService.selectTargetDcptCarlineGrid(searchVO));
        } else {
            targetDcptStepService.insertTargetDcptCarlineGridSave(searchVO);
            result.setData(targetDcptStepService.selectTargetDcptCarlineGrid(searchVO));
        }

        return result;
    }

    /**
     * 목표 차종 설정 데이터 저장 분기한다.
     * @param saveVO - 목표 차종 설정 데이터 저장 분기한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiTargetDcptCarlineGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTargetDcptCarlineGrid(@Validated @RequestBody TargetDcptStepSaveVO saveVO) throws Exception {

        targetDcptStepService.multiTargetDcptCarlineGrid(saveVO);
        return true;
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표 저장 분기한다.
     * @param saveVO - 목표 분해 공구 화면을 전체 저장 분기한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiDealerTargetGridSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiDealerTargetGridSave(@Validated @RequestBody TargetDcptStepToSaveVO saveVO) throws Exception {
        targetDcptStepService.multiDealerTargetGridSave(saveVO);        // 딜러분해(차형) 총목표 저장
        return true;
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 개별목표 저장 분기한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiDealerChannelGridSave.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiDealerChannelGridSave(@RequestBody Map<?,?> saveVO) throws Exception {
        return targetDcptStepService.multiDealerChannelGridSave(saveVO);
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 집객목표 저장 분기한다.
     * @param saveVO - 목표 분해 공구 화면을 전체 저장 분기한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiDealerCustGridSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiDealerCustGridSave(@Validated @RequestBody TargetDcptStepToSaveVO saveVO) throws Exception {
        targetDcptStepService.multiDealerCustGridSave(saveVO);       // 딜러분해(차형) 채널별 목표 저장
        return true;
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 과정목표 저장 분기한다.
     * @param saveVO - 목표 분해 공구 화면을 전체 저장 분기한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiDealerProcessTargetSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiDealerProcessTargetSave(@Validated @RequestBody TargetDcptStepToSaveVO saveVO) throws Exception {
        targetDcptStepService.multiDealerProcessTargetSave(saveVO);   // 과정목표 저장
        return true;
    }

    /**
     * 목표 분해 공구 - 목표 분해 공구, 파생예측 저장 분기한다.
     * @param saveVO - 목표 분해 공구 화면을 전체 저장 분기한다.
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiProcessDerivationGridSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiProcessDerivationGridSave(@Validated @RequestBody TargetDcptStepToSaveVO saveVO) throws Exception {
        targetDcptStepService.multiProcessDerivationGridSave(saveVO);   // 파생예측 저장
        return true;
    }

    /**
     * 목표 분해 공구 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptStepSearch.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectTargetDcptStepSearch(TargetDcptStepSearchVO targetDcptStepSearchVO, Model model) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        targetDcptStepSearchVO.setDlrCd(dlrCd);

        targetDcptStepSearchVO.setsMonitorDate(targetDcptStepSearchVO.getsMonitorDate());

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;

        String newStatusMonth = "";

        // 딜러사 총목표 조회
        TargetDcptStepSearchVO allResultListVO = new TargetDcptStepSearchVO();

        allResultListVO.setsMonitorDate(targetDcptStepSearchVO.getsMonitorDate());

        if(allResultListVO.getsMonitorDate() == null || allResultListVO.getsMonitorDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            allResultListVO.setsMonitorDate(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptStepSearchVO> totalResultList = targetDcptStepService.selectTargetDcptDealerTargetAllGrid(allResultListVO);

        if(totalResultList.size() > 0 && !totalResultList.get(0).getDataChk().equals("A")) {
            allResultListVO = totalResultList.get(0);
        } else {
            targetDcptStepService.insertTargetDcptStepTotalResult(allResultListVO);
            allResultListVO.setAllDealerGoalPrefVal("0");
            allResultListVO.setIdccDealerGoalPrefVal("0");
            allResultListVO.setShopDealerGoalPrefVal("0");
            allResultListVO.setOrgDealerGoalPrefVal("0");
        }

        model.addAttribute("allResultListVO", allResultListVO);

        // 딜러사 설정 차종 조회

        TargetDcptStepSearchVO dealerCarlineCdListVO = new TargetDcptStepSearchVO();

        dealerCarlineCdListVO.setsMonitorDate(targetDcptStepSearchVO.getsMonitorDate());
        dealerCarlineCdListVO.setsDcptDate(targetDcptStepSearchVO.getsDcptDate());

        if(dealerCarlineCdListVO.getsMonitorDate() == null || dealerCarlineCdListVO.getsMonitorDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            dealerCarlineCdListVO.setsMonitorDate(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptStepSearchVO> dealerCarlineCdList = targetDcptStepService.selectDealerCarlineCdList(dealerCarlineCdListVO);

        if(dealerCarlineCdList.size() > 0){
            dealerCarlineCdListVO = dealerCarlineCdList.get(0);
        }

        model.addAttribute("dealerCarlineCdListVO", dealerCarlineCdListVO);

        // 딜러사 차형별 목표(IDCC) 조회

        TargetDcptStepSearchVO carResultListVO = new TargetDcptStepSearchVO();

        carResultListVO.setsMonitorDate(targetDcptStepSearchVO.getsMonitorDate());
        carResultListVO.setsDcptDate(targetDcptStepSearchVO.getsDcptDate());

        if(carResultListVO.getsMonitorDate() == null || carResultListVO.getsMonitorDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            carResultListVO.setsMonitorDate(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptStepSearchVO> carResultList = targetDcptStepService.selectTargetDcptMgmtDealerSaleDcptCarResult(carResultListVO);

        if(carResultList.size() > 0){
            carResultListVO = carResultList.get(0);
        } else {
            targetDcptStepService.insertTargetDcptMgmtDealerSaleDcptCarResult(carResultListVO);
        }

        model.addAttribute("carResultListVO", carResultListVO);


        // 딜러사 차형별 목표(전시장) 조회
        TargetDcptStepSearchVO shopResultListVO = new TargetDcptStepSearchVO();

        shopResultListVO.setsMonitorDate(targetDcptStepSearchVO.getsMonitorDate());
        shopResultListVO.setsDcptDate(targetDcptStepSearchVO.getsDcptDate());

        if(shopResultListVO.getsMonitorDate() == null || shopResultListVO.getsMonitorDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            shopResultListVO.setsMonitorDate(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptStepSearchVO> shopResultList = targetDcptStepService.selectTargetDcptMgmtDealerSaleDcptShopResult(shopResultListVO);

        if(shopResultList.size() > 0){
            shopResultListVO = shopResultList.get(0);
        } else {
            targetDcptStepService.insertTargetDcptMgmtDealerSaleDcptCarResult(shopResultListVO);
        }

        model.addAttribute("shopResultListVO", shopResultListVO);

        // 딜러사 집객 목표 조회
        TargetDcptStepSearchVO custResultListVO = new TargetDcptStepSearchVO();

        custResultListVO.setsMonitorDate(targetDcptStepSearchVO.getsMonitorDate());
        custResultListVO.setsDcptDate(targetDcptStepSearchVO.getsDcptDate());

        if(custResultListVO.getsMonitorDate() == null || custResultListVO.getsMonitorDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            custResultListVO.setsMonitorDate(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptStepSearchVO> custResultList = targetDcptStepService.selectTargetDcptMgmtDealerDcptCustResult(custResultListVO);

        if(custResultList.size() > 0){
            custResultListVO = custResultList.get(0);
        } else {
            targetDcptStepService.insertTargetDcptMgmtDealerDcptCustResult(custResultListVO);
        }

        model.addAttribute("custResultListVO", custResultListVO);


        // 파생이익 목표 조회
        TargetDcptStepSearchVO pcsDvtTrttListVO = new TargetDcptStepSearchVO();

        pcsDvtTrttListVO.setsMonitorDate(targetDcptStepSearchVO.getsMonitorDate());
        pcsDvtTrttListVO.setsDcptDate(targetDcptStepSearchVO.getsDcptDate());

        if(pcsDvtTrttListVO.getsMonitorDate() == null || pcsDvtTrttListVO.getsMonitorDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            pcsDvtTrttListVO.setsMonitorDate(String.valueOf(statusYear)+newStatusMonth);
        }

        List<TargetDcptStepSearchVO> pcsDvtTrttList = targetDcptStepService.selectTargetDcptStepProcessDerivationTarget(pcsDvtTrttListVO);

        if(pcsDvtTrttList.size() > 0){
            pcsDvtTrttListVO = pcsDvtTrttList.get(0);
        } else {
            targetDcptStepService.insertTargetDcptStepProcessDerivationTarget(pcsDvtTrttListVO);
        }

        model.addAttribute("pcsDvtTrttListVO", pcsDvtTrttListVO);
        model.addAttribute("sysDate", DateUtil.getDate("YYYYMM"));


        return "/mis/tds/selectTargetDcptStepSearch";
    }

    /**
     * 목표 분해 공구 - 시장현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptMarketStatusGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMarketStatusGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDcptMarketStatusGrid(searchVO));

        return result;

    }

    /**
     * 목표 분해 공구 - 딜러현황 자료(기초값)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerStatusBasicGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptDealerStatusBasicGrid(@RequestBody TargetDcptStepSearchVO targetDcptStepSearchVO, Model model) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDcptDealerStatusBasicGrid(targetDcptStepSearchVO));

        return result;
    }


    /**
     * [제조사] 동종업계 참조 목록 데이터를 조회한다.   2018-07-02  추가 ...
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetReferSameBsnsMainSearch2.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetReferSameBsnsMainSearch(@RequestBody TargetReferSameBsnsSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetReferSameBsnsService.selectTargetReferSameBsnsMainSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetReferSameBsnsService.selectTargetReferSameBsnsMainSearch(searchVO));
        }

        return result;

    }


    /**
     * 목표 분해 공구 - 딜러현황 자료(채널)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerStatusChannelGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptDealerStatusChannelGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDcptDealerStatusChannelGrid(searchVO));

        return result;
    }

    /**
     * 목표 분해 공구 - 제조사목표(당월 총 목표) 자료를 조회한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptManuTargetAllGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptManuTargetAllGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(targetDcptStepService.selectTargetDcptManuTargetAllGrid(searchVO));



        return result;
    }

    /**
     * 목표 분해 공구 - 제조사목표(차형별 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptManuTargetChannelGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetDcptStepViewVO selectTargetDcptManuTargetChannelGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        Map<String, List> map = targetDcptStepService.selectTargetDcptManuTargetChannelGrid(searchVO);

        TargetDcptStepViewVO result = new TargetDcptStepViewVO();

        result.setTotal(targetDcptStepService.selectTargetDcptManuTargetChannelGridCnt(searchVO) );
        result.setData( map.get("dataSet") );
        result.setManuColumnList( map.get("manuColumnList") );

        return result;

    }

    /**
     * 목표 분해 공구 - 딜러사목표(차형별 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerTargetChannelGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetDcptStepViewVO selectTargetDcptDealerTargetChannelGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        Map<String, List> map = targetDcptStepService.selectTargetDcptDealerTargetChannelGrid(searchVO);

        TargetDcptStepViewVO result = new TargetDcptStepViewVO();

        result.setTotal(targetDcptStepService.selectTargetDcptDealerTargetChannelGridCnt(searchVO) );
        result.setData( map.get("dataSet") );
        result.setDealerColumnList( map.get("dealerColumnList") );

        return result;

    }

    /**
     * 목표 분해 공구 - 딜러현황 자료(채널)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerTargetAllGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptDealerTargetAllGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDcptDealerTargetAllGrid(searchVO));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러사 집객 목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptMgmtDealerDcptCustGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptMgmtDealerDcptCustGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDcptMgmtDealerDcptCustGrid(searchVO));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptStepProcessDerivationGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptStepProcessDerivationGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDcptStepProcessDerivationGrid(searchVO));

        return result;
    }




    /**
     * 딜러분해(판매고문) 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectDealerDcptSaleSearch.do")
    public String selectDealerDcptSaleSearch(TargetDcptStepSearchVO targetDcptStepSearchVO, Model model) throws Exception {
        targetDcptStepSearchVO.setsMonitorSaleDate(targetDcptStepSearchVO.getsMonitorSaleDate());

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        String newStatusDate = "";

        TargetDcptStepSearchVO saleStatusResultListVO = new TargetDcptStepSearchVO();

        saleStatusResultListVO.setsMonitorSaleDate(targetDcptStepSearchVO.getsMonitorSaleDate());

        List<TargetDcptStepSearchVO> saleStatusResultList = targetDcptStepService.selectTargetDcptMgmtDealerSaleDcptAllStatus(saleStatusResultListVO);

        if(saleStatusResultList.size() > 0){
            saleStatusResultListVO = saleStatusResultList.get(0);
        }

        model.addAttribute("saleStatusResultListVO", saleStatusResultListVO);

        TargetDcptStepSearchVO saleProResultListVO = new TargetDcptStepSearchVO();

        saleProResultListVO.setsMonitorSaleDate(targetDcptStepSearchVO.getsMonitorSaleDate());

        List<TargetDcptStepSearchVO> saleProResultList = targetDcptStepService.selectTargetDcptMgmtDealerSaleDcptProStatus(saleProResultListVO);

        if(saleProResultList.size() > 0){
            saleProResultListVO = saleProResultList.get(0);
        }

        model.addAttribute("saleProResultListVO", saleProResultListVO);
        model.addAttribute("sysDate", DateUtil.getDate("YYYYMM"));

        return "/mis/tds/selectDealerDcptSaleSearch";
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 총목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerSaleTargetAllGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptDealerSaleTargetAllGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptStepService.selectTargetDcptDealerSaleTargetAllGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptStepService.selectTargetDcptDealerSaleTargetAllGrid(searchVO));
        }

        return result;

    }

    /**
     * 목표 분해 공구 - 딜러분해(당월 차형별 분해 목표, 진도, 차이) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDealerSaleDcptStatusGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetDcptStepScViewVO selectTargetDealerSaleDcptStatusGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        Map<String, List> map = targetDcptStepService.selectTargetDealerSaleDcptStatusGrid(searchVO);

        TargetDcptStepScViewVO result = new TargetDcptStepScViewVO();

        result.setTotal(targetDcptStepService.selectTargetDealerSaleDcptStatusGridCnt(searchVO) );
        result.setData( map.get("dataSet"));
        result.setCarDcptColumnList( map.get("carDcptColumnList"));

        return result;

    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerSaleManSearchGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetDcptStepSmViewVO selectTargetDcptDealerSaleManSearchGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {


        TargetDcptStepSmViewVO result = new TargetDcptStepSmViewVO();

        result.setTotal(targetDcptStepService.selectTargetDcptDealerSaleManSearchGridCnt(searchVO) );

        if(result.getTotal() != 0){
            Map<String, List> map = targetDcptStepService.selectTargetDcptDealerSaleManSearchGrid(searchVO);
            result.setData( map.get("dataSet"));
            result.setSmDcptColumnList( map.get("smDcptColumnList"));
        }


        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerSaleManGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDcptDealerSaleManGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptStepService.selectTargetDcptDealerSaleManGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptStepService.selectTargetDcptDealerSaleManGrid(searchVO));
        }

        return result;

    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 엑셀 업로드 팝업 화면을 호출한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDcptDealerSalesmanDcptRegPopup.do", method = RequestMethod.GET)
    public String selectTargetDcptDealerSalesmanDcptRegPopup(Model model, HttpServletRequest request, TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception {
        targetDcptStepSearchVO.setsMonitorSaleDate(targetDcptStepSearchVO.getsMonitorSaleDate());
        return "/mis/tds/selectTargetDcptDealerSalesmanDcptRegPopup";
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 엑셀 업로드 한다.
     * @param TargetDcptStepSaveVO
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/insertSalesmanTargetDcptRegUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertDBMessageSourceBatchUploadFile1(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<TargetDcptStepVO> list = new ArrayList<TargetDcptStepVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<TargetDcptStepVO> excelReader = new ExcelReader<TargetDcptStepVO>(TargetDcptStepVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }
        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를  저장 한다.
     * @param
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectSalesmanTargetDcptRegExcel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectSalesmanTargetDcptRegExcel(@Validated @RequestBody TargetDcptStepSaveVO targetSalesmanRegUploadList, TargetDcptStepSearchVO targetDcptStepSearchVO, TargetDcptStepVO targetDcptStepVO) throws Exception {

        targetDcptStepSearchVO.setsMonitorSaleDate(targetDcptStepSearchVO.getsMonitorSaleDate());

        targetDcptStepService.insertSalesmanTargetDcptRegUploadSave(targetSalesmanRegUploadList.getTargetSalesmanRegUploadList(), targetDcptStepSearchVO);

        return true;

    }

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를  저장 한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiTargetDcptDealerSaleManSearchGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiTargetDcptDealerSaleManSearchGrid(@RequestBody Map<?,?> saveVO) throws Exception {
        return targetDcptStepService.multiTargetDcptDealerSaleManSearchGrid(saveVO);
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectDealerDcptCustSearch.do", method = RequestMethod.GET)
    public String selectDealerDcptCustSearch(TargetDcptStepSearchVO targetDcptStepSearchVO, Model model) throws Exception {
        targetDcptStepSearchVO.setsMonitorCustDate(targetDcptStepSearchVO.getsMonitorCustDate());
        model.addAttribute("sysDate", DateUtil.getDate("YYYYMM"));
        return "/mis/tds/selectDealerDcptCustSearch";
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 잠재고객수 , 최근3개월 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDealerDcptCustGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDealerDcptCustGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDealerDcptCustGrid(searchVO));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 잠재고객수 , 최근3개월 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDealerDcptCustFirstGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetDcptStepCuViewVO selectTargetDealerDcptCustFirstGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        Map<String, List> map = targetDcptStepService.selectTargetDealerDcptCustFirstGrid(searchVO);

        TargetDcptStepCuViewVO result = new TargetDcptStepCuViewVO();

        result.setTotal(targetDcptStepService.selectTargetDealerDcptCustFirstGridCnt(searchVO) );
        result.setData( map.get("dataSet"));
        result.setFirstColumnList( map.get("firstColumnList"));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDealerDcptCustConfig.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDealerDcptCustConfig(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDealerDcptCustConfig(searchVO));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDealerDcptCustSecondGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetDcptStepCuViewVO selectTargetDealerDcptCustSecondGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        Map<String, List> map = targetDcptStepService.selectTargetDealerDcptCustSecondGrid(searchVO);

        TargetDcptStepCuViewVO result = new TargetDcptStepCuViewVO();

        result.setTotal(targetDcptStepService.selectTargetDealerDcptCustSecondGridCnt(searchVO) );
        result.setData( map.get("dataSet"));
        result.setSecondColumnList( map.get("secondColumnList"));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDealerDcptCustConfigVal.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetDealerDcptCustConfigVal(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

            result.setData(targetDcptStepService.selectTargetDealerDcptCustConfigVal(searchVO));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDealerDcptCustThirdGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetDcptStepCuViewVO selectTargetDealerDcptCustThirdGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        Map<String, List> map = targetDcptStepService.selectTargetDealerDcptCustThirdGrid(searchVO);

        TargetDcptStepCuViewVO result = new TargetDcptStepCuViewVO();

        result.setTotal(targetDcptStepService.selectTargetDealerDcptCustThirdGridCnt(searchVO) );
        result.setData( map.get("dataSet"));
        result.setThirdColumnList( map.get("thirdColumnList"));

        return result;
    }

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 저장한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/multiTargetDealerDcptCustThirdGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public int multiTargetDealerDcptCustThirdGrid(@RequestBody Map<?,?> saveVO) throws Exception {
        return targetDcptStepService.multiTargetDealerDcptCustThirdGrid(saveVO);
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해 탭 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectTargetDerivationProfitSearch.do", method = RequestMethod.GET)
    public String selectTargetDerivationProfitSearch(TargetDcptStepSearchVO targetDcptStepSearchVO, Model model) throws Exception {

        model.addAttribute("sysDate", DateUtil.getDate("YYYYMM"));

        return "/mis/tds/selectTargetDerivationProfitSearch";
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectCarlineProfitGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCarlineProfitGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptStepService.selectCarlineProfitGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptStepService.selectCarlineProfitGrid(searchVO));
        } else {
            targetDcptStepService.insertCarlineProfitGrid(searchVO);
        }
            result.setData(targetDcptStepService.selectCarlineProfitGrid(searchVO));

        return result;

    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 데이터를 등록한다.
     * @param saveVO - 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tds/insertCarlineProfitGridSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertCarlineProfitGridSave(@Validated @RequestBody TargetProfitConfigSaveVO saveVO) throws Exception {

        targetDcptStepService.multiCarlineProfitGridSave(saveVO);

        return true;
    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tds/selectProfitTargetGrid.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectProfitTargetGrid(@RequestBody TargetDcptStepSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetDcptStepService.selectProfitTargetGridCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetDcptStepService.selectProfitTargetGrid(searchVO));
        } else {
            targetDcptStepService.insertProfitTargetGrid(searchVO);
        }

        result.setData(targetDcptStepService.selectProfitTargetGrid(searchVO));
        return result;

    }

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 데이터를 등록한다.
     * @param saveVO - 목표 분해 공구 - 파생업무이익지표분해(이익목표) 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tds/insertProfitTargetSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertProfitTargetSave(@Validated @RequestBody TargetProfitConfigSaveVO saveVO) throws Exception {

        targetDcptStepService.multiProfitTargetGridSave(saveVO);

        return true;
    }

}
