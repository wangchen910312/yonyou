package chn.bhmc.dms.sal.ctm.web;

import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ctm.service.DeliveryFixService;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSaveVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 출고확정 관리
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자               수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.10         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/ctm/deliveryFix")
public class DeliveryFixController extends HController {

    /**
     * 출고확정관리 서비스
     */
    @Resource(name="deliveryFixService")
    private DeliveryFixService deliveryFixService;

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
     * 출고확정관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectDeliveryFixMain.do", method = RequestMethod.GET)
    public String selectDeliveryFixMain(Model model,
            @RequestParam(value="contNo", required = false, defaultValue="") String contNo
    ) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String nextMonthDay = DateUtil.getDate(DateUtil.getLastDateOfMonth(new Date()), "yyyy-MM-dd");
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("nextMonthDay", nextMonthDay);

        //계약상태
        model.addAttribute("contractStatCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL002", null, langCd));

        // 계약유형
        model.addAttribute("contractTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 재고상태
        model.addAttribute("stockTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL074", null, langCd));

        model.addAttribute("contNo", contNo);           // 계약번호로 조회

        return "/sal/ctm/deliveryFix/selectDeliveryFixMain";
    }

    /**
     * 출고확정관리 목록 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectDeliveryFixs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDeliveryFixs(@RequestBody DeliveryAskSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(deliveryFixService.selectDeliveryFixsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(deliveryFixService.selectDeliveryFixsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 출고확정 요청.
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/confirmFixDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmFixDelivery(@Validated @RequestBody DeliveryAskSaveVO confirmVO) throws Exception {
        deliveryFixService.confirmFixDelivery(confirmVO);
        return true;
    }

    /**
     * 출고확정 취소 처리
     * @param confirmVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/confirmFixDeliveryCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmFixDeliveryCancel(@Validated @RequestBody DeliveryAskSaveVO confirmVO) throws Exception {
        deliveryFixService.confirmFixDeliveryCancel(confirmVO);
        return true;
    }


}
