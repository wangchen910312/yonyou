package chn.bhmc.dms.bat.par.pmm.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemPriceService.java
 * @Description : 배치 부품가격 프로시져 서비스
 * @author In Bo Shim
 * @since 2017. 06. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 06. 17.     In Bo Shim     최초 생성
 * </pre>
 */

public interface BatchPartsItemPriceService {

    /**
     * 딜러별 부품가격 프로시져 호출
     *
     * @throws Exception
     */
    public void executeItemPriceProcedure(String ifId) throws Exception;
}
