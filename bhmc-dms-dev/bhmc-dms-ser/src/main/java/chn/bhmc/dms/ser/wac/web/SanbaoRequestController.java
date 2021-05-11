package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
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
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.SanbaoRequestService;
import chn.bhmc.dms.ser.wac.vo.SanbaoSaveVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoRequestController.java
 * @Description : 삼포 요청 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 3. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 9.     YIN XUEYUAN     최초 생성
 * </pre>
 */
@Controller
public class SanbaoRequestController extends HController{

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="sanbaoRequestService")
    SanbaoRequestService sanbaoRequestService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 파일관리 서비스
     */
    @Autowired
    FileMgrService fileMgrService;

    /**
    *
    * 삼포 요청 화면 메인
    *
    * @param model
    * @return 삼포 요청 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoReq/selectSanbaoRequestMain.do")
   public String selectSanbaoRequestMain(Model model,HttpServletRequest request)throws Exception{

       Device device = DeviceUtils.getCurrentDevice(request);
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat));

       // 삼보 상태코드
       model.addAttribute("stateDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER216", null, LocaleContextHolder.getLocale().getLanguage()));
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
       // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
       model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

       // 세율
       model.addAttribute("vatCd", sanbaoRequestService.selectVATSearch(DateUtil.getDate("yyyyMMdd"), "ALL"));

       return "/ser/wac/sanbaoReq/selectSanbaoRequestMain";

   }


   /**
    *
    * 삼보 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보 요청 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoReq/selectSanbaoRequestMains.do",  method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoRequestMains(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(sanbaoRequestService.selectSanbaoRequestByConditionCnt(searchVO));

       if(result.getTotal() !=0 ){
           result.setData(sanbaoRequestService.selectSanbaoRequestByCondition(searchVO));
       }

       return result;
   }


   /**
    *
    * 삼보요청  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보요청 상세 정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoReq/selectSanbaoRequestByKey.do",  method=RequestMethod.POST)
   @ResponseBody
   public SanbaoVO selectSanbaoRequestByKey(@RequestBody SanbaoSearchVO searchVO)throws Exception{

       return sanbaoRequestService.selectSanbaoRequestByKey(searchVO);
   }

   /**
    *
    * 삼보요청 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 삼보요청 부품  정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoReq/selectSanbaoRequestParts.do",  method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoParts(@RequestBody SanbaoSearchVO searchVO) throws Exception{

       SearchResult result = new SearchResult();

       result.setTotal(sanbaoRequestService.selectSanbaoRequestPartsByConditionCnt(searchVO));

       if(result.getTotal() !=0 ){
           result.setData(sanbaoRequestService.selectSanbaoRequestPartsByCondition(searchVO));
       }

       return result;

   }

   /**
    *
    * 삼보요청 정보를 등록/수정/삭제 한다.
    *
    * @param saveVO - 삼보 요청 등록/수정/삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoReq/multiSanbaoRequests.do", method=RequestMethod.POST)
   @ResponseBody
   public String multiSanbaoRequests(@Validated @RequestBody SanbaoSaveVO saveVO)throws Exception{
       String docNo = sanbaoRequestService.multiSanbaoRequests(saveVO);

       String fileNo = saveVO.getSanbaoVO().getFileKeyNm();
       if(StringUtils.isNotBlank(fileNo)){
           fileMgrService.updateFileDocEnabled(new FileDocVO(fileNo, LoginUtil.getUserId()));
       }


       return docNo;

   }


   /**
    *
    * 삼보요청 정보를 등 삭제 한다.
    *
    * @param saveVO - 삼보 요청  삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoReq/deleteSanbaoRequests.do", method=RequestMethod.POST)
   @ResponseBody
   public boolean deleteSanbaoRequests(@Validated @RequestBody SanbaoVO sanbaoVO)throws Exception{


       return sanbaoRequestService.deleteSanbaoRequests(sanbaoVO) > 0 ? true : false;

   }



}
