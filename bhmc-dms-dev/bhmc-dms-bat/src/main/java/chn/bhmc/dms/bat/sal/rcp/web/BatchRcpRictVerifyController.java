package chn.bhmc.dms.bat.sal.rcp.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.bat.sal.rcp.service.BatchRcpRictVerifyService;

@Controller
public class BatchRcpRictVerifyController extends HController {

    @Resource(name="batchRcpRictVerifyService")
    BatchRcpRictVerifyService batchRcpRictVerifyService;

    @RequestMapping(value = "/bat/sal/rcp/batCallRcpRictVerifyProcess.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallStkJoinProcess() throws Exception {
    	batchRcpRictVerifyService.updateRcpRictVerify();
        return 1;
    }

}