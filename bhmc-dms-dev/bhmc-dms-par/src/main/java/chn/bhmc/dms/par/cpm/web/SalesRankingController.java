package chn.bhmc.dms.par.cpm.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesRankingController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.     In Bo Shim     최초 생성
 * </pre>
 */
@Controller
public class SalesRankingController {

    /**
     * 판매순위 메인 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/salesRanking/selectSalesRankingMain.do", method = RequestMethod.GET)
    public String selectSalesRankingMain(Model model) throws Exception {

        return "/par/cpm/salesRanking/selectSalesRankingMain";
    }
}
