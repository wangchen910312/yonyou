package chn.bhmc.dms.cmm.nms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;

import chn.bhmc.dms.cmm.nms.vo.NotificationPolicyGroupVO;

import chn.bhmc.dms.cmm.nms.service.NotificationPolicyService;

import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;

import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationMessageController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class NotificationMessageController extends HController {

    /**
     * 알림메세지 관리 서비스
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    /**
     * 알림정책 서비스
     */
    @Resource(name="notificationPolicyService")
    NotificationPolicyService notificationPolicyService;

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    /**
     * 알림메세지 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationMessageSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationMessage/selectNotifications.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotifications(@RequestBody NotificationMessageSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        searchVO.setsReceiveUsrId(LoginUtil.getUserId());

        result.setTotal(notificationMessageService.selectNotificationMessagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(notificationMessageService.selectNotificationMessagesByCondition(searchVO));
        }

        return result;

    }

    /**
     * Notification 정보 목록 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationInfo/selectNotificationInfoMain.do", method = RequestMethod.GET)
    public String selectNotificationInfoMain(Model model) throws Exception {
        return "/cmm/nms/notificationInfo/selectNotificationInfoMain";
    }

    /**
     * Notification 정보를 수신 처리한다.
     * @param list 수신 처리할 Notification 리스트 목록
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationMessage/updateNotificationInfoRcve.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateNotificationInfoRcve(@RequestBody List<String> list) throws Exception {
        return notificationMessageService.updateNotificationInfoRcve(list);
    }

    /**
     * Todo
     * @param todoNo Todo 번호
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/nms/notificationMessage/updateActionNotificationInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateActionNotificationInfo(@RequestParam(value="mesgId", required=true) String mesgId, HttpServletRequest request) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("needReload", false);
        result.put("needPostAction", false);
        Device device = DeviceUtils.getCurrentDevice(request);

        NotificationMessageVO notificationMessageVO = notificationMessageService.selectNotificationMessageByKey(mesgId);

        //확인여부가 'N'인 경우 확인여부를 'Y'로 변경한다.
        if("N".equals(notificationMessageVO.getReceiveYn())){
            notificationMessageService.updateNotificationInfoRcve(mesgId);
        }

        NotificationPolicyGroupVO notiPolicyGroupVO = notificationPolicyService.selectNotificationPolicyGroupByKey(notificationMessageVO.getAlrtPolicyGrpId());

        if(device.isMobile()){
            if(StringUtils.isNotBlank(notiPolicyGroupVO.getActionUrlMob())){
                ViewInfoVO viewInfoVO = viewInfoService.selectViewInfoByTcd(notiPolicyGroupVO.getActionUrlMob());
                if(viewInfoVO != null){
                    result.put("needPostAction", true);
                    result.put("viewUrl", viewInfoVO.getViewUrl());
                    result.put("viewId", viewInfoVO.getViewId());
                    //result.put("viewParams", todoInfoVO.getActionParams());
                    result.put("tCd", StringUtils.defaultIfBlank(viewInfoVO.gettCd(), ""));

                    String viewNm = "";

                    if(!StringUtils.isBlank(viewInfoVO.getMesgKey())){
                        viewNm = messageSource.getMessage(viewInfoVO.getMesgKey(), null, viewInfoVO.getViewNm(), LocaleContextHolder.getLocale());
                    }else{
                        viewNm = viewInfoVO.getViewNm();
                    }

                    if(!StringUtils.isBlank(viewInfoVO.gettCd())){
                        viewNm = "<span title=\""+viewInfoVO.gettCd()+"\">"+viewNm+"</span>";
                    }

                    result.put("viewNm", viewNm);
                }
            }
        }else{
            if(StringUtils.isNotBlank(notiPolicyGroupVO.getActionUrlWeb())){
                ViewInfoVO viewInfoVO = viewInfoService.selectViewInfoByTcd(notiPolicyGroupVO.getActionUrlWeb());
                if(viewInfoVO != null){
                    result.put("needPostAction", true);
                    result.put("viewUrl", viewInfoVO.getViewUrl());
                    result.put("viewId", viewInfoVO.getViewId());
                    //result.put("viewParams", todoInfoVO.getActionParams());
                    result.put("tCd", StringUtils.defaultIfBlank(viewInfoVO.gettCd(), ""));

                    String viewNm = "";

                    if(!StringUtils.isBlank(viewInfoVO.getMesgKey())){
                        viewNm = messageSource.getMessage(viewInfoVO.getMesgKey(), null, viewInfoVO.getViewNm(), LocaleContextHolder.getLocale());
                    }else{
                        viewNm = viewInfoVO.getViewNm();
                    }

                    if(!StringUtils.isBlank(viewInfoVO.gettCd())){
                        viewNm = "<span title=\""+viewInfoVO.gettCd()+"\">"+viewNm+"</span>";
                    }

                    result.put("viewNm", viewNm);
                }
            }
        }
        return result;

    }

    @RequestMapping(value = "/cmm/nms/notificationInfo/selectNotificationInfoPortlet.do", method = RequestMethod.GET)
    public String selectNotificationInfoPortlet(){
        return "/cmm/nms/notificationInfo/selectNotificationInfoPortlet";
    }




}
