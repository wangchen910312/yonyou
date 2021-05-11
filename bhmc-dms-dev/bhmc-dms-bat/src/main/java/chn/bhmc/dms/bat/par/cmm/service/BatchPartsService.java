package chn.bhmc.dms.bat.par.cmm.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsService.java
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

public interface BatchPartsService {

    /**
     * 딜러벌 월 마감 재고금액 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeParMmStockAmtLoopDlrCdProcedure(String prCallProgramId, String prCallId, String debugMode, String yymm) throws Exception;

    /**
     * 딜러벌 월 마감 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeParMmDdlnLoopDlrCdProcedure(String prCallProgramId, String prCallId, String debugMode, String yymm, String dlrCd) throws Exception;

    /**
     * 부품 구매 인터페이스 프로시저 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeParPurchaseOrderInfcProcedure(String prCallProgramId) throws Exception;

    /**
     * 부품 송장 인터페이스 프로시저 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeParInvoiceInfcProcedure(String prCallProgramId) throws Exception;

    /**
     * 부품 기준창고 설정 프로시저 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeParItemStdStrgeProcedure(String prCallProgramId) throws Exception;

    /**
     * VALIDATION체크 프로시저 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeParValidationCheckProcedure(String prCallProgramId) throws Exception;

    /**
     * 재고전송 프로시저 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeStockInfcProcedure(int pDay) throws Exception;

    /**
     * 재고분석전송 프로시저 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeStockAnalysisInfcProcedure(int pDay) throws Exception;

    /**
     * 부품판매전송 프로시저 호출
     * @param serviceId
     * @throws Exception
     */
    public void executePartsSaleInfcProcedure(int pDay) throws Exception;

    /**
     * 装箱单接口表生成业务表
     * @author liuxueying
     * @throws Exception
     */
    public void excecuteSpParInvoiceProcedure() throws Exception;
}
