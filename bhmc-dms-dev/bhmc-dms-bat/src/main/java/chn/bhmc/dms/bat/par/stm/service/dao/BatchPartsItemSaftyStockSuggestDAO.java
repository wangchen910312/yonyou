package chn.bhmc.dms.bat.par.stm.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftyStockSuggestDAO.java
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
@Mapper("batchPartsItemSaftyStockSuggestDAO")
public interface BatchPartsItemSaftyStockSuggestDAO {

    /**
     * 딜러별 구매제시계산 프로시져 호출
     *
     * @throws Exception
     */
    public void executeItemSaftyStockSuggestProcedure() throws Exception;
}
