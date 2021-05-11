package chn.bhmc.dms.par.pmm.service;

import chn.bhmc.dms.par.pmm.vo.CertificationSaveVO;

/**
 * <pre>
 * 합격증 인터페이스 서비스
 * </pre>
 *
 * @ClassName   : CertificationInterfaceService.java
 * @author In Bo Shim
 * @since 2016. 11. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 09.  In Bo Shim    최초 생성
 * </pre>
 */

public interface CertificationInterfaceService {

    /**
     * 합격증 엔진정보를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public void multiCertificationEngineSend(CertificationSaveVO certificationSaveVO) throws Exception;

    /**
     * 합격증 엔진정보를 수정한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public void multiCertificationSendEngineUpdate(CertificationSaveVO certificationSaveVO) throws Exception;

    /**
     * 합격증 엔진정보를 삭제한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public void multiCertificationSendEngineDelete(CertificationSaveVO certificationSaveVO) throws Exception;


    /**
     * 합격증 바디(차체)정보를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public void multiCertificationBodySend(CertificationSaveVO certificationSaveVO) throws Exception;

    /**
     * 합격증 바디(차체)정보를 수정한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public void multiCertificationSendBodyUpdate(CertificationSaveVO certificationSaveVO) throws Exception;

    /**
     * 합격증 바디(차체)정보를 삭제한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public void multiCertificationSendBodyDelete(CertificationSaveVO certificationSaveVO) throws Exception;


}
