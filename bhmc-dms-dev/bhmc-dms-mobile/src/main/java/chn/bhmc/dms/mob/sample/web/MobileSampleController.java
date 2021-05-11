package chn.bhmc.dms.mob.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import able.com.web.HController;

@Controller
public class MobileSampleController extends HController{
	
	@RequestMapping(value = "/mob/sample/selectMain.do")
	public String selectMain() throws Exception {
		return "/mob/sample/selectMain";
	}

}
