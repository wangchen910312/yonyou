package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.CertificationFileVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSearchVO;

/**
 * <pre>
 * 합격증 파일 관리 서비스
 * </pre>
 *
 * @ClassName   : CertificationFileService.java
 * @author In Bo Shim
 * @since 2016. 11. 07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 07.     In Bo Shim    최초 생성
 * </pre>
 */

public interface CertificationFileService {

    /**
     *합격증  정보를 등록한다.
     * @param CertificationFileVO - 등록할 정보가 담긴 certificationFileVO
     * @return 등록된 목록수
     */
    public int insertCertificationFile(CertificationFileVO certificationFileVO) throws Exception;

    /**
     *합격증  정보를 수정한다.
     * @param CertificationFileVO - 수정할 정보가 담긴 certificationFileVO
     * @return 수정된 목록수
     */
    public int updateCertificationFile(CertificationFileVO certificationFileVO) throws Exception;

    /**
     *합격증  정보를 삭제한다.
     * @param CertificationFileVO - 삭제할 정보가 담긴 certificationFileVO
     * @return 삭제된 목록수
     */
    public int deleteCertificationFile(CertificationFileVO certificationFileVO) throws Exception;

    /**
     * 조회조건에 해당하는 합격증 파일 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public int selectCertificationFileCnt(CertificationSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 합격증 파일 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public List<CertificationFileVO> selectCertificationFileByCondition(CertificationSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 합격증 파일 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public CertificationFileVO selectCertificationFileByKey(CertificationSearchVO searchVO) throws Exception;







}
