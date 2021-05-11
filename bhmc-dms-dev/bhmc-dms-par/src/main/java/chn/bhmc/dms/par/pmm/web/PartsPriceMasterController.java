package chn.bhmc.dms.par.pmm.web;

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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.PartsVenderMasterService;
import chn.bhmc.dms.par.pmm.service.PartsVenderPriceMasterService;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 가격마스터 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class PartsPriceMasterController extends HController {

    /**
     * 부품가격마스터 공급업체 서비스
     */
    @Resource(name="partsVenderMasterService")
    PartsVenderMasterService partsVenderMasterService;

    /**
     * 부품구매가격마스터 가격정보 서비스
     */
    @Resource(name="partsVenderPriceMasterService")
    PartsVenderPriceMasterService partsVenderPriceMasterService;

    /**
     * 부품판매가격마스터 가격정보 서비스
     */
    @Resource(name="partsVenderSalPriceMasterService")
    PartsVenderSalPriceMasterService partsVenderSalPriceMasterService;

    /**
     * 품목그룹 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * ABC Class
     */
    @Resource(name="abcClassService")
    AbcClassService abcClassService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 부품가격마스터 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsPriceMasterMain.do", method = RequestMethod.GET)
    public String selectPartsPriceMasterMain(Model model, String itemCd, String itemNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 파라미터 정보: 부품코드
        model.addAttribute("itemCd", itemCd);
        // 파라미터 정보: 부품코드
        model.addAttribute("itemNm", itemNm);

        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        // 거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        // 구매단가유형 공통코드정보 조회.
        model.addAttribute("purcPrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        // 판매단가유형 공통코드정보 조회.
        model.addAttribute("salePrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        // 공급상 공통코드정보 조회.
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        // 단위 공통코드정보 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("prcQtyUnitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        // 품목그룹 정보 조회.
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("itemGroupCdList", itemGroupService.selectItemGroupsByCondition(searchVO));

        return "/par/pmm/partsPriceMaster/selectPartsPriceMasterMain";
    }

    /**
     * 공급업체 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsVenderMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsVenderMasters(@RequestBody PartsVenderMasterSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(partsVenderMasterService.selectPartsVenderMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsVenderMasterService.selectPartsVenderMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 공급업체 추가/수정/삭제 한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/multiPartsVenderMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPartsVenderMasters(@Validated @RequestBody BaseSaveVO<PartsVenderMasterVO> saveVO, BindingResult bindingResult) throws Exception
    {
        partsVenderMasterService.multiPartsVenderMasters(saveVO);
        return true;
    }

    /**
     * 공급업체 데이타를 추가한다.
     * @param venderMasterVO - 거래처 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/insertPartsVenderMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertPartsVenderMaster(@Validated @RequestBody PartsVenderMasterVO partsVenderMasterVO)throws Exception
    {
        partsVenderMasterService.insertPartsVenderMaster(partsVenderMasterVO);

        return true;
    }

    /**
     * 공급업체 데이타를 수정한다.
     * @param venderMasterVO - 거래처 데이타 VO
     * @return 성공 유무
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/updatePartsVenderMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updatePartsVenderMaster(@Validated @RequestBody PartsVenderMasterVO partsVenderMasterVO)throws Exception
    {
        partsVenderMasterService.updatePartsVenderMaster(partsVenderMasterVO);

        return true;
    }

    /**
     * 부품가격마스터 구매가격정보 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsVenderPriceMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsVenderPriceMasters(@RequestBody PartsVenderPriceMasterSearchVO searchVO)throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(partsVenderPriceMasterService.selectPartsVenderPriceMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsVenderPriceMasterService.selectPartsVenderPriceMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 부품가격마스터 구매가격정보 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/multiPartsVenderPriceMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPartsVenderPriceMasters(@Validated @RequestBody BaseSaveVO<PartsVenderPriceMasterVO> saveVO, BindingResult bindingResult) throws Exception
    {
        partsVenderPriceMasterService.multiPartsVenderPriceMaster(saveVO);
        return true;
    }

    /**
     * 부품가격마스터 판매가격정보 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsVenderSalPriceMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsVenderSalPriceMasters(@RequestBody PartsVenderSalPriceMasterSearchVO searchVO)throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(partsVenderSalPriceMasterService.selectPartsVenderSalPriceMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(partsVenderSalPriceMasterService.selectPartsVenderSalPriceMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 부품가격마스터 판매가격정보 등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/multiPartsVenderSalPriceMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPartsVenderSalPriceMasters(@Validated @RequestBody BaseSaveVO<PartsVenderSalPriceMasterVO> saveVO, BindingResult bindingResult) throws Exception
    {
        partsVenderSalPriceMasterService.multiPartsVenderSalPriceMaster(saveVO);
        return true;
    }


    /**
     * 부품가격마스터 조회 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsPriceMasterDisableMain.do", method = RequestMethod.GET)
    public String selectPartsPriceMasterDisableMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        // 거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        // 구매단가유형 공통코드정보 조회.
        model.addAttribute("purcPrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        // 판매단가유형 공통코드정보 조회.
        model.addAttribute("salePrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        // 공급상 공통코드정보 조회.
        model.addAttribute("spyrCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR102", null, langCd));

        // 단위 공통코드정보 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("prcQtyUnitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        // 품목그룹 정보 조회.
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("itemGroupCdList", itemGroupService.selectItemGroupsByCondition(searchVO));


        return "/par/pmm/partsPriceMaster/selectPartsPriceMasterDisableMain";
    }

    /**
     * 부품가격마스터 구매가격정보 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsPurcPriceMastersByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsPurcPriceMastersByKey(@RequestBody PartsVenderSalPriceMasterSearchVO searchVO)throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(partsVenderSalPriceMasterService.selectPartsPurcPriceMastersByKey(searchVO));

        return result;
    }

    /**
     * 부품가격마스터 도소매격정보 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPartsRetailPriceMastersByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPartsRetailPriceMastersByKey(@RequestBody PartsVenderSalPriceMasterSearchVO searchVO)throws Exception
    {
        SearchResult result = new SearchResult();

        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(partsVenderSalPriceMasterService.selectPartsRetailPriceMastersByKey(searchVO));

        return result;
    }

    /**
     * 지불유형별 창고부품 가격  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderSalPriceMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/partsPriceMaster/selectPayTpPriceMasterByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public PartsVenderSalPriceMasterVO selectPayTpPriceMasterByKey(@RequestBody PartsVenderSalPriceMasterSearchVO searchVO) throws Exception
    {

        PartsVenderSalPriceMasterVO partsVenderSalPriceMasterVO = new PartsVenderSalPriceMasterVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        partsVenderSalPriceMasterVO = partsVenderSalPriceMasterService.selectPayTpPriceMasterByKey(searchVO);


        return partsVenderSalPriceMasterVO;
    }

}
