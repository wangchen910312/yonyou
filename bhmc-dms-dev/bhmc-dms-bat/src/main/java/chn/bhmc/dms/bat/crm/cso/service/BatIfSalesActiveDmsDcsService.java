package chn.bhmc.dms.bat.crm.cso.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfSalesActiveDmsDcsService
 * @Description : SalesActive Info. Interfacd Batch Service
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

public interface BatIfSalesActiveDmsDcsService {

    /**
     * DMS - DCS로 전송하기위한 SalesActive 정보 수집
     * @param null
     * @return Count
     */
    public int selectSalesActiveDmsDcs() throws Exception;


}