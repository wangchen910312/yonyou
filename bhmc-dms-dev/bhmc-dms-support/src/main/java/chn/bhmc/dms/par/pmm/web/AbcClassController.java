package chn.bhmc.dms.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.par.pmm.service.AbcClassService;

/**
 * ABC클래스 관리 컨트롤러
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Controller
public class AbcClassController extends HController {


    /**
     * ABC클래스 관리 서비스
     */
    @Resource(name="abcClassService")
    AbcClassService abcClassService;


    /**
     * 품목마스터 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/abcClass/selectAbcClassMain.do", method = RequestMethod.GET)
    public String selectAbcClassMain(Model model) throws Exception  {


        return "/par/pmm/abcClass/selectAbcClassMain";
    }
}
