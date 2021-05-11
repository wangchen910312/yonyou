package chn.bhmc.dms.par.pcm.web;

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

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.PurcCostService;
import chn.bhmc.dms.par.pcm.service.PurcCostSgstService;
import chn.bhmc.dms.par.pcm.vo.PurcCostSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.AbcClassSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 구매소요량 컨트롤러
 *
 * @author In Bo Shim
 * @since 2016. 2. 1.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 1.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class PurcCostController extends HController {

    /**
     * 구매소요량 서비스
     */
    @Resource(name="purcCostService")
    PurcCostService purcCostService;

    /**
     * 구매제시 서비스
     */
    @Resource(name="purcCostSgstService")
    PurcCostSgstService purcCostSgstService;

    /**
     * 거래처 관리 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

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
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 구매소요량 산출 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcCost/selectPurcCostCalculateMain.do", method = RequestMethod.GET)
    public String selectPurcCostCalculateMain(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 로그인 정보: 플랜트코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // BMP 거래처 VO
        VenderMasterVO venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            // BMP 거래처 코드
            model.addAttribute("bpCd", venderMasterVO.getBpCd());
            // BMP 거래처 코드명
            model.addAttribute("bpNm", venderMasterVO.getBpNm());
            model.addAttribute("bpTp", venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd", "A10AA001");
            model.addAttribute("bpNm", "BMP");
            model.addAttribute("bpTp", "01");
        }

        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/pcm/purcCost/selectPurcCostCalculateMain";

    }

    /**
     * 구매소요량 산출 추가/수정/삭제 한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcCost/multiPurcCostes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPurcCostes(@RequestBody PurcCostSearchVO searchVO) throws Exception
    {
        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        // 플랜트 코드
        searchVO.setsPltCd(LoginUtil.getPltCd());
        purcCostService.multiPurcCostes(searchVO);
        return true;
    }

    /**
     * 구매제시 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/pcm/purcCost/selectPurcCostManageMain.do", method = RequestMethod.GET)
    public String selectPurcCostManageMain(Model model, String bpCd, String bpNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        // 센터코드
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        // BMP 거래처 코드
        model.addAttribute("bpCd", bpCd);
        // BMP 거래처 코드명
        model.addAttribute("bpNm", bpNm);
        // 단위 조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));
        // 차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");  // UseYn
        model.addAttribute("partsCarTpDs", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        // ABC Class 공통코드정보 조회.
        AbcClassSearchVO abcClassSearchVO = new AbcClassSearchVO();
        abcClassSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        abcClassSearchVO.setsUseYn("Y");

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        return "/par/pcm/purcCost/selectPurcCostManageMain";

    }

    /**
     * 구매제시 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcCost/selectPurcCostSgstes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemGroups(@RequestBody PurcCostSgstSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcCostSgstService.selectPurcCostSgstesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcCostSgstService.selectPurcCostSgstesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 구매제시 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcCost/selectSgstPurcOrds.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSgstPurcOrds(@RequestBody PurcCostSgstSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        // 딜러코드 검색 VO
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(purcCostSgstService.selectSgstPurcOrdByCondition(searchVO));

        return result;

    }

    /**
     * 구매제시 추가/수정/삭제 한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcCost/multiPurcCostSgstes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPurcCostSgstes(@Validated @RequestBody BaseSaveVO<PurcCostSgstVO> purcCostSgstSaveVO, BindingResult bindingResult) throws Exception
    {
        purcCostSgstService.multiPurcCostesSgst(purcCostSgstSaveVO);
        return true;
    }

    /**
     * 구매산출 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/purcCost/selectPurcCostDisableMain.do", method = RequestMethod.GET)
    public String selectPurcCostDisableMain(Model model, String bpCd, String bpNm, String pltCd) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        //센터코드
        model.addAttribute("pltCd", pltCd);
        //공급처코드
        model.addAttribute("bpCd", bpCd);
        //공급처명
        model.addAttribute("bpNm", bpNm);

        //차종,중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //단위조회.
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        commonCodeSearchVO.setsLangCd(langCd);
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("storageList",     storageList);

        return "/par/pcm/purcCost/selectPurcCostDisableMain";
    }

}
