package chn.bhmc.dms.sal.svo.web;

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
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.PackageWorkService;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSaveVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSearchVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 집단판매업무신청
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.16         Kim Jin Suk            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/svo/packageWork")
public class PackageWorkController extends HController {

    /**
     * 집단판매 업무 서비스
     */
    @Resource(name="packageWorkService")
    PackageWorkService packageWorkService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 집단판매업무 신청 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkMain.do", method = RequestMethod.GET)
    public String selectPackageSalesWorkMain(Model model) throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        model.addAttribute("userId", LoginUtil.getUserId());
        model.addAttribute("userNm", LoginUtil.getUserNm());
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());

        // 현재일자 DateUtil
        //SimpleDateFormat simpleformat = new SimpleDateFormat("yyyy-MM-dd");
        //model.addAttribute("toDay", simpleformat.format(new Date()));
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        // 상태 SAL184 : APPROVE_CD
        model.addAttribute("stateTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL184", null, langCd));
        // 항목 SAL151
        model.addAttribute("atcDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL151", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/svo/packageWork/selectPackageSalesWorkMain";
    }

    /**
     * 집단판매업무 정보 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWork.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageSalesWork(@RequestBody PackageSalesWorkSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(packageWorkService.selectPackageSalesWorksByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageWorkService.selectPackageSalesWorksByCondition(searchVO));
        }

        return result;
    }


    /**
     * 집단판매업무 신청 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkPopup.do", method = RequestMethod.GET)
    public String selectPackageSalesWorkPopup(Model model) throws Exception{

        // 현재일자 DateUtil
        String sysDate = DateUtil.getDate("yyyy-MM-dd");
        String oneDay  = DateUtil.getDate("yyyy-MM") + "-01";
        model.addAttribute("toDay", sysDate);
        model.addAttribute("oneDay", oneDay);

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 항목 SAL151
        model.addAttribute("atcDstinCdDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL151", null, langCd));
        // 상태 SAL184 : APPROVE_CD
        model.addAttribute("stateTpDS", commonCodeService.selectCommonCodesByCmmGrpCd("SAL184", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carLineCdInfo", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/sal/svo/packageWork/selectPackageSalesWorkPopup";
    }

    /**
     * 집단판매업무 신청 팝업 내용조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkPopupContain.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageSalesWorkPopupContain(@RequestBody PackageSalesWorkSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(packageWorkService.selectPackageSalesWorkPopupContainsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageWorkService.selectPackageSalesWorkPopupContainsByCondition(searchVO));
        }

        return result;
    }


    /**
     * 집단판매업무 신청 팝업 - 심사내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkPopupEvl.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageSalesWorkPopupEvl(@RequestBody PackageSalesWorkSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(packageWorkService.selectPackageSalesWorkPopupEvlsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageWorkService.selectPackageSalesWorkPopupEvlsByCondition(searchVO));
        }

        return result;
    }




    /**
     * 집단판매업무 신청 팝업 - 차량내역 조회
     * @param searchVO
     * @return
     */
    @RequestMapping(value = "/selectPackageSalesWorkPopupVehicle.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPackageSalesWorkPopupVehicle(@RequestBody PackageSalesWorkSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(packageWorkService.selectPackageSalesWorkPopupVehicleByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(packageWorkService.selectPackageSalesWorkPopupVehicleByCondition(searchVO));
        }

        return result;
    }



    /**
     *
     * 집단판매업무 신청 저장
     * @param saveVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/multiPackageSalesWorkPopup.do", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> multiPackageSalesWorkPopup(@Validated @RequestBody PackageSalesWorkSaveVO saveVO) throws Exception {

    	Map<String, Object> result = new HashMap<String, Object>();
    	int reqSeq = packageWorkService.multiPackageSalesWorkPopups(saveVO);

    	PackageSalesWorkVO packageSalesWorkVO = new PackageSalesWorkVO();
    	packageSalesWorkVO.setReqSeq(reqSeq);

    	result.put("packageSalesWorkVO", packageSalesWorkVO);

        return result;
    }

    /**
    *
    * 집단판매업무 신청 삭제
    * @param saveVO
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/deletePackageSalesWorkPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deletePackageSalesWorkPopup(@Validated @RequestBody PackageSalesWorkVO deleteVO) throws Exception {
        packageWorkService.deletePackageSalesWorkPopups(deleteVO);
        return true;
    }

    /**
    *
    * 집단판매업무 신청 확정
    * @param saveVO
    * @return
    * @throws Exception
    */
    @RequestMapping(value = "/confirmPackageSalesWorkPopup.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean confirmPackageSalesWorkPopup(@Validated @RequestBody PackageSalesWorkVO confirmVO) throws Exception {
        packageWorkService.confirmPackageSalesWorkPopups(confirmVO);
        return true;
    }




}
