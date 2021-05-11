package chn.bhmc.dms.ser.wac.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoLaborProblemController.java
 * @Description : 삼포 LTS 동일하자 컨트롤러
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
public class SanbaoLaborProblemController extends HController{

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
    
    /**
    *
    * 삼포 LTS 동일하자 화면 메인
    *
    * @param model
    * @return 삼포 LTS 동일하자 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoLaborProblem/selectSanbaoLaborProblemMain.do")
   public String selectSanbaoLaborProblemMain(Model model,@RequestParam(value="docNo", defaultValue="") String docNo)throws Exception{

       
       
       model.addAttribute("docNo", docNo);
      
       
       return "/ser/wac/sanbaoLaborProblem/selectSanbaoLaborProblemMain";

   }

}
