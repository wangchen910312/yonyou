package chn.bhmc.dms.bat.sal.cmm.service.dao;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesAddresDAO
 * @Description : DAO
 * @author Kim Jin Suk
 * @since 2018. 3. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("batchSalesAddresDAO")
public interface BatchSalesAddresDAO {

    /**
     * 프로시져 호출
     * @param proId
     * @throws Exception
     */
    public void pingSearch(@Param("sUrl") String sUrl, @Param("sContYn") String sContYn) throws Exception;


}
