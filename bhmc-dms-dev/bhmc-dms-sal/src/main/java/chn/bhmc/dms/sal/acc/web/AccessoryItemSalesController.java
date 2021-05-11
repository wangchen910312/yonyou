package chn.bhmc.dms.sal.acc.web;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang.StringUtils;
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
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesVO;
import chn.bhmc.dms.sal.cnt.service.ContractReService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;
import chn.bhmc.dms.ser.svi.service.DcMasterService;
import chn.bhmc.dms.ser.svi.service.TechManFnMasterService;
import chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterSearchVO;

/**
 * 용품판매관리
 *
 * @author Kang Seok Han
 * @since 2017. 2. 08
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                     수정내용
 *  ----------------    ------------    ---------------------------
 *  2017.02.08          Kang Seok Han   최초생성
 * </pre>
 */

@Controller
public class AccessoryItemSalesController extends HController {

    /**
     * 용품판매관리 서비스
     */
    @Resource(name="accessoryItemSalesService")
    private AccessoryItemSalesService accessoryItemSalesService;

    /**
     * 계약 서비스
     */
    @Resource(name="contractReService")
    private ContractReService contractReService;

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
    @Resource(name="techManFnMasterService")
    TechManFnMasterService techManFnMasterService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;

    /**
     * 할인관리 관리
     */
    @Resource(name="dcMasterService")
    DcMasterService dcMasterService;

    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 용품판매관리 메인 화면을 출력한다.
     * @param goodsContractNo
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemSalesMain.do", method = RequestMethod.GET)
    public String selectAccessoryItemSalesMain(@RequestParam(value="goodsContractNo", required=false, defaultValue="") String goodsContractNo, Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //용품계약번호
        model.addAttribute("goodsContractNo", goodsContractNo);

        //용품계약일자 조회시작일
        Date startGoodsContractDt = DateUtil.convertToDate(DateUtil.getDate("yyyy-MM-01"), "yyyy-MM-dd");
        model.addAttribute("startGoodsContractDt", startGoodsContractDt);

        //용품계약일자 조회 종료일
        Date endGoodsContractDt = DateUtil.getLastDateOfMonth(startGoodsContractDt);
        model.addAttribute("endGoodsContractDt", endGoodsContractDt);

        //용품업무유형
        model.addAttribute("goodsTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        //용품판매상태
        model.addAttribute("contractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));

        return "/sal/acc/itemSales/selectAccessoryItemSalesMain";
    }

    /**
     * 용품판매 목록 데이터를 조회한다.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemSales.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemSales(@RequestBody AccessoryItemSalesSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(accessoryItemSalesService.selectAccessoryItemSalesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(accessoryItemSalesService.selectAccessoryItemSalesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 용품판매정보 팝업 화면을 오픈한다.
     * @param goodsContractNo
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemSalesDetailPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemSalesDetailPopup(@RequestParam(value="goodsContractNo", required=false, defaultValue="") String goodsContractNo, Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        AccessoryItemSalesVO accessoryItemSalesVO;

        //신규 인 경우
        if(StringUtils.isEmpty(goodsContractNo)){
            accessoryItemSalesVO = new AccessoryItemSalesVO();
            accessoryItemSalesVO.setDlrCd(LoginUtil.getDlrCd());
            //용품업무유형-직접(01)
            accessoryItemSalesVO.setGoodsTp("01");
            //추가증정금액
            accessoryItemSalesVO.setAddPrenAmt(0.0);
        }else{
            accessoryItemSalesVO = accessoryItemSalesService.selectAccessoryItemSalesByKey(LoginUtil.getDlrCd(), goodsContractNo);
        }

        //용품판매정보
        model.addAttribute("accessoryItemSalesVO", accessoryItemSalesVO);

        //용품업무유형
        model.addAttribute("goodsTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));

        //용품판매상태
        model.addAttribute("contractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));

        //용품판매품목상태
        model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL199", null, langCd));

        //납부방식
//        model.addAttribute("payTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL012", null, langCd));

        //할인레벨
        model.addAttribute("dcLvlCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL156", null, langCd));

        //서비스고문
        /*BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo("C01");
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("eqipPrsnList", bayManageService.selectBayDetailsByCondition(searchVO));*/

      //테크니션
        model.addAttribute("techManCdList", techManFnMasterService.selectTechManFnMasterByCondition(new TechManFnMasterSearchVO()));


        //브랜드
        model.addAttribute("carBrandList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //차관
        List<VehicleSpecVO> fscList = new ArrayList<VehicleSpecVO>();
        if(StringUtils.isNotBlank(accessoryItemSalesVO.getCarlineCd())){
            VehicleSpecSearchVO fscSearchVO = new VehicleSpecSearchVO();
            fscSearchVO.setsCarlineCd(accessoryItemSalesVO.getCarlineCd());    //차종
            //fscSearchVO.setUseYn("Y");                                        //사용여부

            fscList = vehicleSpecComboCommService.selectModelTypeCombo(fscSearchVO);
        }
        model.addAttribute("fscList", fscList);

        //OCN
        List<CarInfoVO> ocnList = new ArrayList<CarInfoVO>();
        if(StringUtils.isNotBlank(accessoryItemSalesVO.getModelCd())){
            CarInfoSearchVO ocnSearchVO = new CarInfoSearchVO();
            ocnSearchVO.setDlrCd(LoginUtil.getDlrCd());                         //딜러코드
            ocnSearchVO.setCarlineCd(accessoryItemSalesVO.getCarlineCd());      //차종
            ocnSearchVO.setModelCd(accessoryItemSalesVO.getModelCd());          //모델
            //ocnSearchVO.setUseYn("Y");                                          //사용여부

            ocnList = carInfoService.selectOcnListsByCondition(ocnSearchVO);
        }
        model.addAttribute("ocnList", ocnList);

        //외장색
        List<CarInfoVO> extColorList = new ArrayList<CarInfoVO>();
        if(StringUtils.isNotBlank(accessoryItemSalesVO.getOcnCd())){
            CarInfoSearchVO extColorSearchVO = new CarInfoSearchVO();
            extColorSearchVO.setDlrCd(LoginUtil.getDlrCd());                     //딜러코드
            extColorSearchVO.setModelCd(accessoryItemSalesVO.getModelCd());      //모델
            //extColorSearchVO.setUseYn("Y");                                      //사용여부

            extColorList = carInfoService.selectExtColorListsByCondition(extColorSearchVO);
        }
        model.addAttribute("extColorList", extColorList);

        //내장색
        List<CarInfoVO> intColorList = new ArrayList<CarInfoVO>();
        if(StringUtils.isNotBlank(accessoryItemSalesVO.getExtColorCd())){
            CarInfoSearchVO intColorSearchVO = new CarInfoSearchVO();
            intColorSearchVO.setDlrCd(LoginUtil.getDlrCd());                     //딜러코드
            intColorSearchVO.setModelCd(accessoryItemSalesVO.getModelCd());      //모델

            intColorList = carInfoService.selectIntColorListsByCondition(intColorSearchVO);
        }
        model.addAttribute("intColorList", intColorList);


        return "/sal/acc/itemSales/selectAccessoryItemSalesDetailPopup";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectModel.do", method = RequestMethod.POST)
    @ResponseBody
    public List<CarInfoVO> selectModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        //searchVO.setUseYn("Y");                       // 사용여부

        return carInfoService.selectModelListsByCondition(searchVO);
    }

    /**
     * 차종과 모델에 따른 OCN조회
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public List<CarInfoVO> selectOcn(@RequestBody CarInfoSearchVO searchVO) throws Exception{
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        //searchVO.setUseYn("Y");                       // 사용여부

        return carInfoService.selectOcnListsByCondition(searchVO);
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public List<CarInfoVO> selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        //searchVO.setUseYn("Y");                       // 사용여부

        return carInfoService.selectExtColorListsByCondition(searchVO);
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public List<CarInfoVO> selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {
        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        return carInfoService.selectIntColorListsByCondition(searchVO);
    }

    /**
     * 용품판매 품목리스트 데이터 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemSalesItems.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemSalesItems(@RequestBody AccessoryItemSalesSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(accessoryItemSalesService.selectAccessoryItemSalesItemsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(accessoryItemSalesService.selectAccessoryItemSalesItemsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 용품판매 정보를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sal/acc/itemSales/multiAccessoryItemSales.do", method = RequestMethod.POST)
    @ResponseBody
    public AccessoryItemSalesVO multiAccessoryItemSales(@Validated @RequestBody AccessoryItemSalesSaveVO accessoryItemSalesSaveVO) throws Exception {
        AccessoryItemSalesVO accessoryItemSalesVO = accessoryItemSalesSaveVO.getAccessoryItemSalesVO();

        accessoryItemSalesVO.setDlrCd(LoginUtil.getDlrCd());
        accessoryItemSalesVO.setRegUsrId(LoginUtil.getUserId());
        accessoryItemSalesVO.setUpdtUsrId(LoginUtil.getUserId());

        if(StringUtils.isBlank(accessoryItemSalesVO.getDcLvlCd())){
            accessoryItemSalesVO.setDcApproveYn("N");
        }

        accessoryItemSalesService.multiAccessoryItemSales(accessoryItemSalesSaveVO);

        accessoryItemSalesVO = accessoryItemSalesService.selectAccessoryItemSalesByKey(LoginUtil.getDlrCd(), accessoryItemSalesVO.getGoodsContractNo());

        return accessoryItemSalesVO;
    }

    /**
     * 용품 할인레벨을 조회한다.
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectDlrGoodsDcLevel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDlrGoodsDcLevel(@RequestBody AccessoryItemSalesSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<AccessoryItemSalesVO> list = accessoryItemSalesService.selectDlrGoodsDcLevel(searchVO);

        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }
        return result;
    }

    /**
     * 용품판매문서 품목조회 팝업 화면을 출력한다.
     * @param model
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemSearchPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemSearchPopup(Model model ,
            @RequestParam(value="sBrandYn",defaultValue="Y") String sBrandYn
    ) throws Exception{
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
        model.addAttribute("sBrandYn", sBrandYn);
        model.addAttribute("stockUnitCdList", unitInfoService.selectUnitInfosByCondition(unitInfoSearchVO));

        //브랜드
        model.addAttribute("brandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/sal/acc/itemSales/selectAccessoryItemSearchPopup";
    }

    /**
     * 용품판매문서상태를 취소 상태로 변경한다.
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/updateAccessoryItemSalesContractStatCdToCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateAccessoryItemSalesStatusToCancel(@RequestBody AccessoryItemSalesVO acessoryItemSalesVO) throws Exception{
        //accessoryItemSalesService.updateAccessoryItemSalesContractStatCd(acessoryItemSalesVO.getDlrCd(), acessoryItemSalesVO.getGoodsContractNo(), "50", LoginUtil.getUserId(),acessoryItemSalesVO.getUpdtDtStr());
        accessoryItemSalesService.updateAccessoryItemSalesContractStatCd(acessoryItemSalesVO , "50");
        return true;
    }

    /**
     * 용품판매문서상태를 완성 상태로 변경한다.
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/updateAccessoryItemSalesContractStatCdToCompletion.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateAccessoryItemSalesContractStatCdToCompletion(@RequestBody AccessoryItemSalesVO acessoryItemSalesVO) throws Exception{
        //accessoryItemSalesService.updateAccessoryItemSalesContractStatCd(acessoryItemSalesVO.getDlrCd(), acessoryItemSalesVO.getGoodsContractNo(), "40", LoginUtil.getUserId(),acessoryItemSalesVO.getUpdtDtStr());
        accessoryItemSalesService.updateAccessoryItemSalesContractStatCd(acessoryItemSalesVO , "40");
        return true;
    }


    /**
     * 품목팝업 정보(판매단가용)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectItemSalePrcPopupByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectItemSalePrcPopupByCondition(@RequestBody ContractReSearchVO searchVO)  throws Exception  {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(contractReService.selectItemSalePrcPopupByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(contractReService.selectItemSalePrcPopupByCondition(searchVO));
        }
        return result;
    }

    /**
     * 용품 출고요청
     *
    @RequestMapping(value = "/sal/acc/itemSales/applyReq.do", method = RequestMethod.POST)
    @ResponseBody
    public String applyReq(@RequestBody AccessoryItemSalesSaveVO saveVO)  throws Exception  {
        saveVO.getGoodsMainVO().setDlrCd(LoginUtil.getDlrCd());
        return accessoryItemSalesService.applyReq(saveVO);
    }
    */

    /**
     * 용품 출고취소
     */
    @RequestMapping(value = "/sal/acc/itemSales/applyCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public String applyCancel(@RequestBody AccessoryItemSalesSearchVO searchVO)  throws Exception  {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return accessoryItemSalesService.applyCancel(searchVO);
    }

    /**
     * 판매현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/sal/acc/itemSales/selectAccessoryItemSalesList.do", method = RequestMethod.GET)
    public String selectAccessoryItemSalesList(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        Calendar calendar = Calendar.getInstance();

        //예정출고일자 조회종료일
        model.addAttribute("sEndRegDt", calendar.getTime());
        calendar.add(Calendar.DATE, -30);
        //예정출고일자 조회시작일
        model.addAttribute("sStartRegDt", calendar.getTime());
        //용품업무유형
        model.addAttribute("goodsTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd));
        //용품판매상태
        model.addAttribute("contractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd));
        //용품판매품목상태
        model.addAttribute("itemStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL199", null, langCd));
        //고객유형(개인, 법인)
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        //공급업체유형
        CommonCodeSearchVO commonCodeSearchVO = new CommonCodeSearchVO();
        commonCodeSearchVO.setsCmmGrpCd("PAR121");
        commonCodeSearchVO.setsRemark2("01"); //구매처
        model.addAttribute("bpTpList", commonCodeService.selectCommonCodesByCondition(commonCodeSearchVO));

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        model.addAttribute("itemDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO));

        return "/sal/acc/itemSales/selectAccessoryItemSalesList";
    }

    /**
     * 용품판매헤더 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VenderMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectAccessoryItemSalesByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public AccessoryItemSalesVO selectAccessoryItemSalesByKey(@RequestBody AccessoryItemSalesSearchVO accessoryItemSalesSearchVO) throws Exception
    {
        AccessoryItemSalesVO accessoryItemSalesVO = accessoryItemSalesService.selectAccessoryItemSalesByKey(LoginUtil.getDlrCd(), accessoryItemSalesSearchVO.getsGoodsContractNo());
        return accessoryItemSalesVO;
    }



    /**
     * 용품판매관리 > 용품판매정보 > 멤버십 정보 팝업 화면을 출력한다.
     * @param model
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectDealerMemberShipInfoPopup.do", method = RequestMethod.GET)
    public String selectDealerMemberShipInfoPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //BM쿠폰유형
        model.addAttribute("bmCupnTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER073", null, langCd));
        //포인트 상한치
        model.addAttribute("membershipPointUseMaxPoint", LoginUtil.getMembershipPointUseMaxPoint());
        // 멤버십포인트 환산기준 ( 포인트 )
        model.addAttribute("membershipPointExchgPoint", LoginUtil.getMembershipPointExchgPoint());
        // 멤버십포인트 환산기준 ( 위안 )
        model.addAttribute("membershipPointExchgMoney", LoginUtil.getMembershipPointExchgMoney());

        return "/sal/acc/itemSales/selectDealerMemberShipInfoPopup";
    }

    /**
     * 용품판매관리 > 용품판매정보 > 멤버십 정보 팝업 > 멤버십 가입 정보 데이터를 조회한다.
     * @param searchVO - custNo
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectDealerMemberShipInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMemberships(@RequestBody MembershipSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(membershipService.selectMembershipsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(membershipService.selectMembershipsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 용품판매관리 > 용품판매정보 > 멤버십 정보 팝업 > 멤버십 가입 정보 데이터를 조회한다.
     * @param searchVO - custNo
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectDealerMemberShipInfos.do", method = RequestMethod.POST)
    @ResponseBody
    public MembershipVO selectMembershipss(@RequestBody MembershipSearchVO searchVO) throws Exception {

        MembershipVO result = membershipSupportService.selectMembershipInfoByKey(searchVO);

        if(result == null){
            result = new MembershipVO();
        }

        return result;

    }

    /**
     * 용품판매관리 > 용품판매정보 > 쿠폰 조회 팝업 화면을 출력한다.
     * @param model
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectEtcDcTargetPopup.do", method = RequestMethod.GET)
    public String selectEtcDcTargetPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //할인유형 목록
        model.addAttribute("dcTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SER920", null, langCd));

        return "/sal/acc/itemSales/selectEtcDcTargetPopup";
    }


    /**
     * 용품판매관리 > 용품판매정보 > 쿠폰 조회 팝업 목록을 가져온다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sal/acc/itemSales/selectEtcDcTarget.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectEtcDcTarget(@RequestBody DcMasterSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        result.setTotal(dcMasterService.selectEtcDcTargetByConditionCnt(searchVO));

        if(result.getTotal() !=0 ){
            result.setData(dcMasterService.selectEtcDcTargetByCondition(searchVO));
        }
        return result;

    }

    /**
     * 포인트 교환 - CRM 멤버십에서 호출
     * @param AccessoryItemSalesSaveVO accessoryItemSalesSaveVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExchange/updateMembershipPointGoodsExchange.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateMembershipPointGoodsExchange(@RequestBody AccessoryItemSalesSaveVO accessoryItemSalesSaveVO) throws Exception {

        boolean result = false;

        AccessoryItemSalesVO accessoryItemSalesVO = accessoryItemSalesSaveVO.getAccessoryItemSalesVO();

        accessoryItemSalesVO.setDlrCd(LoginUtil.getDlrCd());
        accessoryItemSalesVO.setRegUsrId(LoginUtil.getUserId());
        accessoryItemSalesVO.setUpdtUsrId(LoginUtil.getUserId());

        // 출고시 chkAccessorySaleUpdateSomebody 에서 등록/수정 시간을 가지고 체크하는 로직이 있어서 앞에서 세팅해준다.
        accessoryItemSalesVO.setRegDt(Calendar.getInstance().getTime());

        if(StringUtils.isBlank(accessoryItemSalesVO.getDcLvlCd())){
            accessoryItemSalesVO.setDcApproveYn("N");
        }
        accessoryItemSalesVO.setPrenAmt(0.0);
        accessoryItemSalesVO.setCustPayAmt(0.0);


        accessoryItemSalesService.updateMembershipPointGoodsExchange(accessoryItemSalesSaveVO);

        return result;
    }


}