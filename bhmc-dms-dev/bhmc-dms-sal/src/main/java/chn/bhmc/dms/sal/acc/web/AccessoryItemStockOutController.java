package chn.bhmc.dms.sal.acc.web;


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

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.acc.service.AccessoryItemMasterService;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesService;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesSupportService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesListVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.ser.svi.service.BayManageService;

/**
 * 용품출고관리
 *
 * @author Lee Ju Won
 * @since 2017. 2. 21
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                     수정내용
 *  ----------------    ------------    ---------------------------
 *  2017. 2. 21          Lee Ju Won   최초생성
 * </pre>
 */

@Controller
public class AccessoryItemStockOutController extends HController {

    /**
     * 용품판매관리 서비스
     */
    @Resource(name="accessoryItemSalesService")
    private AccessoryItemSalesService accessoryItemSalesService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

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
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * Bay관리 : 서비스 담당자
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;

    /**
     * 용품판매관리 서비스
     */
    @Resource(name="accessoryItemSalesSupportService")
    AccessoryItemSalesSupportService accessoryItemSalesSupportService;

    /**
     * 용품마스터 서비스-세율
     */
    @Resource(name="accessoryItemMasterService")
    AccessoryItemMasterService accessoryItemMasterService;

    /**
     * 용품출고관리 메인 화면을 출력한다.
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemStockOutMain.do", method = RequestMethod.GET)
    public String selectAccessoryItemStockOutMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String dateFormat  = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        String searchBfDt  = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -1), dateFormat);

        UnitInfoSearchVO unitInfoSearchVO  = new UnitInfoSearchVO();
        List<UnitInfoVO> unitCdList        = new ArrayList<UnitInfoVO>();

        unitInfoSearchVO.setsUseYn("Y");
        unitCdList  = unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO);

        model.addAttribute("toDt",            sysDate);
        model.addAttribute("searchBfDt",      searchBfDt);
        model.addAttribute("unitCdList",      unitCdList);

        //용품업무유형
        model.addAttribute("goodsTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        //용품출고상태
        model.addAttribute("contractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));

        //용품품목출고상태
        model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL199", null, langCd));

        //용품지불유형
        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL071", null, langCd));

        //계약고객유형
        model.addAttribute("custTpList",      commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd));

        // 세율
        model.addAttribute("vatCd", accessoryItemMasterService.selectVATSearch(DateUtil.getDate("yyyyMMdd"), "ALL"));

        return "/sal/acc/itemSales/selectAccessoryItemStockOutMain";
    }

    /**
     * 용품출고요청 목록 데이터를 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemStockOutList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemStockOutList(@RequestBody AccessoryItemSalesSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(accessoryItemSalesService.selectAccessoryItemSalesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(accessoryItemSalesService.selectAccessoryItemSalesByCondition(searchVO));
        }

        return result;
    }



    /**
     * 용품출고요청 품목리스트 데이터 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemStockOutItemByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemStockOutItemByKey(@RequestBody AccessoryItemSalesSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setData(accessoryItemSalesService.selectAccessoryItemStockOutItemsByKey(searchVO));

        return result;
    }

    /**
     * 용품출고요청 정보를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     *
    @RequestMapping(value = "/sal/acc/itemSales/multiAccessoryItemStockOuts.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiAccessoryItemStockOuts(@Validated @RequestBody AccessoryItemSalesVO accessoryItemSalesVO) throws Exception {
        accessoryItemSalesVO.setDlrCd(LoginUtil.getDlrCd());
        accessoryItemSalesVO.setRegUsrId(LoginUtil.getUserId());
        accessoryItemSalesVO.setUpdtUsrId(LoginUtil.getUserId());

        if(StringUtils.isBlank(accessoryItemSalesVO.getDcLvlCd())){
            accessoryItemSalesVO.setDcApproveYn("N");
        }

        accessoryItemSalesService.multiAccessoryItemSales(accessoryItemSalesVO);

        return true;
    }
    */

    /**
     * 용품 출고
     *
     */
    @RequestMapping(value = "/sal/acc/itemSales/applySalesCnfm.do", method = RequestMethod.POST)
    @ResponseBody
    public AccessoryItemSalesVO applySalesCnfm(@RequestBody AccessoryItemSalesListVO accessoryItemSalesListVO)  throws Exception  {

        AccessoryItemSalesVO accessoryItemSalesVO = new AccessoryItemSalesVO();
        accessoryItemSalesVO = accessoryItemSalesListVO.getAccessoryItemSalesVO();
        List<AccessoryItemSalesItemVO> list = accessoryItemSalesListVO.getAccessoryItemSalesItemList();

        accessoryItemSalesVO = accessoryItemSalesService.applySalesCnfm(accessoryItemSalesVO, list);

        return accessoryItemSalesVO;
    }

    /**
     * 용품 출고반품
     */
    @RequestMapping(value = "/sal/acc/itemSales/applyReturn.do", method = RequestMethod.POST)
    @ResponseBody
    public String applyReturn(@RequestBody AccessoryItemSalesSearchVO searchVO)  throws Exception  {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return accessoryItemSalesService.applyCancel(searchVO);
    }

    /**
     * 용품판매문서 반품 팝업 화면을 출력한다.
     * @param model
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/setAccessoryItemStockOutReturnPopup.do", method = RequestMethod.GET)
    public String setAccessoryItemStockOutReturnPopup(Model model) throws Exception{

        return "/sal/acc/itemSales/setAccessoryItemStockOutReturnPopup";
    }

}
