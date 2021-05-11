package chn.bhmc.dms.sal.acu.web;


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

import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.service.ZipCodeService;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cso.service.SalesOpptMgmtService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngService;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSaveVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSearchVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;

/**
 * 예약판매관리
 *
 * @author Kim Jin Suk
 * @since 2017. 3. 02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자              수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.03.02         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/acu/contBeforeMng")
public class ContBeforeMngController extends HController {

    /**
     * 예약판매 서비스
     */
    @Resource(name="contBeforeMngService")
    ContBeforeMngService contBeforeMngService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 차관적용차량스펙콤보서비스
     **/
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

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
     * 보험가입정보관리 서비스 - 주소지: 성, 시, 구 호출
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /**
     * 판매기회 관리 서비스
     */
    @Resource(name="salesOpptMgmtService")
    SalesOpptMgmtService salesOpptMgmtService;
    /**
     * crm 주소정보 관리 서비스
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * CRM 고객 정보 재조회
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 우편번호 조회 서비스
     */
    @Resource(name="zipCodeService")
    ZipCodeService zipCodeService;

    /**
     * Customer Management
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 판매고문 관리 서비스
     */
    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;


    /**
     * 예약판매 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectContBeforeMngMain.do", method = RequestMethod.GET)
    public String selectContBeforeMngMain(Model model,
            @RequestParam(value="saleOpptNo", required = false, defaultValue="") String saleOpptNo
    ) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());


        //DateUtil//
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        String sevenDtAf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, +7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtAf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);
        model.addAttribute("threeMonthDay", threeMonthBf);
        //DateUtil end//

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        String saleAdminYn = "N";
        //VIEW-D-12916 : 화면 : 판매>계약관리>예약판매관리
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-12916", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        //상태 : SAL208
        model.addAttribute("statCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL208", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        // 고객유형
        model.addAttribute("custTpList", commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd));

        /**
         * crm 판매기회
         */

        //model.addAttribute("orderNo", orderNo);           // 계약번호로 조회

        return "/sal/acu/contBeforeMng/selectContBeforeMngMain";
    }

    /**
     * 예약판매 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectContBeforeMngSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectContBeforeMngSearch(@RequestBody ContBeforeMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        result.setTotal(contBeforeMngService.selectContBeforeMngsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(contBeforeMngService.selectContBeforeMngsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 예약판매관리 상세화면
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectContBeforeMngPopup.do", method = RequestMethod.GET)
    public String selectContBeforeMngPopup(Model model) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 딜러명 조회
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<DealerVO>  dlrList =  dealerService.selectDealersByCondition( dealerSearchVO );
        if(dlrList != null && dlrList.size() > 0){
            model.addAttribute("dlrNm", dlrList.get(0).getDlrNm());
        }else{
            model.addAttribute("dlrNm", "");
        }

        //DateUtil//
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate      = DateUtil.getDate(dateFormat);

        Calendar cal = Calendar.getInstance();
        cal.setTime(DateUtil.convertToDate(sysDate));
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH);
        //int day = cal.get(Calendar.DATE);
        //cal.set(year, month, day+1, 00, 00, 00);
        cal.set(year, month, 1, 00, 00, 00);
        String oneDay       = DateUtil.getDate(cal.getTime(), dateFormat);

        int lastDay = DateUtil.getMaximumDateOfMonth(year, month);
            cal.set(year, month, lastDay, 00, 00, 00);
        String lastDate= DateUtil.getDate(cal.getTime(), dateFormat);

        String sevenDtAf    = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, +7), dateFormat);
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), dateFormat);
        String threeMonthBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, -3), dateFormat);
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("sevenDay", sevenDtAf);
        model.addAttribute("lastDay", lastDate);
        model.addAttribute("nextMonthDay", nextMonthDay);
        model.addAttribute("threeMonthDay", threeMonthBf);
        //DateUtil end//

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //성
        model.addAttribute("sungCdList", incJoinInfoService.selectSungCd(null));

        // 판매인 여부
        String saleEmpYn = "N";
        List<UserVO> saleEmpList = crmCommonService.selectMngScIdListByCondition();
        for(UserVO usVO : saleEmpList){
            if(usVO.getUsrId().equals(LoginUtil.getUserId())){
                saleEmpYn = "Y";
            }
        }
        model.addAttribute("saleEmpYn", saleEmpYn);
        model.addAttribute("saleEmpDSInfo", saleEmpList);

        String saleAdminYn = "N";
        //VIEW-D-12916  : 화면 : 판매>계약관리>예약판매관리
        if(viewMappingService.hasPermission(Constants.SYS_CD_DLR, "VIEW-D-12916", Constants.VIEW_AUTH_REF_TP_USER, LoginUtil.getUserId(), Constants.PERMISSION_SEARCHALL)){
            saleAdminYn = "Y";
        }
        //전체 조회권한
        model.addAttribute("saleAdminYn", saleAdminYn);

        // 재무수납여부
        String implyYn = dealerService.selectDealerByKey(LoginUtil.getDlrCd()).getAllowSubscriptionSaleYn();
        model.addAttribute("finImplyYn", StringUtils.isBlank(implyYn)?"Y":implyYn);

        // 주요인증문서유형(신분증유형) : CRM024
        model.addAttribute("mathDocTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        //상태 : SAL208
        model.addAttribute("statCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL208", null, langCd));

        //주소유형 : CRM033
        model.addAttribute("addrTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("CRM033", null, langCd));

        // 여부(Y/N) COM020
        model.addAttribute("ynDs", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));

        return "/sal/acu/contBeforeMng/selectContBeforeMngPopup";
    }

    /**
     * 차종에 따른 모델조회
     */
    @RequestMapping(value = "/selectFsc.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFsc(@RequestBody VehicleSpecSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        List<VehicleSpecVO> list = vehicleSpecComboCommService.selectModelTypeCombo(searchVO);

        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }

        return result;
    }

    /**
     * 차종과 차관에 따른 OCN조회
     */
    @RequestMapping(value = "/selectOcn.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectOcn(@RequestBody VehicleSpecSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();
        List<VehicleSpecVO> list = vehicleSpecComboCommService.selectOcnCombo(searchVO);

        result.setTotal(list.size());
        if(result.getTotal() != 0){
            result.setData(list);
        }
        return result;
    }

    /**
     * 모델에 따른 외장색조회
     */
    @RequestMapping(value = "/selectExtColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectExtColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectExtColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectExtColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 모델에 따른 내장색조회
     */
    @RequestMapping(value = "/selectIntColor.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectIntColor(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectIntColorListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectIntColorListsByCondition(searchVO));
        }
        return result;
    }

    /**
     * 성에 해당하는 도시를 조회.
     */
    @RequestMapping(value = "/selectCity.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCity(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectCityCd(vo));

        return result;
    }


    /**
     * 도시에 해당하는 구를 조회.
     */
    @RequestMapping(value = "/selectDist.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDist(@RequestBody IncJoinInfoVO vo) throws Exception{

        SearchResult result = new SearchResult();
        result.setData(incJoinInfoService.selectDistCd(vo));

        return result;
    }

    /**
     * 주소(성,시,구)로 우편번호 조회.
     */
    @RequestMapping(value = "/selectZipCodeSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public ZipCodeVO selectZipCodeSearch(@RequestBody IncJoinInfoVO vo) throws Exception{
        return zipCodeService.selectZipCodeByKey(vo.getSungCd(), vo.getCityCd(), vo.getDistCd());
    }


    /**
     * CRM 고객 데이터 재조회
     */
    @RequestMapping(value = "/selectCrmCustomerInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCrmCustomerInfo(@RequestBody CustomerInfoSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(customerInfoOutBoundService.selectCustomerInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO));
        }
        return result;
    }

    // 예판 저장 , 생성
    @RequestMapping(value = "/multiContBeforeMngs.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiContBeforeMngs(@Validated @RequestBody ContBeforeMngVO saveVO) throws Exception {
        saveVO.setDlrCd(LoginUtil.getDlrCd());
        return contBeforeMngService.multiContBeforeMngs(saveVO);
    }

    // 예판 삭제 : 승인전
    @RequestMapping(value = "/deleteContBefore.do", method = RequestMethod.POST)
    @ResponseBody
    public String deleteContBefore(@RequestBody ContBeforeMngVO beforeVO) throws Exception {
        beforeVO.setDlrCd(LoginUtil.getDlrCd());
        return contBeforeMngService.deleteContBefore(beforeVO);
    }

    // 예판 취소 : 승인후
    @RequestMapping(value = "/cancelContBefore.do", method = RequestMethod.POST)
    @ResponseBody
    public String cancelContBefore(@RequestBody ContBeforeMngVO beforeVO) throws Exception {
        beforeVO.setDlrCd(LoginUtil.getDlrCd());
        return contBeforeMngService.cancelContBefore(beforeVO);
    }

    // 예판 계약 멀티 계약취소, 계약삭제
    @RequestMapping(value = "/deleteContractMnt.do", method = RequestMethod.POST)
    @ResponseBody
    public int deleteContBeforeMng(@RequestBody ContBeforeMngSaveVO saveVO) throws Exception {
        return contBeforeMngService.deleteContBeforeMng(saveVO);
    }

}
