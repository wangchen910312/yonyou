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
import org.springframework.validation.annotation.Validated;
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
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.par.pcm.service.InvcService;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcListVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.VenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobInvcController.java
 * @Description : 모바일입고 Controller
 * @author JongHee Lim
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobReceiveController extends HController {

    /**
     * 송장 서비스
     */
    @Resource(name="invcService")
    InvcService invcService;

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 로케이션 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;



    /**
     * 모바일입고 메인
     * @return
     */
    @RequestMapping(value = "/mob/par/pcm/receive/selectReceiveCnfmMain.do", method = RequestMethod.GET)
    public String selectReceiveCnfmMain(Model model) throws Exception  {

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
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           mobLoginVO.getDlrCd());
        model.addAttribute("regUsrId",        mobLoginVO.getUserId());
        model.addAttribute("pltCd",           mobLoginVO.getPltCd());

        model.addAttribute("invcUnitList",    invcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("bpCd",            venderMasterVO.getBpCd());
        model.addAttribute("bpNm",            venderMasterVO.getBpNm());
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("clTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR222", null, langCd));  //클레임 사유
        model.addAttribute("clTargetTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR221", null, langCd));  //클레임대상
        model.addAttribute("abcIndList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/par/pcm/receive/baseJsp/selectReceiveCnfmMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateB";
    }

    /**
     * 모바일입고 메인
     * @return
     */
    @RequestMapping(value = "/mob/par/pcm/receive/__selectReceiveCnfmMain.do", method = RequestMethod.GET)
    public String __selectReceiveCnfmMain(Model model) throws Exception  {

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
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(mobLoginVO.getPltCd());
        storageSearchVO.setsDlrCd(mobLoginVO.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(mobLoginVO.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",           mobLoginVO.getDlrCd());
        model.addAttribute("regUsrId",        mobLoginVO.getUserId());
        model.addAttribute("pltCd",           mobLoginVO.getPltCd());

        model.addAttribute("invcUnitList",    invcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("bpCd",            venderMasterVO.getBpCd());
        model.addAttribute("bpNm",            venderMasterVO.getBpNm());
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("clTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR222", null, langCd));  //클레임 사유
        model.addAttribute("clTargetTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR221", null, langCd));  //클레임대상
        model.addAttribute("abcIndList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR108", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/mob/par/pcm/receive/selectReceiveCnfmMain";
    }


    /**
     * 모바일입고 목록
     */
    @RequestMapping(value = "/mob/par/pcm/receive/selectReceiveCnfmList.do", method = RequestMethod.GET)
    public String selectReceiveCnfmList(Model model) throws Exception  {
        return "/mob/par/pcm/receive/selectReceiveCnfmList";
    }


    /**
     * 모바일입고 목록 [조회]
     */
    @RequestMapping(value = "/mob/par/pcm/receive/selectReceiveCnfmLists.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveInvoiceByMobile(@RequestBody InvcSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());
        searchVO.setsBpCd(venderMasterVO.getBpCd());
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setTotal(invcService.selectReceiveByMobileCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(invcService.selectReceiveByMobile(searchVO));
        }
        return result;
    }


    /**
     * 모바일입고 부품 목록
     */
    @RequestMapping(value = "/mob/par/pcm/receive/selectReceiveCnfmItemList.do", method = RequestMethod.GET)
    public String selectReceiveCnfmItemList(Model model) throws Exception  {
        return "/mob/par/pcm/receive/selectReceiveCnfmItemList";
    }


    /**
     * 모바일입고 부품 목록 [조회]
     */
//    @RequestMapping(value = "/mob/par/pcm/receive/selectReceiveCnfmItemLists.do", method = RequestMethod.POST)
//    @ResponseBody
//    public SearchResult selectReceiveItemByCondition(@RequestBody InvcSearchVO searchVO)  throws Exception  {
//        SearchResult result = new SearchResult();
//        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
//        VenderMasterVO venderMasterVO = new VenderMasterVO();
//        venderMasterVO = venderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());
//        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
//        searchVO.setsBpCd(venderMasterVO.getBpCd());
//        result.setTotal(invcService.selectReceiveItemByConditionCnt(searchVO));
//        if(result.getTotal() != 0){
//            result.setData(invcService.selectReceiveItemByCondition(searchVO));
//        }
//        return result;
//    }

    @RequestMapping(value = "/mob/par/pcm/invc/selectReceiveItemByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveItemByCondition(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());

        result.setTotal(invcService.selectReceiveItemByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectReceiveItemByCondition(searchVO));
        }

        return result;

    }


    /**
     * 모바일입고 부품 상세 [조회]
     */
    //@RequestMapping(value = "/mob/par/pcm/invc/selectReceiveItemByInvcItemBarcode.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/pcm/reveice/selectReceiveCnfmItemDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcItemVO selectReceiveItemByInvcItemBarcode(@RequestBody InvcSearchVO searchVO)  throws Exception  {
        InvcItemVO invcItemVO = new InvcItemVO();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(mobLoginVO.getDlrCd());
        searchVO.setsBpCd(venderMasterVO.getBpCd());
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        invcItemVO = invcService.selectReceiveItemByInvcItemBarcode(searchVO);
        return invcItemVO;
    }


    /**
     * 모바일입고 입고확정 [수정]
     */
    //@RequestMapping(value = "/mob/par/pcm/receive/insertReceiveCnfm.do", method = RequestMethod.POST)
    @RequestMapping(value = "/mob/par/pcm/invc/selectInvcItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvcItems(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd(mobLoginVO.getDlrCd());
        result.setTotal(invcService.selectInvcsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectInvcsByCondition(searchVO));
        }

        return result;
    }



    /**
     * 입고확정한다.
     * @return
     */
    @RequestMapping(value = "/mob/par/pcm/receive/insertReceiveCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO insertReceiveCnfm(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();

        invcVO = invcService.updateReceiveCnfm(invcVO, list);

        invcVO.setResultYn(true);
        return invcVO;
    }




}
