package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.svi.service.RunDistValManageService;
import chn.bhmc.dms.ser.svi.vo.RunDistValManageVO;
import chn.bhmc.dms.ser.svi.vo.RunDistValSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RunDistValManageController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 12.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Controller
public class RunDistValManageController extends HController {


    @Resource(name="runDistValManageService")
    RunDistValManageService runDistValManageService;

    /**
     * 수행거리 수정 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/runDistValManage/selectRunDistValManageMain.do", method=RequestMethod.GET)
    public String selectRunDistValManageMain(Model model) throws Exception {

        return "/ser/svi/runDistValManage/selectRunDistValManageMain";

    }

    /**
     * 수행거리 수정 메인
     * @param
     * @return
     */
    @RequestMapping(value = "/ser/svi/runDistValManage/selectRunDistValPopup.do", method=RequestMethod.GET)
    public String selectRunDistValPopup(Model model) throws Exception {

        return "/ser/svi/runDistValManage/selectRunDistValPopup";

    }


    /**
     * 수행거리 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/runDistValManage/selectRunDistValManage.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRunDistValManage(@RequestBody RunDistValSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(runDistValManageService.selectRunDistValManagesByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(runDistValManageService.selectRunDistValManagesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 수행거리 수정
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/svi/runDistValManage/updateVinRunDistVal.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateVinRunDistVal(@RequestBody RunDistValManageVO runDistValManageVO) throws Exception {

        runDistValManageService.updateVinRunDistVal(runDistValManageVO);

        return true;
    }





}
