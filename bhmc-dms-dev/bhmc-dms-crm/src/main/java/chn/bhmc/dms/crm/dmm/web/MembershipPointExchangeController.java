package chn.bhmc.dms.crm.dmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngService;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesSupportService;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchSupportVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointExchangeMainController.java
 * @Description : 포인트 교환 집계 컨트롤러.
 * @author Kim Hyun Ho
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Controller
public class MembershipPointExchangeController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 용품판매관리 서비스
     */
    @Resource(name="accessoryItemSalesSupportService")
    AccessoryItemSalesSupportService accessoryItemSalesSupportService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 멤버십 등급 관리 서비스
     */
    @Resource(name="membershipGradeMngService")
    MembershipGradeMngService membershipGradeMngService;

    /**
     * 포인트 교환 집계 main페이지
     * 마스터 및 detail
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExchange/selectMembershipPointExchangeMain.do", method = RequestMethod.GET)
    public String selectMembershipPointExchangeMain(Model model) throws Exception {
        model.addAttribute("policy", LoginUtil.getMembershipPolicy());


     // 시작일 - 종료일 설정
        Calendar startCal = Calendar.getInstance();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        int year = startCal.get(Calendar.YEAR);
        int month = startCal.get(Calendar.MONTH);
        int day = startCal.get(Calendar.DATE);

        startCal.set(year, month-1, day);
        String sStartDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sStartDt", sStartDt);

        startCal.set(year, month, day);
        String sEndDt = DateUtil.getDate(startCal.getTime(),dateFormat);
        model.addAttribute("sEndDt", sEndDt);



        return "/crm/dmm/membershipPointExchange/selectMembershipPointExchangeMain";
    }

    /**
     * 포인트 교환 집계 마스터
     * @param searchVO - AccessoryItemSalesSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExchange/selectAccessoryItemSalesMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemSalesByCondition(@RequestBody AccessoryItemSalesSearchSupportVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        SearchResult result = new SearchResult();

        result.setTotal(accessoryItemSalesSupportService.selectAccessoryItemSalesSupportByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(accessoryItemSalesSupportService.selectAccessoryItemSalesSupportByCondition(searchVO));
        }
        return result;
    }

    /**
     * 포인트 교환 집계 상세
     * @param searchVO - AccessoryItemSalesSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExchange/selectAccessoryItemSalesHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAccessoryItemSalesHistory(@RequestBody AccessoryItemSalesSearchSupportVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        SearchResult result = new SearchResult();

        result.setTotal(accessoryItemSalesSupportService.selectAccessoryItemSalesItemsSupportByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(accessoryItemSalesSupportService.selectAccessoryItemSalesItemsSupportByCondition(searchVO));
        }
        return result;
    }

    /**
     * 포인트 교환
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExchange/selectMembershipPointGoodsExchangeMain.do", method = RequestMethod.GET)
    public String selectMembershipPointGoodsExchangeMain(Model model) throws Exception {

        //창고목록
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        //용품유형
        model.addAttribute("etcCd1List", commonCodeService.selectCommonCodesByCmmGrpCd("SAL195", null, LocaleContextHolder.getLocale().getLanguage()));

        //등급코드
        MembershipGradeMngSearchVO searchMngVO = new MembershipGradeMngSearchVO();
        model.addAttribute("gradeCodeList", membershipGradeMngService.selectGradeCodesByCondition(searchMngVO));

        // 멤버십 기준 ( 차량 / 고객 )
        model.addAttribute("membershipStan", LoginUtil.getMembershipPolicy());

        return "/crm/dmm/membershipPointExchange/selectMembershipPointGoodsExchangeMain";
    }

    /**
     * 포인트 교환 목록
     * @param searchVO - AccessoryItemSalesSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/dmm/membershipPointExchange/selectMembershipPointGoodsExchanges.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMembershipPointGoodsExchanges(@RequestBody AccessoryItemSalesSearchSupportVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        SearchResult result = new SearchResult();

        result.setTotal(accessoryItemSalesSupportService.selectAccessoryItemSalesItemsSupportByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(accessoryItemSalesSupportService.selectAccessoryItemSalesItemsSupportByCondition(searchVO));
        }
        return result;
    }

}