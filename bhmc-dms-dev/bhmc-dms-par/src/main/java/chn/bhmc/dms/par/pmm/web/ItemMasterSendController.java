package chn.bhmc.dms.par.pmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ComItemMasterService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterSendService;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSendSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSendVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 품목마스터 전송 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 5. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.27         In Bo Shim            최초 생성
 * </pre>
 */
@Controller
public class ItemMasterSendController extends HController {

    /**
     * 품목관리 전송 서비스
     */
    @Resource(name="itemMasterSendService")
    ItemMasterSendService itemMasterSendService;

    /**
     * 품목그룹 관리 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="comItemMasterService")
    ComItemMasterService comItemMasterService;

    /**
     * 품목마스터 관리 송신 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasterSendMain.do", method = RequestMethod.GET)
    public String selectItemMasterSendMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO      = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList    = new ArrayList<ItemGroupVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList     = new ArrayList<UnitInfoVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",    LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());

        model.addAttribute("itemGroupList",         itemGroupList);
        model.addAttribute("storageList",           storageList);
        model.addAttribute("stockUnitList",         stockUnitList);
        model.addAttribute("spyrCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("weightUnitCdList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
        model.addAttribute("brandCdList",           commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("sucList",               commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));

        return "/par/pmm/itemMaster/selectItemMasterSendMain";
    }

    /**
     * 품목마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSendSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasterSends.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemMasterSends(@RequestBody ItemMasterSendSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDpsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterSendService.selectItemMasterSendsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterSendService.selectItemMasterSendsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 부품마스터 전송 정보를 저장한다.
     * @param saveVO - 저장 할 ItemMasterSendVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/multiItemMasterSends.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiItemMasterSends(@Validated @RequestBody BaseSaveVO<ItemMasterSendVO> itemMasterSendVO, BindingResult bindingResult) throws Exception
    {
        itemMasterSendService.multiItemMasterSend(itemMasterSendVO);
        return true;
    }

    /**
     * 품목마스터 재고관리 송신 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasterStockSendMain.do", method = RequestMethod.GET)
    public String selectItemMasterStockSendMain(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO      = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList    = new ArrayList<ItemGroupVO>();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList     = new ArrayList<UnitInfoVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",    LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());

        model.addAttribute("itemGroupList",         itemGroupList);
        model.addAttribute("storageList",           storageList);
        model.addAttribute("stockUnitList",         stockUnitList);
        model.addAttribute("spyrCdList",            commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        model.addAttribute("weightUnitCdList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
        model.addAttribute("brandCdList",           commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("sucList",               commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));

        return "/par/pmm/itemMaster/selectItemMasterStockSendMain";
    }

    /**
     * 부품마스터 재고 전송 정보를 저장한다.
     * @param saveVO - 저장 할 ItemMasterSendVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/multiItemMasterStockSends.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiItemMasterStockSends(@Validated @RequestBody BaseSaveVO<ItemMasterSendVO> itemMasterSendVO, BindingResult bindingResult) throws Exception
    {
        itemMasterSendService.multiItemMasterStockSend(itemMasterSendVO);
        return true;

    }
}
