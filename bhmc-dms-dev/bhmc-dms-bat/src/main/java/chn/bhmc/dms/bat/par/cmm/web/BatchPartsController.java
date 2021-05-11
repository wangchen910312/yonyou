package chn.bhmc.dms.bat.par.cmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.bat.par.cmm.service.BatchPartsService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 9. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 11.     Ju Won Lee     최초 생성
 * </pre>
 */
@Controller
public class BatchPartsController extends HController {
    @Resource(name="batchPartsService")
    BatchPartsService batchPartsService;

    /**
     * 월마감 이평가 및 재고금액 실행 프로시저
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeParMmStockAmtLoopDlrCdProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeParMmStockAmtLoopDlrCdProcedure() throws Exception {
        String prCallProgramId = "batch";
        String prCallId = "admin";
        String debugMode = "Y";
        batchPartsService.executeParMmStockAmtLoopDlrCdProcedure(prCallProgramId, prCallId, debugMode, null);
    }

    /**
     * 월마감 실행 프로시저
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeParMmDdlnLoopDlrCdProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeParMmDdlnLoopDlrCdProcedure() throws Exception {
        String prCallProgramId = "batch";
        String prCallId = "admin";
        String debugMode = "Y";
        batchPartsService.executeParMmDdlnLoopDlrCdProcedure(prCallProgramId, prCallId, debugMode, null, null);
    }

    /**
     * 구매오더상태 실행 프로시저
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeParPurchaseOrderInfcProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeParPurchaseOrderInfcProcedureOld() throws Exception {
        batchPartsService.executeParPurchaseOrderInfcProcedure("PTS003");
    }

    /**
     * 송장 실행 프로시저
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeParInvoiceInfcProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeParInvoiceInfcProcedure() throws Exception {
        batchPartsService.executeParInvoiceInfcProcedure("PTS004");
    }

    /**
     * 부품마스터 기준창고 적용 프로시저
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeParItemStdStrgeProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeParItemStdStrgeProcedure() throws Exception {
        batchPartsService.executeParItemStdStrgeProcedure("PTS005");
    }

    /**
     * VALIDATION체크 정보 DCS로 전송
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeParValidationCheckProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeParValidationCheckProcedure() throws Exception {
        batchPartsService.executeParValidationCheckProcedure("PTS107");
    }

    /**
     * 재고전송 정보 DCS로 전송
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeStockInfcProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeStockInfcProcedure() throws Exception {
        batchPartsService.executeStockInfcProcedure(1);
    }

    /**
     * 재고분석전송 정보 DCS로 전송
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executeStockAnalysisInfcProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executeStockAnalysisInfcProcedure() throws Exception {
        batchPartsService.executeStockAnalysisInfcProcedure(1);
    }

    /**
     * 부품판매 정보 DCS로 전송
     * @return chn.bhmc.dms.bat.par.cmm.service
     */
    @RequestMapping(value = "/bat/par/cmm/executePartsSaleInfcProcedure.do", method = RequestMethod.POST)
    @ResponseBody
    public void executePartsSaleInfcProcedure() throws Exception {
        batchPartsService.executePartsSaleInfcProcedure(1);
    }

}
