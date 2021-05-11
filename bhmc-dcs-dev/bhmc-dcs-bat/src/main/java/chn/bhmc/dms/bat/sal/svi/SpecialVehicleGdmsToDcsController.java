package chn.bhmc.dms.bat.sal.svi;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.svi.service.SpecialVehicleGdmsToDcsService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialVehicleGdmsToDcsController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 8. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 10.     Ki hyun Kwon     최초 생성
 * </pre>
 */

@Controller
public class SpecialVehicleGdmsToDcsController extends HController {

    @Autowired
    SpecialVehicleGdmsToDcsService specialVehicleGdmsToDcsService;


    /**
    *
    * GDMS To DCS
    *
    * @throws Exception
    */
   @RequestMapping(value = "/bat/sal/svi/migSaSpecialVehicle.do", method = RequestMethod.GET)
   @ResponseBody
   public void migSaSpecialVehicle()throws Exception{

       specialVehicleGdmsToDcsService.migSalSpecialVehicle();

   }

}
