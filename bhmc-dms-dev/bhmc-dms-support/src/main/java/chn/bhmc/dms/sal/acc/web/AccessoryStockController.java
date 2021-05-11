package chn.bhmc.dms.sal.acc.web;


import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



/**
 * 용품 입고
 *
 * @author HG Lee
 * @since 2017. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.18           HG Lee            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/acc/accessoryStock")
public class AccessoryStockController extends HController {

    /**
     * 용품마스터현황 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectAccessoryStockMain.do", method = RequestMethod.GET)
    public String selectAccessoryConditionMain(Model model,
            @RequestParam(value="accessoryMngNo",    required = false, defaultValue="") String accessoryMngNo
    ) throws Exception {

        return "/sal/acc/accessoryStock/selectAccessoryStockMain";
    }
}
