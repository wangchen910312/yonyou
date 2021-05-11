package chn.bhmc.dms.bat.par.cmm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.par.cmm.service.BatchPartsService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsProcedureBean.java
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

public class BatchPartsProcedureBean extends BaseJobBean {

	@Autowired
	BatchPartsService partsService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            //BatchPartsService partsService = getBean(BatchPartsService.class);
            String sID = context.getJobDetail().getJobDataMap().getString("sID");

            String prCallProgramId = context.getJobDetail().getJobDataMap().getString("prCallProgramId");
            String prCallId = context.getJobDetail().getJobDataMap().getString("prCallId");
            String debugMode = context.getJobDetail().getJobDataMap().getString("debugMode");

            int day = 1;

            String strDay = context.getJobDetail().getJobDataMap().getString("day");
            if(strDay != null){
                day = Integer.parseInt(strDay);
            }

            if(sID.equals("PAR001")){
                partsService.executeParMmStockAmtLoopDlrCdProcedure(prCallProgramId, prCallId, debugMode, null);
            }else if(sID.equals("PAR002")){
                partsService.executeParMmDdlnLoopDlrCdProcedure(prCallProgramId, prCallId, debugMode, null, null);
            }else if(sID.equals("PAR003")){
                partsService.executeParPurchaseOrderInfcProcedure(prCallProgramId);
            }else if(sID.equals("PAR004")){
                partsService.executeParInvoiceInfcProcedure(prCallProgramId);
            }else if(sID.equals("PAR005")){
                partsService.executeParItemStdStrgeProcedure(prCallProgramId);
            }else if(sID.equals("PAR006")){
                partsService.executeParValidationCheckProcedure(prCallProgramId);
            }else if(sID.equals("PAR007")){
                partsService.executeStockInfcProcedure(day);
            }else if(sID.equals("PAR008")){
                partsService.executeStockAnalysisInfcProcedure(day);
            }else if(sID.equals("PAR009")){
                partsService.executePartsSaleInfcProcedure(day);
            }else if(sID.equals("PAR010")){
            	//装箱单接口表生成业务表
                partsService.excecuteSpParInvoiceProcedure();
            }
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}