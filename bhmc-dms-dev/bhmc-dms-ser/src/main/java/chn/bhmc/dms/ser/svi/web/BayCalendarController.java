package chn.bhmc.dms.ser.svi.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.BayCalendarService;
import chn.bhmc.dms.ser.svi.vo.BayCalendarSaveVO;
import chn.bhmc.dms.ser.svi.vo.BayCalendarSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayCalendarController.java
 * @Description : Bay Calendar 컨트롤러
 * @author Kwon Ki Hyun
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class BayCalendarController extends HController{


    @Resource(name="bayCalendarService")
    BayCalendarService bayCalendarService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * Bay Calendar 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayCalendarMain.do", method = RequestMethod.GET)
    public String selectBayCalendarMain(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysdate", DateUtil.getDate(dateFormat));

        return "/ser/svi/bayManage/selectBayCalendarMain";

    }

    /**
     * Bay Calendar 관리 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회조건이 포함된 BayCalendarSearchVO
     * @return 관리 목록 데이터
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayCalendarMains.do", method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectBayCalendarMains(@RequestBody BayCalendarSearchVO searchVO) throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(bayCalendarService.selectBayCalendarMainsByConditionCnt(searchVO));

        if(result.getTotal() != 0 ){
            result.setData(bayCalendarService.selectBayCalendarMainsByCondition(searchVO));
        }


        return result;

    }

    /**
     * Bay Calendar 정보를 저장/수정/삭제한다.
     *
     * @param saveVO - 등록/수정/삭제 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    @RequestMapping(value="/ser/svi/bayManage/multiBayCalendars.do" , method=RequestMethod.POST)
    @ResponseBody
    public boolean multiBayCalendars(@RequestBody BayCalendarSaveVO saveVO)throws Exception{

        bayCalendarService.multiBayCalendars(saveVO);

        return true;

    }

}
