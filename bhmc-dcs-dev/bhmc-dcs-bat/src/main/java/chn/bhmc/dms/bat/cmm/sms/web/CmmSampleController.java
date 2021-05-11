package chn.bhmc.dms.bat.cmm.sms.web;

import java.util.List;

import able.com.web.HController;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.cmm.sms.service.SendSmsAmountService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmmSampleController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author             description
 *  ===========    ===============    ======================
 *  2017. 3. 24.   Choi Kyung Yong           최초 생성
 * </pre>
 */
@Controller
public class CmmSampleController extends HController {


   @Autowired
   SendSmsAmountService sendSmsAmountService;

   @RequestMapping(value = "/bat/cmm/sms/smsTestInfo.do", method = RequestMethod.GET)
   @ResponseBody
   public void smsTestInfo()throws Exception{

       //Dlr 리스트의
       List<JSONObject> dlrList = sendSmsAmountService.getDlrSmsAmount();

       //딜러별로 잔액 조회
       if(dlrList != null && dlrList.size() > 0){
           sendSmsAmountService.requestSMSAmount(dlrList);
       }
   }

}
