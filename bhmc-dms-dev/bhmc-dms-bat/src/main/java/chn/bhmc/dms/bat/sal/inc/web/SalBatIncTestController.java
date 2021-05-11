package chn.bhmc.dms.bat.sal.inc.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.inc.service.BatchIncJoinInfoService;

@Controller
public class SalBatIncTestController extends HController {
    
    @Resource(name="batchIncJoinInfoService")
    BatchIncJoinInfoService batchIncJoinInfoService;

    /**
     * 보험 고객추적 알람 테스트
     * @return chn.bhmc.dms.bat.crm.cso.service
     */
    @RequestMapping(value = "/bat/sal/inc/batCallIncJoinProcess.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallIncJoinProcess() throws Exception {
        batchIncJoinInfoService.callIncJoinProcess();
        return 1;

    }

}