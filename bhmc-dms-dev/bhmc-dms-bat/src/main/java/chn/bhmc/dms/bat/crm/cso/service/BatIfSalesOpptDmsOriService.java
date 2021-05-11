package chn.bhmc.dms.bat.crm.cso.service;

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

public interface BatIfSalesOpptDmsOriService {

    /**
     * DMS - Ori로 전송하기위한 SalesOppt 정보
     * @param null
     * @return Count
     */
    public int selectSalesOpptDmsOri() throws Exception;

    /**
     * DMS - Ori로 전송하기위한 SalesOppt 정보
     * @param CR_0211IR --> CR_0211T or CR_0218T
     * @return Count
     */
    public int selectSalesOpptDmsOriDup() throws Exception;


}