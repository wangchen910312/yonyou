package chn.bhmc.dms.mis.tdp.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import chn.bhmc.dms.mis.tdp.service.TargetDcptPcsService;
/**
 * <pre>
 * 목표분해 흐름도
 * </pre>
 *
 * @ClassName   : TargetDcptPcsController.java
 * @Description : 목표분해 흐름도
 * @author chibeom.song
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.   chibeom.song     최초 생성
 * </pre>
 */

@Controller
public class TargetDcptPcsController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * 목표분해 흐름도 서비스
     */
    //@Resource(name="targetDcptPcsService")
    //TargetDcptPcsService targetDcptPcsService;

    /**
     * 목표분해 흐름도 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tdp/selectTargetDcptPcsMain.do", method = RequestMethod.GET)
    public String selectTargetDcptPcsMain(Model model) throws Exception {
        //model.addAttribute("supportedLangs", systemConfigInfoService.selectStrValuesByKey("supportLangs"));
        model.addAttribute("baseNames", baseNames);

        return "/mis/tdp/selectTargetDcptPcsMain";
    }

}
