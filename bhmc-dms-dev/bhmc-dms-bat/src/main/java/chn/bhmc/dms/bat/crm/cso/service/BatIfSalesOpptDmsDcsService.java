package chn.bhmc.dms.bat.crm.cso.service;

import chn.bhmc.dms.core.support.camel.Data;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfSalesOpptDmsDcsService
 * @Description : SalesOppt Info. Interfacd Batch Service
 * @author LEE KYOJIN
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     LEE KYOJIN     최초 생성
 * </pre>
 */

public interface BatIfSalesOpptDmsDcsService {

    /**
     * DMS - DCS로 전송하기위한 SalesOppt 정보 수집
     * @param null
     * @return Count
     */
    public int selectSalesOpptDmsDcs() throws Exception;

    /**
     * DMS IR to DMS T로 데이터 처리
     * @param null
     * @return Count
     */
    public int selectSalesOpptDmsOri() throws Exception;

    /**
     * DCS 전송을 위한 Camel Client 호출
     * Statements
     *
     * @return
     * @throws Exception
     */
    public Data selectSalesOpptProcessCallCamel() throws Exception;



}