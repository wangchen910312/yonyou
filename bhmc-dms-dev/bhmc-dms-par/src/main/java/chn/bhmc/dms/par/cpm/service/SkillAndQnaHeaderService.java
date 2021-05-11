package chn.bhmc.dms.par.cpm.service;

import java.util.List;

import chn.bhmc.dms.par.cpm.vo.SkillAndQnaHeaderVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSaveVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO;

/**
 * 기술자문헤더 서비스
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

public interface SkillAndQnaHeaderService {

    /**
     * 기술자문  정보를 등록한다.
     * @param skillAndQnaHeaderVO 등록할 정보가 담긴 SkillAndQnaHeaderVO
     * @return 등록된 목록수
     */
    public int insertSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception;

    /**
     * 기술자문  정보를 수정한다.
     * @param skillAndQnaHeaderVO - 수정할 정보가 담긴 SkillAndQnaHeaderVO
     * @return 수정된 목록수
     */
    public int updateSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception;

    /**
     * 기술자문  정보를 삭제한다.
     * @param skillAndQnaHeaderVO - 삭제할 정보가 담긴 SkillAndQnaHeaderVO
     * @return 삭제된 목록수
     */
    public int deleteSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception;

    /**
     * 기술자문  정보를 등록/수정/삭제한다.
     * @param skillAndQnaHeaderVO - 삭제할 정보가 담긴 SkillAndQnaHeaderVO
     * @return 등록/수정/삭제 목록수
     */
    public void multiSkillAndQnaHeader(SkillAndQnaSaveVO skillAndQnaSaveVO) throws Exception;

    /**
     * 기술자문  정보를 BMP에 전송한다.
     * @param skillAndQnaHeaderVO - 삭제할 정보가 담긴 SkillAndQnaHeaderVO
     */
    public void sendSkillAndQnaHeader(SkillAndQnaHeaderVO skillAndQnaHeaderVO) throws Exception;

    /**
     * Key에 해당하는 기술자문  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pblmCd - 측문제번호
     * @return 조회한 기술자문  정보
     */
    public SkillAndQnaHeaderVO selectSkillAndQnaHeaderByKey(String dlrCd, String pblmNo) throws Exception;

    /**
     * 조회 조건에 해당하는 기술자문  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SkillAndQnaHeaderSearchVO
     * @return 조회 목록
     */
    public List<SkillAndQnaHeaderVO> selectSkillAndQnaHeadersByCondition(SkillAndQnaSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 기술자문  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SkillAndQnaHeaderSearchVO
     * @return 조회 목록 수
     */
    public int selectSkillAndQnaHeadersByConditionCnt(SkillAndQnaSearchVO searchVO) throws Exception;
}
