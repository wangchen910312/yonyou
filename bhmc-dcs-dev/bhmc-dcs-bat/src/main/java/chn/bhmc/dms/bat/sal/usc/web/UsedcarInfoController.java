package chn.bhmc.dms.bat.sal.usc.web;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.usc.service.UsedcarInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedcarInfoController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 24.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Controller
public class UsedcarInfoController extends HController {


   @Autowired
   UsedcarInfoService usedcarInfoService;

   @RequestMapping(value = "/bat/sal/usc/batUsedcarInfo.do", method = RequestMethod.GET)
   @ResponseBody
   public void batchClaimApprove(String preFixId)throws Exception{

       if(preFixId.equals("SAL122")){
           usedcarInfoService.insertSusunDcsUvinmst();
       }else if(preFixId.equals("SAL123")){
           usedcarInfoService.insertSusunDcsOwner();
       }else if(preFixId.equals("SAL124")){
           usedcarInfoService.insertSusunDcsCrtvin();
       }else if(preFixId.equals("SAL125")){
           usedcarInfoService.insertSusunDcsCrtdlr();
       }


   }

}
