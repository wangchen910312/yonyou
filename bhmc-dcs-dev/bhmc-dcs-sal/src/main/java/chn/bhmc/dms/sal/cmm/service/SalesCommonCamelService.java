package chn.bhmc.dms.sal.cmm.service;

import java.util.Map;

import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;



/**
 * camel 호출요청. (이승민 과장 요청)
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.21         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface SalesCommonCamelService {

    /**
     * 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    public void executeSalesProcedure(String proId) throws Exception;

    /**
    *
    * EAI Client Call
    *
    * @param DLR_CD , Messge
    * @return
    * @throws Exception
    */
    public boolean executeWebSeviceEaiCall( String dlrCd ,String ifId, String sender, Map<String, Object> message, String flag)throws Exception;

    /**
     *
     * Statements
     *
     * @param pgmId
     * @return
     * @throws Exception
     */
    public CommDMSDoc executeEaiService(String pgmId) throws Exception;
}
