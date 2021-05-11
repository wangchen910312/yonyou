package chn.bhmc.dms.mob.cmm.web;


import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * 모바일 로그인
 *
 * @author Kim In
 * @since 2016. 3. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2016.03.18       Kim In          최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/cmm/scan")
public class MobScanController extends HController {

    /**
     * 바코드스켄연동 화면.
     * @return
     */
    @RequestMapping(value = "/selectScanMain.do", method = RequestMethod.GET)
    public String selectScanMain(Model model) throws Exception {
        return "/mob/cmm/sacn/selectScanMain";
    }

    /**
     * 바코드스켄연동 결과목록.
     * @param SearchVO
     * @return
     */
    @RequestMapping(value = "/selectScanResults.do", method = RequestMethod.POST)
    public SearchResult selectScanResults(@RequestBody SearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        return result;
    }
}
