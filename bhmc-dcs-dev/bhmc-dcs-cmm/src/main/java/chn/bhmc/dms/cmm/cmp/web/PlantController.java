package chn.bhmc.dms.cmm.cmp.web;

import java.util.ArrayList;
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

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.PlantService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CalendarVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 센터 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class PlantController extends HController {

    /**
     * 센터 관리 서비스
     */
    @Resource(name="plantService")
    PlantService plantService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 센터 관리 메인 화면을 출력한다. - DCS
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/plant/selectPlantMain.do", method = RequestMethod.GET)
    public String selectPlantMain(Model model) throws Exception {


        //TODO [한강석] 캘린더 서비스 연결
        List<CalendarVO> calendarList = new ArrayList<CalendarVO>();
        CalendarVO c1 = new CalendarVO();
        c1.setCalendarId("01");
        c1.setCalendarNm("달력1");

        CalendarVO c2 = new CalendarVO();
        c2.setCalendarId("02");
        c2.setCalendarNm("달력2");

        calendarList.add(c1);
        calendarList.add(c2);

        model.addAttribute("calendarList", calendarList);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/cmp/plant/selectPlantMain";
    }

    /**
     * 센터 관리 메인 화면을 출력한다. - DMS
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/plant/selectPlantMain2.do", method = RequestMethod.GET)
    public String selectPlantMain2(Model model) throws Exception {


        //TODO [한강석] 캘린더 서비스 연결
        List<CalendarVO> calendarList = new ArrayList<CalendarVO>();
        CalendarVO c1 = new CalendarVO();
        c1.setCalendarId("01");
        c1.setCalendarNm("달력1");

        CalendarVO c2 = new CalendarVO();
        c2.setCalendarId("02");
        c2.setCalendarNm("달력2");

        calendarList.add(c1);
        calendarList.add(c2);

        model.addAttribute("calendarList", calendarList);
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/cmm/cmp/plant/selectPlantMain2";
    }

    /**
     * 딜러 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/plant/selectDealers.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealers() throws Exception {
        SearchResult result = new SearchResult();

        DealerSearchVO searchVO = new DealerSearchVO();

        result.setData(dealerService.selectDealersByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;
    }

    /**
     * 딜러 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/plant/selectDealersForSuggest.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealersForSuggest(@RequestBody DealerSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(dealerService.selectDealersForSuggest(searchVO.getsText(), searchVO.getRecordCountPerPage()));
        result.setTotal(result.getData().size());
        return result;
    }

    /**
     * 센터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PlantSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/plant/selectPlants.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPlants(@RequestBody PlantSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(plantService.selectPlantsByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(plantService.selectPlantsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 센터 정보를 등록한다.
     * @param saveVO - 센터정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/plant/multiPlants.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPlants(@Validated @RequestBody PlantSaveVO saveVO) throws Exception {
        plantService.multiPlants(saveVO);
        return true;

    }

    /**
     * 센터 정보를 등록한다.
     * @param plantVO - 센터 정보 VO
     * @return
     */
//    @RequestMapping(value = "/cmm/cmp/plant/insertPlant.do", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean insertPlant(@Validated(Draft.class) @RequestBody PlantVO plantVO) throws Exception {
//        plantVO.setRegUsrId(LoginUtil.getUserId());
//        plantService.insertPlant(plantVO);
//        return true;
//    }

    /**
     * 센터 정보를 수정한다.
     * @param plantVO - 센터 정보 VO
     * @return
     */
//    @RequestMapping(value = "/cmm/cmp/plant/updatePlant.do", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean updatePlant(@Validated(Modify.class) @RequestBody PlantVO plantVO) throws Exception {
//        plantVO.setUpdtUsrId(LoginUtil.getUserId());
//        plantService.updatePlant(plantVO);
//        return true;
//    }

    /**
     * 센터 정보를 삭제한다.
     * @param plantVO - 센터 정보 VO
     * @return
     */
//    @RequestMapping(value = "/cmm/cmp/plant/deletePlant.do", method = RequestMethod.POST)
//    @ResponseBody
//    public boolean deletePlant(@RequestBody PlantVO plantVO) throws Exception {
//        plantService.deletePlant(plantVO);
//        return true;
//    }

}
