package chn.bhmc.dms.mob.sal.usc.web;


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

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSaveVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 중고차평가관리
 *
 * @author Kim yewon
 * @since 2016. 6. 10
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                           수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 10           Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/mob/sal/usc/purcEval")
public class MobUsedCarEvalMngController extends HController {


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
     * 중고차평가관리 Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectEvalMngMain.do", method = RequestMethod.GET)//중요!! 이건  웹에서 selectPurcMngMain.do 이거다 이거 만들었던 사람이 엉뚱한 것을 붙여놨다
    public String selectEvalMngMain(Model model) throws Exception {
        /*MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());
        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        //중고차매입상태 SAL044
        model.addAttribute("purcStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL044"));
        //차량상태 SAL001
        model.addAttribute("carStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL001"));
        //연료구분 SAL114
        model.addAttribute("fuelCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL114"));
        //구동방식(미션구분) SAL121
        model.addAttribute("drvMthCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL121"));
        //승사용구분 SAL120
        model.addAttribute("pcDstinCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL120"));
        //경매구분 SAL050
        model.addAttribute("auctCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL050"));
        //차량인도여부 SAL051
        model.addAttribute("carDlYnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL051"));

        String toDay = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", toDay);*/

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String dlrCd = mobLoginVO.getDlrCd();
        String usrId = mobLoginVO.getUserId();
        String usrNm = mobLoginVO.getUserNm();

        model.addAttribute("dlrCd", dlrCd);
        model.addAttribute("usrId", usrId);
        model.addAttribute("usrNm", usrNm);
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

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
        //차량브랜드 COM019
        model.addAttribute("carBrandCdList", commonCodeService.selectCommonCodesByCmmGrpCd("COM019", null, langCd));


        String toDay = DateUtil.getDate("yyyy-MM-dd");
        model.addAttribute("toDay", toDay);


        return "/mob/sal/usc/purcEval/selectEvalMngMain";
    }

    /**
     * 중고차평가관리 목록
     * @return
     */
    @RequestMapping(value = "/selectEvalMngList.do", method = RequestMethod.GET)
    public String selectEvalMngList(Model model)  throws Exception  {

        return "/mob/sal/usc/purcEval/selectEvalMngList";
    }

    /**
     * 중고차평가관리 상세목록
     * @return
     */
    @RequestMapping(value = "/selectEvalMngSubList.do", method = RequestMethod.GET)
    public String selectEvalMngSubList(Model model)  throws Exception  {

        return "/mob/sal/usc/purcEval/selectEvalMngSubList";
    }

    /**
     * 중고차매입관리 목록을 조회한다.
     * UsedCarPurcMngController.selectPurcMng()함수 로직 이용
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
     * 중고차매입관리 - 경매(위탁)정보 목록을 조회한다.
     * UsedCarPurcMngController.selectAuctInfo
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
     * 중고차평가관리 - 경매정보를 등록한다.
     * @param saveVO - 마감대상딜러 등록/수정 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiSaveAuctInfo.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiSaveAuctInfo(@Validated @RequestBody PurcEvalSaveVO saveVO) throws Exception {

        purcEvalService.multiSaveAuctInfo(saveVO);

        return true;

    }

    /**
     * 중고차매입관리 가져온다.
     * @param searchVO
     * @return 조회 조건을 만족하는 중고 차량정보를 반환한다.
     */
    @RequestMapping(value="selectPurcEval.do",  method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> selectPurcEval(@RequestBody PurcEvalSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        //평가매입정보
        PurcEvalVO purcEvalDs = purcEvalService.selectPurcEvalInfo(searchVO);

        result.put("purcEvalDs", purcEvalDs);

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
   /* public String savePurcEvalMng(@RequestBody PurcEvalVO saveVO) throws Exception {

        String result = purcEvalService.savePurcEvalMng(saveVO);

        return result;
    }*/




}
