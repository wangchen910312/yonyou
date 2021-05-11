package chn.bhmc.dms.par.pmm.web;

import java.util.ArrayList;
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

import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.MovementTypeService;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.MovementTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocListVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

/**
 * 수불유형 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 1. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 19.     Ju Won Lee      최초 생성
 * </pre>
 */

@Controller
public class MvtDocController extends HController {

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 거래처 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

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
     * 수불유형 서비스
     */
    @Resource(name="movementTypeService")
    MovementTypeService movementTypeService;

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 로케이션 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 수불유형 메인 화면을 출력한다.
     * @return
     */
    //@RequestMapping(value = "/par/pmm/movementType/selectMovementTypeMain.do", method = RequestMethod.GET)
    //public String selectMovementDocumentMain(Model model) {

        //return "/par/pmm/movementType/selectMovementTypeMain";
      //  return "/par/pmm/movementType/selectMovementTypeMain";

    //}

    /**
     *  수불 테스트 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/mvtDoc/selectMvtDocTest.do", method = RequestMethod.GET)
    public String selectMovementDocumentTest(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        MovementTypeSearchVO searchVO = new MovementTypeSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsUseYn("Y"); // 사용가능

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",        LoginUtil.getUserId());
        model.addAttribute("pltCd",           LoginUtil.getPltCd());
        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);

        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("mvtTpList",       movementTypeService.selectMovementTypesByCondition(searchVO));

        return "/par/pmm/mvtDoc/selectMvtDocTest";

    }

    /**
     * 수불문서 테스트를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pmm/mvtDoc/multiSaveMvtDocs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult multiSaveMovementDocuments(@RequestBody MvtDocListVO mvtDocListVO)  throws Exception {

        SearchResult result = new SearchResult();
        MvtDocVO mvtDocVO = new MvtDocVO();
        mvtDocVO = mvtDocListVO.getMvtDocVO();
        List<MvtDocItemVO> list = mvtDocListVO.getMvtDocItemVO();
        //List<MvtDocItemVO> resultList = new ArrayList<MvtDocItemVO>();

        result.setData(mvtDocService.multiSaveMvtDocs(mvtDocVO, list));

        return result;
    }

    /**
     * 수불문서 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/mvtDoc/selectMvtDoc.do", method = RequestMethod.GET)
    public String selectMvtDoc(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -7), dateFormat);

        //차종
        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        //창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //model
        // 공통코드 : 품목구분
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("mvtTpList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("carlineCdList", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));
        model.addAttribute("storageList",   storageList);
        model.addAttribute("toDt",          sysDate);
        model.addAttribute("sevenDtBf",     sevenDtBf);

        return "/par/pmm/mvtDoc/selectMvtDoc";
    }

    /**
     * 수불문서 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     * @return /par/pmm/mvtDoc/selectMvtDocList.do
     */
    @RequestMapping(value = "/par/pmm/mvtDoc/selectMvtDocList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMvtDocList(@RequestBody MovementTypeSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(movementTypeService.selectMvtDocItemsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(movementTypeService.selectMvtDocItemsByCondition(searchVO));
        }

        return result;




    }


    /**
     * 입출고 현황 데이타(입고)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     */
    @RequestMapping(value = "/par/pmm/mvtDoc/selectGrList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGrList(@RequestBody MvtDocSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(mvtDocService.selectGrListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(mvtDocService.selectGrList(searchVO));
        }

        return result;
    }

    /**
     * 입출고 현황 데이타(출고)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     */
    @RequestMapping(value = "/par/pmm/mvtDoc/selectGiList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGiList(@RequestBody MvtDocSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(mvtDocService.selectGiListCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(mvtDocService.selectGiList(searchVO));
        }

        return result;
    }

    /**
     * 부품번호에 해당하는 입출고 서머리를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     */
    @RequestMapping(value = "/par/pmm/mvtDoc/selectGrGiSummaryByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGrGiSummaryByItemCd(@RequestBody MvtDocSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(mvtDocService.selectGrGiSummaryByItemCd(searchVO));

        return result;
    }

    /**
     * 조회조건에 해당하는 입출고 서머리를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MovementTypeSearchVO
     */
    @RequestMapping(value = "/par/pmm/mvtDoc/selectGrGiSummary.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGrGiSummary(@RequestBody MvtDocSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<MvtDocVO> mvtDocList        = new ArrayList<MvtDocVO>();

        mvtDocList.add(mvtDocService.selectGrGiSummary(searchVO));

        result.setData(mvtDocList);

        return result;
    }


}
