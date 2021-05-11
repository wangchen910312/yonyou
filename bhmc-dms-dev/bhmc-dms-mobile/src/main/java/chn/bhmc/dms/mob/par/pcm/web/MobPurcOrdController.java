package chn.bhmc.dms.mob.par.pcm.web;

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
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobPurcOrdController.java
 * @Description : 오더현황조회 Controller
 * @author JongHee Lim
 * @since 2016. 4. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 7.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobPurcOrdController extends HController {

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
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 오더현황조회 메인
     */
    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdMain.do", method = RequestMethod.GET)
    public String selectPurcOrdMain(Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        VenderMasterSearchVO searchVO = new VenderMasterSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsBpDstinCd("Y");
        model.addAttribute("bpCdList", venderMasterService.selectVenderMastersByCondition(searchVO));

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           mobLoginVO.getDlrCd());
        model.addAttribute("regUsrId",        mobLoginVO.getUserId());
        model.addAttribute("pltCd",           mobLoginVO.getPltCd());

        model.addAttribute("purcUnit",        purcUnitList);
        model.addAttribute("storageList",     storageList);
        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }
        model.addAttribute("pPurcOrdNo",      pPurcOrdNo);
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/cpm/purcOrd/baseJsp/selectPurcOrdMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateE";
    }

    /**
     * 오더현황조회 목록
     */
    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdList.do", method = RequestMethod.GET)
    public String selectPurcOrdList(Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo) throws Exception  {
        return "/mob/par/pcm/purcOrd/selectPurcOrdList";
    }
    /**
     * 구매오더정보 목록
     */
    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdStatusList.do", method = RequestMethod.GET)
    public String selectPurcOrdStatusList(Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo) throws Exception  {
        return "/mob/par/pcm/purcOrd/selectPurcOrdStatusList";
    }

    /**
     * 오더현황조회 목록 [조회]
     */
    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrds(@RequestBody PurcOrdSearchVO searchVO) throws Exception{
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setTotal(purcOrdService.selectPurcOrdsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(purcOrdService.selectPurcOrdsByCondition(searchVO));
        }
        return result;
    }


    /**
     * 오더현황 상세 [조회]
     *//*
    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdItemByKey(@RequestBody PurcOrdSearchVO purcOrdSearchVO) throws Exception{
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        purcOrdSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setData(purcOrdService.selectPurcOrdItemByKey(purcOrdSearchVO));
        return result;
    }*/

    /**
     * 구매오더 부품 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcOrdItemByKey(@RequestBody PurcOrdSearchVO purcOrdSearchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        purcOrdSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setData(purcOrdService.selectPurcOrdItemByKey(purcOrdSearchVO));

        return result;
    }

}
