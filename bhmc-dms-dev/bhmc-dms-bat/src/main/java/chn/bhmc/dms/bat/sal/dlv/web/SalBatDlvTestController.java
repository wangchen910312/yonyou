package chn.bhmc.dms.bat.sal.dlv.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.dlv.service.BatchDlvConfInfoService;

@Controller
public class SalBatDlvTestController extends HController {

    @Resource(name="batchDlvConfInfoService")
    BatchDlvConfInfoService batchDlvConfInfoService;

    @RequestMapping(value = "/bat/sal/dlv/batCallDlvJoinProcess.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallDlvJoinProcess() throws Exception {
        batchDlvConfInfoService.callAlarmProcess("Y");

        return 1;
    }
}