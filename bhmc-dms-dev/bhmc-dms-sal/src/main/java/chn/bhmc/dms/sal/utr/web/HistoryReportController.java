package chn.bhmc.dms.sal.utr.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.CarInfoService;

/**
 * 내역보고서
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자               수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.08.29         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/utr/historyReport")
public class HistoryReportController extends HController {

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 내역보고서 탭 메인화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectHistoryReportMain.do", method = RequestMethod.GET)
    public String selectHistoryReportMain(Model model) throws Exception{

        return "/sal/utr/historyReport/selectHistoryReportMain";
    }


    /**
     * 거래성공 통계보고서
     */


    /**
     * 딜리버리 수량 통계보고서
     */


    /**
     * 입출고 판매현황보고서
     */
    @RequestMapping(value = "/selectDeliveryStockSaleResultReportMain.do", method = RequestMethod.GET)
    public String selectDeliveryStockSaleResultReportMain(Model model) throws Exception{
        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("toMonth", DateUtil.getDate("yyyy-MM"));

        return "/sal/utr/historyReport/selectDeliveryStockSaleResultReportMain";
    }




    /**
     * 수요예측 분석보고서
     */


}
