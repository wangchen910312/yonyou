package chn.bhmc.dms.sal.acc.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 현재고 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee      최초 생성
 * </pre>
 */

@Controller
public class StockInOutSalesController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 현재고 서비스
     */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

    /**
     * 딜러 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 품목그룹 관리 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;


    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 수불유형 서비스
     */
    @Resource(name="movementTypeService")
    MovementTypeService movementTypeService;

    /**
     * 현재고리스트 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/stockInOut/selectStockInOut.do", method = RequestMethod.GET)
    public String selectStockInOut(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        ItemGroupSearchVO itemGroupVO      = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList    = new ArrayList<ItemGroupVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd));
        model.addAttribute("abcIndList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("spyrCdList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));
        model.addAttribute("storageList",   storageList);
        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("toDt",          sysDate);

        return "/sal/acc/stockInOut/selectStockInOut";

    }

}
