package chn.bhmc.dms.bat.sal.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesAddresService;
import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;

@Controller
public class SalBatCmmTestController extends HController {

    @Resource(name="batchSalesService")
    BatchSalesService batchSalesService;

    @Resource(name="batchSalesAddresService")
    BatchSalesAddresService batchSalesAddresService;

    /**
     * 프로시져 + 카멜 배치 테스트
     * @return chn.bhmc.dms.bat.crm.cso.service
     */
    @RequestMapping(value = "/bat/sal/cmm/batCallIncJoinProcess.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallIncJoinProcess(String procedure, String sid) throws Exception {
        batchSalesService.executeSalesProcedure(procedure);
        batchSalesService.executeCamel(sid);
        return 1;

    }


    /**
     * ping 배치 테스트
     * @return chn.bhmc.dms.bat.crm.cso.service
     */
    @RequestMapping(value = "/bat/sal/cmm/batCallPingSearch.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallPingSearch(String url, String timeOut) throws Exception {
        batchSalesAddresService.pingSearch(url, Integer.parseInt(timeOut));
        return 1;

    }

}