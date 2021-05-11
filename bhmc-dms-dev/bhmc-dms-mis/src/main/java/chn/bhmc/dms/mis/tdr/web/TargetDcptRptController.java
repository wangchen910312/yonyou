package chn.bhmc.dms.mis.tdr.web;

import java.util.Calendar;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.mis.tdr.vo.TargetDcptRptVO;
/**
 * <pre>
 * 목표분해 보고서
 * </pre>
 *
 * @ClassName   : TargetDcptRptController.java
 * @Description : 목표분해 보고서
 * @author chibeom.song
 * @since 2016. 9. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 21.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetDcptRptController extends HController {

    /**
     * 목표분해 보고서 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdr/selectTargetDcptRptMain.do", method = RequestMethod.GET)
    public String selectTargetDcptRptMain(Model model) throws Exception {

        return "/mis/tdr/selectTargetDcptRptMain";
    }

    /**
     * [딜러사] 목표분해 보고서 메인을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdr/selectTargetDcptRptMainReport.do")
    public String selectTargetDcptRptMainReport(Model model, TargetDcptRptVO targetDcptRptVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        String newStatusDate = "";

        targetDcptRptVO.setsMonitorRptDate(targetDcptRptVO.getsMonitorRptDate());

        if(targetDcptRptVO.getsMonitorRptDate() == null || targetDcptRptVO.getsMonitorRptDate() == ""){

            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }

            if(statusDate < 10 ) {
                newStatusDate = "0" + String.valueOf(statusDate);
            } else {
                newStatusDate = String.valueOf(statusDate);
            }

            targetDcptRptVO.setsMonitorRptDate(String.valueOf(statusYear)+newStatusMonth+newStatusDate);

        }

        model.addAttribute("targetDcptRptVO", targetDcptRptVO);

        return "/mis/tdr/selectTargetDcptRptMainReport";
    }

}
