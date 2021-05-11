package chn.bhmc.dms.mob.crm.cif.web;

import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : MobCustInfoRefOffController.java
 * @Description : 고객등록 컨트롤러
 * @author Sung sin Park
 * @since 2016. 6. 02.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 02.     Sung sin Park     최초 생성
 * </pre>
 */

@Controller
public class MobCustInfoRefOffController extends HController {

    /**
     * 고객등록 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustInfoRegOffMain.do", method = RequestMethod.GET)
    public String selectCustInfoRegOffMain(Model model, HttpServletRequest request) throws Exception {
        return "/mob/crm/cif/customerInfo/selectCustInfoRegOffMain";
    }

    /**
     * 고객등록 데이터 목록.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustInfoRegOffList.do", method = RequestMethod.GET)
    public String selectCustInfoRegOffList(Model model) throws Exception {

        return "/mob/crm/cif/customerInfo/selectCustInfoRegOffList";
    }


    /**
     * 오프라인 등록 화면을 출력한다.
     *
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustInfoOffLineRegMain.do", method = RequestMethod.GET)
    public String selectCustInfoOffLineRegMain(Model model, HttpServletRequest request) throws Exception {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        return "/mob/crm/cif/customerInfo/selectCustInfoOffLineRegMain";
    }

    /**
     * 오프라인 등록 데이터 목록.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 CustomerInfoSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/mob/crm/cif/customerInfo/selectCustInfoOffLineRegList.do", method = RequestMethod.GET)
    public String selectCustInfoOffLineRegList(Model model) throws Exception {

        return "/mob/crm/cif/customerInfo/selectCustInfoOffLineRegList";
    }
}
