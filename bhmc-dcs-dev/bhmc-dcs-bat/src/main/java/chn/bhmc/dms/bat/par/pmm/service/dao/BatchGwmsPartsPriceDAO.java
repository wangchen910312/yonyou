package chn.bhmc.dms.bat.par.pmm.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchGwmsPartsMarkupDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 10. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 10.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("batchGwmsPartsPriceDAO")
public interface BatchGwmsPartsPriceDAO {

    /**
     * GWMS 부품가격 프로시져 호출
     * @param proId
     * @throws Exception
     */
    public void executeGwmsPartsPriceProcedure() throws Exception;
}
