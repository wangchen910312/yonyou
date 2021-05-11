package chn.bhmc.dms.sal.cmm.service;

import java.util.Map;

import chn.bhmc.dms.core.support.camel.Data;



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


    /**
    *
    * CamelClent
    *
    * @param message
    * @param ifId
    * @return
    * @throws Exception
    */
    public boolean executeCamelClent(Map<String, Object> message , String ifId)throws Exception;


    /**
    *
    * CamelClent
    *
    * @param message
    * @param ifId
    * @return
    * @throws Exception
    */
    public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception;

    /**
     *
     * CamelClentERP Call
     *
     * @param messages
     * @param ifId
     * @param receiver
     * @return
     * @throws Exception
     */
    public Data executeCamelClentListResult(Map<String, Object> messages , String ifId, String receiver)throws Exception;

}
