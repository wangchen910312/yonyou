package chn.bhmc.dms.sal.acc.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.acc.service.AccessoryItemStockService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemPriceVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemStockSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemStockVO;

/**
 * 용품재고 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2017. 1. 31.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.31         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class AccessoryItemStockController extends HController {

    /**
     * 용품재고 관리 서비스
     */
    @Resource(name="accessoryItemStockService")
    AccessoryItemStockService accessoryItemStockService;

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

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 용품재고 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemStock/selectAccessoryItemStockMain.do", method = RequestMethod.GET)
    public String selectAccessoryItemStockMain(Model model) throws Exception {
        //용품유형
        model.addAttribute("etcCd1List", commonCodeService.selectCommonCodesByCmmGrpCd("SAL195", null, LocaleContextHolder.getLocale().getLanguage()));

        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01"); //구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //브랜드
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/sal/acc/itemStock/selectAccessoryItemStockMain";
    }

    /**
     * 용품재고 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemStock/selectAccessoryItemStocks.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemStocks(@RequestBody AccessoryItemStockSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        searchVO.setsStrgeTp("20");     //창고유형(판매용품창고)
        searchVO.setsItemDstinCd("20"); //용품구분(판매용품)

        result.setTotal(accessoryItemStockService.selectAccessoryItemStocksByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(accessoryItemStockService.selectAccessoryItemStocksByCondition(searchVO));
        }

        return result;
    }

    /**
     * 용품재고 상세정보 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemStock/selectAccessoryItemStockDetailPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemMasterDetailPopup(
            @RequestParam(name="dlrCd", required=true) String dlrCd
            ,@RequestParam(name="pltCd", required=true) String pltCd
            ,@RequestParam(name="strgeCd", required=true) String strgeCd
            ,@RequestParam(name="itemCd", required=true) String itemCd
            ,Model model) throws Exception  {

        AccessoryItemStockVO accessoryItemStockVO = accessoryItemStockService.selectAccessoryItemStockByKey(dlrCd, pltCd, strgeCd, itemCd);

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        //용품재고 정보
        model.addAttribute("itemStock", accessoryItemStockVO);

        //용품유형
        model.addAttribute("etcCd1List", commonCodeService.selectCommonCodesByCmmGrpCd("SAL195", null, LocaleContextHolder.getLocale().getLanguage()));

        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01"); //구매처
        model.addAttribute("spynCdList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //재고단위
        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("stockUnitCdList", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //브랜드
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/acc/itemStock/selectAccessoryItemStockDetailPopup";
    }

    /**
     * 용품가격 정보를 변경한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemStock/insertOrUpdateAccessoryItemPrice.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertOrUpdateAccessoryItemPrice(@Validated @RequestBody AccessoryItemPriceVO accessoryItemPriceVO) throws Exception {
        accessoryItemPriceVO.setRegUsrId(LoginUtil.getUserId());
        accessoryItemPriceVO.setUpdtUsrId(LoginUtil.getUserId());

        return accessoryItemStockService.insertOrupdateAccessoryItemPrice(accessoryItemPriceVO);
    }
}
