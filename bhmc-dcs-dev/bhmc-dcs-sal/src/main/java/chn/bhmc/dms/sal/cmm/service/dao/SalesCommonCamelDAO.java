package chn.bhmc.dms.sal.cmm.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesCommonCamelDAO
 * @Description : 판매공통 DAO
 * @author Kim Jin Suk
 * @since 2016. 7. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("salesCommonCamelDAO")
public interface SalesCommonCamelDAO {

    /**
     * 프로시져 호출
     * @param proId
     * @throws Exception
     */
    public void executeSalesProcedure(String proId) throws Exception;

}
