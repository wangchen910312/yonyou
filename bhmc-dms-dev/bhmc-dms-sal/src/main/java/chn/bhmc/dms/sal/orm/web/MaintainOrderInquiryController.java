package chn.bhmc.dms.sal.orm.web;

import javax.annotation.Resource;

import able.com.util.fmt.DateUtil;
import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.MaintainOrderInquiryService;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySaveVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySearchVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;

/**
 * BTO 주문생성(C.R.U.D)
 *
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16         Bong            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/orm/maintainOrderInquiry")
public class MaintainOrderInquiryController extends HController {

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 금융 상품 관리 서비스
     */
    @Resource(name="maintainOrderInquiryService")
    MaintainOrderInquiryService maintainOrderInquiryService;

    /**
     * 오더유지 및 조회 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectMaintainOrderInquiryMain.do", method = RequestMethod.GET)
    public String selectMaintainOrderInquiryMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String toDay = DateUtil.getToday();
        model.addAttribute("toDay", toDay);
        model.addAttribute("sysDate", DateUtil.dateToSqlDate(maintainOrderInquiryService.selectSysDt()) );

        //주문유형(오더유형)
        model.addAttribute("ordTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));

        // 위약오더 상태 SAL022
        model.addAttribute("ptyOrdStatCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL022", null, langCd));

        // 책임구분 SAL023
        model.addAttribute("stockCauCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL023", null, langCd));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        return "/sal/orm/maintainOrderInquiry/selectMaintainOrderInquiryMain";
    }

    /**
     * Financial Products Management 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
    @RequestMapping(value = "/selectMaintainOrderInquiry.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMaintainOrderInquiry(@RequestBody MaintainOrderInquirySearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(maintainOrderInquiryService.selectMaintainOrderInquiryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(maintainOrderInquiryService.selectMaintainOrderInquiryByCondition(searchVO));
        }

        return result;
    }

    /**
     * 연장/취소 여부를 업데이트 한다.
     * @param saveVO -
     * @param
     * @return
     */
    @RequestMapping(value = "/updateMaintainOrderInquiry.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateMaintainOrderInquiry(@Validated @RequestBody MaintainOrderInquirySaveVO saveVO) throws Exception {
        maintainOrderInquiryService.updateMaintainOrderInquiry(saveVO);

        return true;
    }
}
