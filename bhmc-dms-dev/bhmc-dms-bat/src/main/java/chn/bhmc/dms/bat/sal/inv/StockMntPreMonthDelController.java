package chn.bhmc.dms.bat.sal.inv;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.inv.service.StockMntPreMonthDelService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockMntPreMonthDelController.java
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
public class StockMntPreMonthDelController extends HController {

    @Resource(name="stockMntPreMonthDelService")
    StockMntPreMonthDelService stockMntPreMonthDelService;

    @RequestMapping(value="/bat/sal/inv/StockMntPreMonthDel.do", method=RequestMethod.GET)
    @ResponseBody
    public void stockMntPreMonthDel(int day)throws Exception{

        stockMntPreMonthDelService.updateStockMntPreMonthDel(day);

    }

}
