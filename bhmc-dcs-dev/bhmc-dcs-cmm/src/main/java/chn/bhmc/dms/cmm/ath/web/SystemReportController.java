package chn.bhmc.dms.cmm.ath.web;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 시스템 통계 컨트롤러
 *
 * @author Choi Kyung Yong
 * @since 2016. 2. 22.
 * @version 1.0
 * @see <pre>
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.23         Choi Kyung Yong          최초 생성
 * </pre>
 */

@Controller
public class SystemReportController extends HController {

    /**
     * 시스템 로그인 통계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/systemReport/selectLoginReportMain.do")
    public String selectLoginMain() throws Exception {
        return "/cmm/ath/systemReport/selectLoginReportMain";
    }

    /**
     * 메뉴 접속 통계 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ath/systemReport/selectScreenAccessReportMain.do")
    public String selectScreenAccessReportMain() throws Exception {
        return "/cmm/ath/systemReport/selectScreenAccessReportMain";
    }
}
