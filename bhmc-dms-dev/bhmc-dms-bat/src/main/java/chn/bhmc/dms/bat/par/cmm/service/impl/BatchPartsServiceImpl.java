package chn.bhmc.dms.bat.par.cmm.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.cmm.service.BatPartsCmmCamelService;

import chn.bhmc.dms.bat.par.cmm.service.BatchPartsService;
import chn.bhmc.dms.bat.par.cmm.service.dao.BatchPartsDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Ju Won Lee     최초 생성
 * </pre>
 */

@Service("batchPartsService")
public class BatchPartsServiceImpl extends HService implements BatchPartsService {

    /**
     * 부품공통 DAO 선언
     */
    @Resource(name="batchPartsDAO")
    BatchPartsDAO batchPartsDAO;


    @Autowired
    BatPartsCmmCamelService batPartsCmmCamelService;

    /*
     * @see chn.bhmc.dms.bat.par.cmm.BatchPartsService#executeParMmStockAmtLoopDlrCdProcedure(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public void executeParMmStockAmtLoopDlrCdProcedure(String prCallProgramId, String prCallId, String debugMode, String yymm)
            throws Exception {
        batchPartsDAO.executeParMmStockAmtLoopDlrCdProcedure(prCallProgramId, prCallId, debugMode, yymm);
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executeParMmDdlnLoopDlrCdProcedure(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public void executeParMmDdlnLoopDlrCdProcedure(String prCallProgramId, String prCallId, String debugMode, String yymm, String dlrCd)
            throws Exception {
        batchPartsDAO.executeParMmDdlnLoopDlrCdProcedure(prCallProgramId, prCallId, debugMode, yymm, dlrCd);
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executeParPurchaseOrderInfcProcedure(java.lang.String)
     */
    @Override
    public void executeParPurchaseOrderInfcProcedure(String prCallProgramId) throws Exception {
        batchPartsDAO.executeParPurchaseOrderInfcProcedure(prCallProgramId);
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executeParPurchaseOrderInfcProcedure(java.lang.String)
     */
    @Override
    public void executeParInvoiceInfcProcedure(String prCallProgramId) throws Exception {
        batchPartsDAO.executeParInvoiceInfcProcedure(prCallProgramId);
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executeParPurchaseOrderInfcProcedure(java.lang.String)
     */
    @Override
    public void executeParItemStdStrgeProcedure(String prCallProgramId) throws Exception {
        batchPartsDAO.executeParItemStdStrgeProcedure(prCallProgramId);
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executeParValidationCheckProcedure(java.lang.String)
     */
    @Override
    public void executeParValidationCheckProcedure(String prCallProgramId) throws Exception {
        // TODO Auto-generated method stub
        batchPartsDAO.executeParValidationCheckProcedure(prCallProgramId);

        HashMap<String, Object> message = new HashMap<String, Object>();

        batPartsCmmCamelService.executeCamelClient(message, "PTS107");
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executeStockInfcProcedure(java.lang.String)
     */
    @Override
    public void executeStockInfcProcedure(int pDay) throws Exception {
        // TODO Auto-generated method stub
        batchPartsDAO.executeStockInfcProcedure(pDay);

        HashMap<String, Object> message = new HashMap<String, Object>();

        batPartsCmmCamelService.executeCamelClient(message, "PTS108");
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executeStockAnalysisInfcProcedure(int)
     */
    @Override
    public void executeStockAnalysisInfcProcedure(int pDay) throws Exception {
        // TODO Auto-generated method stub
        batchPartsDAO.executeStockAnalysisInfcProcedure(pDay);

        HashMap<String, Object> message = new HashMap<String, Object>();

        batPartsCmmCamelService.executeCamelClient(message, "PTS109");
    }

    /*
     * @see chn.bhmc.dms.bat.par.cmm.service.BatchPartsService#executePartsSaleInfcProcedure(int)
     */
    @Override
    public void executePartsSaleInfcProcedure(int pDay) throws Exception {
        // TODO Auto-generated method stub
        batchPartsDAO.executePartsSaleInfcProcedure(pDay);

        HashMap<String, Object> message = new HashMap<String, Object>();

        batPartsCmmCamelService.executeCamelClient(message, "PTS110");

    }

	@Override
	public void excecuteSpParInvoiceProcedure() throws Exception {
		batchPartsDAO.excecuteSpParInvoiceProcedure();
	}
}
