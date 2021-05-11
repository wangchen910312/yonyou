package chn.bhmc.dms.sal.exc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.exc.service.VehicleDlrExcService;
import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcSearchVO;
import chn.bhmc.dms.sal.exc.vo.VehicleDlrExcVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 딜러간차량교환관리
 *
 * @author Kim yewon
 * @since 2016. 4. 27
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.27           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/exc/dlrExc")
public class VehicleDlrExcController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 딜러간차량교환관리 서비스
     */
    @Resource(name="vehicleDlrExcService")
    VehicleDlrExcService vehicleDlrExcService;


    /**
     * 차량,모델,OCN,색상,로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 딜러간차량교환관리  Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleDlrExcMain.do", method = RequestMethod.GET)
    public String selectVehicleDlrExcMain(@RequestParam(value="sysCd", defaultValue="I") String sysCd,Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String toDay = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        String lastDay = DateUtil.getDate("yyyy-MM") +"-"+ DateUtil.getMaximumDateOfMonth(Integer.parseInt(DateUtil.getDate("yyyy")), Integer.parseInt(DateUtil.getDate("MM")));

        model.addAttribute("oneDay", oneDay);
        model.addAttribute("lastDay", lastDay);
        model.addAttribute("toDay", toDay);

        String dlrCd = LoginUtil.getDlrCd();
        String usrId = LoginUtil.getUserId();
        String usrNm = LoginUtil.getUserNm();

        model.addAttribute("dlrCd", dlrCd);
        model.addAttribute("usrId", usrId);
        model.addAttribute("usrNm", usrNm);

        //요청상태 공통코드 목록
        model.addAttribute("reqStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL141", null, langCd));

        //심사결과 공통코드 목록
        model.addAttribute("evalRsltYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL144", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        if(Constants.SYS_CD_CORP.equals(sysCd)){
            model.addAttribute("loginUrl", "DCS");
        }else{
            model.addAttribute("loginUrl", "DMS");
        }


        return "/sal/exc/dlrExc/selectVehicleDlrExcMain";
    }



    /**
     * 딜러간차량교환 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleDlrExcSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleDlrExc.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleDlrExc(@RequestBody VehicleDlrExcSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleDlrExcService.selectVehicleDlrExcByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleDlrExcService.selectVehicleDlrExcByCondition(searchVO));
        }

        return result;
    }


    /**
     * 딜러간차량교환 저장
     */
    @RequestMapping(value = "/saveVehicleDlrExc.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveVehicleDlrExc(@RequestBody VehicleDlrExcVO saveVO) throws Exception {

        vehicleDlrExcService.saveVehicleDlrExc(saveVO);


        return true;
    }



    /**
     * 차량조달신청관리 삭제
     */
    @RequestMapping(value = "/deleteVehicleDlrExc.do", method = RequestMethod.POST)
    public boolean deleteVehicleDlrExc(@RequestBody VehicleDlrExcVO saveVO) throws Exception {

        vehicleDlrExcService.deleteVehicleDlrExc(saveVO);


        return true;
    }




}
