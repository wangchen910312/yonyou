package chn.bhmc.migdms.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.migdms.cmm.service.MigTestService;

/**
 * 공통 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class MigTestController extends HController {

    /**
     * 통화정보 관리 서비스
     */
    @Resource(name="migTestService")
    MigTestService migTestService;

    /**
     * 소스배포 서버에서 체크하기 위한 URL
     *
     * @return
     */
    @RequestMapping(value = "/mig/selectMigTest.do", method = RequestMethod.GET)
    public void selectMigTest(){
        try {
            migTestService.selectMigTest();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
