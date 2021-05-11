package chn.bhmc.dms.ser.svi.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayManageVO;
import chn.bhmc.dms.ser.svi.vo.BayMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageController.java
 * @Description : BAY관리 컨트롤러
 * @author KyungMok Kim
 * @since 2016. 1. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Controller
public class BayManageController extends HController {

    @Autowired
    BayManageService bayManageService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * Bay 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayManageMain.do", method = RequestMethod.GET)
    public String selectBayManageMain(Model model, HttpServletRequest request) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        
        Device device = DeviceUtils.getCurrentDevice(request);

        model.addAttribute("sMngToDt", DateUtil.getDate(dateFormat));
        model.addAttribute("sMngFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -30), dateFormat) );

        // 공통코드 : 수리유형
        model.addAttribute("rpirTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER036", null, langCd));
        // 공통코드 : BAY 세부구분
        model.addAttribute("bayGrpTpCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER903", null, langCd));

        //사용여부
        model.addAttribute("userYnList", commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd));
        //bay 상태
        model.addAttribute("bayStatCdList", commonCodeService.selectCommonCodesByCmmGrpCd("SER096", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("sysdate", DateUtil.getDate(dateFormat));
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end



        return "/ser/svi/bayManage/selectBayManageMain";

    }

    /**
     * Bay관리 마스터 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayManages.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectBayManages(@RequestBody BayManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(bayManageService.selectBayMastersByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(bayManageService.selectBayMastersByCondition(searchVO));
        }

        return result;

     }

    /**
     * Bay관리 헤더  정보를 등록한다.
     * @param saveVO - Bay관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/bayManage/saveBayManages.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveBayManages(@Validated @RequestBody BayManageVO bayManageVO, BindingResult bindingResult) throws Exception {

        bayManageService.saveBayManages(bayManageVO);

        return true;

    }

    /**
     * Bay관리 상세  정보를 등록한다.
     * @param saveVO - Bay관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/bayManage/saveBayDetails.do", method = RequestMethod.POST)
    public @ResponseBody boolean saveBayDetails(@Validated @RequestBody BayManageVO bayManageVO, BindingResult bindingResult) throws Exception {

        bayManageService.saveBayDetails(bayManageVO);

        return true;

    }
    /**
     * Bay관리 정보를 등록한다.
     * @param saveVO - Bay관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/ser/svi/bayManage/multiBayManages.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiBayManages(@Validated @RequestBody BayManageVO bayManageVO, BindingResult bindingResult) throws Exception {

        bayManageService.multiBayManages(bayManageVO);

        return true;

    }

    /**
     * Bay마스터 정보를 가져온다
     * @param saveVO - Bay관리
     * @param bindingResult
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayMasterByKey.do",  method = RequestMethod.POST)
    public @ResponseBody BayMasterVO selectBayMasterByKey(@RequestBody BayManageSearchVO searchVO) throws Exception {

       return bayManageService.selectBayMasterByKey(searchVO);

    }


    /**
     * Bay디테일 리스트
     * @param
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayDetails.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectBayDetails(@RequestBody BayManageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(bayManageService.selectBayDetailsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(bayManageService.selectBayDetailsByCondition(searchVO));
        }

        return result;

    }

    /**
     * Bay 삭제
     * @param
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/deleteBayManage.do",  method = RequestMethod.POST)
    public @ResponseBody String deleteBayManage(@RequestBody BayMasterVO bayMasterVO) throws Exception {

        bayManageService.deleteBayManage(bayMasterVO);

        return "OK";
    }

    /**
     * Bay디테일 카운트
     * @param
     * @return
     */
    @RequestMapping(value="/ser/svi/bayManage/selectBayDetailsCnt.do",  method = RequestMethod.POST)
    public @ResponseBody int selectBayDetailsCnt(@RequestBody BayManageSearchVO searchVO) throws Exception {

        int detailCnt = bayManageService.selectBayDetailsByConditionCnt(searchVO);

        return detailCnt;

    }
}
