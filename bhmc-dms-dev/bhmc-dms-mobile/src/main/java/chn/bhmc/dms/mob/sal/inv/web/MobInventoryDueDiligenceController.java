package chn.bhmc.dms.mob.sal.inv.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.sti.service.ConfirmWearingVehicleService;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSaveVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 재고실사
 *
 * @author park mi yeon
 * @since 2016. 07. 15
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.15         park mi yeon    최초생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/inv/inventoryDueDiligence")
public class MobInventoryDueDiligenceController extends HController {

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
     * 완성차 입고확정 서비스
     */
    @Resource(name="confirmWearingVehicleService")
    ConfirmWearingVehicleService confirmWearingVehicleService;

    /**
     * 재고실사 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/__selectInventoryDueDiligenceMain.do", method = RequestMethod.GET)
    public String __selectInventoryDueDiligenceMain(Model model) throws Exception{

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

        return "/mob/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceMain";
    }

    @RequestMapping(value = "/selectInventoryDueDiligenceMain.do", method = RequestMethod.GET)
    public String selectInventoryDueDiligenceMain(Model model) throws Exception{

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
        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/sal/inv/inventoryDueDiligence/baseJsp/selectInventoryDueDiligenceMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateB";
    }

    /**
     * 재고실사 목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectInventoryDueDiligenceList.do", method = RequestMethod.GET)
    public String selectStockActualList(Model model) throws Exception{
        return "/mob/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceList";
    }

    /**
     * 재고실사 입고대상 조회
     * @return
     */
    @RequestMapping(value = "/retVehicleInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult retVehicleInfo(@RequestBody ConfirmWearingVehicleSaveVO saveVO) throws Exception {
        SearchResult result = new SearchResult();

        //result.setData(confirmWearingVehicleService.retVehicleInfo(saveVO));

        return result;

    }

    /**
     * 재고실사 입고대상목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectInventoryDueDiligenceSelList.do", method = RequestMethod.GET)
    public String selectStockActualSelList(Model model) throws Exception{
        return "/mob/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceSelList";
    }

    /**
     * 재고실사 입고대상목록을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectInventoryDueDiligenceTotalList.do", method = RequestMethod.GET)
    public String selectInventoryDueDiligenceTotalList(Model model) throws Exception{
        return "/mob/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceTotalList";
    }
    /**
     * 재고실사 생성을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectStockCreateList.do", method = RequestMethod.GET)
    public String selectStockCreateList(Model model) throws Exception{
        return "/mob/sal/inv/inventoryDueDiligence/selectStockCreateList";
    }


}
