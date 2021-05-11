package chn.bhmc.dms.bat.crm.crq.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerCareBatchService
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

public interface BatCustomerCareBatchService {

    /**
     * DMS - DCS로 전송하기위한 SalesOppt 정보 수집
     * @param null
     * @return Count
     */
    public String customerCareTargetExtract() throws Exception;


}