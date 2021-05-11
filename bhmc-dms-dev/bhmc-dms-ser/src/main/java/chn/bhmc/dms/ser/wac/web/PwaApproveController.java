package chn.bhmc.dms.ser.wac.web;

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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.wac.service.PwaApproveService;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveController.java
 * @Description : PWA 승인 컨트롤러
 * @author Kwon Ki Hyun
 * @since 2016. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class PwaApproveController extends HController{

    /**
     * PWA 승인 서비스
     */
    @Resource(name="pwaApproveService")
    PwaApproveService pwaApproveService;

    /**
     * 공통코드 관리 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
    *
    * PWA 승인 화면 메인
    *
    * @param model
    * @return PWA 승인 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveMain.do",method=RequestMethod.GET)
   public String selectPwaApproveMain(Model model,HttpServletRequest request)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       Device device = DeviceUtils.getCurrentDevice(request);
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

       // PWA 상태코드
       model.addAttribute("pwaTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER100", null, langCd));
       // PWA 유형코드
       model.addAttribute("pwaStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER102", null, langCd));
       // 사용여부
       model.addAttribute("pwaCauYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER101", null, langCd));
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
       // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
       model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

       return "/ser/wac/pwaAppr/selectPwaApproveMain";

   }

   /**
    *
    * PWA 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 요청 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveMains.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaApproveMains(@RequestBody PwaSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaApproveService.selectPwaApproveMainsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaApproveService.selectPwaApproveMainsByCondition(searchVO));
       }

       return result;
   }


   /**
    *
    * PWA 공임 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveLbrs.do", method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaApproveLbrs(@RequestBody PwaSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaApproveService.selectPwaApproveLbrsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaApproveService.selectPwaApproveLbrsByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * PWA 상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveByKey.do", method=RequestMethod.POST)
   @ResponseBody
   public PwaVO selectPwaApproveByKey(@RequestBody PwaSearchVO searchVO)throws Exception{

       return pwaApproveService.selectPwaApproveByKey(searchVO);
   }


   /**
    *
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaAppr/selectPwaApproveParts.do", method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectPwaApproveParts(@RequestBody PwaSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(pwaApproveService.selectPwaApprovePartsByConditionCnt(searchVO));

       if(result.getTotal() != 0 ){
           result.setData(pwaApproveService.selectPwaApprovePartsByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * PWA 요청 정보를 수정한다.
    *
    * @param saveVO - PWA 요청 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/pwaAppr/updateStatePwaApproves.do", method=RequestMethod.POST)
   @ResponseBody
   public PwaVO updateStatePwaApproves(@Validated @RequestBody PwaVO pwaVO)throws Exception{
           pwaApproveService.updateStatePwaApproves(pwaVO);




       return pwaVO;
   }




}
