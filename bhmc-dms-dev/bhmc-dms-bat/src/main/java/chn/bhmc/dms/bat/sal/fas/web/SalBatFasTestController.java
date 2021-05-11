package chn.bhmc.dms.bat.sal.fas.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.fas.service.BatchFasConfInfoService;

@Controller
public class SalBatFasTestController extends HController {

    @Resource(name="batchFasConfInfoService")
    BatchFasConfInfoService batchFasConfInfoService;

    @RequestMapping(value = "/bat/sal/fas/batCallFasJoinProcess.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallFasJoinProcess() throws Exception {
        batchFasConfInfoService.callAlarmProcess("Y");
        return 1;

    }

}