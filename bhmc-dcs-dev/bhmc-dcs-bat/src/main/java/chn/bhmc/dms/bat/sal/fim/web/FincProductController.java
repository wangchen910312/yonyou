package chn.bhmc.dms.bat.sal.fim.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.fim.service.FincProductService;

/**
 * @ClassName   : FincProductController.java
 * @Description : 금융상품정보 I/F DCS -> DMS
 * @author KIM JIN SUK
 * @since 2017. 4. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 17.    KIM JIN SUK            최초 생성
 * </pre>
 */
@Controller
public class FincProductController extends HController {

   @Resource(name="fincProductService")
   FincProductService fincProductService;

   @RequestMapping(value = "/bat/sal/fim/batFincProductSearch.do", method = RequestMethod.GET)
   @ResponseBody
   public int batFincProductSearch(String sId)throws Exception{
       return fincProductService.batFincProductSearch(sId);
   }

}
