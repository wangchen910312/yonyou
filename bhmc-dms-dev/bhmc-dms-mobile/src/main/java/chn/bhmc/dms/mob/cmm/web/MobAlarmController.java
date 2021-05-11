package chn.bhmc.dms.mob.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageSearchVO;
import chn.bhmc.dms.cmm.nms.vo.NotificationMessageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * 알람
 *
 * @author Kim In
 * @since 2016. 3. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2016.03.18       Kim In          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/cmm/alarm")
public class MobAlarmController extends HController {

    /**
     * 알람
     */
    //서비스 확인 요망
    //@Resource(name="AlarmService")
    //private AlarmService AlarmService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 알림메세지 관리 서비스
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;
    /**
     * 알람 목록
     * @return
     */
    @RequestMapping(value = "/__selectAlarmMain.do", method = RequestMethod.GET)
    public String __selectAlarmMain(Model model) throws Exception{

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        return "/mob/cmm/alarm/selectAlarmMain";
    }

    @RequestMapping(value = "/selectAlarmMain.do", method = RequestMethod.GET)
    public String selectAlarmMain(Model model) throws Exception{

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        model.addAttribute("_urlBaseJsp", "/WEB-INF/jsp/ZnewMob/cmm/alarm/baseJsp/selectAlarmMain.jsp");
        return "/ZnewMob/templatesNewMob/mobTemplateA";
    }

    /**
     * 알람 목록 리스트 조회
     * @return
     */
    @RequestMapping(value = "/selectAlarmList.do", method = RequestMethod.GET)
    public String selectAlarmList(Model model) throws Exception{
        return "/mob/cmm/alarm/selectAlarmList";
    }

    /**
     * 알람 목록 리스트 조회
     * @return
     */
    @RequestMapping(value = "/selectAlarm.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAlarm(@RequestBody NotificationMessageSearchVO searchVO) throws Exception{
        SearchResult result = new SearchResult();

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();


        //sReceiveUsrId : 사용자 ID
        //sMesgTp : 메세지유형 -> PUSH
        //sSendYn : 전송여부 -> Y

        searchVO.setsReceiveUsrId(mobLoginVO.getUserId());
      //searchVO.setsMesgTp("PUSH");
        searchVO.setsMesgTp("P");
        searchVO.setsSendYn("Y");

        result.setTotal(notificationMessageService.selectNotificationMessagesByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(notificationMessageService.selectNotificationMessagesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 로그인 후 미확인 알림 데이터 건수를 조회한다.
     * @return
     */
    @RequestMapping(value = "/selectAlarmCnt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAlarmCnt(@RequestBody NotificationMessageSearchVO searchVO)  throws Exception  {

        SearchResult result = new SearchResult();
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();


        //sReceiveUsrId : 사용자 ID
        //sMesgTp : 메세지유형 -> PUSH
        //sSendYn : 전송여부 -> Y
        //sReceiveYn : 수신여부 -> N

        searchVO.setsReceiveUsrId(mobLoginVO.getUserId());
        searchVO.setsMesgTp("P");
        searchVO.setsSendYn("Y");
        searchVO.setsReceiveYn("N");

        result.setTotal(notificationMessageService.selectNotificationMessagesByConditionCnt(searchVO));

        return result;
    }

    /**
     * 알림 데이터 읽기 update
     */
    @RequestMapping(value = "/updateAlarm.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateAlarm(@RequestBody NotificationMessageVO searchVO) throws Exception {

        notificationMessageService.updateReceive(searchVO.getMesgId());

        return true;
    }

    /**
     * 알림 데이터 삭제 delete
     */
    @RequestMapping(value = "/deleteAlarm.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAlarm(@RequestBody NotificationMessageVO searchVO) throws Exception {

        notificationMessageService.deleteNotificationMessage(searchVO.getMesgId());

        return true;
    }
}
