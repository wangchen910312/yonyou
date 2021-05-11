package chn.bhmc.dms.bat.par.pmm.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.par.pmm.service.BatchInvoiceService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchInvoiceController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 2. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 13.     Mid Eum Park     최초 생성
 * </pre>
 */

@Controller
public class BatchInvoiceController {

    /**
     * 송장정보 서비스
     */
    @Resource(name="batchInvoiceService")
    BatchInvoiceService batchInvoiceService;

    /**
     *  송장 프로시져를 호출한다.
     * @return
     */
    @RequestMapping(value = "/bat/par/pmm/selectInvoiceProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectInvoiceProcedure() throws Exception {

        //GWMS 부품 가격 정보 가져오기 프로시져 호출.
        batchInvoiceService.executeInvoiceProcedure();

        return true;
    }
}
