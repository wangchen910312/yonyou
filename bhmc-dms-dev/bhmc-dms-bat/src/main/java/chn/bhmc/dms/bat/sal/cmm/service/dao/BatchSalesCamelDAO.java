package chn.bhmc.dms.bat.sal.cmm.service.dao;

import java.util.Map;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesCamelDAO
 * @Description : 판매배치 DAO
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

@Mapper("batchSalesCamelDAO")
public interface BatchSalesCamelDAO {

    /**
     * 프로시져 호출
     * @param proId
     * @throws Exception
     */
    public void executeSalesProcedure(String proId) throws Exception;
    public void executeSalesProcedure1(Map<String, ?> s1) throws Exception;
    public void executeSalesProcedure2(Map<String, ?> s1) throws Exception;
    public void executeSalesProcedure3(Map<String, ?> s1) throws Exception;
    public void executeSalesProcedure4(Map<String, ?> s1) throws Exception;

    public void executeSalesDlrCheckProcedure(@Param("sDlrCd") String sDlrCd) throws Exception;
}
