package chn.bhmc.dms.par.dlm.web;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 수불유형 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee      최초 생성
 * </pre>
 */

@Controller
public class EndingStockController extends HController {

    /**
     * 수불유형 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/dlm/movement/selectEndingStockMain.do", method = RequestMethod.GET)
    public String selectEndingStockMain(Model model) throws Exception {

        return "/par/dlm/movement/selectEndingStockMain";

    }
}
