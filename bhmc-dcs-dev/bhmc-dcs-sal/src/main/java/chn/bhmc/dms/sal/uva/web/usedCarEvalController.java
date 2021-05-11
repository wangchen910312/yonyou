package chn.bhmc.dms.sal.uva.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

/**
 *
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.0X.XX         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/uva/usedCarEval")
public class usedCarEvalController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectUsedCarEvalMain.do", method = RequestMethod.GET)
    public String selectUsedCarEvalMain(Model model) throws Exception{

        return "/sal/uva/usedCarEval/selectUsedCarEvalMain";
    }

}
