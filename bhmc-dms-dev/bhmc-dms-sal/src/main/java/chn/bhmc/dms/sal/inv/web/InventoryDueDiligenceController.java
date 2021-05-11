package chn.bhmc.dms.sal.inv.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.sal.inv.service.InventoryDueDiligenceService;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceSaveVO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceSearchVO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 재고실사
 *
 * @author Bong
 * @since 2016. 4. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.14           Bong                  최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/inv/inventoryDueDiligence")
public class InventoryDueDiligenceController extends HController {

    /**
     * 재고상태관리 서비스
     */
    @Resource(name="inventoryDueDiligenceService")
    InventoryDueDiligenceService inventoryDueDiligenceService;

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
     * 재고상태관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectInventoryDueDiligenceMain.do", method = RequestMethod.GET)
    public String selectInventoryDueDiligenceMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sysDate = DateUtil.getDate("yyyy-MM");

        model.addAttribute("sysDate", sysDate);

        // 실사구분 SAL017
        model.addAttribute("stockDdDstinCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL017", null, langCd));
        // 차량상태(재고상태) SAL001
        model.addAttribute("carStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("strgeCdInfo", storageService.selectStoragesByCondition(storageSearchVO));
        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("locCdInfo", binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO));

        return "/sal/inv/inventoryDueDiligence/selectInventoryDueDiligenceMain";
    }

    /**
     * 재고실사 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectInventoryDueDiligence.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInventoryDueDiligence(@RequestBody InventoryDueDiligenceSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(inventoryDueDiligenceService.selectInventoryDueDiligenceByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(inventoryDueDiligenceService.selectInventoryDueDiligenceByCondition(searchVO));
        }

        return result;
    }


    /**
     * 재고실사 확인여부/사진파일을 등록한다.
     */
    @RequestMapping(value = "/updateInventoryDueDiligence.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateInventoryDueDiligences(@RequestBody InventoryDueDiligenceVO saveVO) throws Exception {

        inventoryDueDiligenceService.updateInventoryDueDiligence(saveVO);
        return true;
    }



    /**
     * 재고실사 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     * @param PurcEvalSaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/retVehicleInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult retVehicleInfo(@RequestBody InventoryDueDiligenceSaveVO saveVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(inventoryDueDiligenceService.retVehicleInfo(saveVO));

        return result;

    }






}
