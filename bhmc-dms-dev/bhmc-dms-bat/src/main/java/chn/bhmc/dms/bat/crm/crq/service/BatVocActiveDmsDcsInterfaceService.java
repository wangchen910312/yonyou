package chn.bhmc.dms.bat.crm.crq.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatVocActiveDmsDcsInterfaceService
 * @Description : DMS-DCS 고객요청 활동 정보전송을 위한 데이터 수집
 * @author LEE IN MOON
 * @since 2016.10.10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.10.     LEE IN MOON     최초 생성
 * </pre>
 */

public interface BatVocActiveDmsDcsInterfaceService {

    /**
     * DMS - DCS로 전송
     * @param null
     * @return Count
     */
    public int selectVocActiveDmsDcs() throws Exception;

}