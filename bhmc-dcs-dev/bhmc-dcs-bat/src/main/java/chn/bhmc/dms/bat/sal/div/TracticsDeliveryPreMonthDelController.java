package chn.bhmc.dms.bat.sal.div;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.div.service.TracticsDeliveryPreMonthDelService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TracticsDeliveryPreMonthDelController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Controller
public class TracticsDeliveryPreMonthDelController extends HController {

    @Resource(name="tracticsDeliveryPreMonthDelService")
    TracticsDeliveryPreMonthDelService tracticsDeliveryPreMonthDelService;


    @RequestMapping(value = "/bat/sal/div/TracticsDeliveryPreMonthDel.do", method = RequestMethod.GET)
    @ResponseBody
    public void batchClaimApprove(int day)throws Exception{

        log.error("day="+day);

        tracticsDeliveryPreMonthDelService.updateTracticsDelivery(day);

    }

}
