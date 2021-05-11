package chn.bhmc.dms.bat.mis.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.mis.service.BatchDaySaleStatusJobService;

@Controller
public class BatchDaySaleStatusTestController extends HController {

    @Resource(name="batchDaySaleStatusJobService")
    BatchDaySaleStatusJobService batchDaySaleStatusJobService;

    @RequestMapping(value = "/bat/mis/batchDaySaleStatusJob.do", method = RequestMethod.GET)
    @ResponseBody
    public int batchDaySaleInfosJobProcess() throws Exception {
        batchDaySaleStatusJobService.insertSaleStatusJob();
        return 1;
    }
}