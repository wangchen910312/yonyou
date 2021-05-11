package chn.bhmc.dms.bat.sal.cmm.service;

import java.util.Map;


/**
 * camel 호출요청.
 *
 * @author Kim Jin Suk
 * @since 2016.06.21
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.21         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface BatchSalesService {

    /**
     * camel 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeCamel(String serviceId) throws Exception;


    /**
     * 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeSalesProcedure(String proId) throws Exception;
    public void executeSalesProcedure(String proId, Map<String, ?> s1) throws Exception;

    /**
     * @param proId
     * @throws Exception
     */
    public void executeSalesDlrCheckProcedure() throws Exception;
}
