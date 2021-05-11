package chn.bhmc.dms.crm.cmm.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.cmm.service.SmsMessageService;
import chn.bhmc.dms.crm.cmm.service.SmsTmplUserService;
import chn.bhmc.dms.crm.cmm.vo.SmsMessageVO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserSearchVO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsTmplUserController.java
 * @Description : SMS 발송 대상자 임시저장 컨트롤러
 * @author In Moon Lee
 * @since 2016.06.29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.29.     In Moon Lee     최초 생성
 * </pre>
 */

@Controller
public class SmsTmplUserController extends HController{

    /**
     * SMS 발송 대상자 임시 저장 서비스
     */
    @Resource(name="smsTmplUserService")
    SmsTmplUserService smsTmplUserService;

    /**
     * 메시지 저장 서비스
     */
    @Resource(name="smsMessageService")
    SmsMessageService smsMessageService;

    /**
     * 메시지템플릿 관리 서비스
     */
    @Resource(name="messageTemplateService")
    MessageTemplateService messageTemplateService;

    /**
     * SMS 발송 대상자 임시 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SmsTmplUserSearchVO
     * @return
     */
    @RequestMapping(value = "/crm/cmm/customerInfo/selectSmsTmplUsers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSmsTmplUsers(@RequestBody SmsTmplUserSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        int total = smsTmplUserService.selectSmsTmplUsersByConditionCnt(searchVO);
        result.setTotal(total);

        if(result.getTotal() != 0){

            result.setData(smsTmplUserService.selectSmsTmplUsersByCondition(searchVO));
        }

        return result;

    }

    /**
     * SMS 발송 대상자 임시 저장
     * @param List<SmsTmplUserVO>
     * @return Inserte SEQ
     */
    @RequestMapping(value = "/crm/cmm/customerInfo/insertSmsTmplUsers.do", method = RequestMethod.POST)
    @ResponseBody
    public int insertSmsTmplUsers(@RequestBody List<SmsTmplUserVO> saveVO) throws Exception {

        return smsTmplUserService.insertSmsTmplUsers(saveVO);

    }


    /**
     * 메시지 템플릿 팝업
     * @return
     */
    @RequestMapping(value = "/crm/cmm/customerInfo/selectMessagePopup.do", method = RequestMethod.GET)
    public String selectMessagePopup(Model model) throws Exception {

        MessageTemplateGroupSearchVO searchGroupVO = new MessageTemplateGroupSearchVO();
        MessageTemplateSearchVO searchVO = new MessageTemplateSearchVO();
        searchVO.setsMesgTmplTp(MessageTemplateVO.MESG_TMPL_TP_SMS);
        model.addAttribute("smsTemplateGroupList", messageTemplateService.selectMessageTemplateGroupsByCondition(searchGroupVO));     // 메시지 템플릿 그룹 목록

        String sysDate = DateUtil.getDate("yyyy-MM-dd HH:mm");
        model.addAttribute("sysDate", sysDate);

        return "/crm/cmm/customerInfo/selectMessagePopup";
    }

    /**
     * 메시지 템플릿 목록
     * @return
     */
    @RequestMapping(value = "/crm/cmm/customerInfo/selectSmsTemplateList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSmsMessageTemplates(@RequestBody MessageTemplateSearchVO searchVO)throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsMesgTmplTp(MessageTemplateVO.MESG_TMPL_TP_SMS);
        result.setData(messageTemplateService.selectMessageTemplatesByCondition(searchVO));     // 메시지 템플릿 목록

        return result;

    }



    /**
     * SMS 메시지 전송
     * @param smsMessageVO - 메시지 정보
     * @return
     */
    @RequestMapping(value = "/crm/cmm/customerInfo/sendSmsMessage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean sendSmsMessage(@Validated @RequestBody SmsMessageVO smsMessageVO)throws Exception {

        return smsMessageService.smsMessageSend(smsMessageVO);
    }




}