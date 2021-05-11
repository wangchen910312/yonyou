package chn.bhmc.dms.bat.par.stm.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftyStockSuggestSerice.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 12. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 5.     In Bo Shim     최초 생성
 * </pre>
 */

public interface BatchPartsItemSaftyStockSuggestService {

    /**
     * 딜러별 구매제시 프로시져 호출
     *
     * @throws Exception
     */
    public void executeItemSaftyStockSuggestProcedure() throws Exception;
}
