package chn.bhmc.dms.bat.crm.cmm.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatDataOutBatIfService
 * @Description : Customer Info. Interfacd Batch Service
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

public interface BatDmsDataOutService {

    /**
     * DMS - DCS로 전송하기위한 CRM 전체 데이터 아웃
     * @param null
     * @return Count
     */
    public void selectDmsData(String fPath, String strDay, String strTable) throws Exception;

    public void selectIF() throws Exception;
}