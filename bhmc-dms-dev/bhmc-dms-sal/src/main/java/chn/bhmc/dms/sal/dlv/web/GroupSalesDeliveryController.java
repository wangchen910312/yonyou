package chn.bhmc.dms.sal.dlv.web;


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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.sal.dlv.service.DeliveryMngService;
import chn.bhmc.dms.sal.dlv.vo.DeliverySaveVO;
import chn.bhmc.dms.sal.dlv.vo.DeliverySearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.ser.svi.service.BayManageService;



/**
 * 집단판매 - 고객인도관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 8. 11
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.08.11           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dlv/groupSalesDelivery")
public class GroupSalesDeliveryController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 고객인도 서비스
     */
    @Resource(name="deliveryMngService")
    DeliveryMngService deliveryMngService;


    /**
     * 고객인도 서비스
     */
    @Resource(name="bayManageService")
    BayManageService bayManageService;


    /**
     * Customer Information Management Service
     * CRM PAPRT
     */
    @Resource(name = "customerInfoService")
    CustomerInfoService customerInfoService;



    /**
     * 집단판매 - 고객인도관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesDeliveryMain.do", method = RequestMethod.GET)
    public String selectDeliveryMngMain(Model model) throws Exception {

        //집단판매 계약상태
        model.addAttribute("grpContractStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL029", null, LocaleContextHolder.getLocale().getLanguage()));
        //오늘일자
        model.addAttribute("toDay", DateUtil.getDate("yyyy-MM-dd"));

        return "/sal/dlv/groupSalesDelivery/selectGroupSalesDeliveryMain";
    }



    /**
     * 집단판매 - 고객인도관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeliveryMng(@RequestBody DeliverySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        result.setTotal(deliveryMngService.selectGroupSalesDeliveryCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(deliveryMngService.selectGroupSalesDelivery(searchVO));
        }

        return result;
    }


    /**
     * 집단판매 - 고객인도관리
     * @param saveVO - 수정 목록을 포함하는 ConfirmWearingVehicleSaveVO
     * @param
     * @return
     */
    @RequestMapping(value = "/GroupVehicleDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean GroupVehicleDelivery(@Validated @RequestBody DeliverySaveVO saveVO) throws Exception {
        deliveryMngService.GroupVehicleDelivery(saveVO);
        return true;

    }


}
