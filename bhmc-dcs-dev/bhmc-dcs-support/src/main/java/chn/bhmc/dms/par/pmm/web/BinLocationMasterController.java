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

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationDefineService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterItemService;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.TempCodeMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterItemVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterTreeListVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 로케이션 마스터 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

@Controller
public class BinLocationMasterController extends HController {

    /**
     * 로케이션 레벨 정의 서비스
     */
    @Resource(name="binLocationDefineService")
    BinLocationDefineService binLocationDefineService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 부번별 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterItemService")
    BinLocationMasterItemService binLocationMasterItemService;

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
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 사용자코드 서비스(테스트용)
     */
    @Resource(name="tempCodeMasterService")
    TempCodeMasterService tempCodeMasterService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 로케이션 레벨 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationDefineMain.do")
    public String selectBinLocationDefineMain(Model model) throws Exception{

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 로케이션 타입 정보 조회.
        model.addAttribute("locationTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR006", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/par/pmm/binLocationMaster/selectBinLocationDefineMain";
    }

    /**
     * 로케이션 레벨 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationDefines.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBinLocationDefines(@RequestBody BinLocationDefineSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        SearchResult result = new SearchResult();

        result.setTotal(binLocationDefineService.selectBinLocationDefinesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(binLocationDefineService.selectBinLocationDefinesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 로케이션 레벨 키 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationDefineSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationDefineByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public BinLocationDefineVO selectBinLocationDefineByKey(@RequestBody BinLocationDefineSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        BinLocationDefineVO binLocationDefineVO = new BinLocationDefineVO();
        binLocationDefineVO = binLocationDefineService.selectBinLocationDefineByKey(searchVO.getsDlrCd(), searchVO.getsLvlId());

        return binLocationDefineVO;
    }

    /**
     * 로케이션 레벨 정보를 저장한다.
     * @param saveVO - 저장 할 ItemGroupSaveVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/multiBinLocationDefines.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBinLocationDefines(@Validated @RequestBody BaseSaveVO<BinLocationDefineVO> binLocationDefineSaveVO, BindingResult bindingResult) throws Exception
    {
        binLocationDefineService.multiBinLocationDefines(binLocationDefineSaveVO);
        return true;
    }

    /**
     * 로케이션 마스터 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationMasterMain.do")
    public String selectBinLocationMasterMain(Model model) throws Exception{

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 레벨 조회.
        BinLocationDefineSearchVO binLocationDefineSearchVO = new BinLocationDefineSearchVO();
        binLocationDefineSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("binLocationLevelCdList", binLocationDefineService.selectBinLocationDefinesByCondition(binLocationDefineSearchVO));

        // 단위 공통코드정보 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("prcQtyUnitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        return "/par/pmm/binLocationMaster/selectBinLocationMasterMain";
    }

    /**
     * 로케이션 마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBinLocationMasters(@RequestBody BinLocationMasterSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(binLocationMasterService.selectBinLocationMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(binLocationMasterService.selectBinLocationMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 로케이션 소속 부품 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBinLocationItems(@RequestBody BinLocationMasterSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(binLocationMasterService.selectBinLocationMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(binLocationMasterService.selectBinLocationItemsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 로케이션 마스터 트리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationMasterTreeLists.do", method = RequestMethod.POST)
    @ResponseBody
    public List<BinLocationMasterTreeListVO> selectBinLocationMasterTreeLists(@RequestBody BinLocationMasterSearchVO searchVO) throws Exception{

        List<BinLocationMasterTreeListVO> list = new ArrayList<BinLocationMasterTreeListVO>();
        list = binLocationMasterService.selectBinLocationMastersTreeListByCondition(searchVO);

        return list;
    }

    /**
     * 로케이션 마스터 계층구조 정보를 저장한다.
     * @param saveVO - 저장 할 BinLocationMasterSaveVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/multiBinLocationMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBinLocationMasters(@Validated @RequestBody BaseSaveVO<BinLocationMasterVO> binLocationMasterSaveVO, BindingResult bindingResult) throws Exception
    {
        binLocationMasterService.multiBinLocationMasters(binLocationMasterSaveVO);
        return true;
    }

    /**
     * 부번별 로케이션 마스터 계층구조 정보를 저장한다.
     * @param saveVO - 저장 할 BinLocationMasterSaveVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/multiBinLocationMasterPartsItems.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBinLocationMasterPartsItems(@Validated @RequestBody BaseSaveVO<BinLocationMasterItemVO> binLocationMasterSaveVO, BindingResult bindingResult) throws Exception
    {
        binLocationMasterItemService.multiBinLocationMasterItems(binLocationMasterSaveVO);
        return true;
    }

    /**
     * 로케이션 마스터 최종부품정보를 저장한다.
     * @param saveVO - 저장 할 BinLocationMasterSaveVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/multiBinLocationMasterItems.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiBinLocationMasterItems(@Validated @RequestBody BaseSaveVO<BinLocationMasterVO> binLocationMasterSaveVO, BindingResult bindingResult) throws Exception
    {
        binLocationMasterService.multiBinLocationMasterItems(binLocationMasterSaveVO);
        return true;
    }

    /**
     * 로케이션 마스터 메인 최종 부품화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationMasterItemMain.do")
    public String selectBinLocationMasterItemMain(Model model) throws Exception{

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 레벨 조회.
        BinLocationDefineSearchVO binLocationDefineSearchVO = new BinLocationDefineSearchVO();
        binLocationDefineSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("binLocationLevelCdList", binLocationDefineService.selectBinLocationDefinesByCondition(binLocationDefineSearchVO));

        // 단위 공통코드정보 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("prcQtyUnitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        return "/par/pmm/binLocationMaster/selectBinLocationMasterItemMain";
    }

    /**
     * 로케이션 마스터 메인 유지관리 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationMasterMaintenanceMain.do")
    public String selectBinLocationMasterMaintenanceMain(Model model) throws Exception{

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        // 출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        // 로케이션 레벨 조회.
        BinLocationDefineSearchVO binLocationDefineSearchVO = new BinLocationDefineSearchVO();
        binLocationDefineSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("binLocationLevelCdList", binLocationDefineService.selectBinLocationDefinesByCondition(binLocationDefineSearchVO));

        // 단위 공통코드정보 조회.
        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("prcQtyUnitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));
        // 로케이션 조회 상태
        // TODO [심인보] 공통코드 정의 후 교체 함.
        model.addAttribute("locStatusDs", tempCodeMasterService.selectTempCodeLocStatusByCondition());

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, LocaleContextHolder.getLocale().getLanguage()));

        // 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsLvlId(2);
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLastLvlYn("N");
        model.addAttribute("locCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));


        return "/par/pmm/binLocationMaster/selectBinLocationMasterMaintenanceMain";
    }

    /**
     * 부번별 로케이션 부품 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binLocationMaster/selectBinLocationMasterItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBinLocationMasterItems(@RequestBody BinLocationMasterSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        result.setTotal(binLocationMasterItemService.selectBinLocationMasterItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(binLocationMasterItemService.selectBinLocationMasterItemsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 로케이션 특정 품목 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BinLocationMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/binlocation/selectBinLocationMasterByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBinLocationMasterByItemCd(@RequestBody BinLocationMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(binLocationMasterService.selectBinLocationMasterByItemCd(searchVO));

        return result;

    }
}
