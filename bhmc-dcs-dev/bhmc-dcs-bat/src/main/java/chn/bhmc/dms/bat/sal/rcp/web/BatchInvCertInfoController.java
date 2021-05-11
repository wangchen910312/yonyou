package chn.bhmc.dms.bat.sal.rcp.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.sal.rcp.service.BatchInvCertInfoService;

/**
 * @ClassName   : BatchInvCertInfoController
 * @Description : 판매 - 영수증 취합
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
public class BatchInvCertInfoController extends HController {

    @Resource(name="batchInvCertInfoService")
    BatchInvCertInfoService batchInvCertInfoService;

    @RequestMapping(value = "/bat/sal/rcp/secondDistrictRun.do", method = RequestMethod.GET)
    @ResponseBody
    public void InvCertInfoRun(String serviceId)throws Exception{
        batchInvCertInfoService.InvCertInfoRun(serviceId);
    }

}