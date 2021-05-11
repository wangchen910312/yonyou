package chn.bhmc.dms.mob.sal.inv.web;

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

import chn.bhmc.dms.sal.inv.vo.StockMntSearchVO;

import chn.bhmc.dms.sal.inv.service.StockMntService;

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.inv.service.StockStateService;
import chn.bhmc.dms.sal.inv.vo.StockStateSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockStateSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 재고상태관리
 *
 * @author Park Sung sin
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.21         Park Sung sin            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/inv/stockState")
public class MobStockStateController extends HController {

    /**
     * 재고상태관리 서비스
     */
    @Resource(name="stockStateService")
    private StockStateService stockStateService;

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
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * CRM 공통 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;


    /**
     * 판매 재고관리 서비스
     */
    @Resource(name="stockMntService")
    StockMntService stockMntService;


    /**
     * 재고상태관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/__selectStockStateMain.do", method = RequestMethod.GET)
    public String __selectStockStateMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("threeMonthDay", DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), "yyyy-MM-dd"));
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
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 판매사원 리스트
        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR
        model.addAttribute("saleEmpDSInfo", saleEmpList);
        // 판매인 여부
        String saleEmpYn = "N";
        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        if( LoginUtil.hasRole("ROLE_SALES_ADVISOR") ) {
            saleEmpYn = "Y";
        }
        model.addAttribute("saleEmpYn", saleEmpYn);

        return "/mob/sal/inv/stockState/selectStockStateMain";
    }
    /**
     * 재고상태관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockStateMain.do", method = RequestMethod.GET)
    public String selectStockStateMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());


        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));
        model.addAttribute("threeMonthDay", DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), "yyyy-MM-dd"));
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
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // 판매사원 리스트
        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();  // 판매고문 : ROLE_SALES_ADVISOR
        model.addAttribute("saleEmpDSInfo", saleEmpList);
        // 판매인 여부
        String saleEmpYn = "N";
        //VIEW-D-10321 : 기능 : CRM>판매기회관리>판매기회관리>판매담당
        if( LoginUtil.hasRole("ROLE_SALES_ADVISOR") ) {
            saleEmpYn = "Y";
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/inv/stockState/baseJsp/selectStockStateMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateB";
    }

    /**
     * 재고실사결과 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockStateResultMain.do", method = RequestMethod.GET)
    public String selectStockStateResultMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("sysDate", sysDate);

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 실사구분 SAL017
        model.addAttribute("stockDdDstinCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL017", null, langCd));
        // 차량상태(재고상태) SAL001
        model.addAttribute("carStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));
        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        model.addAttribute("locDSList", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //재고월령
        model.addAttribute("agingCntDSList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL169", null, langCd));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/inv/stockState/baseJsp/selectStockStateResultMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 재고실사결과 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockStateResultList.do", method = RequestMethod.GET)
    public String selectInventoryDueDiligenceTotalList(Model model) throws Exception{
        return "/mob/sal/inv/stockState/selectStockStateResultList";
    }

    /**
     * 재고관리 화면 목록
     * @return
     */
    @RequestMapping(value = "/selectStockStateList.do", method = RequestMethod.GET)
    public String selectStockStateList(Model model) throws Exception{

        return "/mob/sal/inv/stockState/selectStockStateList";
    }

    /**
     * 재고관리 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockState.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockState(@RequestBody StockMntSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());      // 딜러코드


        result.setTotal(stockMntService.selectAppStockMntGroupsByConditionCnt(searchVO) );

        if(result.getTotal() != 0){
            result.setData(stockMntService.selectAppStockMntGroupsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고관리상세 화면 목록
     */
    @RequestMapping(value = "/selectStockStateDetailList.do", method = RequestMethod.GET)
    public String selectStockStateDetailList(Model model) throws Exception {

        return "/mob/sal/inv/stockState/selectStockStateDetailList";
    }

    /**
     * 재고상태관리 상세 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectStockStateSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStockStateSub(@RequestBody StockStateSearchVO searchVO) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());      // 딜러코드

        result.setTotal(stockStateService.selectStockStateSubsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(stockStateService.selectStockStateSubsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 재고상태관리 목록
     * @return
     */
    @RequestMapping(value = "/selectStockStateSubList.do", method = RequestMethod.GET)
    public String selectStockStateSubList(Model model) throws Exception  {
        return "/mob/sal/inv/stockState/selectStockStateSubList";
    }

    /**
     * 재고상태관리 유형정보를 등록한다.
     */
    @RequestMapping(value = "/multiStockState.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStockStates(@RequestBody StockStateSaveVO saveVO) throws Exception {

        stockStateService.multiStockStates(saveVO);
        return true;
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
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(mobLoginVO.getDlrCd());    // 딜러코드
        locSearchVO.setsStrgeCd( storage );

        result.setData(binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));
        return result;
    }


}
