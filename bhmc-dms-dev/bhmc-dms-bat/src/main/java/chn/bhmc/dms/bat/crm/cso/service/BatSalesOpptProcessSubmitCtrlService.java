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

public interface BatSalesOpptProcessSubmitCtrlService {

    /**
     * 4단계에서 일정 기간 지나면 자동전출
     * @param null
     * @return Count
     */
    public int updateSalesOpptProcessSubmitCtrl() throws Exception;


}