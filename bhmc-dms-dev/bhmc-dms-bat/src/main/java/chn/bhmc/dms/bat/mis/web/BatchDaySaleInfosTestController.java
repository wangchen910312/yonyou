package chn.bhmc.dms.bat.mis.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.mis.service.BatchDaySaleInfosJobService;

@Controller
public class BatchDaySaleInfosTestController extends HController {

    @Resource(name="batchDaySaleInfosJobService")
    BatchDaySaleInfosJobService batchDaySaleInfosJobService;

    @RequestMapping(value = "/bat/mis/batchDaySaleInfosJob.do", method = RequestMethod.GET)
    @ResponseBody
    public int batchDaySaleInfosJobProcess() throws Exception {
        batchDaySaleInfosJobService.insertSaleInfosJob();
        return 1;
    }
}