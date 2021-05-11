package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.CertificationFileVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSearchVO;

/**
 * <pre>
 * 합격증 파일 데이터처리 매퍼 클래스
 * </pre>
 *
 * @ClassName   : CertificationFileDAO
 * @author In Bo Shim
 * @since 2016. 11. 07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 07.     In Bo Shim     최초 생성
 * </pre>
 */

@Mapper("certificationFileDAO")
public interface CertificationFileDAO {

    /**
     * 합격증 정보를 등록 처리한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public int insertCertificationFile(CertificationFileVO certificationFileVO)throws Exception;

    /**
     * 합격증 정보를 수정 처리한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public int updateCertificationFile(CertificationFileVO certificationFileVO)throws Exception;

    /**
     * 합격증 정보를 삭제 처리한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public int deleteCertificationFile(CertificationFileVO certificationFileVO)throws Exception;

    /**
     * 조회조건에 해당하는 합격증 파일 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public int selectCertificationFileCnt(CertificationSearchVO searchVO)throws Exception;

    /**
     * 조회조건에 해당하는 합격증 파일 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public List<CertificationFileVO> selectCertificationFileByCondition(CertificationSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 합격증 파일 단일정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public CertificationFileVO selectCertificationFileByKey(CertificationSearchVO searchVO) throws Exception;

}
