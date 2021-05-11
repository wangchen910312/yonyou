package chn.bhmc.dms.mob.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * 달력
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
@RequestMapping(value = "/mob/cmm/calendar")
public class MobCalendarController extends HController {

    /**
     * 달력
     */
    //서비스 확인 요망
    //@Resource(name="CalendarService")
    //private CalendarService CalendarService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 달력 목록
     * @return
     */
    @RequestMapping(value = "/selectCalendarMain.do", method = RequestMethod.GET)
    public String selectCalendarMain(Model model) throws Exception{

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

        return "/mob/cmm/calendar/selectCalendarMain";
    }

    /**
     * 달력 목록 리스트 조회
     * @return
     */
    @RequestMapping(value = "/selectCalendarList.do", method = RequestMethod.GET)
    public String selectCalendarList(Model model) throws Exception{
        return "/mob/cmm/calendar/selectCalendarList";
    }

    /**
     * 일별 목록
     * @return
     */
    @RequestMapping(value = "/selectDailyMain.do", method = RequestMethod.GET)
    public String selectDailyMain(Model model) throws Exception{

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

        return "/mob/cmm/calendar/selectDailyMain";
    }

    /**
     * 일별 목록 리스트 조회
     * @return
     */
    @RequestMapping(value = "/selectDailyList.do", method = RequestMethod.GET)
    public String selectDailyList(Model model) throws Exception{
        return "/mob/cmm/calendar/selectDailyList";
    }
}
