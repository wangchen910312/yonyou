package chn.bhmc.dms.bat.par.pmm.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemPriceDAO.java
 * @Description : 클래스 설명을 기술합니다.
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

@Mapper("batchPartsItemPriceDAO")
public interface BatchPartsItemPriceDAO {

    /**
     * 딜러별 부품가격 프로시져 호출
     *
     * @throws Exception
     */
    public void executeItemPriceProcedure(String sIfId) throws Exception;
}
