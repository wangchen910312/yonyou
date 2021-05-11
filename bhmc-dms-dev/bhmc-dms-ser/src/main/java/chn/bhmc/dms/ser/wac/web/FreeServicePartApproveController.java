package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FreeServicePartApproveController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 6. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 13.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Controller
public class FreeServicePartApproveController extends HController{

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
    *
    * 면비보양부품 요청 화면 메인
    *
    * @param model
    * @return 면비보양부품 요청 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/freeServicePart/selectFreeServicePartApproveMain.do", method = RequestMethod.GET)
   public String selectFreeServicePartApproveMain(Model model)throws Exception{

       String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

       model.addAttribute("sToDt", DateUtil.getDate(dateFormat));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), dateFormat) );

       return "/ser/wac/freeServicePart/selectFreeServicePartApproveMain";

   }

}
