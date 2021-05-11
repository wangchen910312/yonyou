package chn.bhmc.dms.cmm.tmp.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSaveVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSaveVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * Code 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class MessageTemplateController extends HController {

    /**
     * 메시지템플릿 관리 서비스
     */
    @Resource(name="messageTemplateService")
    MessageTemplateService messageTemplateService;

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
     * 메시지템플릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/selectMessageTemplateMain.do", method = RequestMethod.GET)
    public String selectMessageTemplateMain(Model model) throws Exception {
    	//메세지템플릿 그룹 구분 목록
        model.addAttribute("mesgTmplGrpTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM060", null, LocaleContextHolder.getLocale().getLanguage()));
        //메세지템플릿 유형 목록
        model.addAttribute("mesgTmplTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM004", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/tmp/messageTemplate/selectMessageTemplateMain";
    }

    /**
     * 메시지템플릿그룹 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/selectMessageTemplateGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMessageTemplateGroups(@RequestBody MessageTemplateGroupSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = messageTemplateService.selectMessageTemplateGroupsByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(messageTemplateService.selectMessageTemplateGroupsByCondition(searchVO));
        }

        return result;

    }



    /**
     * 메시지템플릿그룹 정보를 등록한다.
     * @param saveVO - 메세지소스정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/multiMessageTemplateGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiMessageTemplateGroups(@Validated @RequestBody MessageTemplateGroupSaveVO saveVO,BindingResult bindingResult) throws Exception {
        messageTemplateService.multiMessageTemplateGroups(saveVO);
        return true;

    }


    /**
     * 메시지템플릿 정보를 등록한다.
     * @param messageTemplateVO - 메시지템플릿정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/insertMessageTemplate.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertMessageTemplate(@Validated @RequestBody MessageTemplateVO messageTemplateVO) throws Exception {
        messageTemplateService.insertMessageTemplate(messageTemplateVO);
        return true;

    }

    /**
     * 메시지템플릿 수정를 등록한다.
     * @param messageTemplateVO - 메시지템플릿정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/updateMessageTemplate.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateMessageTemplate(@Validated @RequestBody MessageTemplateVO messageTemplateVO) throws Exception {
        messageTemplateService.updateMessageTemplate(messageTemplateVO);
        return true;

    }

    /**
     * 메시지템플릿 정보를 등록한다.
     * @param saveVO - 메시지템플릿정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/multiMessageTemplates.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiMessageTemplates(@Validated @RequestBody MessageTemplateSaveVO saveVO) throws Exception {
        messageTemplateService.multiMessageTemplates(saveVO);
        return true;

    }

    /**
     * 메시지템플릿 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/selectMessageTemplates.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMessageTemplates(@RequestBody MessageTemplateSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(messageTemplateService.selectMessageTemplatesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(messageTemplateService.selectMessageTemplatesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 메시지템플릿관리 - 메시지템플릿텍스트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/selectMessageTemplateWritePopup.do", method = RequestMethod.GET)
    public String selectMessageTemplateWritetPopup(HttpServletRequest request, Model model) throws Exception {
        //메세지템플릿 유형 목록
        model.addAttribute("mesgTmplTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM004", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/cmm/tmp/messageTemplate/selectMessageTemplateWritePopup";
    }


    /**
     * 메시지템플릿관리 - 메시지템플릿텍스트 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/tmp/messageTemplate/selectMessageTemplateUpdatePopup.do", method = RequestMethod.GET)
    public String selectMessageTemplateUpdatePopup(HttpServletRequest request, Model model) throws Exception {
        //메세지템플릿 유형 목록
        model.addAttribute("mesgTmplTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM004", null, LocaleContextHolder.getLocale().getLanguage()));
        return "/cmm/tmp/messageTemplate/selectMessageTemplateUpdatePopup";
    }


}
