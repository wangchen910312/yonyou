package chn.bhmc.dms.bat.ser.rev.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.ser.rev.service.ReseReceiptService;
import able.com.web.HController;
@Controller
public class ReserReceTestController  extends HController {
    @Resource(name="reseReceiptService")
	ReseReceiptService reseReceiptService;
    
    @RequestMapping(value = "/bat/ser/rev/insertReservationReceipt.do", method = RequestMethod.GET)
    @ResponseBody
    public int insertReservationReceipt() throws Exception {
    	reseReceiptService.insertReservationReceipt();
        return 1;
    }
}
