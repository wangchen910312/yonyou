package chn.bhmc.dms.bat.sal.stk.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.stk.service.BatchStockDailyService;

@Controller
public class SalBatStkTestController extends HController {

    @Resource(name="batchStockDailyService")
    BatchStockDailyService batchStockDailyService;

    @RequestMapping(value = "/bat/sal/stk/batCallStkProcess.do", method = RequestMethod.GET)
    @ResponseBody

    public int batCallStkJoinProcess() throws Exception {

        batchStockDailyService.callStockCntProcess();

        return 1;

    }

}