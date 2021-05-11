package chn.bhmc.dms.dply.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.service.NotificationService;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationHistorySearchVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationReceiverSaveVO;
import chn.bhmc.dms.dply.cmm.vo.NotificationReceiverSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JobSchMngController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheolman Man Oh
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     Cheolman Man Oh     최초 생성
 * </pre>
 */

@Controller
public class NotificationMngController extends HController {

    /**
     * Notification 관리 서비스
     */
    @Resource(name="notificationService")
    NotificationService notificationService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 형상관리 공통업무 관리 서비스
     */
    @Resource(name="dplyCmmService")
    DplyCmmService dplyCmmService;


    /**
     * Notification Receiver 등록 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/noti/selectNotificationReceiverMngMain.do", method = RequestMethod.GET)
    public String selectNotificationReceiverMngMain(Model model) throws Exception {

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        return "/dply/cmm/noti/selectNotificationReceiverMngMain";
    }

    /**
     * Notification Receiver List를 조회한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/noti/selectNotificationReceiver.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationReceiver(@RequestBody NotificationReceiverSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(notificationService.selectNotificationReceiverByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(notificationService.selectNotificationReceiverByCondition(searchVO));
        }

        return result;

    }

    // Notification Receiver 신규 등록, 수정
    @RequestMapping(value = "/dply/cmm/noti/multiNotificationReceiver.do", method = RequestMethod.POST)
    @ResponseBody
    public String multiNotificationReceiver(@RequestBody NotificationReceiverSaveVO saveVO) throws Exception {
        return notificationService.multiNotificationReceiver(saveVO);

    }


    /**
     * Notification History 조회 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/noti/selectNotificationHistoryMain.do", method = RequestMethod.GET)
    public String selectNotificationHistoryMain(Model model) throws Exception {

        DplyCmmSearchVO dplyCmmSearchVO = new DplyCmmSearchVO();
        model.addAttribute("cmmPrtyDS", dplyCmmService.selectCmmPrtyList(dplyCmmSearchVO));

        // Notification Type
        model.addAttribute("notificationTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("COM033", null, LocaleContextHolder.getLocale().getLanguage()));

        return "/dply/cmm/noti/selectNotificationHistoryMain";
    }

    /**
     * Notification History List를 조회한다.
     * @return
     */
    @RequestMapping(value = "/dply/cmm/noti/selectNotificationHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectNotificationHistory(@RequestBody NotificationHistorySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(notificationService.selectNotificationHistoryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(notificationService.selectNotificationHistoryByCondition(searchVO));
        }

        return result;

    }




}
