package chn.bhmc.dms.mob.par.cpm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobAdvanceReceivedInfoController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 2. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 27.     HG                     최초 생성
 * </pre>
 */

@Controller
public class MobAdvanceReceivedInfoController extends HController{

     /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

     /**
     * 선수금 헤더 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoMain.do", method = RequestMethod.GET)
    public String selectadvanceReceivedInfoMain(Model model) throws Exception {

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        // 공통코드 : 선수금유형
        model.addAttribute("preAmtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR501", null, LocaleContextHolder.getLocale().getLanguage()));
        //dlrCd
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        model.addAttribute("_urlBaseJsp","/WEB-INF/jsp/ZnewMob/par/cpm/advanceReceivedInfo/baseJsp/selectAdvanceReceivedInfoMain.jsp");

        return "/ZnewMob/templatesNewMob/mobTemplateA";

    }

     /**
     * 선수금 리스트 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/mob/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoList.do", method = RequestMethod.GET)
    public String selectadvanceReceivedInfoList(Model model) throws Exception {

        return "/mob/par/cpm/advanceReceivedInfo/selectAdvanceReceivedInfoList";

    }

}
