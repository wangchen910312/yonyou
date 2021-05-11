package chn.bhmc.dms.par.cpm.service;

import java.util.List;

import chn.bhmc.dms.par.cpm.vo.SkillAndQnaDetailVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO;

/**
 * 기술자문부품상세 서비스
 *
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim      최초 생성
 * </pre>
 */

public interface SkillAndQnaDetailService {

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
     * 기술자문부품  정보를 등록/수정/삭제한다.
     * @param skillAndQnaDetailVO - 삭제할 정보가 담긴 SkillAndQnaDetailVO
     * @return 등록/수정/삭제 목록수
     */
    //public void multiSkillAndQnaDetail(SkillAndQnaDetailSaveVO skillAndQnaDetailSaveVO) throws Exception;

    /**
     * Key에 해당하는 기술자문부품  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pblmNo - 문제번호
     * @return 조회한 기술자문부품  정보
     */
    public SkillAndQnaDetailVO selectSkillAndQnaDetailByKey(String dlrCd, String pblmNo) throws Exception;

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
