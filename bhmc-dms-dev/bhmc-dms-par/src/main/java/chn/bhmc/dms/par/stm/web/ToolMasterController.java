package chn.bhmc.dms.par.stm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.service.ToolGiService;
import chn.bhmc.dms.par.stm.vo.ToolGiItemVO;
import chn.bhmc.dms.par.stm.vo.ToolGiListVO;
import chn.bhmc.dms.par.stm.vo.ToolGiSaveVO;
import chn.bhmc.dms.par.stm.vo.ToolGiSearchVO;
import chn.bhmc.dms.par.stm.vo.ToolGiVO;

/**
 * Tool Master Controller
 *
 * @author Ju Won Lee
 * @since 2016. 05. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Ju Won Lee      최초 생성
 * </pre>
 */
@Controller
public class ToolMasterController extends HController {

    /**
     * 공구출고 서비스
     */
    @Resource(name="toolGiService")
    ToolGiService toolGiService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 로케이션 마스터 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 현재고 서비스
     */
    @Resource(name="stockInOutService")
    StockInOutService stockInOutService;

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

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 공구사용기록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/selectToolMasterUseMain.do", method = RequestMethod.GET)
    public String selectToolMasterUseMain(Model model,@RequestParam(value="pToolGiNo", defaultValue="") String pToolGiNo) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate = DateUtil.getDate(dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
        model.addAttribute("unitCdList", unitCdList);
        model.addAttribute("storageList", storageList);
        model.addAttribute("pToolGiNo", pToolGiNo);
        model.addAttribute("toDt", sysDate);
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR421", null, langCd));
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("toolGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR422", "Y", langCd));

        return "/par/stm/toolMaster/selectToolMasterUseMain";
    }

    /**
     * 공구관리현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/selectToolMasterUseStatus.do", method = RequestMethod.GET)
    public String selectToolMasterUseStatus(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",            LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",         LoginUtil.getUserId());
        model.addAttribute("pltCd",            LoginUtil.getPltCd());
        model.addAttribute("unitCdList",       unitCdList);
        model.addAttribute("storageList",      storageList);
        model.addAttribute("toDt",             sysDate);
        model.addAttribute("sevenDtBf",        sevenDtBf);
        model.addAttribute("statCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR421", null, langCd));
        model.addAttribute("mvtTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("toolGiTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR422", "Y", langCd));

        return "/par/stm/toolMaster/selectToolMasterUseStatus";
    }

    /**
     * 공구출고를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/stm/toolMaster/createToolGi.do", method = RequestMethod.POST)
    @ResponseBody
    public ToolGiVO createToolGi(@Validated @RequestBody ToolGiListVO toolGiListVO)  throws Exception {

        ToolGiVO toolGiVO = new ToolGiVO();
        toolGiVO          = toolGiListVO.getToolGiVO();
        List<ToolGiItemVO> list = toolGiListVO.getToolGiItemList();


        toolGiVO.setRegUsrId(LoginUtil.getUserId());
        toolGiVO.setDlrCd(LoginUtil.getDlrCd());
        toolGiVO.setRegDt(new Date());


        toolGiVO = toolGiService.createToolGi(list, toolGiVO);

        toolGiVO.setResultYn(true);

        return toolGiVO;
    }

    /**
     * 공구출고를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/multiToolGis.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiToolGis(@Validated @RequestBody ToolGiSaveVO saveVO)  throws Exception {

        ToolGiVO toolGiVO = new ToolGiVO();
        toolGiVO = saveVO.getToolGiVO();

        toolGiVO.setRegUsrId(LoginUtil.getUserId());
        toolGiVO.setDlrCd(LoginUtil.getDlrCd());

        toolGiService.multiToolGis(saveVO, toolGiVO);

        return true;
    }

    /**
     * 공구출고를 취소한다.
     * @return
    */
    @RequestMapping(value = "/par/stm/toolMaster/cancelToolGi.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelToolGi(@Validated @RequestBody ToolGiListVO toolGiListVO)  throws Exception {

        int resultCnt           =  0;
        ToolGiVO toolGiVO       =  new ToolGiVO();
        toolGiVO                =  toolGiListVO.getToolGiVO();
        List<ToolGiItemVO> list =  toolGiListVO.getToolGiItemList();


        toolGiVO.setRegUsrId(LoginUtil.getUserId());
        toolGiVO.setDlrCd(LoginUtil.getDlrCd());
        toolGiVO.setRegDt(new Date());

        resultCnt = toolGiService.cancelToolGi(list, toolGiVO);


        return resultCnt;
    }

    /**
     * 공구를 폐기한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/createToolDisuse.do", method = RequestMethod.POST)
    @ResponseBody
    public ToolGiVO createToolDisuse(@Validated @RequestBody ToolGiListVO toolGiListVO)  throws Exception {

        ToolGiVO toolGiVO = new ToolGiVO();
        toolGiVO          = toolGiListVO.getToolGiVO();
       // List<ToolGiItemVO> list = toolGiListVO.getToolGiItemList();


        toolGiVO.setRegUsrId(LoginUtil.getUserId());
        toolGiVO.setDlrCd(LoginUtil.getDlrCd());
        toolGiVO.setRegDt(new Date());


        //toolGiVO = toolGiService.createToolDisuse(list, toolGiVO);

        toolGiVO.setResultYn(true);

        return toolGiVO;
    }

    /**
     * 공구폐기를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/multiToolDisuses.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiToolDisuses(@Validated @RequestBody ToolGiSaveVO saveVO)  throws Exception {

        ToolGiVO toolGiVO = new ToolGiVO();
        toolGiVO = saveVO.getToolGiVO();

        toolGiVO.setRegUsrId(LoginUtil.getUserId());
        toolGiVO.setDlrCd(LoginUtil.getDlrCd());

        toolGiService.multiToolGis(saveVO, toolGiVO);

        return true;
    }

    /**
     * 공구폐기를 취소한다.
     * @return
    */
    @RequestMapping(value = "/par/stm/toolMaster/cancelToolDisuse.do", method = RequestMethod.POST)
    @ResponseBody
    public ToolGiVO cancelToolDisuse(@Validated @RequestBody ToolGiListVO toolGiListVO)  throws Exception {

        ToolGiVO toolGiVO = new ToolGiVO();
        toolGiVO          = toolGiListVO.getToolGiVO();
        //List<ToolGiItemVO> list = toolGiListVO.getToolGiItemList();


        toolGiVO.setRegUsrId(LoginUtil.getUserId());
        toolGiVO.setDlrCd(LoginUtil.getDlrCd());
        toolGiVO.setRegDt(new Date());


        //toolGiVO = toolGiService.cancelToolDisuse(list, toolGiVO);

        toolGiVO.setResultYn(true);

        return toolGiVO;
    }

    /**
     * 공구출고  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/selectToolGiByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public ToolGiVO selectToolGiByKey(@RequestBody ToolGiSearchVO toolGiSearchVO) throws Exception
    {

        ToolGiVO toolGiVO = new ToolGiVO();
        toolGiSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        toolGiVO = toolGiService.selectToolGiByKey(toolGiSearchVO);


        return toolGiVO;
    }

    /**
     * 공구출고 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/selectToolGiItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectToolGiItemByKey(@RequestBody ToolGiSearchVO toolGiSearchVO) throws Exception
    {

        SearchResult result = new SearchResult();
        toolGiSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setData(toolGiService.selectToolGiItemByKey(toolGiSearchVO));

        return result;
    }

    /**
     * 공구출고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/selectToolGis.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectToolGis(@RequestBody ToolGiSearchVO toolGiSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        toolGiSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(toolGiService.selectToolGisByConditionCnt(toolGiSearchVO));

        if(result.getTotal() != 0){
            result.setData(toolGiService.selectToolGisByCondition(toolGiSearchVO));
        }

        return result;
    }

    /**
     * 공구부품 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/selectToolItemByConditions.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectToolItemByConditions(@RequestBody ToolGiSearchVO toolGiSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        toolGiSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(toolGiService.selectSearchToolItemByConditionCnt(toolGiSearchVO));

        if(result.getTotal() != 0){
            result.setData(toolGiService.selectSearchToolItemByCondition(toolGiSearchVO));
        }

        return result;
    }

    /**
     * 공구부품에 해당하는 공구 출고 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return
     */
    @RequestMapping(value = "/par/stm/toolMaster/selectToolGiItemListByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectToolGiItemListByKey(@RequestBody ToolGiSearchVO toolGiSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        toolGiSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(toolGiService.selectToolGiItemListByKeyCnt(toolGiSearchVO));

        if(result.getTotal() != 0){
            result.setData(toolGiService.selectToolGiItemListByKey(toolGiSearchVO));
        }

        return result;
    }
}
