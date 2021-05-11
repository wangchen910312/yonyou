package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.CertificationSearchVO;
import chn.bhmc.dms.par.pmm.vo.CertificationVO;

/**
 * <pre>
 * 합격증에 관한 데이터처리 매퍼 클래스
 * </pre>
 *
 * @ClassName   : CertificationDAO
 * @author Eun Jung Jang
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Eun Jung Jang     최초 생성
 * </pre>
 */

@Mapper("certificationDAO")
public interface CertificationDAO {

    /**
     * 조회조건에 해당하는 합격증 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    public int selectCertListByConditionCnt(CertificationSearchVO searchVO)throws Exception;

    /**
     * 조회조건에 해당하는 합격증 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public List<CertificationVO> selectCertListByCondition(CertificationSearchVO searchVO) throws Exception;

    /**
     * 합격증 정보를 등록 처리한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public int insertCertReq(CertificationVO certificationVO)throws Exception;

    /**
     * 합격증 정보를 수정한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public int updateCertReq(CertificationVO certificationVO)throws Exception;

    /**
     * Key에 해당하는 합격증 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return 조회 목록
     */
    public CertificationVO selectCertReqByKey(CertificationSearchVO certificationSearchVO);



}
