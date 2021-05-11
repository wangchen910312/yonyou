package chn.bhmc.dms.bat.sal.rcp.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import able.com.web.HController;
import chn.bhmc.dms.bat.sal.rcp.service.BatchInvImgInfoService;


import javax.annotation.Resource;



@RestController
public class ImgController  extends HController {
	
	@Resource(name="batchInvImgInfoService")
	BatchInvImgInfoService batchInvImgInfoService;
	

	@RequestMapping(value = "/bat/sal/rcp/ImgRun.do", method = RequestMethod.GET)
    @ResponseBody
    public String toImgSingleThread()throws Exception{

		
		batchInvImgInfoService.readBlod2Pictures();


        return "OK";
    }

}
