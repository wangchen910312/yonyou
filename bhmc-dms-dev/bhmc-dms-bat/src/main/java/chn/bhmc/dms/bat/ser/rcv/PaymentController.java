package chn.bhmc.dms.bat.ser.rcv;
import able.com.web.HController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.ser.rcv.service.PaymentCompleteService;
import chn.bhmc.dms.bat.ser.rcv.vo.PaymentCompleteVO;

/**
 * 수납관리
 *
 * @author Kim Jin Suk
 * @since 2017. 1. 07
 * @version 1.0
 * @see
 * 
 *      <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                수정자                  수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.01.07           Kim Jin Suk            최초 생성
 *      </pre>
 */

@Controller
@RequestMapping(value = "/bat/payInfo")
public class PaymentController extends HController {

	@Autowired
	PaymentCompleteService paymentCompleteService;

	@RequestMapping(value = "/payInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public void selectPayInfoMainSearch(@RequestBody PaymentCompleteVO searchVO) throws Exception {
		try {
			paymentCompleteService.finish();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
