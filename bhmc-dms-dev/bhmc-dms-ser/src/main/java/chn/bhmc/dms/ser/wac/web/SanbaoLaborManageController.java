package chn.bhmc.dms.ser.wac.web;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoLaborManageController.java
 * @Description : 삼포 공임코드 등록 컨트롤러
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
public class SanbaoLaborManageController extends HController{

    /**
    *
    * 삼포 공임코드 등록 화면 메인
    *
    * @param model
    * @return 삼포 공임코드 등록 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/sanbaoLaborManage/selectSanbaoLaborManageMain.do")
   public String selectSanbaoLaborManageMain(Model model)throws Exception{

       return "/ser/wac/sanbaoLaborManage/selectSanbaoLaborManageMain";

   }

}
