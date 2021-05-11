package chn.bhmc.dms.bat.sal.cr.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.cr.service.BatchCrConRemService;
import able.com.web.HController;
@Controller
public class SalBatCrTestController extends HController {
	@Resource(name="batchCrConRemService")
	BatchCrConRemService batchCrConRemService;
	                         
	@RequestMapping(value = "/bat/sal/cr/batCallCrJoinProcess.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallDlvJoinProcess() throws Exception {
		batchCrConRemService.insertMessRem();
        return 1;
    }
}
