package chn.bhmc.dms.ser.wac.web;

import java.util.Calendar;
import java.util.Date;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FreeServicePartRequestController.java
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
public class FreeServicePartRequestController extends HController{
    
    
    /**
    *
    * 면비보양부품 요청 화면 메인
    *
    * @param model
    * @return 면비보양부품 요청 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/freeServicePart/selectFreeServicePartReqeustMain.do", method = RequestMethod.GET)
   public String selectFreeServicePartReqeustMain(Model model)throws Exception{
       
       model.addAttribute("sToDt", DateUtil.getDate("yyyy-MM-dd"));
       model.addAttribute("sFromDt", DateUtil.getDate(DateUtil.add(new Date(), Calendar.DATE, -15), "yyyy-MM-dd") );
        
       // 사용여부 
//       model.addAttribute("pwaCauYnDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER101", null, langCd));

       return "/ser/wac/freeServicePart/selectFreeServicePartReqeustMain";

   }

}
