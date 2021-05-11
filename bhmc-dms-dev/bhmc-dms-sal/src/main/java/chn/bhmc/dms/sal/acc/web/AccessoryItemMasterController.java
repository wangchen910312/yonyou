package chn.bhmc.dms.sal.acc.web;

import javax.annotation.Resource;

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

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.sal.acc.service.AccessoryItemMasterService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterVO;

/**
 * 용품마스터 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2017. 1. 26.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.15         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class AccessoryItemMasterController extends HController {

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="accessoryItemMasterService")
    AccessoryItemMasterService accessoryItemMasterService;

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
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 용품마스터 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemMaster/selectAccessoryItemMasterMain.do", method = RequestMethod.GET)
    public String selectAccessoryItemMasterMain(Model model) throws Exception  {
        //용품유형
        model.addAttribute("etcCd1List", commonCodeService.selectCommonCodesByCmmGrpCd("SAL195", null, LocaleContextHolder.getLocale().getLanguage()));

        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01"); //구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        return "/sal/acc/itemMaster/selectAccessoryItemMasterMain";
    }

    /**
     * 용품마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemMaster/selectAccessoryItemMasters.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemMasters(@RequestBody AccessoryItemMasterSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());
        searchVO.setsItemDstinCd("20"); //용품구분(판매용품)
        result.setTotal(accessoryItemMasterService.selectAccessoryItemMastersByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(accessoryItemMasterService.selectAccessoryItemMastersByCondition(searchVO));
        }

        return result;
    }

    /**
     * 용품마스터 상세정보 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemMaster/selectAccessoryItemMasterDetailPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemMasterDetailPopup(@RequestParam(name="itemCd", required=false) String itemCd, Model model) throws Exception  {

        AccessoryItemMasterVO accessoryItemMasterVO = null;

        //신규인 경우
        if(StringUtils.isNotBlank(itemCd)){
            accessoryItemMasterVO = accessoryItemMasterService.selectAccessoryItemMasterByKey(LoginUtil.getDlrCd(), itemCd);

            if(StringUtils.isBlank(accessoryItemMasterVO.getEtc3())){
                accessoryItemMasterVO.setEtc3("0");         //블루멤버쉽포인트
            }
            if(StringUtils.isBlank(accessoryItemMasterVO.getEtc4())){
                accessoryItemMasterVO.setEtc4("0");         //딜러포인트
            }
        }else{
            accessoryItemMasterVO = new AccessoryItemMasterVO();
            accessoryItemMasterVO.setSpyrCd("02");          //공급상코드-기타
            accessoryItemMasterVO.setEtcCd2("N");           //포인트상품
            accessoryItemMasterVO.setEndYn("N");            //사용중지
            accessoryItemMasterVO.setEtc2("0");             //설치비
            accessoryItemMasterVO.setGrStrgeCd("");         //창고코드
            accessoryItemMasterVO.setPrndYn("N");           //단종여부
            accessoryItemMasterVO.setDgrItemYn("N");        //위험품여부
            accessoryItemMasterVO.setBrandCd("OT");         //브랜드-기타
            accessoryItemMasterVO.setStockUnitCd("EA");     //단위-EA
            accessoryItemMasterVO.setEtc3("0");             //블루멤버쉽포인트
            accessoryItemMasterVO.setEtc4("0");             //딜러포인트
        }

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        //용품마스터 정보
        model.addAttribute("accessoryItemMaster", accessoryItemMasterVO);

        //용품유형
        model.addAttribute("etcCd1List", commonCodeService.selectCommonCodesByCmmGrpCd("SAL195", null, LocaleContextHolder.getLocale().getLanguage()));

        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01"); //구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //재고단위
        UnitInfoSearchVO unitInfoSearchVO = new UnitInfoSearchVO();
        unitInfoSearchVO.setsUseYn("Y");
        model.addAttribute("stockUnitCdList", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //브랜드
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/acc/itemMaster/selectAccessoryItemMasterDetailPopup";
    }

    /**
     * 용품마스터 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemMaster/insertAccessoryItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertAccessoryItemMaster(@Validated @RequestBody AccessoryItemMasterVO accessoryItemMasterVO)  throws Exception {
        accessoryItemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        accessoryItemMasterVO.setRegUsrId(LoginUtil.getUserId());
        accessoryItemMasterVO.setItemDstinCd("20");      //부품유형(판매용품)
        accessoryItemMasterVO.setOldRplcParCmptYn("N");  //구형대체부품호환여부
        accessoryItemMasterVO.setNewRplcParCmptYn("N");  //신형대체부품호환여부
        accessoryItemMasterVO.setStdrdStockCalcYn("N");  //적정재고산출여부
        accessoryItemMasterVO.setPurcCqtyCalcYn("N");    //구매소요량산출여부
        accessoryItemMasterVO.setImpTestTp("N");         //수입검사유형
        accessoryItemMasterVO.setNonMovingFlg("N");      //재고이동허용여부
        accessoryItemMasterVO.setLocalItemIfYn("N");     //로컬품목연계여부
        accessoryItemMasterVO.setPaintYn("N");           //도색여부
        accessoryItemMasterVO.setMjrUseYn("N");          //주사용여부
        accessoryItemMasterVO.setMjrErrYn("N");          //주고장여부

        if(StringUtils.isBlank(accessoryItemMasterVO.getStockUnitCd())){
            accessoryItemMasterVO.setStockUnitCd("EA");
        }

        int result = accessoryItemMasterService.insertAccessoryItemMaster(accessoryItemMasterVO);

        return result;
    }

    /**
     * 용품마스터 정보를 등록한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemMaster/updateAccessoryItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateAccessoryItemMaster(@Validated @RequestBody AccessoryItemMasterVO accessoryItemMasterVO) throws Exception {
        accessoryItemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        accessoryItemMasterVO.setRegUsrId(LoginUtil.getUserId());
        //accessoryItemMasterVO.setItemDstinCd("20");      //부품유형(판매용품)
        accessoryItemMasterVO.setOldRplcParCmptYn("N");  //구형대체부품호환여부
        accessoryItemMasterVO.setNewRplcParCmptYn("N");  //신형대체부품호환여부
        accessoryItemMasterVO.setStdrdStockCalcYn("N");  //적정재고산출여부
        accessoryItemMasterVO.setPurcCqtyCalcYn("N");    //구매소요량산출여부
        accessoryItemMasterVO.setImpTestTp("N");         //수입검사유형
        accessoryItemMasterVO.setNonMovingFlg("N");      //재고이동허용여부
        accessoryItemMasterVO.setLocalItemIfYn("N");     //로컬품목연계여부
        accessoryItemMasterVO.setPaintYn("N");           //도색여부
        accessoryItemMasterVO.setMjrUseYn("N");          //주사용여부
        accessoryItemMasterVO.setMjrErrYn("N");          //주고장여부

        /*
        if(StringUtils.isBlank(accessoryItemMasterVO.getStockUnitCd())){
            accessoryItemMasterVO.setStockUnitCd("EA");
        }
         */
        int result = accessoryItemMasterService.updateAccessoryItemMaster(accessoryItemMasterVO);

        return result;
    }

    /**
     * 용품마스터 정보를 삭제한다.
     * 단) 로컬부품(spyrcd=02) 인 경우에 한해서 삭제가 가능하다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemMaster/deleteAccessoryItemMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteAccessoryItemMaster(@Validated @RequestBody ItemMasterVO itemMasterVO) throws Exception {
        itemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        itemMasterVO.setRegUsrId(LoginUtil.getUserId());

        int result = accessoryItemMasterService.deleteLocalItemMaster(itemMasterVO);

        return result;
    }

    /**
     * 검색용 부품마스터 & 재고 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemMaster/selectAccessoryItemMasterSearchPopup.do", method = RequestMethod.GET)
    public String selectSearchItemPopup(Model model) throws Exception  {
        return "/sal/acc/itemMaster/selectAccessoryItemMasterSearchPopup";
    }
}
