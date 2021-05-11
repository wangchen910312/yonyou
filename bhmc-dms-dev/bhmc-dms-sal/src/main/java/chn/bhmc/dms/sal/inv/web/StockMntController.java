package chn.bhmc.dms.sal.inv.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.inv.service.StockMntService;
import chn.bhmc.dms.sal.inv.vo.StockMntSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockMntSearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 * 재고관리
 *
 * @author Kim Jin Suk
 * @since 2016. 11. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.11.23         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inv/stockMnt")
public class StockMntController extends HController {

    /**
     * 재고상태관리 서비스
     */
    @Resource(name="stockMntService")
    StockMntService stockMntService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    //@Resource(name="carInfoService")
    //CarInfoService carInfoService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 위치 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 판매 공통 - 사업부, 사무소, 성, 도시 조회 서비스
     */
    @Resource(name="salesCommonService")
    SalesCommonService salesCommonService;

    /**
     * 판매고문 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;

    /**
     * 재고 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockPotalMain.do", method = RequestMethod.GET)
    public String selectStockPotalMain(Model model) throws Exception{
        return "/sal/inv/stockMnt/selectStockPotalMain";
    }

    /**
     * 재고관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockMntMain.do", method = RequestMethod.GET)
    public String selectStockMntMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("threeMonthDay", DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), "yyyy-MM-dd"));

        // 재고유형 SAL074
        //model.addAttribute("stockTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 손상여부 SAL049
        model.addAttribute("damageDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL049", null, langCd));

        // 회사차구분 SAL053
        model.addAttribute("cmpCarDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));

        // 재고용차량상태 SAL192
        model.addAttribute("carStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL192", null, langCd));

        // 보유상태 SAL149
        model.addAttribute("ownStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL149", null, langCd));
        // 오더상세유형(오더유형) SAL137
        model.addAttribute("ordTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd));
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        // 차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        // 판매사원 리스트
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        return "/sal/inv/stockMnt/selectStockMntMain";
    }

    /**
     * 위치 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectLocation.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLocation(@RequestBody String storage) throws Exception {

        SearchResult result = new SearchResult();

        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());    // 딜러코드
        locSearchVO.setsStrgeCd( storage );

        result.setData(binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));
        return result;
    }

    /**
     * 차관 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectFscList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFscList(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(vehicleSpecComboCommService.selectModelTypeCombo(searchVO));
        return result;
    }


    /**
     * 재고관리 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockMntSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockStateSub(@RequestBody StockMntSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(stockMntService.selectStockMntsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockMntService.selectStockMntsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고상태관리 유형정보를 등록한다.
     *  : 상태변동유형 SAL009 에 따라 저장
     */
    @RequestMapping(value = "/multiStockMnt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStockMnt(@RequestBody StockMntSaveVO saveVO) throws Exception {
        stockMntService.multiStockMnt(saveVO);
        return true;
    }

    /**
     * 전략출고 신청
     **/
    @RequestMapping(value = "/insertStockStrategyAsk.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertStockStrategyAsk(@RequestBody StockMntSaveVO saveVO) throws Exception {
        stockMntService.insertStockStrategyAsk(saveVO);
        return true;
    }

    /**
     * 공개재고 설정 팝업
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectStockOpenSearchPopup.do", method = RequestMethod.GET)
    public String selectStockOpenSearchPopup(Model model) throws Exception{
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 사업부
        model.addAttribute("sdptList", salesCommonService.selectDealerSdpt(new DealerSearchVO()));
        // 성
        model.addAttribute("sungList", salesCommonService.selectDealerSung(new DealerSearchVO()));

        return "/sal/inv/stockMnt/selectStockOpenSearchPopup";
    }

    /**
     * 사무소 리스트 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectOffice.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOffice(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(salesCommonService.selectDealerOfficeCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesCommonService.selectDealerOffice(searchVO));
        }
        return result;
    }

    /**
     * 성 리스트 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectSung.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSung(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(salesCommonService.selectDealerSungCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesCommonService.selectDealerSung(searchVO));
        }
        return result;
    }

    /**
     * 도시 리스트 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCity(@RequestBody DealerSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(salesCommonService.selectDealerCityCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(salesCommonService.selectDealerCity(searchVO));
        }
        return result;
    }
}
