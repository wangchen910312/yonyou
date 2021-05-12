package chn.bhmc.dms.bat.par.stm.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemSaftyStockDAO.java
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
@Mapper("batchPartsItemSaftyStockDAO")
public interface BatchPartsItemSaftyStockDAO {

    /**
     * 딜러별 적정재고계산 프로시져 호출
     *
     * @throws Exception
     */
    public void executeItemSaftyStockProcedure() throws Exception;
}