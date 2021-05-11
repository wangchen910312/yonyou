package chn.bhmc.dms.cmm.nms.web;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.nms.service.NotificationPolicyService;
import chn.bhmc.dms.cmm.nms.service.NotificationTargetService;
import chn.bhmc.dms.cmm.nms.service.NotificationTemplateService;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationExcludeTargetVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicySaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationPolicySearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSaveVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationTemplateVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * 알림정책 관리 컨트롤러
 *
 * @ClassName   : NotificationPolicyController.java
 * @Description : 알림정책 관리 컨트롤러
 * @author Kang Seok Han
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class NotificationPolicyController extends HController {

    /**
     * 알림정책 서비스
     */
    @Resource(name="notificationPolicyService")
    NotificationPolicyService notificationPolicyService;

    /**
     * 알림정책 메세지템플릿 서비스
     */
    @Resource(name="notificationTemplateService")
    NotificationTemplateService notificationTemplateService;
    /**
     * 알림정책 수신대상 서비스
     */
    @Resource(name="notificationTargetService")
    NotificationTargetService notificationTargetService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템설정 정보 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 메시지템플릿 관리 서비스
     */
    @Resource(name="messageTemplateService")
    MessageTemplateService messageTemplateService;

    /**
     * 알림정책 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/selectNotificationPolicyMain.do", method = RequestMethod.GET)
    public String selectNotificationPolicyMain(Model model, HttpServletRequest request)  throws Exception {
    	//직무구분(딜러/제조사)
        String cmpTp = null;
        //시스템구분
        String sysCd = request.getServletContext().getInitParameter("SYS_CD");

        if(Constants.SYS_CD_CORP.equals(sysCd)){
            cmpTp = Constants.CMP_TP_CORP;
        }else{
            cmpTp = Constants.CMP_TP_DLR;
        }
        
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        Calendar calendar = Calendar.getInstance();
        calendar.set(9999, 11, 31);

        String validStartDt = DateUtil.getDate(dateFormat);
        String validEndDt = DateUtil.getDate(calendar.getTime(), dateFormat);
        
        //회사구분
        model.addAttribute("cmpTp", cmpTp);

        model.addAttribute("validStartDt", validStartDt);
        model.addAttribute("validEndDt", validEndDt);
        
        //메세지템플릿 유형 목록
        model.addAttribute("mesgTmplTpList", commonCodeService.selectCommonCodesByCmmGrpCd("COM004", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/cmm/nms/notificationPolicy/selectNotificationPolicyMain";
    }

    /**
     * 알림정책 그룹 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/selectNotificationPolicyGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationPolicyGroups(@RequestBody NotificationPolicySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(notificationPolicyService.selectNotificationPolicyGroupsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(notificationPolicyService.selectNotificationPolicyGroupsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 알림정책그룹을 저장한다
     * @param saveVO - 알림정책그룹 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/multiNotificationPolicyGroups.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiNotificationPolicyGroups(@Validated @RequestBody NotificationPolicyGroupSaveVO saveVO) throws Exception {
        notificationPolicyService.multiNotificationPolicyGroups(saveVO);
        return true;
    }

    /**
     * 알림정책 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationPolicySearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/selectNotificationPolicies.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationPolicies(@RequestBody NotificationPolicySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(notificationPolicyService.selectNotificationPoliciesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(notificationPolicyService.selectNotificationPoliciesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 알림정책을 저장한다.
     * @param saveVO - 알림정책 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/multiNotificationPolicies.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiNotificationPolicies(@Validated @RequestBody NotificationPolicySaveVO saveVO) throws Exception {
        notificationPolicyService.multiNotificationPolicies(saveVO);
        return true;
    }

    /**
     * 알림정책 메세지템플릿 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationTemplateSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/selectNotificationTemplates.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationTemplates(@RequestBody NotificationTemplateSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<NotificationTemplateVO> list = notificationTemplateService.selectNotificationTemplatesByCondition(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }


    /**
     * 알림정책 메세지템플릿을 저장한다.
     * @param saveVO - 알림정책 메세지템플릿 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/multiNotificationTemplates.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiNotificationTemplates(@Validated @RequestBody NotificationTemplateSaveVO saveVO) throws Exception {
        notificationTemplateService.multiNotificationTemplates(saveVO);
        return true;
    }
    
    /**
     * 메시지템플릿 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/selectMessageTemplates.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectMessageTemplates(@RequestBody MessageTemplateSearchVO searchVO) throws Exception {
        searchVO.setsDefaultYn("Y");
        searchVO.setsUseYn("Y");
        SearchResult result = new SearchResult();

        result.setTotal(messageTemplateService.selectMessageTemplatesByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(messageTemplateService.selectMessageTemplatesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 알림정책 수신대상 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationTargetSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/selectNotificationTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationTargets(@RequestBody NotificationTargetSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<NotificationTargetVO> list = notificationTargetService.selectNotificationTargetsByCondition(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 알림정책 수신대상을 저장한다.
     * @param saveVO - 알림정책 수신대상 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/multiNotificationTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiNotificationTargets(@Validated @RequestBody NotificationTargetSaveVO saveVO) throws Exception {
        notificationTargetService.multiNotificationTargets(saveVO);
        return true;
    }

    /**
     * 알림정책 수신제외대상 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationExcludeTargetSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/selectNotificationExcludeTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationExcludeTargets(@RequestBody NotificationExcludeTargetSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        List<NotificationExcludeTargetVO> list = notificationTargetService.selectNotificationExcludeTargetsByCondition(searchVO);

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 알림정책 수신제외대상을 저장한다.
     * @param saveVO - 알림정책 수신대상 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationPolicy/multiNotificationExcludeTargets.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiNotificationExcludeTargets(@Validated @RequestBody NotificationExcludeTargetSaveVO saveVO) throws Exception {
        notificationTargetService.multiNotificationExcludeTargets(saveVO);
        return true;
    }
}
