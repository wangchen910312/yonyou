package chn.bhmc.dms.sal.svo.web;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.OfficeService;
import chn.bhmc.dms.cmm.cmp.vo.OfficeVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.GroupSalesApplicationService;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSaveVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSearchVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVehVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecCarlineService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;

/**
 * 집단 판매신청
 *
 * @author Bong
 * @since 2016. 3. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.20         Bong              최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/svo/groupSalesApplication")
public class GroupSalesApplicationController extends HController {

    /**
     * 시승차량 신청 서비스
     */
    @Resource(name="groupSalesApplicationService")
    private GroupSalesApplicationService groupSalesApplicationService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차종 서비스
     */
    @Resource(name="vehicleSpecCarlineService")
    VehicleSpecCarlineService vehicleSpecCarlineService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 지역사무소 정보 서비스
     */
    @Resource(name="officeService")
    OfficeService officeService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 집단판매신청 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesApplicationMain.do", method = RequestMethod.GET)
    public String selectGroupSalesApplicationMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("strDlrCd", LoginUtil.getDlrCd());
        model.addAttribute("strDlrNm", LoginUtil.getDlrNm());

        if(LoginUtil.getSdptCd() == null || LoginUtil.getDistOfficeCd() == null){
        	model.addAttribute("strOffNm", "");
        }else {
        	OfficeVO officeVO = officeService.selectOfficeByKey(LoginUtil.getSdptCd(),LoginUtil.getDistOfficeCd());
        	model.addAttribute("strOffNm", officeVO.getOffNm());
        }

        String sysDate = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));
        String fifteenDayBf = DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), systemConfigInfoService.selectStrValueByKey("dateFormat"));
        model.addAttribute("sysDate", sysDate);
        model.addAttribute("fifteenDayBf", fifteenDayBf);

        // 상태 SAL184
        model.addAttribute("approveCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL184", null, langCd));
        // 항목 SAL151
        model.addAttribute("atcDstinInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL151", null, langCd));

        //차종 콤보 조회
        VehicleSearchVO vehicleSearchVO = new VehicleSearchVO();
        vehicleSearchVO.setUseYn("Y");

        model.addAttribute("carLineCdInfo", vehicleSpecCarlineService.selectVehicleCarlineByCondition(vehicleSearchVO));

        return "/sal/svo/groupSalesApplication/selectGroupSalesApplicationMain";
    }

    /**
     * 법인 - 집단판매 신청 정보 조회 (Grid)
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSalesApplication(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if(searchVO.getsCallType()!="" && searchVO.getsCallType().equals("req")){       //호출화면이 신청이면
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
            searchVO.setsUsrId(LoginUtil.getUserId());     // 사용자id
        }

        result.setTotal(groupSalesApplicationService.selectGroupSalesApplicationByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(groupSalesApplicationService.selectGroupSalesApplicationByCondition(searchVO));
        }

        return result;
    }

    /**
     * 법인 - 집단판매 신청 상세정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSlaesApplicationDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSlaesApplicationDetail(@RequestBody GroupSalesApplicationVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if(searchVO.getsCallType()!="" && searchVO.getsCallType().equals("req")){       //호출화면이 신청이면
            searchVO.setDlrCd(LoginUtil.getDlrCd());      // 딜러코드
            searchVO.setUsrId(LoginUtil.getUserId());     // 사용자id
        }

        result.setData(groupSalesApplicationService.selectGroupSalesApplicationDetailByCondition(searchVO));

        return result;
    }

    /**
     * 법인 - 집단판매 신청 차량상세정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesApplicationDetVeh.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSlaesApplicationDetailVeh(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if(searchVO.getsCallType()!="" && searchVO.getsCallType().equals("req")){       //호출화면이 신청이면
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
            searchVO.setsUsrId(LoginUtil.getUserId());     // 사용자id
        }

        result.setData(groupSalesApplicationService.selectGroupSalesApplicationDetVehByCondition(searchVO));

        return result;
    }

    /**
     * 법인 - 집단판매 신청 차량 심사정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesApplicationDetJdg.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectGroupSalesApplicationDetJdg(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        if(searchVO.getsCallType()!="" && searchVO.getsCallType().equals("req")){       //호출화면이 신청이면
            searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
            searchVO.setsUsrId(LoginUtil.getUserId());     // 사용자id
        }

        result.setData(groupSalesApplicationService.selectGroupSalesApplicationDetJdgByCondition(searchVO));

        return result;
    }

    /**
     * 법인 - 집단 판매신청 저장/수정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/multiGroupSalesApplication.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> multiGroupSalesApplication(@Validated @RequestBody GroupSalesApplicationSaveVO saveVO) throws Exception {

    	Map<String, Object> result = new HashMap<String, Object>();
    	GroupSalesApplicationVO groupSalesApplicationVO = groupSalesApplicationService.multiGroupSalesApplication(saveVO);

    	result.put("groupSalesApplicationVO", groupSalesApplicationVO);

        return result;

    }

    /**
     * 법인 - 집단 판매신청 확정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateGroupSalesApplicationCnfrm.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> updateGroupSalesApplicationCnfrm(@Validated @RequestBody GroupSalesApplicationVO saveVO) throws Exception {

    	Map<String, Object> result = new HashMap<String, Object>();
    	GroupSalesApplicationVO groupSalesApplicationVO = groupSalesApplicationService.updateGroupSalesApplicationCnfrm(saveVO);

    	result.put("groupSalesApplicationVO", groupSalesApplicationVO);

        return result;
    }

    /**
     * 법인 - 집단 판매신청 삭제
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/deleteGroupSalesApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteGroupSalesApplication(@Validated @RequestBody GroupSalesApplicationVO delVO) throws Exception {

        groupSalesApplicationService.deleteGroupSalesApplication(delVO);
        return true;
    }

    /**
     * 법인 - 집단판매신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectGroupSalesApplicationPopup.do", method = RequestMethod.GET)
    public String selectGroupSalesApplicationPopup(Model model) throws Exception{

        return "/sal/svo/groupSalesApplication/selectGroupSalesApplicationPopup";
    }

    /**
     * 법인 - 집단판매신청 팝업 적용 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/applyGroupSalesApplicationPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult applyGroupSalesApplicationPopup(@RequestBody GroupSalesApplicationSaveVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setData(groupSalesApplicationService.applyGroupSalesApplicationPopup(searchVO));

        return result;
    }

    /**
     * 법인 - 집단 판매신청 저장/수정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/groupSalesApplication.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean groupSalesApplication(@Validated @RequestBody GroupSalesApplicationSaveVO saveVO) throws Exception {

        groupSalesApplicationService.groupSalesApplication(saveVO);

        return true;
    }


    /**
     * 집단판매신청 - 차량조회 팝업.
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectVehiclePopup.do", method = RequestMethod.GET)
    public String selectVehiclePopup(Model model) throws Exception{

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/sal/svo/groupSalesApplication/selectVehiclePopup";
    }

    /**
     * 차량 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleInfoPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleInfoPopup(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(groupSalesApplicationService.selectVehicleInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(groupSalesApplicationService.selectVehicleInfoByCondition(searchVO));
        }
        return result;
    }

    /**
     * 집단판매신청 - 신청된 차량 상세조회.
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectDetlVehPopMain.do", method = RequestMethod.GET)
    public String selectDetlVehPopMain(Model model) throws Exception{

        return "/sal/svo/groupSalesApplication/selectDetlVehPopMain";
    }

    /**
     * 집단판매신청된 차량 상세를 조회한다.
     * @param searchVO -
     * @return
     */
    @RequestMapping(value = "/selectDetlVehPop.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDetlVehPop(@RequestBody GroupSalesApplicationSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(groupSalesApplicationService.selectDetlVehPopByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(groupSalesApplicationService.selectDetlVehPopByCondition(searchVO));
        }
        return result;
    }

    /**
     * 법인 - 집단 판매신청 저장/수정
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/deleteGroupSalesVeh.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteGroupSalesVeh(@Validated @RequestBody GroupSalesApplicationSaveVO saveVO) throws Exception {

        groupSalesApplicationService.deleteGroupSalesVeh(saveVO);

        return true;
    }

    /**
     * 집단판매신청 - 신청차량 파일올리기
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/updateGroupSalesFile.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateGroupSalesFile(@Validated @RequestBody GroupSalesApplicationVehVO vehVO) throws Exception {

        groupSalesApplicationService.updateGroupSalesFile(vehVO);
        return true;
    }

    /**
     * 집단판매신청 - 보충차료파일 업로드
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/saveAddFile.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSaveAddFile(@Validated @RequestBody GroupSalesApplicationVehVO vehVO) throws Exception {

        groupSalesApplicationService.updateSaveAddFile(vehVO);
        return true;
    }

}