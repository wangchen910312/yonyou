package chn.bhmc.dms.sal.usc.web;


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

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.usc.service.UsedCarService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.service.UsedCarMasterService;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSaveVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSearchVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 중고차차량마스터
 *
 * @author Kim yewon
 * @since 2016.05.31
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자               수정내용
 *  -------------    ------------    ---------------------------
 *   2016.05.31       Kim yewon             최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/carMaster")
public class UsedCarMasterController extends HController {


    /**
     * 차량마스터 서비스
     */
    @Resource(name="usedCarMasterService")
    UsedCarMasterService usedCarMasterService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN,색상,로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 중고차 매입관리
     */
    @Resource(name="purcEvalService")
    PurcEvalService purcEvalService;


    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 중고차 조회 서비스
     */
    @Resource(name="usedCarService")
    UsedCarService usedCarService;

    /**
     * 중고차량마스터  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectUsedCarMasterMain.do", method = RequestMethod.GET)
    public String selectUsedCarMasterMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);


        //차량상태 SAL001
        model.addAttribute("carStatList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        //계약유형(판매유형) SAL003
        model.addAttribute("saleTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        //매입경로 SAL027
        model.addAttribute("purcPathNmList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL027", null, langCd));
        //자사구분 SAL118
        model.addAttribute("corpCarDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL118", null, langCd));
        //차량브랜드
        model.addAttribute("carBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL181", null, langCd));
        //판매상태
        model.addAttribute("saleStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL182", null, langCd));
        //금액구간
        model.addAttribute("saleEvalAmtList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL193", null, langCd));

        // 공통코드 : RO유형
        model.addAttribute("roTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER031", null, langCd));

        //차량브랜드 SAL181
        model.addAttribute("usedCarBrandList", usedCarService.selectUsedCarBrandList());

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        model.addAttribute("storageList", storageService.selectStoragesByCondition(storageSearchVO));

        model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -90), dateFormat) );
        model.addAttribute("sToDt", sysDate);

        return "/sal/usc/carMaster/selectUsedCarMasterMain";
    }


    /**
     * 중고차량마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UsedCarMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectUsedCarMaster.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedCarMaster(@RequestBody UsedCarMasterSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        SearchResult result = new SearchResult();

        result.setTotal(usedCarMasterService.selectUsedCarMasterByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(usedCarMasterService.selectUsedCarMasterByCondition(searchVO));
        }

        return result;
    }



    /**
     * 중고 차량정보를 가져온다.
     * @param searchVO
     * @return 조회 조건을 만족하는 중고 차량정보를 반환한다.
     */
    @RequestMapping(value="selectUsedCar.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectUsedCar(@RequestBody UsedCarMasterSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        if(!searchVO.getsVinNo().isEmpty()){

            //딜러정보
            UsedCarMasterVO usedCarVO = usedCarMasterService.selectUsedCar(searchVO);
            //딜러정보
            TopSelectionUsedCarVO topSelectionUsedCarVO = usedCarMasterService.selectTopSelectionCar(searchVO.getsVinNo());

            result.put("usedCar", usedCarVO);
            result.put("topSelectionCar", topSelectionUsedCarVO);
        }

        return result;

    }



    /**
     * 보험가입정보관리 저장
     */
    @RequestMapping(value = "/multiSaveUsedCar.do", method = RequestMethod.POST)
    public @ResponseBody Boolean multiSaveUsedCar(@Validated @RequestBody UsedCarMasterSaveVO saveVO) throws Exception {

        usedCarMasterService.multiSaveUsedCar(saveVO);

        return true;
    }




    /**
     * 중고차량 소유자 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectUsedCarOwner.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedCarOwner(@RequestBody UsedCarMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(usedCarMasterService.selectUsedCarOwnerByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(usedCarMasterService.selectUsedCarOwnerByCondition(searchVO));
        }

        return result;
    }

    /**
     * 중고차량 이력 조회
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectRepairOrder.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectRepairOrder(@RequestBody UsedCarMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(usedCarMasterService.selectUsedCarRepairOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(usedCarMasterService.selectUsedCarRepairOrderByCondition(searchVO));
        }

        return result;
    }



    /**
     * 중고차량 운전자 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleMasterSearchVO
     * @return
     */
    @RequestMapping(value = "/selectUsedCarDriver.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectUsedCarDriver(@RequestBody UsedCarMasterSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(usedCarMasterService.selectUsedCarDriverByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(usedCarMasterService.selectUsedCarDriverByCondition(searchVO));
        }

        return result;
    }



}
