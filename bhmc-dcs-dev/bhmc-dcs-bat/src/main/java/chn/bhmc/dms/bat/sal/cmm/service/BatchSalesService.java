package chn.bhmc.dms.bat.sal.cmm.service;

import java.util.Map;

import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;


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

    public CommDMSDoc executeEaiService(String pgmId) throws Exception;

    public CommDMSDoc executeEaiService(String pgmId , String sender) throws Exception;

    /**
     * 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeSalesProcedure(String proId) throws Exception;
    public void executeSalesProcedure(String proId, Map<String, ?> s1) throws Exception;

}
