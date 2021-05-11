package chn.bhmc.dms.sal.usc.web;


import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.usc.service.UsedCarService;
import chn.bhmc.dms.cmm.usc.vo.UsedCarBrandListVO;
import chn.bhmc.dms.cmm.usc.vo.UsedCarModelListVO;
import chn.bhmc.dms.cmm.usc.vo.UsedCarStyleListVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.vo.PurcEvalImageVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;


/**
 * 중고차매입관리
 *
 * @author Kim yewon
 * @since 2016. 6. 9
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일             수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 9           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/purcEval")
public class UsedCarPurcMngController extends HController {



    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 평가매입 서비스
     */
    @Resource(name="purcEvalService")
    PurcEvalService purcEvalService;


    /**
     * 차량,모델,OCN,색상,로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * 중고차 정보 조회
     */
    @Resource(name="usedCarService")
    UsedCarService usedCarService;


    @Resource(name="crmCommonService")
    CrmCommonService crmCommonService;


    /**
     * 중고차매입관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPurcMngMain.do", method = RequestMethod.GET)
    public String selectPurcMngMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dlrCd = LoginUtil.getDlrCd();
        String usrId = LoginUtil.getUserId();
        String usrNm = LoginUtil.getUserNm();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate = DateUtil.getDate(dateFormat);

        model.addAttribute("dlrCd", dlrCd);
        model.addAttribute("usrId", usrId);
        model.addAttribute("usrNm", usrNm);

        //중고차매입상태 SAL044
        model.addAttribute("purcStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL044", null, langCd));
        //차량상태 SAL001
        model.addAttribute("carStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001", null, langCd));
        //연료구분 SAL114
        model.addAttribute("fuelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL114", null, langCd));
        //구동방식(미션구분) SAL121
        model.addAttribute("drvMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL121", null, langCd));
        //승사용구분 SAL120
        model.addAttribute("pcDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120", null, langCd));
        //경매구분 SAL050
        model.addAttribute("auctCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL050", null, langCd));
        //차량인도여부 SAL051
        model.addAttribute("carDlYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL051", null, langCd));
        //차량브랜드 SAL181

        //중고차브랜드 목록
        try{
            model.addAttribute("usedCarBrandList", usedCarService.selectUsedCarBrandList());
        }catch (Exception e) {
            log.error(e.getMessage() ,  e);
        }

        //중고차외색
        model.addAttribute("purcExClrList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL210", "Y", langCd));

        //중고차 용도 SAL213
        model.addAttribute("usedCarUsgeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL213", null, langCd));

        //판매고문
        //model.addAttribute("saleEmpDSInfo", userService.selectUsersByTskCd(LoginUtil.getDlrCd(), Constants.DMS_TSK_CD_B40));
        model.addAttribute("saleEmpDSInfo", crmCommonService.selectMngScIdListByCondition());

        String toDay = DateUtil.getDate(systemConfigInfoService.selectStrValueByKey("dateFormat"));

        model.addAttribute("toDay", toDay);

        model.addAttribute("sPurcRegStartDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );
        model.addAttribute("sPurcRegEndDt", sysDate);

        return "/sal/usc/purcEval/selectPurcMngMain";
    }


    /**
     * 중고차매입관리 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcEvalSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPurcMng.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPurcMng(@RequestBody PurcEvalSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(purcEvalService.selectPurcByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcEvalService.selectPurcByCondition(searchVO));
        }

        return result;
    }




    /**
     * 중고차매입관리 가져온다.
     * @param searchVO
     * @return 조회 조건을 만족하는 중고 차량정보를 반환한다.
     */
    @RequestMapping(value="/selectPurcEval.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectPurcEval(@RequestBody PurcEvalSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        //평가매입정보
        PurcEvalVO purcEvalDs = purcEvalService.selectPurcEvalInfo(searchVO);

        result.put("purcEvalDs", purcEvalDs);

        return result;

    }


    /**
     * 중고차매입관리 - 경매(위탁)정보 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcEvalSearchVO
     * @return
     */
    @RequestMapping(value = "/selectAuctInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAuctInfo(@RequestBody PurcEvalSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(purcEvalService.selectAuctInfoByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(purcEvalService.selectAuctInfoByCondition(searchVO));
        }

        return result;
    }



    /**
     * 중고차평가매입관리 저장
     */
    @RequestMapping(value = "/savePurcEvalMng.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean savePurcEvalMng(@RequestBody PurcEvalVO saveVO) throws Exception {

        purcEvalService.savePurcEvalMng(saveVO);

        return true;
    }



    /**
     * 중고차매입관리 - 차량이미지 평가용 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectEvalCarImage.do", method = RequestMethod.GET)
    public String selectEvalCarImage(Model model) throws Exception {


    /*
        PurcEvalImageVO purcEvalImageDs = new PurcEvalImageVO();
        PurcEvalSearchVO searchVO = new PurcEvalSearchVO();

        int cnt = purcEvalService.selectImageEvalValCnt(searchVO);

        if(cnt != 0){
            purcEvalImageDs = purcEvalService.selectImageEvalVal(searchVO);
        }

        model.addAttribute("purcEvalImageDs", purcEvalImageDs);
    */
        return "/sal/usc/purcEval/selectEvalCarImage";
    }


    /**
     * 중고차매입관리 - 차량이미지 평가용 상세데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcEvalSearchVO
     * @return
     */
    @RequestMapping(value="selectImageEvalVal.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectImageEvalVal(@RequestBody PurcEvalSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        /*
        PurcEvalImageVO purcEvalImageDs = new PurcEvalImageVO();
        int cnt = purcEvalService.selectImageEvalValCnt(searchVO);


        if(cnt > 0){
            purcEvalImageDs = purcEvalService.selectImageEvalVal(searchVO);
        }else{
            purcEvalImageDs = purcEvalService.selectImageEvalInitVal(searchVO);
        }

        result.put("purcEvalImageDs", purcEvalImageDs);
         */

        result.put("purcEvalImageDs", purcEvalService.selectImageEvalVal(searchVO));
        return result;

    }


    /**
     * 중고차매입관리 - 차량이미지 평가용 평가데이터를 저장한다.
     */
    @RequestMapping(value = "/saveImageEval.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean saveImageEval(@RequestBody PurcEvalImageVO saveVO) throws Exception {

        purcEvalService.saveImageEval(saveVO);

        return true;
    }

    /**
     * 브랜드 목록 조회
     */
    @RequestMapping(value = "/selectUsedCarBrandList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<UsedCarBrandListVO> selectUsedCarBrandList() throws Exception {
        return usedCarService.selectUsedCarBrandList();
    }

    /**
     * 브랜드별 차종 목록 조회
     */
    @RequestMapping(value = "/selectUsedCarModelList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<UsedCarModelListVO> selectUsedCarModelList(@RequestParam(value="carBrandCd") String carBrandCd) throws Exception {
        return usedCarService.selectUsedCarModelList(carBrandCd);
    }

    /**
     * 차종별 차관 조회
     */
    @RequestMapping(value = "/selectUsedCarStyleList.do", method = RequestMethod.POST)
    @ResponseBody
    public List<UsedCarStyleListVO> selectUsedCarStyleList(@RequestParam(value="carlineCd") String carlineCd) throws Exception {
        return usedCarService.selectUsedCarStyleList(carlineCd);
    }

    /**
     * 빈중복체크
     */
    @RequestMapping(value = "/checkingVinNoDupWhether.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkingVinNoDupWhether(@RequestBody PurcEvalSearchVO searchVO) throws Exception {
        String result = "";
        result = purcEvalService.checkingVinNoDupWhether(searchVO);
        return result;
    }

    /**
     * 중고차매입취소
     */
    @RequestMapping(value = "/purchaseCancel.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean purchaseCancel(@RequestBody PurcEvalVO saveVO) throws Exception {

        purcEvalService.purchaseCancel(saveVO);

        return true;
    }
}