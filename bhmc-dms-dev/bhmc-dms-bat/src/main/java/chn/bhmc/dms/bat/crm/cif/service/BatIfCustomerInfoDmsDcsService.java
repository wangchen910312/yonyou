package chn.bhmc.dms.bat.crm.cif.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfCustomerInfoDmsDcsService.java
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

public interface BatIfCustomerInfoDmsDcsService {

    /**
     * DMS - DCS로 전송하기위한 고객정보 수집
     * @param null
     * @return Count
     */
    public int selectCustomerInfoDmsDcs() throws Exception;

    /**
     * DMS - DCS로 전송하기위한 고객정보 주소 수집
     * @param null
     * @return Count
     */
    public int selectCustomerInfoAddrDmsDcs() throws Exception;

    /**
     * DMS - DCS로 전송하기위한 고객정보 연계인 수집
     * @param null
     * @return Count
     */
    public int selectCustomerInfoRelCustDmsDcs() throws Exception;
}