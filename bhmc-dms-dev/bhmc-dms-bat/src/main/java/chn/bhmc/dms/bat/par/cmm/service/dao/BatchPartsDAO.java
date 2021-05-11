package chn.bhmc.dms.bat.par.cmm.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsDAO.java
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

@Mapper("batchPartsDAO")
public interface BatchPartsDAO {
    /**
     * 딜러벌 월 마감 재고금액 프로시져 호출
     * @param proId
     * @throws Exception
     */
    public void executeParMmStockAmtLoopDlrCdProcedure(String prCallProgramId, String prCallId, String debugMode, String yymm) throws Exception;

    /**
     * 딜러벌 월 마감 프로시져 호출
     * @param proId
     * @throws Exception
     */
    public void executeParMmDdlnLoopDlrCdProcedure(String prCallProgramId, String prCallId, String debugMode, String yymm, String dlrCd) throws Exception;

    /**
     * 부품구매인터페이스 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public void executeParPurchaseOrderInfcProcedure(String prCallProgramId) throws Exception;

    /**
     * 부품송장인터페이스 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public void executeParInvoiceInfcProcedure(String prCallProgramId) throws Exception;
    /**
     * 부품구매인터페이스 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public int executeParPurchaseOrderInfcProcedureOld(String prCallProgramId) throws Exception;

    /**
     * 부품송장인터페이스 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public int executeParInvoiceInfcProcedureOld(String prCallProgramId) throws Exception;

    /**
     * 부품마스터 기준창고 설정 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public int executeParItemStdStrgeProcedure(String prCallProgramId) throws Exception;

    /**
     * VALIDATION체크 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public int executeParValidationCheckProcedure(String prCallProgramId) throws Exception;

    /**
     * 재고전송 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public int executeStockInfcProcedure(int pDay) throws Exception;

    /**
     * 재고분석전송 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public int executeStockAnalysisInfcProcedure(int pDay) throws Exception;

    /**
     * 부품판매전송 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public int executePartsSaleInfcProcedure(int pDay) throws Exception;
    /**
     * 装箱单接口表生成业务表
     * @author liuxueying
     * @throws Exception
     */
    public void excecuteSpParInvoiceProcedure() throws Exception;
}
