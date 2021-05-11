package chn.bhmc.dms.bat.par.pmm.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchStockService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 19.     Mid Eum Park     최초 생성
 * </pre>
 */

public interface BatchStockService {

    /**
     * 재고 프로시저 호출
     * @param proId
     * @throws Exception
     */
    public void executeStockProcedure() throws Exception;
}
