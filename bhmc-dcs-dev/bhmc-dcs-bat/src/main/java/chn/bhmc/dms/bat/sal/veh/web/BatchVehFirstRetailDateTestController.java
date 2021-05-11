package chn.bhmc.dms.bat.sal.veh.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.veh.service.BatchVehFirstRetailDateService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchVehFirstRetailDateTestController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 6. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 27.     Lee Seungmin     최초 생성
 * </pre>
 */

@Controller
public class BatchVehFirstRetailDateTestController extends HController{

    @Resource(name="batchVehFirstRetailDateService")
    BatchVehFirstRetailDateService batchVehFirstRetailDateService;

    @RequestMapping(value = "/bat/sal/veh/batFirstRetailDateTestCall.do", method = RequestMethod.GET)
    @ResponseBody
    public int batFirstRetailDate()throws Exception{
        return batchVehFirstRetailDateService.batFirstRetailDate();
    }

}
