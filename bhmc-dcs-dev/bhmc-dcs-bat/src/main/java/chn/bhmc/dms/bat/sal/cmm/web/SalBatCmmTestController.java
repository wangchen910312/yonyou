package chn.bhmc.dms.bat.sal.cmm.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;

@Controller
public class SalBatCmmTestController extends HController {
    
    @Resource(name="batchSalesService")
    BatchSalesService batchSalesService;

    /**
     * 프로시져 실행 테스트
     * @return chn.bhmc.dms.bat.sal.cmm.service
     */
    @RequestMapping(value = "/bat/sal/cmm/batCallSalesCmmProcedure.do", method = RequestMethod.GET)
    @ResponseBody
    public int batCallSalesCmmProcedure(String sid) throws Exception {
        batchSalesService.executeSalesProcedure(sid);
        return 1;
    }

}