package chn.bhmc.dms.sal.obt.web;


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
import chn.bhmc.dms.sal.obt.service.VehicleObtainReqService;
import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqSearchVO;
import chn.bhmc.dms.sal.obt.vo.VehicleObtainReqVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 차량조달신청관리
 *
 * @author Kim yewon
 * @since 2016. 4. 22
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.22           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/obt/obtReq")
public class VehicleObtainReqController extends HController {


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 차량조달신청관리 서비스
     */
    @Resource(name="vehicleObtainReqService")
    VehicleObtainReqService vehicleObtainReqService;


    /**
     * 차량,모델,OCN,색상,로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 차량조달신청관리  Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleObtainReqMain.do", method = RequestMethod.GET)
    public String selectVehicleObtainReqMain(@RequestParam(value="sysCd", defaultValue="I") String sysCd,Model model) throws Exception {

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


        return "/sal/obt/obtReq/selectVehicleObtainReqMain";
    }



    /**
     * 차량조달신청관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AapMngSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleObtainReq.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleObtainReq(@RequestBody VehicleObtainReqSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(vehicleObtainReqService.selectVehicleObtainReqByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(vehicleObtainReqService.selectVehicleObtainReqByCondition(searchVO));
        }

        return result;
    }


    /**
     * 차량조달신청관리 저장
     */
    @RequestMapping(value = "/saveVehicleObtainReq.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveVehicleObtainReq(@RequestBody VehicleObtainReqVO saveVO) throws Exception {

        vehicleObtainReqService.saveVehicleObtainReq(saveVO);


        return true;
    }



    /**
     * 차량조달신청관리 삭제
     */
    @RequestMapping(value = "/deleteVehicleObtainReq.do", method = RequestMethod.POST)
    public @ResponseBody boolean deleteVehicleObtainReq(@RequestBody VehicleObtainReqVO saveVO) throws Exception {

        vehicleObtainReqService.deleteVehicleObtainReq(saveVO);


        return true;
    }




}
