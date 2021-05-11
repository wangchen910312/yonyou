package chn.bhmc.dms.mis.tdf.web;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <pre>
 * 목표 분해 흐름도
 * </pre>
 *
 * @ClassName   : TargetDcptFlowController.java
 * @Description : 목표 분해 흐름도
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */

@Controller
public class TargetDcptFlowController extends HController {

    /**
     * 목표분해 흐름도 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdf/selectTargetDcptFlowMain.do", method = RequestMethod.GET)
    public String selectTargetDcptFlowMain(Model model) throws Exception {

        return "/mis/tdf/selectTargetDcptFlowMain";
    }

}
