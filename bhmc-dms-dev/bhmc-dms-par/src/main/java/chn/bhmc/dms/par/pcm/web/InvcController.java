package chn.bhmc.dms.par.pcm.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

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
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.InvcService;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcListVO;
import chn.bhmc.dms.par.pcm.vo.InvcSaveVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 구매오더 관리 컨트롤러
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
public class InvcController extends HController {

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
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     * 송장등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcMain.do", method = RequestMethod.GET)
    public String selectInvcMain(Model model,@RequestParam(value="pInvcNo", defaultValue="") String pInvcNo) throws Exception  {
/*
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);*/

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> purcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        purcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

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
        model.addAttribute("pInvcNo",         pInvcNo);
        model.addAttribute("purcItemTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR206", null, langCd));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("vatCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());
  /*      model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);*/


        return "/par/pcm/invc/selectInvcMain";

    }

    /**
     * 송장정보를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/invc/insertInvc.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO createOrd(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();


        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());
        invcVO.setPltCd(LoginUtil.getPltCd());

        invcVO = invcService.createInvc(list, invcVO);

        invcVO.setResultYn(true);

        return invcVO;
    }


    /**
     * 로컬입고등록한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/createReceiveRgst.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO createReceiveRgst(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();

        invcVO = invcService.createReceiveRgst(invcVO, list);

        invcVO.setResultYn(true);
        return invcVO;
    }

    /**
     * 입고확정대기한다.(대용량용.)
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/updateAllReceiveRgst.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO updateAllReceiveRgst(@RequestParam(value="pInvcNo", defaultValue="") String pInvcNo
                                      ,@RequestParam(value="pStrgeCd", defaultValue="") String pStrgeCd
                                      ,@RequestParam(value="pInvcStatCd", defaultValue="") String pInvcStatCd
                                      ,@RequestParam(value="pUpdtDtStr", defaultValue="") String pUpdtDtStr)  throws Exception {

        InvcVO invcVO = new InvcVO();
        InvcSearchVO searchVO  = new InvcSearchVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsInvcDocNo(pInvcNo);
        searchVO.setsGrStrgeCd(pStrgeCd);
        searchVO.setsUpdtDtStr(pUpdtDtStr);

        invcVO = invcService.selectDmsInvcByKey(searchVO);
        invcVO.setUpdtDtStr(searchVO.getsUpdtDtStr());
        invcVO.setGrDocNo(pInvcNo);
        int listCnt = invcService.selectInvcItemByKeyForRgstCnt(searchVO);

        if(listCnt > 0){
            List<InvcItemVO> list = invcService.selectInvcItemByKeyForRgst(searchVO);
            if(pInvcStatCd.equals("02")){
                invcVO = invcService.updateReceiveRgst(invcVO, list);
            }else if(pInvcStatCd.equals("00")){
                InvcSaveVO saveVO = new InvcSaveVO();
                saveVO.setUpdateList(list);
                invcService.multiReceiveRgst(saveVO, invcVO);
            }



            invcVO.setResultYn(true);
        }else{
            invcVO.setResultYn(false);
        }
        return invcVO;
    }

    /**
     * 입고확정대기한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/updateReceiveRgst.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO updateReceiveRgst(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();

        invcVO = invcService.updateReceiveRgst(invcVO, list);

        invcVO.setResultYn(true);
        return invcVO;
    }

    /**
     * 입고확정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/insertReceiveCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO insertReceiveCnfm(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();

        invcVO = invcService.updateReceiveCnfm(invcVO, list);

        invcVO.setResultYn(true);
        return invcVO;
    }

    /**
     * 입고를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/multiReceiveRgst.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiReceiveRgst(@RequestBody InvcSaveVO saveVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = saveVO.getInvcVO();

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        invcService.multiReceiveRgst(saveVO, invcVO);

        return true;
    }


    /**
     * 기타입고를 수정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/multiReceiveEtcRgst.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiReceiveEtcRgst(@RequestBody InvcSaveVO saveVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = saveVO.getInvcVO();

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        invcService.multiReceiveEtcRgst(saveVO, invcVO);

        return true;
    }

    /**
     * 기타입고를 취소한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/invc/cancelReceiveEtcs.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelReceiveEtcs(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();

        //invcService.cancelReceiveEtc(list, invcVO);
        invcService.cancelReceiveRegEtc(list, invcVO);

        return true;
    }

    /**
     * 입고확정한다.(모바일용)
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/updateReceiveCnfmForMobile.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO updateReceiveCnfmForMobile(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();

        invcVO = invcService.updateReceiveCnfmForMobile(invcVO, list);

        invcVO.setResultYn(true);
        return invcVO;
    }

    /**
     * 송장관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcList.do", method = RequestMethod.GET)
    public String selectInvcList(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

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
        model.addAttribute("invcUnit",        invcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("vatCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);


        return "/par/pcm/invc/selectInvcList";

    }

    /**
     * 송장확정을 위한 송장 정보 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvcItems(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(invcService.selectInvcsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectInvcsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 송장 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvcItemByKey(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();


        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(invcService.selectInvcItemByKey(searchVO));

        return result;

    }

    /**
     * 송장 부품 정보를 조회한다.(구매번호에 의한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcItemByPurcKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectInvcItemByPurcKey(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();


        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(invcService.selectInvcItemByPurcKey(searchVO));

        return result;

    }

    /**
     * 입고확정  SUMMARY 정보를 조회한다.(송장번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectReceiveCnfmItemSummaryByInvcKey.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO selectReceiveCnfmItemSummaryByInvcKey(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        InvcVO result = new InvcVO();


        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result = invcService.selectReceiveCnfmItemSummaryByInvcKey(searchVO);

        return result;

    }

    /**
     * 입고확정  정보를 조회한다.(송장번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectReceiveCnfmItemByInvcKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveCnfmItemByInvcKey(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();


        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(invcService.selectReceiveCnfmItemByInvcKey(searchVO));

        return result;

    }

    /**
     * 입고확정  SUMMARY 정보를 조회한다.(기타번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectReceiveCnfmItemSummaryByEtcGrKey.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO selectReceiveCnfmItemSummaryByEtcGrKey(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        InvcVO result = new InvcVO();


        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result = invcService.selectReceiveCnfmItemSummaryByEtcGrKey(searchVO);

        return result;

    }

    /**
     * 입고확정  정보를 조회한다.(기타번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectReceiveCnfmItemByEtcGrKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveCnfmItemByEtcGrKey(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();


        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(invcService.selectReceiveCnfmItemByEtcGrKey(searchVO));

        return result;

    }

    /**
     * 송장문서를 확정한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/updateInvcCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateInvcCnfm(@Validated @RequestBody InvcVO invcVO)  throws Exception {

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        int result = invcService.updateInvcCnfm(invcVO);

        return result;
    }

    /**
     * 송장확정문서를 취소한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/cancelInvcCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public int cancelInvcCnfm(@Validated @RequestBody InvcVO invcVO)  throws Exception {

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        int result = invcService.cancelInvcCnfm(invcVO);

        return result;
    }

    /**
     * 송장문서를 삭제한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/deleteInvcDoc.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteInvcDoc(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {

        InvcVO invcVO = new InvcVO();
        invcVO = invcListVO.getInvcVO();
        List<InvcItemVO> list = invcListVO.getInvcItemList();
        int resultCnt = 0;

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        resultCnt = invcService.deleteInvcDoc(invcVO, list);

        return resultCnt;
    }

    /**
     * 입고확정 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveCnfmMain.do", method = RequestMethod.GET)
    public String selectReceiveCnfmMain(Model model,@RequestParam(value="pMobisInvcNo", defaultValue="") String pMobisInvcNo
            ,@RequestParam(value="pBpCd", defaultValue="") String pBpCd,@RequestParam(value="pBpNm", defaultValue="") String pBpNm
            ,@RequestParam(value="pArrvYy", defaultValue="") String pArrvYy,@RequestParam(value="pArrvMm", defaultValue="") String pArrvMm
            ,@RequestParam(value="pArrvDd", defaultValue="") String pArrvDd,@RequestParam(value="pItemDistinCd", defaultValue="") String pItemDistinCd
            ,@RequestParam(value="pInvcDocNo", defaultValue="") String pInvcDocNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
        VatInfoVO vatInfoVO = new VatInfoVO();
        int vatInfoCnt = 0;

        vatInfoSearchVO.setsVatId("V01");
        vatInfoSearchVO.setsVatTypeCd("ALL");

        vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

        if(vatInfoCnt == 1){
            vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
        }else{
            vatInfoVO.setVatApplyRate(0.16);
        }

        //차종 , 중고차-자사-차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        //carInfoSearchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

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
        model.addAttribute("invcUnitList",    invcUnitList);
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("storageList",     storageList);
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("clTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR222", null, langCd));  //클레임 사유
        model.addAttribute("clTargetTpList",  commonCodeService.selectCommonCodesByCmmGrpCd("PAR221", null, langCd));  //클레임대상

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        model.addAttribute("abcIndList", commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO));

        model.addAttribute("grTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR216", null, langCd)); //송장으로인한 입고인지 로컬입고인지 구분위한 콤보

        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");//구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);
        model.addAttribute("pMobisInvcNo",    pMobisInvcNo);
        model.addAttribute("pItemDistinCd",   pItemDistinCd);
        model.addAttribute("pBpCd",           pBpCd);
        model.addAttribute("pBpNm",           pBpNm);
        model.addAttribute("pArrvYy",         pArrvYy);
        model.addAttribute("pArrvMm",         pArrvMm);
        model.addAttribute("pArrvDd",         pArrvDd);
        model.addAttribute("pInvcDocNo",      pInvcDocNo);
        model.addAttribute("vatCd",           vatInfoVO.getVatApplyRate());


        return "/par/pcm/receive/selectReceiveCnfmMain";

    }

    /**
     * 입고확정대상 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectReceiveItemByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveItemByCondition(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(invcService.selectReceiveItemByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectReceiveItemByCondition(searchVO));
        }

        return result;

    }

    /**
     * 입고확정대상 정보를 조회한다.(모바일용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectReceiveInvoiceByMobile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveInvoiceByMobile(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(invcService.selectReceiveByMobileCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectReceiveByMobile(searchVO));
        }

        return result;

    }

    /**
     * 입고확정대상 부품 정보를 조회한다.(모바일 바코드)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectReceiveItemByInvcItemBarcode.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcItemVO selectReceiveItemByInvcItemBarcode(@RequestBody InvcSearchVO searchVO)  throws Exception  {

        InvcItemVO invcItemVO = new InvcItemVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        invcItemVO = invcService.selectReceiveItemByInvcItemBarcode(searchVO);

        return invcItemVO;

    }

    /**
     * 부품별 입고현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/par/pcm/receive/selectReceiveCnfmList.do", method = RequestMethod.GET)
    public String selectReceiveCnfmList(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        //공급업체
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        //입고창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("storageList",     storageList);
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, LocaleContextHolder.getLocale().getLanguage()));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/par/pcm/receive/selectReceiveCnfmList";
    }

    /**
     * 부품입고집계 정보를 조회한다.
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceivesByConditionForPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceivesByConditionForPopup(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(invcService.selectReceivesByConditionForPopupCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectReceivesByConditionForPopup(searchVO));
        }

        return result;
    }

    /**
     * 부품입고집계 정보를 조회한다.
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceivesByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceivesByCondition(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(invcService.selectReceivesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectReceivesByCondition(searchVO));
        }

        return result;
    }

    /**
     * key에 의한 송장 정보를 조회한다.
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectInvcByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO selectInvcByKey(@RequestBody InvcVO searchVO) throws Exception
    {
        searchVO.setDlrCd(LoginUtil.getDlrCd());
        return invcService.selectInvcByKey(searchVO);
    }

    /**
     * 부품별 입고현황 화면을 조회한다.
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveCnfmListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveCnfmListByCondition(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(invcService.selectReceiveCnfmListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectReceiveCnfmListByCondition(searchVO));
        }

        return result;
    }

    /**
     * 부품별 입고내역 정보를 조회한다.
     * @param searchVO - 조회조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveHistoryByItemCd.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveHistoryByItemCd(@RequestBody InvcSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(invcService.selectReceiveHistoryByItemCdCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(invcService.selectReceiveHistoryByItemCd(searchVO));
        }

        return result;
    }

    /**
     * 입고현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/par/pcm/receive/selectReceiveCnfmDetailList.do", method = RequestMethod.GET)
    public String selectReceiveCnfmDetailList(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        //공급업체
        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        //입고창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 창고 하위 2단계 로케이션 코드정보 조회.
        BinLocationMasterSearchVO locationSearchVO = new BinLocationMasterSearchVO();
        locationSearchVO.setsPltCd(LoginUtil.getPltCd());
        locationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        locationSearchVO.setsMainLocYn("N");
        locationSearchVO.setsLvlId(2);

        if(venderMasterVO != null){
            model.addAttribute("bpCd",            venderMasterVO.getBpCd());
            model.addAttribute("bpNm",            venderMasterVO.getBpNm());
            model.addAttribute("bpTp",            venderMasterVO.getBpTp());
        }else{
            model.addAttribute("bpCd",            "A10AA001");
            model.addAttribute("bpNm",            "BMP");
            model.addAttribute("bpTp",            "01");
        }

        model.addAttribute("giTwoLocCdList", binLocationMasterService.selectBinLocationMastersByCondition(locationSearchVO));

        model.addAttribute("dlrCd",           LoginUtil.getDlrCd());
        model.addAttribute("storageList",     storageList);
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        // 거래처유형 공통코드정보 조회.
        model.addAttribute("bpTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/par/pcm/receive/selectReceiveCnfmDetailList";
    }

    /**
     * 송장조회 메인 화면을 출력한다.(구매번호에 의한)
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcStatusByPurc.do", method = RequestMethod.GET)
    public String selectInvcStatusByPurc(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

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
        model.addAttribute("invcUnit",        invcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("vatCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("bpTpList",        commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd));
        model.addAttribute("purcOrdStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/par/pcm/invc/selectInvcStatusByPurc";
    }

    /**
     * 송장조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pcm/invc/selectInvcStatus.do", method = RequestMethod.GET)
    public String selectInvcStatus(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String sevenDtBf   = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat);

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> invcUnitList      = new ArrayList<UnitInfoVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        unitInfoSearchVO.setsUseYn("Y");
        invcUnitList = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

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
        model.addAttribute("invcUnit",        invcUnitList);
        model.addAttribute("storageList",     storageList);
        model.addAttribute("prcTpList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd));
        model.addAttribute("invcTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd));
        model.addAttribute("invcStatList",    commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("vatCdList",       commonCodeService.selectCommonCodesByCmmGrpCd("PAR215", null, langCd));
        model.addAttribute("trsfTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd));
        model.addAttribute("purcOrdTpList",   commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd));
        model.addAttribute("dlPdcCdList",     commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("sevenDtBf",       sevenDtBf);

        return "/par/pcm/invc/selectInvcStatus";

    }

    @RequestMapping(value = "/par/pcm/invc/insertInvcReceiveEtcExcelUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertInvcReceiveEtcExcelUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            @RequestParam("bpTp") String bpTp,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<InvcItemVO> list = new ArrayList<InvcItemVO>();
        List<InvcItemVO> resultList = new ArrayList<InvcItemVO>();
        InvcItemVO       chkInvcItem = new InvcItemVO();
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        ExcelUploadStatus status = new ExcelUploadStatus();
        int totErrCnt = 0;
        String msg;

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        int chkStrgeCd = 0;

        VenderMasterVO venderMasterVO = new VenderMasterVO();
        venderMasterVO = venderMasterService.selectBHMCVenderMaster(LoginUtil.getDlrCd());

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<InvcItemVO> excelReader = new ExcelReader<InvcItemVO>(InvcItemVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);


                status.setStep(ExcelUploadStatus.COMPLETED);

                for(int i = 0, listLen = list.size(); i < listLen ; i = i + 1){

                    chkInvcItem = new InvcItemVO();
                    errors         = new ArrayList<ExcelUploadError>();

                   if( list.get(i).getErrorCount() > 0){
                       totErrCnt = totErrCnt + 1;
                       if(StringUtils.isNoneBlank(list.get(i).getExcelPrc()) && list.get(i).getExcelPrc().equals("-999")){
                           list.get(i).setExcelPrc("");
                       }
                       if(StringUtils.isNoneBlank(list.get(i).getExcelTaxDdctPrc()) && list.get(i).getExcelTaxDdctPrc().equals("-999")){
                           list.get(i).setExcelTaxDdctPrc("");
                       }
                       resultList.add(list.get(i));
                   }else{

                       //입력된 창고가 있는 경우 검증
                       if(StringUtils.isNoneBlank(list.get(i).getExcelStrgeCd())){
                           storageSearchVO    = new StorageSearchVO();

                           storageSearchVO.setsPltCd(LoginUtil.getPltCd());
                           storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                           storageSearchVO.setsStrgeCd(list.get(i).getExcelStrgeCd());

                           chkStrgeCd = storageService.selectStoragesByConditionCnt(storageSearchVO);

                           //창고마스터에 없는 창고인경우
                           if(chkStrgeCd  == 0){
                               list.get(i).setErrorCount(1);

                               msg = messageSource.getMessage(
                                       "global.info.emptyParamInfo"
                                       , new String[]{
                                               messageSource.getMessage("cmm.title.strgeInfo", null, LocaleContextHolder.getLocale())
                                       }
                                       , LocaleContextHolder.getLocale()
                                   );

                                   errors.add(new ExcelUploadError(i, 0, list.get(i).getExcelStrgeCd(), msg));

                               list.get(i).setErrors(errors);

                               if(list.get(i).getExcelPrc().equals("-999")){
                                   list.get(i).setExcelPrc("");
                               }
                               if(list.get(i).getExcelTaxDdctPrc().equals("-999")){
                                   list.get(i).setExcelTaxDdctPrc("");
                               }

                               totErrCnt = totErrCnt + 1;
                               resultList.add(list.get(i));

                               continue;
                           }
                       }

                       list.get(i).setDlrCd(LoginUtil.getDlrCd());
                       list.get(i).setBpCd(venderMasterVO.getBpCd());

                       chkInvcItem =   invcService.selectInvcReceiveEtcItemExcelUploadByKey(list.get(i));

                       if(list.get(i).getExcelPrc().equals("-999")){
                           list.get(i).setExcelPrc("");
                       }
                       if(list.get(i).getExcelTaxDdctPrc().equals("-999")){
                           list.get(i).setExcelTaxDdctPrc("");
                       }

                       //부품마스터에 없는 부품인경우
                       if(chkInvcItem  == null){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage(
                                   "global.info.emptyParamInfo"
                                   , new String[]{
                                           messageSource.getMessage("ser.title.itemInfo", null, LocaleContextHolder.getLocale())
                                   }
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                           continue;
                       }

                       //공급처가  없는 부품인경우
                       //if(chkInvcItem.getBpCd() == null){
                       /*if(bpTp.equals("01") && !chkInvcItem.getSpyrCd().equals("01")){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage(
                                   "sal.info.notEqualSupplyBp"
                                   //"global.err.chkBpCdIsBMP"
                                   , new String[]{}
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                           continue;
                       }*/

                       /*if(!bpTp.equals("01") && chkInvcItem.getSpyrCd().equals("01")){
                           list.get(i).setErrorCount(1);

                           msg = messageSource.getMessage(
                                   "sal.info.notEqualSupplyBp"
                                   , new String[]{}
                                   , LocaleContextHolder.getLocale()
                               );

                               errors.add(new ExcelUploadError(i, 0, list.get(i).getItemCd(), msg));

                           list.get(i).setErrors(errors);

                           totErrCnt = totErrCnt + 1;
                           resultList.add(list.get(i));

                           continue;
                       }*/

                       list.get(i).setGrStrgeCd(chkInvcItem.getGrStrgeCd());
                       list.get(i).setItemNm(chkInvcItem.getItemNm());
                       list.get(i).setInvcUnitCd(chkInvcItem.getInvcUnitCd());
                       list.get(i).setInvcQty(chkInvcItem.getInvcQty());
                       list.get(i).setGrQty(chkInvcItem.getGrQty());
                       list.get(i).setInvcTargetQty(chkInvcItem.getInvcTargetQty());
                       list.get(i).setPurcQty(chkInvcItem.getPurcQty());
                       list.get(i).setInvcPrc(chkInvcItem.getInvcPrc());
                       list.get(i).setTaxDdctPrc(chkInvcItem.getTaxDdctPrc());
                       list.get(i).setInvcAmt(chkInvcItem.getInvcAmt());
                       list.get(i).setInvcTotAmt(chkInvcItem.getInvcTotAmt());
                       list.get(i).setTaxAmt(chkInvcItem.getTaxAmt());
                       list.get(i).setDcRate(chkInvcItem.getDcRate());
                       list.get(i).setCompareQty(chkInvcItem.getCompareQty());
                       list.get(i).setExcelQty(chkInvcItem.getExcelQty());
                       list.get(i).setExcelPrc(chkInvcItem.getExcelPrc());
                       list.get(i).setExcelTaxDdctPrc(chkInvcItem.getExcelTaxDdctPrc());

                      // resultList.add(chkReceiveEtcItem);
                      resultList.add(list.get(i));
                   }
                }

                //엑셀 업로드 시 에러 라인이 존재할 경우
                //if(totErrCnt > 0){
                    result.setTotal(resultList.size());
                    result.setData(resultList);

                //엑셀 업로드 시 에러 라인이 없는 경우
                //}else{
                //    result.setTotal(-999);
                //    result.setData(resultList);
                //}
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return result;

    }


}



