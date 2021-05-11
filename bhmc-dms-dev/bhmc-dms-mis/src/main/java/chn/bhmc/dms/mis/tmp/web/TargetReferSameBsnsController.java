package chn.bhmc.dms.mis.tmp.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mis.tmp.service.TargetReferSameBsnsService;
import chn.bhmc.dms.mis.tmp.vo.TargetReferSameBsnsSaveVO;
import chn.bhmc.dms.mis.tmp.vo.TargetReferSameBsnsSearchVO;
/**
 * <pre>
 * [제조사] 동종업계 참조
 * </pre>
 *
 * @ClassName   : TargetReferSameBsnsController.java
 * @Description : [제조사] 동종업계 참조
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetReferSameBsnsController extends HController {

    @Resource(name="baseNames")
    List<String> baseNames;

    /**
     * [제조사] 동종업계 참조
     */
    @Resource(name="targetReferSameBsnsService")
    TargetReferSameBsnsService targetReferSameBsnsService;

    /**
     * [제조사] 동종업계 참조  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetReferSameBsnsMain.do", method = RequestMethod.GET)
    public String selectTargetReferSameBsnsMain(Model model) throws Exception {

        model.addAttribute("dlrCd",              LoginUtil.getDlrCd());
        model.addAttribute("regUsrId",           LoginUtil.getUserId());

        return "/mis/tmp/selectTargetReferSameBsnsMain";
    }

    /**
     * [제조사] 동종업계 참조 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tmp/selectTargetReferSameBsnsMainSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetReferSameBsnsMainSearch(@RequestBody TargetReferSameBsnsSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetReferSameBsnsService.selectTargetReferSameBsnsMainSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(targetReferSameBsnsService.selectTargetReferSameBsnsMainSearch(searchVO));
        }

        return result;

    }

    /**
     * [제조사] 동종업계 참조 목록 정보를 등록한다.
     * @param saveVO - [제조사] 동종업계 참조 목록 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/mis/tmp/targetReferSameBsnsSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean targetReferSameBsnsSave(@Validated @RequestBody TargetReferSameBsnsSaveVO saveVO) throws Exception {

        targetReferSameBsnsService.targetReferSameBsnsSave(saveVO);
        return true;
    }

}
