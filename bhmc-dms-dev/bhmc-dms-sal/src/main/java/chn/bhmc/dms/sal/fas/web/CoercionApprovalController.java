package chn.bhmc.dms.sal.fas.web;

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
import chn.bhmc.dms.sal.fas.service.CoercionApprovalService;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalSaveVO;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 강제판매승인
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.21         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/fas/coercionApproval")
public class CoercionApprovalController extends HController {

    /**
     * 강제판매승인 서비스
     */
    @Resource(name="coercionApprovalService")
    CoercionApprovalService coercionApprovalService;

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
     * 강제판매승인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCoercionApprovalMain.do", method = RequestMethod.GET)
    public String selectCoercionApprovalMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrCd());  // TOBE DlrNm

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 예외처리 요청 사유 코드 SAL153 : FCE_SALE_REQ_REASON_CD
        model.addAttribute("reqReasonDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL153", null, langCd));

        // 승인여부 SAL154
        model.addAttribute("approveDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL154", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/fas/coercionApproval/selectCoercionApprovalMain";
    }

    /**
     * 강제판매승인 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectCoercionApproval.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCoercionApproval(@RequestBody CoercionApprovalSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        result.setTotal(coercionApprovalService.selectCoercionApprovalsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(coercionApprovalService.selectCoercionApprovalsByCondition(searchVO));
        }

        return result;
    }

    // 승인
    @RequestMapping(value = "/confirms.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirms(@Validated @RequestBody CoercionApprovalSaveVO saveVO) throws Exception {
        coercionApprovalService.confirms(saveVO);
        return true;
    }

    // 불승인
    @RequestMapping(value = "/nonConfirms.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean nonConfirms(@Validated @RequestBody CoercionApprovalSaveVO saveVO) throws Exception {
        coercionApprovalService.nonConfirms(saveVO);
        return true;
    }

}
