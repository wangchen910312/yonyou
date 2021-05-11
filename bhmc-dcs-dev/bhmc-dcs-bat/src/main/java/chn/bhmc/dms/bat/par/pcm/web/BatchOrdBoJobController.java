package chn.bhmc.dms.bat.par.pcm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import chn.bhmc.dms.bat.par.pcm.service.BatchOrdBoService;



@Controller
public class BatchOrdBoJobController extends HController{

    @Resource(name="batchOrdBoService")
    BatchOrdBoService batchOrdBoService;

    /**
     * 배치 실행 테스트
     * @return chn.bhmc.dms.bat.par.dli.service
     */
    @RequestMapping(value = "/bat/par/pcm/batchOrdBoJob.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchOrdBoJob() throws Exception {
         batchOrdBoService.executeBatchORdBoProcedure();
    }

}
