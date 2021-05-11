package chn.bhmc.dms.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleOsgiController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 3.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class SampleOsgiController {
    @RequestMapping(value = "/samples/osgi/osgiTest.do", method = RequestMethod.GET)
    public String osgiTest(){
        return "osgiTest";
    }
}
