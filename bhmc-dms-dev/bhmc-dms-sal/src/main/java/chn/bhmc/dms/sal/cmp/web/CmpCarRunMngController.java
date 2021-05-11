package chn.bhmc.dms.sal.cmp.web;


import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.vo.UserSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmp.service.CmpCarRunMngService;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSaveVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSearchVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngVO;
import chn.bhmc.dms.sal.veh.service.VehicleSpecComboCommService;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecSearchVO;



/**
 * 회사차운행관리
 *
 * @author Kim yewon
 * @since 2016. 4. 19
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.19           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/cmp/cmpCarRunMng")
public class CmpCarRunMngController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차관적용차량스펙콤보서비스
     */
    @Resource(name="vehicleSpecComboCommService")
    VehicleSpecComboCommService vehicleSpecComboCommService;

    /**
     * 회사차운행관리 서비스
     */
    @Resource(name="cmpCarRunMngService")
    CmpCarRunMngService cmpCarRunMngService;


    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 회사차운행관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCmpCarRunMngMain.do", method = RequestMethod.GET)
    public String selectCmpCarRunMngMain(Model model) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));
        String after2Years = DateUtil.getDate(DateUtil.add(new Date(), Calendar.MONTH, +24), dateFormat);
        String loginUserId = LoginUtil.getUserId();
        String loginUserIdAndNm = "["+LoginUtil.getUserId()+"]"+LoginUtil.getUserNm();

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("toDay", toDay);
        model.addAttribute("after2Years", after2Years);
        model.addAttribute("loginUserId", loginUserId);
        model.addAttribute("loginUserIdAndNm", loginUserIdAndNm);

        //회사차구분 공통코드 목록
        model.addAttribute("cmpCarDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));

        //회사차상태
        model.addAttribute("cmpCarStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL219", null, langCd));

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        UserSearchVO searchVO = new UserSearchVO();
        model.addAttribute("userListDs",userService.selectUsersByCondition(searchVO));

        cmpCarRunMngService.updateCmpCarMngDoneVheicle();

        return "/sal/cmp/cmpCarRunMng/selectCmpCarRunMngMain";
    }



    /**
     * 회사차운행관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AapMngSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCmpCarRunMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCmpCarRunMng(@RequestBody CmpCarRunMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(cmpCarRunMngService.selectCmpCarRunMngByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cmpCarRunMngService.selectCmpCarRunMngByCondition(searchVO));
        }

        return result;
    }

    /**
     * 회사차운행관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CmpCarRunMngSearchVO
     * @return
     */
    @RequestMapping(value = "/selectCmpCarRunMngSub.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCmpCarRunMngSub(@RequestBody CmpCarRunMngSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(cmpCarRunMngService.selectCmpCarRunMngSubCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cmpCarRunMngService.selectCmpCarRunMngSub(searchVO));
        }

        return result;
    }

    /**
     * 회사차운형관리 저장
     */
    @RequestMapping(value = "/saveCmpCarRunMng.do", method = RequestMethod.POST)
    @ResponseBody
    public String saveCmpCarRunMng(@RequestBody CmpCarRunMngVO saveVO) throws Exception {

        //saveVO.setUserId(LoginUtil.getUserId());

        String result = cmpCarRunMngService.saveCmpCarRunMng(saveVO);

        return result;
    }


    /**
     * 회사차운형관리 삭제
     */
    @RequestMapping(value = "/deleteCmpCarRunMng.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteCmpCarRunMng(@RequestBody CmpCarRunMngVO saveVO) throws Exception {

        cmpCarRunMngService.deleteCmpCarRunMng(saveVO);


        return true;
    }

    /**
     * 해당 VIN의 최종 주행거리를 조회.
     */
    @RequestMapping(value = "/selectUseKmVal.do", method = RequestMethod.POST)
    @ResponseBody
    public String selectUseKmVal(@RequestBody CmpCarRunMngSearchVO searchVO) throws Exception {
        String result = "";

        if(StringUtils.isEmpty(searchVO.getsVinNo())){
        	return result;
        } else {
            return cmpCarRunMngService.selectUseKmVal(searchVO.getsVinNo());
        }

    }

    @RequestMapping(value="/saveCmpCarRunMngMain.do", method=RequestMethod.POST)
    @ResponseBody
    public boolean saveCmpCarRunMngMain(@RequestBody CmpCarRunMngSaveVO saveVO) throws Exception {
        cmpCarRunMngService.saveCmpCarRunMngMain(saveVO);
        return true;
    }

    @RequestMapping(value="/saveCmpCarRunMngSub.do", method=RequestMethod.POST)
    @ResponseBody
    public boolean saveCmpCarRunMngSub(@RequestBody CmpCarRunMngSaveVO saveVO) throws Exception {
        cmpCarRunMngService.saveCmpCarRunMngSub(saveVO);
        return true;
    }

    /**
     * 차량마스터 조회 팝업 호출
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectVehicleMasterPopup.do", method = RequestMethod.GET)
    public String selectVehicleMasterPopup(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //차종
        VehicleSpecSearchVO vehicleSpecSearchVO = new VehicleSpecSearchVO();
        model.addAttribute("carLineCdInfo", vehicleSpecComboCommService.selectCarlineCombo(vehicleSpecSearchVO));

        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));

        //회사차구분 공통코드 목록
        model.addAttribute("cmpCarDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd));

        return "/sal/cmp/cmpCarRunMng/selectCmpCarRunMngSrchVhieclePopup";
    }

    /**
     * 차량마스터 조회
     * @param searchVO - 조회 조건을 포함하는 CmpCarRunMngSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterPopupSrch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleMasterPopupSrch(@RequestBody CmpCarRunMngSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        SearchResult result = new SearchResult();

        searchVO.setsLangCd(langCd);

        result.setTotal(cmpCarRunMngService.selectVehicleMasterPopupSrchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(cmpCarRunMngService.selectVehicleMasterPopupSrch(searchVO));
        }

        return result;
    }
}