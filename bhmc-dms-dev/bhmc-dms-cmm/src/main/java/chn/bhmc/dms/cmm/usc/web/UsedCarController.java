package chn.bhmc.dms.cmm.usc.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.usc.service.UsedCarService;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarController
 * @Description : 중고차 사이트 - 브랜드/차종/차관 조회
 * @author Choi KyungYong
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 3. 3.     Choi KyungYong            최초 생성
 * </pre>
 */

@Controller
public class UsedCarController extends HController {
    /**
     * 수선시스템 - 브랜드 리스트 조회
     */
    @Resource(name="usedCarService")
    UsedCarService usedCarService;

    @ResponseBody
    @RequestMapping(value = "/cmm/usc/usedCar/selectUsedCarBrandList.do", method = RequestMethod.GET)
    public SearchResult selectUsedCarBrandList() throws Exception {
        SearchResult result = new SearchResult();

        result.setData(usedCarService.selectUsedCarBrandList());

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/cmm/usc/usedCar/selectUsedCarModelList.do", method = RequestMethod.GET)
    public SearchResult selectUsedCarModelList(@RequestParam("manufacturerid") String manufacturerid) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(usedCarService.selectUsedCarModelList(manufacturerid));

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/cmm/usc/usedCar/selectUsedCarLineList.do", method = RequestMethod.GET)
    public SearchResult selectUsedCarStyleList(@RequestParam("modelid") String modelid) throws Exception {
        SearchResult result = new SearchResult();

        result.setData(usedCarService.selectUsedCarStyleList(modelid));

        return result;
    }
}