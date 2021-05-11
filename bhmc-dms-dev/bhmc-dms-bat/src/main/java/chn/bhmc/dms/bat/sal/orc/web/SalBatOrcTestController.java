package chn.bhmc.dms.bat.sal.orc.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.orc.service.BatchOrcMngService;

@Controller
public class SalBatOrcTestController extends HController {

    @Resource(name="batchOrcMngService")
    BatchOrcMngService batchOrcMngService;

    @RequestMapping(value = "/bat/sal/orc/batCallOrcUpdateProcess.do", method = RequestMethod.GET)
    @ResponseBody

    public int batCallStkJoinProcess() throws Exception {

        batchOrcMngService.callOrcUpdateProcess();

        return 1;

    }

}