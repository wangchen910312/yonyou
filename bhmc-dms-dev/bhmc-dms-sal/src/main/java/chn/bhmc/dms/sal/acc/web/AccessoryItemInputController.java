package chn.bhmc.dms.sal.acc.web;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.vo.InvcListVO;
import chn.bhmc.dms.par.pcm.vo.InvcSaveVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.sal.acc.service.AccessoryItemInputService;
import chn.bhmc.dms.sal.acc.service.AccessoryItemMasterService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemInputSearchVO;

/**
 * 용품입고 관리
 *
 * @author Kang Seok Han
 * @since 2017. 02. 02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 2. 02.     Kang Seok Han      최초 생성
 * </pre>
 */
@Controller
public class AccessoryItemInputController extends HController {

    /**
     * 용품입고 관리 서비스
     */
    @Resource(name="accessoryItemInputService")
    AccessoryItemInputService accessoryItemInputService;

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

    /**
     * 용품마스터 서비스-세율
     */
    @Resource(name="accessoryItemMasterService")
    AccessoryItemMasterService accessoryItemMasterService;

    /**
     * 용품입고 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/sal/acc/itemInput/selectAccessoryItemInputMain.do", method=RequestMethod.GET)
    public String selectAccessoryItemInputMain(Model model) throws Exception{

        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01"); //구매처
        commonCodeSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //딜러코드(리포트)
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        //재고단위
        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("stockUnitCdList", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //세율
        model.addAttribute("vatCd", accessoryItemMasterService.selectVATSearch(DateUtil.getDate("yyyyMMdd"), "ALL"));

        return "/sal/acc/itemInput/selectAccessoryItemInputMain";
    }

    /**
     * 용품입고 품목조회 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/sal/acc/itemInput/selectAccessoryItemInputSearchPopup.do", method=RequestMethod.GET)
    public String selectAccessoryItemInputSearchPopup(Model model) throws Exception{
        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        //용품유형
        model.addAttribute("etcCd1List", commonCodeService.selectCommonCodesByCmmGrpCd("SAL195", null, LocaleContextHolder.getLocale().getLanguage()));

        //재고단위
        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("stockUnitCdList", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //브랜드
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/acc/itemInput/selectAccessoryItemInputSearchPopup";
    }

    /**
     * 용품입고 엑셀업로드
     */
    @RequestMapping(value = "/sal/acc/itemInput/selectAccessoryItemInputUploadPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemInputUploadPopup(Model model, HttpServletRequest request) throws Exception {

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/sal/acc/itemInput/selectAccessoryItemInputUploadPopup";
    }




    /**
     * 입고문서를 등록한다
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemInput/insertAccessoryItemInput.do", method=RequestMethod.POST)
    @ResponseBody
    public InvcVO insertAccessoryItemInput(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {
        InvcVO invcVO = accessoryItemInputService.createReceiveRgst(invcListVO.getInvcVO(), invcListVO.getInvcItemList());
        invcVO.setResultYn(true);

        return invcVO;
    }

    /**
     * 입고문서를 수정한다
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemInput/updateAccessoryItemInput.do", method=RequestMethod.POST)
    @ResponseBody
    public InvcVO updateAccessoryItemInput(@RequestBody InvcSaveVO saveVO)  throws Exception {
        InvcVO invcVO = saveVO.getInvcVO();
        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());
        invcVO.setResultYn(true);

        accessoryItemInputService.multiReceiveEtcRgst(saveVO, invcVO);

        return invcVO;
    }

    /**
     * 입고문서 조회 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sal/acc/itemInput/selectAccessoryItemInputDocSearchPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemInputDocSearchPopup(Model model) throws Exception {
        //송장상태
        model.addAttribute("invcStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR213", null, LocaleContextHolder.getLocale().getLanguage()));

        //거래처유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01");
        commonCodeSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        Calendar calendar = Calendar.getInstance();

        //입고문서 조회종료일
        model.addAttribute("sInvcGrDtTo", calendar.getTime());

        calendar.add(Calendar.DATE, -30);
        //입고문서 조회시작일
        model.addAttribute("sInvcGrDtFr", calendar.getTime());

        return "/sal/acc/itemInput/selectAccessoryItemInputDocSearchPopup";
    }

    /**
     * 입고문서 목록을 조회한다.
     * @param searchVO - 조회조건을 포함하는 AccessoryItemInputSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemInput/selectAccessoryItemInputDocs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemInputDocs(@RequestBody AccessoryItemInputSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(accessoryItemInputService.selectAccessoryItemInputDocsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(accessoryItemInputService.selectAccessoryItemInputDocsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 입고문서 품목 목록을 조회한다.
     * @param searchVO - 조회조건을 포함하는 AccessoryItemInputSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemInput/selectAccessoryItemInputItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemInputItems(@RequestBody AccessoryItemInputSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(accessoryItemInputService.selectAccessoryItemInputItemsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(accessoryItemInputService.selectAccessoryItemInputItemsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 입고문서 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemInput/selectAccessoryItemInputDoc", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> selectAccessoryItemInputDoc(@RequestBody InvcSearchVO searchVO)  throws Exception  {
        Map<String, Object> result = new HashMap<String, Object>();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        //입고문서
        result.put("invcDoc", accessoryItemInputService.selectReceiveCnfmItemSummaryByEtcGrKey(searchVO));

        //입고문서 품목정보
        result.put("invcDocItems", accessoryItemInputService.selectReceiveCnfmItemByEtcGrKey(searchVO));

        return result;

    }

    /**
     * 입고문서를 확정한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemInput/updateAccessoryItemInputToConfirm.do", method = RequestMethod.POST)
    @ResponseBody
    public InvcVO insertReceiveCnfm(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {
        InvcVO invcVO = accessoryItemInputService.updateReceiveCnfm(invcListVO.getInvcVO(), invcListVO.getInvcItemList());
        invcVO.setResultYn(true);

        return invcVO;
    }

    /**
     * 입고문서를 취소한다.
     * @return
    */
    @RequestMapping(value = "/sal/acc/itemInput/updateAccessoryItemInputToCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean cancelReceiveEtcs(@Validated @RequestBody InvcListVO invcListVO)  throws Exception {
        //accessoryItemInputService.cancelReceiveEtc(invcListVO.getInvcItemList(), invcListVO.getInvcVO());
        accessoryItemInputService.cancelReceiveRegEtc(invcListVO.getInvcItemList(), invcListVO.getInvcVO());
        return true;
    }


    /**
     * 입고현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/sal/acc/itemInput/selectAccessoryItemInputList.do", method = RequestMethod.GET)
    public String selectAccessoryItemInputList(Model model) throws Exception {

        Calendar calendar = Calendar.getInstance();

        //입고문서 조회종료일
        model.addAttribute("sInvcGrDtTo", calendar.getTime());

        calendar.add(Calendar.DATE, -30);
        //입고문서 조회시작일
        model.addAttribute("sInvcGrDtFr", calendar.getTime());

        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01"); //구매처
        commonCodeSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        return "/sal/acc/itemInput/selectAccessoryItemInputList";
    }
}