package chn.bhmc.dms.bat.ser.order.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.ser.order.service.WarWoOrderCofAppService;
import able.com.web.HController;

@Controller
public class WarWoOrderCofAppController extends HController {
	
	@Resource(name="warWoOrderCofAppService")
	WarWoOrderCofAppService warWoOrderCofAppService;
	
	/**
	 * 
	 * @throws Exception
	 */
    @RequestMapping(value = "/bat/order/ser/warWoOrderCofAppJob.do", method = RequestMethod.GET)
    @ResponseBody
    public void warWoOrderCofAppJob() throws Exception {
    	warWoOrderCofAppService.updateInsertInfo();
    }
}
