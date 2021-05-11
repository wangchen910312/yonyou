package chn.bhmc.dms.cmm.sci.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.DistCodeService;
import chn.bhmc.dms.cmm.sci.vo.DistCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.DistCodeSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * 지역코드 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class DistCodeController extends HController {
    /**
     * 지역 관리 서비스
     */
    @Resource(name="distCodeService")
    DistCodeService distCodeService;

    /**
     * 지역 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/distCode/selectDistCodeMain.do", method = RequestMethod.GET)
    public String selectDistCodeMain()  throws Exception {
        return "/cmm/sci/distCode/selectDistCodeMain";
    }

    /**
     * 지역 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DistCodeSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/distCode/selectDistCodes.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDistCodes(@RequestBody DistCodeSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(distCodeService.selectDistCodesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(distCodeService.selectDistCodesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 지역 정보를 등록한다.
     * @param saveVO - 지역정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/sci/distCode/multiDistCodes.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiDistCodes(@Validated @RequestBody DistCodeSaveVO saveVO) throws Exception {
        distCodeService.multiDistCodes(saveVO);
        return true;

    }
}
