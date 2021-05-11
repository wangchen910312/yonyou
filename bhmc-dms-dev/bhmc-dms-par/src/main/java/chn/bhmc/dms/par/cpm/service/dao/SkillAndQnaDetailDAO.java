package chn.bhmc.dms.par.cpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.cpm.vo.SkillAndQnaDetailVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SkillAndQnaDetailDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("skillAndQnaDetailDAO")
public interface SkillAndQnaDetailDAO {

    /**
     * 기술자문부품  정보를 등록한다.
     * @param skillAndQnaDetailVO 등록할 정보가 담긴 SkillAndQnaDetailVO
     * @return 등록된 목록수
     */
    public int insertSkillAndQnaDetail(SkillAndQnaDetailVO skillAndQnaDetailVO) throws Exception;

    /**
     * 기술자문부품  정보를 수정한다.
     * @param skillAndQnaDetailVO - 수정할 정보가 담긴 SkillAndQnaDetailVO
     * @return 수정된 목록수
     */
    public int updateSkillAndQnaDetail(SkillAndQnaDetailVO skillAndQnaDetailVO) throws Exception;

    /**
     * 기술자문부품  정보를 삭제한다.
     * @param skillAndQnaDetailVO - 삭제할 정보가 담긴 SkillAndQnaDetailVO
     * @return 삭제된 목록수
     */
    public int deleteSkillAndQnaDetail(SkillAndQnaDetailVO skillAndQnaDetailVO) throws Exception;

    /**
     * Key에 해당하는 기술자문부품  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품번호
     * @return 조회한 기술자문부품  정보
     */
    public SkillAndQnaDetailVO selectSkillAndQnaDetailByKey(@Param("dlrCd") String dlrCd, @Param("pblmNo") String pblmNo) throws Exception;

    /**
     * 조회 조건에 해당하는 기술자문부품  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SkillAndQnaDetailSearchVO
     * @return 조회 목록
     */
    public List<SkillAndQnaDetailVO> selectSkillAndQnaDetailsByCondition(SkillAndQnaSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기술자문부품  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SkillAndQnaDetailSearchVO
     * @return 조회 목록 수
     */
    public int selectSkillAndQnaDetailsByConditionCnt(SkillAndQnaSearchVO searchVO) throws Exception;
}
