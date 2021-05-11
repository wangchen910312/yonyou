package chn.bhmc.dms.bat.sal.dlr.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.dlr.service.BatchSecondDistrictService;

/**
 * @ClassName   : BatchSecondDistrictController
 * @Description : 판매 - 1급/2급 심사자 정보 셋팅
 * @author Kim Jin Suk
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.     Kim Jin Suk     최초 생성
 * </pre>
 */
@Controller
public class BatchSecondDistrictController extends HController {

    @Resource(name="batchSecondDistrictService")
    BatchSecondDistrictService batchSecondDistrictService;

    @RequestMapping(value = "/bat/sal/dlr/secondDistrictRun.do", method = RequestMethod.GET)
    @ResponseBody
    public void secondDistrictRun()throws Exception{
        batchSecondDistrictService.secondDistrictRun();
    }

}