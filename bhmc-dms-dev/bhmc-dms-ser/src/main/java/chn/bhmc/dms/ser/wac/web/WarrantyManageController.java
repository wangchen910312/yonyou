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
 * @ClassName   : WarrantyManageController.java
 * @Description : 보증 현황 관리 컨트롤러
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
public class WarrantyManageController extends HController{

   /**
    *
    * 보증 현황 화면 메인
    *
    * @param model
    * @return 보증 현황 화면
    * @throws Exception
    */
   @RequestMapping(value="/ser/wac/warranty/selectWarrantyStatusMain.do")
   public String selectWarrantyStatusMain(Model model)throws Exception{

       return "/ser/wac/warranty/selectWarrantyStatusMain";

   }

}
