package chn.bhmc.dms.sal.dlv.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.dlv.service.CancDeliveryService;
import chn.bhmc.dms.sal.dlv.vo.CancDeliverySearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 이월판매취소결과조회
 *
 * @author Kim yewon
 * @since 2016. 5. 20
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.20           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/dlv/cancDelivery")
public class CancDeliveryController extends HController {


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
    @Resource(name="cancDeliveryService")
    CancDeliveryService cancDeliveryService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 이월판매취소결과조회  Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCancDeliveryMain.do", method = RequestMethod.GET)
    public String selectCancDeliveryMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //판매취소사유 공통코드 목록
        model.addAttribute("cancReasonCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL129", null, langCd));
        //승인여부 SAL154
        model.addAttribute("reqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL154", null, langCd));
        //승인여부 SAL131
        model.addAttribute("approveYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL131", null, langCd));
        //오더유형 SAL138
        model.addAttribute("ordTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL138", null, langCd));

      //판매고문
        model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));

        return "/sal/dlv/cancDelivery/selectCancDeliveryMain";
    }


    /**
     * 이월판매취소결과조회 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DeliverySearchVO
     * @return
     */
    @RequestMapping(value = "/selectCancDelivery.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCancDelivery(@RequestBody CancDeliverySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        /*searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
*/
        result.setTotal(cancDeliveryService.selectCancDeliveryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cancDeliveryService.selectCancDeliveryByCondition(searchVO));
        }

        return result;
    }






}
