package chn.bhmc.dms.bat.sal.usc.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.usc.service.BatchSalesPurcService;

@Controller
public class SalBatUscTestController extends HController {

    @Resource(name="batchSalesPurcService")
    BatchSalesPurcService batchSalesPurcService;

    @RequestMapping(value = "/bat/sal/usc/batCallUscProcess.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallFasJoinProcess() throws Exception {
        batchSalesPurcService.selectUscTargetItem();
        return 1;

    }

}