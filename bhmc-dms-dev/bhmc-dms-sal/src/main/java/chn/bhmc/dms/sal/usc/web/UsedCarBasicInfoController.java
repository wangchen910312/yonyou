package chn.bhmc.dms.sal.usc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.sal.veh.service.CarInfoService;



/**
 * 중고차치환판매심사결과
 *
 * @author Kim yewon
 * @since 2016. 5. 23
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.23           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/uscBasicInfo")
public class UsedCarBasicInfoController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 고객인도관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectUscBasicInfoMain.do", method = RequestMethod.GET)
    public String selectUscBasicInfoMain(Model model) throws Exception {

        return "/sal/usc/uscBasicInfo/selectUscBasicInfoMain";
    }



}
