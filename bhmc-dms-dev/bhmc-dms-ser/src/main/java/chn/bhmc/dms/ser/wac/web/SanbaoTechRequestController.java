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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.SanbaoTechRequestService;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoTechRequestController.java
 * @Description : 삼포 기술제출 컨트롤러
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
public class SanbaoTechRequestController extends HController{


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    @Resource(name="sanbaoTechRequestService")
    SanbaoTechRequestService sanbaoTechRequestService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 파일관리 서비스
     */
    @Autowired
    FileMgrService fileMgrService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
    *
    * 삼포 기술제출 화면 메인
    *
    * @param model
    * @return 삼포 기술제출 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechReq/selectSanbaoTechRequestMain.do" , method=RequestMethod.GET)
   public String selectSanbaoTechRequestMain(Model model,HttpServletRequest request)throws Exception{

       String langCd = LocaleContextHolder.getLocale().getLanguage();
       Device device = DeviceUtils.getCurrentDevice(request);
       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );
       model.addAttribute("sToDt", DateUtil.getDate(dateFormat));

       /** 삼보 상태코드 **/
       model.addAttribute("stateDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER201", null, langCd));
       /** 삼보 난제고장 **/
       model.addAttribute("pblmErrDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER203", null, langCd));
       /** 삼보 긴급경계 **/
       model.addAttribute("emgcAlrtDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER204", null, langCd));
       model.addAttribute("dlrCd", LoginUtil.getDlrCd());
       model.addAttribute("userId", LoginUtil.getUserId());
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
       // model.addAttribute("isTablet", device.isTablet());//khskhs 문제시삭제
       model.addAttribute("isTablet", (device.isTablet()||device.isMobile()));
       //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end

       return "/ser/wac/sanbaoTechReq/selectSanbaoTechRequestMain";

   }

   /**
    *
    * 삼보 기술제출 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술제출 목록 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechReq/selectSanbaoTechRequestMains.do" , method=RequestMethod.POST)
   @ResponseBody
   public SearchResult selectSanbaoTechRequestMains(@RequestBody SanbaoTechSearchVO searchVO)throws Exception{

       SearchResult result = new SearchResult();


       result.setTotal(sanbaoTechRequestService.selectSanbaoTechRequestByConditionCnt(searchVO));
       if(result.getTotal() !=0 ){
           result.setData(sanbaoTechRequestService.selectSanbaoTechRequestByCondition(searchVO));
       }


       return result;
   }

   /**
    *
    * 삼보 기술제출  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술제출 상세 정보 데이터
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechReq/selectSanbaoTechRequestByKey.do" , method=RequestMethod.POST)
   @ResponseBody
   public SanbaoTechVO selectSanbaoTechRequestByKey(@RequestBody SanbaoTechSearchVO searchVO)throws Exception{

       return sanbaoTechRequestService.selectSanbaoTechRequestByKey(searchVO);

   }

   /**
    *
    * 삼보 기술제출 정보를 등록/수정 한다.
    *
    * @param saveVO - 삼보 기술제출 등록/수정 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechReq/multiSanbaoTechRequest.do" , method=RequestMethod.POST)
   @ResponseBody
   public String multiSanbaoTechRequest(@RequestBody SanbaoTechVO sanbaoTechVO)throws Exception{
       String docNo = sanbaoTechRequestService.multiSanbaoTechRequest(sanbaoTechVO);


       String fileNo = sanbaoTechVO.getFileKeyNm();
       if(StringUtils.isNotBlank(fileNo)){
           fileMgrService.updateFileDocEnabled(new FileDocVO(fileNo, LoginUtil.getUserId()));
       }


       return docNo;
   }

   /**
    *
    * 삼보 기술제출 정보를 삭제 한다.
    *
    * @param saveVO - 삼보 기술제출 삭제 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoTechReq/deleteSanbaoTechRequest.do" , method = RequestMethod.POST)
   @ResponseBody
   public boolean deleteSanbaoTechRequest(@RequestBody SanbaoTechVO sanbaoTechVO)throws Exception{

       sanbaoTechRequestService.deleteSanbaoTechRequest(sanbaoTechVO);

       return true;
   }


}
