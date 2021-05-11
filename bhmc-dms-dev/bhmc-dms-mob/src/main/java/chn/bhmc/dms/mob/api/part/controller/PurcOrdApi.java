package chn.bhmc.dms.mob.api.part.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartPurcOrdService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.service.PartSystemConfigInfoService;
import chn.bhmc.dms.mob.api.part.service.PartUnitInfoService;
import chn.bhmc.dms.mob.api.part.service.PartVenderMasterService;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoSearchVO;
import chn.bhmc.dms.mob.api.part.vo.UnitInfoVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.VenderMasterVO;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.mob.config.BaseJSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


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
@RequestMapping("/api/part/PurcOrd")
@Api("采购订单目录")
public class PurcOrdApi extends HController {

    /**
     * 구매오더 서비스
     */
    @Resource(name="PartPurcOrdService")
    PartPurcOrdService PartPurcOrdService;
  
    /**
     * 거래처 서비스
     */
    @Resource(name="PartVenderMasterService")
    PartVenderMasterService PartVenderMasterService;
    
    
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="PartUnitInfoService")
    PartUnitInfoService PartUnitInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="PartStorageService")
    PartStorageService PartStorageService;

    @Resource(name="PartSystemConfigInfoService")
    PartSystemConfigInfoService PartSystemConfigInfoService;


    /**
     * 오더현황조회 메인
     */
//    @RequestMapping(value = "/selectPurcOrdMain", method = RequestMethod.GET)
    @ApiOperation("采购订单目录(页面加载)")
    @RequestMapping(value = "/selectPurcOrdMain.do", method = RequestMethod.POST)
    @ResponseBody
    public BaseJSON selectPurcOrdMain(Model model,@RequestParam(value="pPurcOrdNo", defaultValue="") String pPurcOrdNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        VenderMasterSearchVO searchVO = new VenderMasterSearchVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        searchVO.setsBpDstinCd("Y");
        model.addAttribute("bpCdList", PartVenderMasterService.selectVenderMastersByCondition(searchVO));

        String dateFormat = PartSystemConfigInfoService.selectStrValueByKey("dateFormat");
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = PartVenderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);
        storageList = PartStorageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = PartUnitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

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

        model.addAttribute("trsfTpList",      PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcItemTpList",  PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",       PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("purcOrdTpList",   PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));

       // model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/cpm/purcOrd/baseJsp/selectPurcOrdMain.jsp");

        //return "/ZnewMob/templatesNewMob/mobTemplateE";
        BaseJSON json = new BaseJSON();
        json.setResult(model);
        return json;
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

//    /** 未调用，重复
//     * 오더현황조회 목록 [조회]
//     */
//    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdLists", method = RequestMethod.POST)
//    @ResponseBody
//    public SearchResult selectPurcOrds(@RequestBody PurcOrdSearchVO searchVO) throws Exception{
//        SearchResult result = new SearchResult();
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
//        result.setTotal(purcOrdService.selectPurcOrdsByConditionCnt(searchVO));
//        if(result.getTotal() != 0){
//            result.setData(purcOrdService.selectPurcOrdsByCondition(searchVO));
//        }
//        return result;
//    }

    /**
     * 구매오더 목록 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPurcOrds.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("采购订单目录(主)")
    public BaseJSON selectPurcOrds(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(PartPurcOrdService.selectPurcOrdsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(PartPurcOrdService.selectPurcOrdsByCondition(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);

        return json;
    }

    /**
     * 오더현황 상세 [조회]
     *//*
    @RequestMapping(value = "/mob/par/pcm/purcOrd/selectPurcOrdDetail", method = RequestMethod.POST)
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
        result.setData(PartPurcOrdService.selectPurcOrdItemByKey(purcOrdSearchVO));

        return result;
    }

    /**
     * 구매오더  데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPurcOrdByKey.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("采购订单目录(明细-订单状态)")
    public BaseJSON selectPurcOrdByKey(@RequestBody PurcOrdSearchVO purcOrdSearchVO) throws Exception
    {

        PurcOrdVO purcOrdVO = new PurcOrdVO();
        purcOrdSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        purcOrdVO = PartPurcOrdService.selectPurcOrdByKey(purcOrdSearchVO);

        BaseJSON json = new BaseJSON();
        json.setResult(purcOrdVO);
        return json;
    }

    /**
     * 구매현황 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 purcOrdSearchVO
     * @return@return
     */
    @RequestMapping(value = "/selectPurcOrdStatusListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    @ApiOperation("采购订单目录(明细-采购订单目录)")
    public BaseJSON selectPurcOrdStatusListByCondition(@RequestBody PurcOrdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(PartPurcOrdService.selectPurcOrdStatusByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(PartPurcOrdService.selectPurcOrdStatusByCondition(searchVO));
        }
        BaseJSON json = new BaseJSON();
        json.setResult(result);
        return json;
    }



}
