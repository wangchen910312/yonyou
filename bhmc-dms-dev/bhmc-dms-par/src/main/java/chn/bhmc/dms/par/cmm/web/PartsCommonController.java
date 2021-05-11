package chn.bhmc.dms.par.cmm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueEtcService;
import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.par.pcm.service.PurcCostSgstService;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.service.PurcRqstService;
import chn.bhmc.dms.par.pcm.service.ReceiveEtcService;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO;
import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.BinLocationDefineService;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.AbcClassSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationDefineSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * 부품 공통 관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 02. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */
@Controller
public class PartsCommonController extends HController {

    /**
     * 구매오더 서비스
     */
    @Resource(name="purcOrdService")
    PurcOrdService purcOrdService;

    /**
     * 거래처 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 품목그룹 관리 서비스
     */
    @Resource(name="itemGroupService")
    ItemGroupService itemGroupService;

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 구매요청 서비스
     */
    @Resource(name="purcRqstService")
    PurcRqstService purcRqstService;

    /**
     * 구매제시 서비스
     */
    @Resource(name="purcCostSgstService")
    PurcCostSgstService purcCostSgstService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 로케이션 레벨 정의 서비스
     */
    @Resource(name="binLocationDefineService")
    BinLocationDefineService binLocationDefineService;

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
     * ABC Class
     */
    @Resource(name="abcClassService")
    AbcClassService abcClassService;

    /**
     * 기타출고 서비스
     */
    @Resource(name="issueEtcService")
    IssueEtcService issueEtcService;

    /**
     * 기타입고 서비스
     */
    @Resource(name="receiveEtcService")
    ReceiveEtcService receiveEtcService;

    /**
     * SA 서비스
     */
    @Resource(name="issueReqTechManService")
    IssueReqTechManService issueReqTechManService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 구매오더 복사 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPrevPurcOrdPopup", method = RequestMethod.GET)
    public String selectPrevPurcOrdPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("purcUnit", purcUnitList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("purcOrdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("trsfTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));

        return "/par/cmm/selectPrevPurcOrdPopup";

    }

    /**
     * 구매오더 품목 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcOrdItemPopup", method = RequestMethod.GET)
    public String selectPurcOrdItemPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("purcUnit", purcUnitList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("purcOrdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));

        return "/par/cmm/selectPurcOrdItemPopup";
    }

    /**
     * 구매오더 리스트 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcOrdListPopup", method = RequestMethod.GET)
    public String selectPurcOrdListPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("purcOrdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));

        return "/par/cmm/selectPurcOrdListPopup";
    }

    /**
     * 구매오더 리스트 부품 상세 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcOrdListAndItemPopup", method = RequestMethod.GET)
    public String selectPurcOrdListAndItemPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("purcOrdTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));

        return "/par/cmm/selectPurcOrdListAndItemPopup";
    }

    /**
     * 구매오더 복사 팝업 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPrevPurcOrdsPop.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrds(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcOrdService.selectPurcOrdsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매요청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcReqPopup", method = RequestMethod.GET)
    public String selectPurcReqPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        //CarInfo
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("purcReqTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR201", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/cmm/selectPurcReqPopup";
    }

    /**
     * 구매요청 팝업 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcReqsPop.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcReqsPop(@RequestBody PurcRqstSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcRqstService.selectPurcReqsPopByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcRqstService.selectPurcReqsPopByCondition(searchVO));
        }

        return result;
    }

    /**
     * 구매제시 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcCostSgstPopup.do", method = RequestMethod.GET)
    public String selectPurcCostSgstPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/cmm/selectPurcCostSgstPopup";
    }

    /**
     * 구매제시 팝업 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcRqstSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcCostSgsts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcCostSgstsPop(@RequestBody PurcCostSgstSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcCostSgstService.selectSgstPurcOrdByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcCostSgstService.selectSgstPurcOrdByCondition(searchVO));
        }

        return result;
    }

    /**
     * 품목 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemPopup.do", method = RequestMethod.GET)
    public String selectItemPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        return "/par/cmm/selectItemPopup";
    }

    /**
     * 품목 팝업(구매오더신청용)화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemPopupForPurcOrd.do", method = RequestMethod.GET)
    public String selectItemPopupForPurcOrd(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        return "/par/cmm/selectItemPopupForPurcOrd";
    }

    /**
     * 품목 팝업(판매단가용) 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemSalePrcPopup.do", method = RequestMethod.GET)
    public String selectItemMasterSalePrcPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("prcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/par/cmm/selectItemSalePrcPopup";
    }

    /**
     * 검색용 부품마스터 & 재고 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectSearchItemPopup.do", method = RequestMethod.GET)
    public String selectSearchItemPopup(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        AbcClassSearchVO abcClassSearchVO = new AbcClassSearchVO();
        abcClassSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        abcClassSearchVO.setsUseYn("Y");

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemGroupList", itemGroupList);

        return "/par/cmm/selectSearchItemPopup";
    }

    /**
     * 검색용 부품마스터 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectSearchItemMasterPopup.do", method = RequestMethod.GET)
    public String selectSearchItemMasterPopup(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        AbcClassSearchVO abcClassSearchVO = new AbcClassSearchVO();
        abcClassSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        abcClassSearchVO.setsUseYn("Y");

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("itemGroupList", itemGroupList);
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        return "/par/cmm/selectSearchItemMasterPopup";
    }

    /**
     * 재고실사리스트 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectInvestigationListPopup.do", method = RequestMethod.GET)
    public String selectInvestigationListPopup(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("docStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR412", null, langCd));
        model.addAttribute("storageList", storageList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/cmm/selectInvestigationListPopup";
    }

    /**
     * 공용차종 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectComCarlineListPopup.do", method = RequestMethod.GET)
    public String selectCompCarlineListPopup(Model model)  throws Exception  {
        return "/par/cmm/selectComCarlineListPopup";
    }

    /**
     * 품목팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemPopupByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectItemPopupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemPopupByCondition(searchVO));
        }

        return result;
    }

    /**
     * 품목팝업 정보(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemSalePrcPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemSalePrcPopupByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectItemSalePrcPopupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemSalePrcPopupByCondition(searchVO));
        }

        return result;
    }

    /**
     * 품목팝업 정보(서비스 단일부품 보증단가)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemGrtePrcPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemGrtePrcPopupByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectItemGrtePrcPopupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemGrtePrcPopupByCondition(searchVO));
        }

        return result;
    }

    /**
     * 품목팝업 정보(서비스판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectItemSalePrcForServicePopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemSalePrcForServicePopupByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectItemSalePrcForServicePopupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectItemSalePrcForServicePopupByCondition(searchVO));
        }

        return result;
    }

    /**
     * 검색용 품목팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectSearchItemPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSearchItemPopupByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectSearchItemPopupByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectSearchItemPopupByCondition(searchVO));
        }

        return result;
    }

    /**
     * 검색용 품목팝업 정보를 조회한다.(기술자문)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectSearchItemPopupByQnACondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSearchItemPopupByQnACondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectSearchItemPopupByQnAConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectSearchItemPopupByQnACondition(searchVO));
        }

        return result;
    }


    /**
     * 차종팝업 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectCarlinePopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCarlinePopupByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn

        result.setTotal(carInfoService.selectCarListsByConditionCnt(carInfoSearchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectCarListsByCondition(carInfoSearchVO));
        }
        return result;

    }

    /**
     * 판매가 생성 대상선정  히스토리 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectPartsPriceSalHistoryPopup.do", method = RequestMethod.GET)
    public String selectPartsSalHistoryPopup(Model model, String itemCd, String itemNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("itemCd", itemCd);
        model.addAttribute("itemNm", itemNm);
        model.addAttribute("sysDate", dateFormat);
        //Unit Info
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        //CarInfo
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("partsCarTpDs", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //ABC Class
        AbcClassSearchVO abcClassSearchVO = new AbcClassSearchVO();
        abcClassSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        abcClassSearchVO.setsUseYn("Y");

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        //SalePriceTp
        model.addAttribute("salePrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));

        return "/par/cmm/selectPartsPriceSalHistoryPopup";
    }

    /**
     * 판매가 생성 대상선정  히스토리 팝업(변경) 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectPartsPriceSalHistoryOperPopup.do", method = RequestMethod.GET)
    public String selectPartsSalHistoryOperPopup(Model model, String itemCd, String itemNm) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("itemCd", itemCd);//params itemCd
        model.addAttribute("itemNm", itemNm);//params itemNm
        model.addAttribute("sysDate", dateFormat);

        //UnitInfo
        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        unitInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("unitCdDs", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));
        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        //CarInfo
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("partsCarTpDs", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        //ABC Class
        AbcClassSearchVO abcClassSearchVO = new AbcClassSearchVO();
        abcClassSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        abcClassSearchVO.setsUseYn("Y");

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        //StorageInfo
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));
        //BinLocationDefine
        BinLocationDefineSearchVO binLocationDefineSearchVO = new BinLocationDefineSearchVO();
        binLocationDefineSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("binLocationLevelCdList", binLocationDefineService.selectBinLocationDefinesByCondition(binLocationDefineSearchVO));
        //SalePrcTp
        model.addAttribute("salePrcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));

        return "/par/cmm/selectPartsPriceSalHistoryOperPopup";
    }

    /**
     * 기타출고 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectIssueEtcPopup.do", method = RequestMethod.GET)
    public String selectIssueEtcPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        model.addAttribute("unitCdList", unitCdList);
        model.addAttribute("storageList", storageList);

        model.addAttribute("giReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR401", null, langCd));
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/cmm/selectIssueEtcPopup";
    }

    /**
     * 기타출고(렌탈) 정보를 조회한다.(차입용)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectIssueEtcRentalPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcRentalPopupByCondition(@RequestBody IssueEtcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(issueEtcService.selectIssueEtcRentalPopCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueEtcService.selectIssueEtcRentalPop(searchVO));
        }

        return result;
    }

    /**
     * 기타출고(렌탈) 정보를 조회한다.(차입반환용)
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectIssueEtcReturnPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIssueEtcReturnPopupByCondition(@RequestBody IssueEtcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(issueEtcService.selectIssueEtcReturnPopCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(issueEtcService.selectIssueEtcReturnPop(searchVO));
        }

        return result;
    }

    /**
     * 기타입고 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectReceiveEtcPopup.do", method = RequestMethod.GET)
    public String selectReceiveEtcPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("unitCdList", unitCdList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/cmm/selectReceiveEtcPopup";
    }

    /**
     * 기타입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectReceiveEtcPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcPopupByCondition(@RequestBody ReceiveEtcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(receiveEtcService.selectReceiveEtcPopCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcService.selectReceiveEtcPop(searchVO));
        }

        return result;
    }

    /**
     * 클레임 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectClaimItemPopup.do", method = RequestMethod.GET)
    public String selectClaimItemPopup(Model model) throws Exception {

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));

        return "/par/cmm/selectClaimItemPopup";
    }

    /**
     * 부품탐색 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectShareStockGiItemPopup.do", method = RequestMethod.GET)
    public String selectShareStockGiItemPopup(Model model,HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);
        model.addAttribute("itemGroupList", itemGroupList);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       //useYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        //BMP VenderMaster VO
        VenderMasterVO venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            //BMP Info
            model.addAttribute("bpCd", venderMasterVO.getBpCd());
            model.addAttribute("bpNm", venderMasterVO.getBpNm());
            model.addAttribute("bpTp", venderMasterVO.getBpTp());
        }else{
            //Default BMP Info
            model.addAttribute("bpCd", "A10AA001");
            model.addAttribute("bpNm", "BMP");
            model.addAttribute("bpTp", "01");
        }

        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
        model.addAttribute("prcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR132", null, langCd));

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        Device device = DeviceUtils.getCurrentDevice(request);//khskhs 문제시삭제
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
      // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
        	model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
      //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        if(request.getHeader("Referer").contains("selectIssueProcureMain")){
            model.addAttribute("spyrCd", "01");
        }

        return "/par/cmm/selectShareStockGiItemPopup";

    }

    /**
     * 부품탐색(서비스용 판매단가) 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectStockGiItemForServicePopup.do", method = RequestMethod.GET)
    public String selectStockGiItemForServicePopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);
        model.addAttribute("itemGroupList", itemGroupList);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       //useYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

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

        //BMP VenderMaster VO
        VenderMasterVO venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            //BMP Info
            model.addAttribute("bpCd", venderMasterVO.getBpCd());
            model.addAttribute("bpNm", venderMasterVO.getBpNm());
            model.addAttribute("bpTp", venderMasterVO.getBpTp());
        }else{
            //Default BMP Info
            model.addAttribute("bpCd", "A10AA001");
            model.addAttribute("bpNm", "BMP");
            model.addAttribute("bpTp", "01");
        }

        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

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
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        return "/par/cmm/selectStockGiItemForServicePopup";

    }

    /**
     * 부품탐색(정비수령용 판매단가) 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectStockGiItemForIssueReqPopup.do", method = RequestMethod.GET)
    public String selectStockGiItemForIssueReqPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ItemGroupSearchVO itemGroupVO = new ItemGroupSearchVO();
        List<ItemGroupVO> itemGroupList = new ArrayList<ItemGroupVO>();

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        itemGroupVO.setsDlrCd(LoginUtil.getDlrCd());
        itemGroupList = itemGroupService.selectItemGroupCodesByCondition(itemGroupVO);
        model.addAttribute("itemGroupList", itemGroupList);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       //useYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

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

        //BMP VenderMaster VO
        VenderMasterVO venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            //BMP Info
            model.addAttribute("bpCd", venderMasterVO.getBpCd());
            model.addAttribute("bpNm", venderMasterVO.getBpNm());
            model.addAttribute("bpTp", venderMasterVO.getBpTp());
        }else{
            //Default BMP Info
            model.addAttribute("bpCd", "A10AA001");
            model.addAttribute("bpNm", "BMP");
            model.addAttribute("bpTp", "01");
        }

        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //출고창고 공통코드정보 조회.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

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
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        return "/par/cmm/selectStockGiItemForIssueReqPopup";

    }

    /**
     * 송장리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectInvcListPopup.do", method = RequestMethod.GET)
    public String selectInvicListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("invcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("vatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/cmm/selectInvcListPopup";
    }

    /**
     * 품질클레임 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectQualityClaimPopup.do", method = RequestMethod.GET)
    public String selectQualityClaimPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("carModelList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR226", null, langCd));
        model.addAttribute("claimTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR227", null, langCd));
        model.addAttribute("dealerClaimWayList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR228", null, langCd));
        model.addAttribute("prcCodeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR229", null, langCd));
        model.addAttribute("deliveryTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR230", null, langCd));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/cmm/selectQualityClaimPopup";
    }

    /**
     * 과부족클레임 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectOversAndShortsClaimPopup.do", method = RequestMethod.GET)
    public String selectOversAndShortsClaimPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf= DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        if(venderMasterVO != null){
            //BMP Info
            model.addAttribute("bpCd", venderMasterVO.getBpCd());
            model.addAttribute("bpNm", venderMasterVO.getBpNm());
            model.addAttribute("bpTp", venderMasterVO.getBpTp());
        }else{
            //Default BMP Info
            model.addAttribute("bpCd", "A10AA001");
            model.addAttribute("bpNm", "BMP");
            model.addAttribute("bpTp", "01");
        }
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("claimTypeList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR238", null, langCd));
        model.addAttribute("isIntactList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR240", null, langCd));
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/cmm/selectOversAndShortsClaimPopup";
    }

    /**
     * 과부족클레임  수신 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectOversAndShortsClaimInfcPopup.do", method = RequestMethod.GET)
    public String selectOversAndShortsClaimInfcPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("strgeCdList", storageService.selectStoragesByCondition(storageSearchVO));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("statusList",            commonCodeService.selectCommonCodesByCmmGrpCd("PAR239", null, langCd));
        model.addAttribute("auditTypeList",         commonCodeService.selectCommonCodesByCmmGrpCd("PAR245", null, langCd));
        model.addAttribute("confirmTypeList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR246", null, langCd));
        model.addAttribute("handleTypeList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR247", null, langCd));
        model.addAttribute("accountTrackTypeList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR248", null, langCd));
        model.addAttribute("followTrackTypeList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR248", null, langCd));
        model.addAttribute("isPassList",            commonCodeService.selectCommonCodesByCmmGrpCd("PAR249", null, langCd));
        model.addAttribute("noPassReasonList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR250", null, langCd));
        model.addAttribute("siteVerifyResultList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR251", null, langCd));
        model.addAttribute("siteHandleViewList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR252", null, langCd));
        model.addAttribute("handleModeList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR253", null, langCd));
        model.addAttribute("noReparationReasonList",commonCodeService.selectCommonCodesByCmmGrpCd("PAR254", null, langCd));
        model.addAttribute("isAccountArrivedList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR249", null, langCd));
        model.addAttribute("followTrackList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR255", null, langCd));

        return "/par/cmm/selectOversAndShortsClaimInfcPopup";
    }

    /**
     * 기타출고 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectIssueEtcListPopup.do", method = RequestMethod.GET)
    public String selectIssueEtcListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList",commonCodeService.selectCommonCodesByCmmGrpCd("PAR311", null, langCd));

        return "/par/cmm/selectIssueEtcListPopup";
    }

    /**
     * 기타입고 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectReceiveEtcListPopup.do", method = RequestMethod.GET)
    public String selectReceiveEtcListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", "Y", langCd));

        return "/par/cmm/selectReceiveEtcListPopup";
    }

    /**
     * 입고반품 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectReceiveReturnEtcListPopup.do", method = RequestMethod.GET)
    public String selectReceiveReturnEtcListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", "Y", langCd));

        return "/par/cmm/selectReceiveReturnEtcListPopup";
    }

    /**
     * 딜러출고 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectIssueEtcFundListPopup.do", method = RequestMethod.GET)
    public String selectIssueEtcFundListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/cmm/selectIssueEtcFundListPopup";
    }

    /**
     * 공구출고 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectToolGiListPopup.do", method = RequestMethod.GET)
    public String selectToolGiListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR421", null, langCd));
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("toolGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR422", "Y", langCd));

        return "/par/cmm/selectToolGiListPopup";
    }

    /**
     * 딜러 선수금체크 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/chkAdvanceReceivedPopup.do", method = RequestMethod.GET)
    public String chkAdvanceReceivedPopup(Model model) throws Exception {

        return "/par/cmm/chkAdvanceReceivedPopup";
    }

    /**
     * 견적 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectEstimateListPopup.do", method = RequestMethod.GET)
    public String selectEstimateListPopup(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);

        return "/par/cmm/selectEstimateListPopup";
    }

    /**
     * 부품판매 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectPartsSaleOrdListPopup.do", method = RequestMethod.GET)
    public String selectPartsSaleOrdListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));
        model.addAttribute("ordStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd));
        model.addAttribute("saleTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd));

        return "/par/cmm/selectPartsSaleOrdListPopup";
    }

    /**
     * 클레임건 상태 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/setQualityClaimStatusPopup.do", method = RequestMethod.GET)
    public String setQualityClaimStatusPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //claimStat Info
        model.addAttribute("claimStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR231", null, langCd));

        return "/par/cmm/setQualityClaimStatusPopup";
    }

    /**
     * 회수운송장번호 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/setReClaimOrderPopup.do", method = RequestMethod.GET)
    public String setReClaimOrderPopup(Model model) throws Exception {

        return "/par/cmm/setReClaimOrderPopup";
    }

    /**
     * 송장 도착일자 설정 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/setInvoiceArriveDtPopup.do", method = RequestMethod.GET)
    public String setInvoiceArriveDtPopup(Model model) throws Exception {

        return "/par/cmm/setInvoiceArriveDtPopup";
    }

    /**
     * 부품판매 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectReceiveCnfmListPopup.do", method = RequestMethod.GET)
    public String selectReceiveCnfmListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("invcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));//Invoice Type
        model.addAttribute("invcStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));//Invoice Status
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//search 01 : Purchase Office
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/par/cmm/selectReceiveCnfmListPopup";
    }

    /**
     * 재고이동 리스트 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectStockMovStorageListPopup.do", method = RequestMethod.GET)
    public String selectStockMovStorageListPopup(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);
        String sevenDtBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("toDt", sysDate);
        model.addAttribute("sevenDtBf", sevenDtBf);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));

        return "/par/cmm/selectStockMovStorageListPopup";
    }

    /**
     * 부품패키지 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cmm/selectPartsPackageRegPopup.do", method = RequestMethod.GET)
    public String selectPartsPackageRegPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> stockUnitList = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        stockUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));
        model.addAttribute("stockUnitList", stockUnitList);

        LtsModelSearchVO searchVO = new LtsModelSearchVO();
        model.addAttribute("ltsModelDs", ltsModelMappingService.selectLtsModelsByCondition(searchVO));

        return "/par/cmm/selectPartsPackageRegPopup";
    }

    @RequestMapping(value = "/par/cmm/selectReceiveEtcExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectReceiveEtcExcelUploadPopup(Model model, HttpServletRequest request) throws Exception {
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/par/cmm/selectReceiveEtcExcelUploadPopup";
    }

    @RequestMapping(value = "/par/cmm/selectPartsSaleOrdExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectPartsSaleOrdExcelUploadPopup(Model model, HttpServletRequest request) throws Exception {

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("storageList",     storageList);

        return "/par/cmm/selectPartsSaleOrdExcelUploadPopup";
    }


    @RequestMapping(value = "/par/cmm/selectPartsPriceExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectPartsPriceExcelUploadPopup(Model model) throws Exception {
        return "/par/cmm/selectPartsPriceExcelUploadPopup";
    }


    @RequestMapping(value = "/par/cmm/selectStockInOutExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectStockInOutExcelUploadPopup(Model model) throws Exception {
        return "/par/cmm/selectStockInOutExcelUploadPopup";
    }

    @RequestMapping(value = "/par/cmm/setPartsSaleOrdReturnPopup.do", method = RequestMethod.GET)
    public String setPartsSaleOrdReturnPopup(Model model) throws Exception {
        //SA 리스트.
        IssueReqTechManSearchVO searchVO = new IssueReqTechManSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("tecCdList", issueReqTechManService.selectTechManFnMasterByCondition(searchVO));

        return "/par/cmm/setPartsSaleOrdReturnPopup";
    }

    /**
     * 검색용 부품마스터 그룹 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectSearchItemMasterGroupPopup.do", method = RequestMethod.GET)
    public String selectSearchItemMasterGroupPopup(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        return "/par/cmm/selectSearchItemMasterGroupPopup";
    }

    /**
     * 내부수령 사용자 검색 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectIssueInnerUserPopup.do", method = RequestMethod.GET)
    public String selectIssueInnerUserPopup(Model model, HttpServletRequest request) throws Exception {

        return "/par/cmm/selectIssueInnerUserPopup";
    }

    /**
     * 신규 로케이션 추가 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/setNewLocPopup.do", method = RequestMethod.GET)
    public String setNewLocPopup(Model model, HttpServletRequest request) throws Exception {

        return "/par/cmm/setNewLocPopup";
    }

    /**
     * 기초입고대상목록 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectReceiveInitTargetListPopup.do", method = RequestMethod.GET)
    public String selectReceiveInitTargetListPopup(Model model, HttpServletRequest request) throws Exception {

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);


        model.addAttribute("storageList",     storageList);
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR512", null, langCd));
        return "/par/cmm/selectReceiveInitTargetListPopup";
    }

    /**
     * 기초입고대상목록(정비수령용) 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectRepairOrderInitTargetListPopup.do", method = RequestMethod.GET)
    public String selectRepairOrderInitTargetListPopup(Model model, HttpServletRequest request) throws Exception {

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        //storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);


        model.addAttribute("storageList",     storageList);
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR512", null, langCd));
        return "/par/cmm/selectRepairOrderInitTargetListPopup";
    }

    /**
     * 창고설정목록 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/cmm/setStrgeCdPopup.do", method = RequestMethod.GET)
    public String setStrgeCdPopup(Model model, HttpServletRequest request) throws Exception {

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        model.addAttribute("storageList",     storageList);
        return "/par/cmm/setStrgeCdPopup";
    }
    
    /**
     * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectSearchPurcOrdPopup.do", method = RequestMethod.GET)
    public String selectSearchPurcOrdPopup(Model model)  throws Exception  {

    	String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        venderMasterVO     = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("carlineCdList",   carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("storageList",     storageList);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");
        model.addAttribute("itemDstinList",   commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("purcPgssCdList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR210", null, langCd));  //구매진행상태상세코드
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("ammendCodeList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR207", null, langCd));
        //삭제여부
        model.addAttribute("delYnList",       commonCodeService.selectCommonCodesByCmmGrpCd("SER902", null, langCd));

        return "/par/cmm/selectSearchPurcOrdPopup";
    }
    
    /**
     * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
     * @param searchVO - PurcOrdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectPurcOrdByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdByCondition(@RequestBody PurcOrdSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(purcOrdService.selectPurcOrdByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdByCondition(searchVO));
        }

        return result;
    }
    
    /**
     * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectReceiveEtcBorrowPopup.do", method = RequestMethod.GET)
    public String selectReceiveEtcBorrowPopup(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");//UseYn
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR019", null, langCd));

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        model.addAttribute("giStrgeCdList", storageService.selectStoragesByCondition(storageSearchVO));
        model.addAttribute("useYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", null, langCd));

        return "/par/cmm/selectReceiveEtcBorrowPopup";
    }
    
    /**
     * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cmm/selectReceiveEtcBorrowByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcBorrowByCondition(@RequestBody ItemMasterSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(itemMasterService.selectReceiveEtcBorrowByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(itemMasterService.selectReceiveEtcBorrowByCondition(searchVO));
        }

        return result;
    }
    @RequestMapping(value = "/par/cmm/selectInvestigationExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectInvestigationExcelPopup(Model model, HttpServletRequest request) throws Exception {
//        StorageSearchVO storageSearchVO = new StorageSearchVO();
//        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
//        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
//        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
//        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/par/cmm/selectInvestigationExcelUploadPopup";
    }
}
