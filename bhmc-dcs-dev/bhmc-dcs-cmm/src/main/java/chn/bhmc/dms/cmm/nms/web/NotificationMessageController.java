package chn.bhmc.dms.cmm.nms.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
     * 알림메세지 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 NotificationMessageSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/nms/notificationMessage/selectNotifications.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotifications(@RequestBody NotificationMessageSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(notificationMessageService.selectNotificationMessagesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(notificationMessageService.selectNotificationMessagesByCondition(searchVO));
        }

        return result;

    }
}
