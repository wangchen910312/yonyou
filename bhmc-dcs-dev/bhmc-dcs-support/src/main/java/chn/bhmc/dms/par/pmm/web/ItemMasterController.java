package chn.bhmc.dms.par.pmm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 품목마스터 관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Controller
public class ItemMasterController extends HController {

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 품목마스터 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasterMain.do", method = RequestMethod.GET)
    public String selectItemMasterMain(Model model,@RequestParam(value="pCallMenu", defaultValue="") String pCallMenu) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        //List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList = new ArrayList<UnitInfoVO>();

        //itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        //itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로케이션 코드정보 조회.
        /*BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("Y");
        model.addAttribute("giLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));*/

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());
        carInfoSearchVO.setUseYn("Y");
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //차종 , 중고차-자사-차종
        model.addAttribute("modelCdList", carInfoService.selectModelListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());

        //model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("stockUnitList", stockUnitList);
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("itemDstinAmosCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR136", null, langCd));
        model.addAttribute("weightUnitCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR502", null, langCd));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));
        model.addAttribute("sucList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR105", null, langCd));
        model.addAttribute("parSpecCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR104", null, langCd));
        model.addAttribute("mobisImpLocalYnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR106", null, langCd));
        //useYnList
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));
        model.addAttribute("pCallMenu", pCallMenu);

        //1차분류코드
        /*ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(2);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin1stCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //2차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(3);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin2ndCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));
        //3차분류코드
        searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLvlVal(4);
        searchVO.setsUseYn("Y");
        model.addAttribute("itemDstin3rdCdList", itemGroupLevelService.selectItemGroupLevelsByCondition(searchVO));*/
        //가격계산유형
        model.addAttribute("basePriceCalTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd));

        return "/par/pmm/itemMaster/selectItemMasterMain";
    }

    /**
     * 품목마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemMasters(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectItemMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemMastersByCondition(searchVO));
        }

        return result;

    }

    /**
     * 품목마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/itemMaster/selectItemMasterByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public ItemMasterVO selectItemMasterByKey(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        ItemMasterVO itemMasterVO = new ItemMasterVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        itemMasterVO = itemMasterService.selectItemMasterByKey(searchVO);

        return itemMasterVO;

    }

}
