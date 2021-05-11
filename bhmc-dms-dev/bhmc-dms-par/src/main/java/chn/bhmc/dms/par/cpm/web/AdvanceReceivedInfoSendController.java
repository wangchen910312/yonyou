package chn.bhmc.dms.par.cpm.web;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoSendService;

/**
 * AdvanceReceivedInfoSend Controller
 *
 * @author In Bo Shim
 * @since 2016. 07. 01.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 7. 01.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class AdvanceReceivedInfoSendController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 선수금 전송 서비스
     */
    @Resource(name="advanceReceivedInfoSendService")
    AdvanceReceivedInfoSendService advanceReceivedInfoSendService;

    /**
     * 선수금 전송 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoSendMain.do", method = RequestMethod.GET)
    public String selectadvanceReceivedInfoSendMain(Model model) throws Exception {

        // 공통코드 : 선수금유형
        model.addAttribute("preAmtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR501", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoSendMain";

    }

    /**
     * 선수금  전송 정보를 저장한다.
     * @param saveVO - 저장 할 ItemMasterSendVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/advanceReceivedInfo/multiAdvanceReceivedInfoSends.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiAdvanceReceivedInfoSends(@Validated @RequestBody BaseSaveVO<DealerVO> dealerSendVO, BindingResult bindingResult) throws Exception
    {
        advanceReceivedInfoSendService.multiAdvanceReceivedInfoSend(dealerSendVO);
        return true;

    }
}
