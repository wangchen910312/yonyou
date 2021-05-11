package chn.bhmc.dms.bat.cmm.itg.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IntegrationDbIfService
 * @Description : DMS - DCS 통합 DB I/F 전송을 위한  Service
 * @author Choi KyungYong
 * @since 2017. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 1. 20.     Choi KyungYong            최초 생성
 * </pre>
 */

public interface IntegrationDbIfService {

    /**
     * DMS - DCS 통합 DB I/F 전송을 위한  Method
     * @param null
     * @return Count
     */
    public void requestIntegrationDbIf(int day) throws Exception;

}