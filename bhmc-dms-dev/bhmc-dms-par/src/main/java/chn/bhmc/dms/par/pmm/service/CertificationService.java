package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.CertificationSaveVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSearchVO;
import chn.bhmc.dms.par.pmm.vo.CertificationVO;

/**
 * <pre>
 * 합격증 관리 서비스
 * </pre>
 *
 * @ClassName   : Certification.java
 * @author Eun Jung Jang
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Eun Jung Jang    최초 생성
 * </pre>
 */

public interface CertificationService {

    /**
     * 조회조건에 해당하는 합격증 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public int selectCertListByConditionCnt(CertificationSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 합격증 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public List<CertificationVO> selectCertListByCondition(CertificationSearchVO searchVO) throws Exception;

    public String selectNextCertNo() throws Exception;

    /**
     *합격증  정보를 등록한다.
     * @param certificationVO - 등록할 정보가 담긴 certificationVO
     * @return 등록된 목록수
     */
    public CertificationVO insertCertReq(CertificationVO certificationVO) throws Exception;

    /**
     *합격증  정보 및 파일정보를 등록한다.
     * @param certificationVO - 등록할 정보가 담긴 certificationVO
     * @return 등록된 목록수
     */
    public CertificationVO insertCertReq(CertificationSaveVO certificationSaveVO) throws Exception;

    /**
     *합격증  정보 및 파일정보를 수정한다.
     * @param certificationVO - 등록할 정보가 담긴 certificationVO
     * @return 등록된 목록수
     */
    public CertificationVO updateCertReq(CertificationSaveVO certificationSaveVO) throws Exception;

    /**
     * Key에 해당하는 합격증 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는
     * @return 조회 목록
     */
    public CertificationVO selectCertReqByKey(CertificationSearchVO certificationSearchVO) throws Exception;




}
