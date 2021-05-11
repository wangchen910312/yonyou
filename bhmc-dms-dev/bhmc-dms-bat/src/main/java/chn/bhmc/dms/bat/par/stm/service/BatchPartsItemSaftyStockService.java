package chn.bhmc.dms.bat.par.stm.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftyStockSerice.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 12. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 1.     In Bo Shim     최초 생성
 * </pre>
 */

public interface BatchPartsItemSaftyStockService {

    /**
     * 딜러별 적정재고계산 프로시져 호출
     *
     * @throws Exception
     */
    public void executeItemSaftyStockProcedure() throws Exception;
}
