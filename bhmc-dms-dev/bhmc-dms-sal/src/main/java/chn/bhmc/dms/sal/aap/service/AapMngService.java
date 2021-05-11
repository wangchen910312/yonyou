package chn.bhmc.dms.sal.aap.service;

import java.util.List;

import chn.bhmc.dms.sal.aap.vo.AapMngSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapMngVO;

/**
 * 대행업무관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 4. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.04.17         Kim yewon            최초 생성
 * </pre>
 */

public interface AapMngService {


	/**
     * 조회 조건에 해당하는 대행업무관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AapMngSearchVO
     * @return 조회 목록
     */
	public List<AapMngVO> selectAapMngByCondition(AapMngSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 대행업무관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AapMngSearchVO
     * @return
     */
	public int selectAapMngByConditionCnt(AapMngSearchVO searchVO) throws Exception;

	/**
     * 대행업무 저장한다.
     * @param saveVO
     */
    public String saveAapMng(AapMngVO saveVO) throws Exception;


    /**
     * 대행업무를 신규 등록
     */
    public int insertAapMng(AapMngVO vo) throws Exception;
    /**
     * 대행업무 삭제한다.
     * @param saveVO
     * @throws Exception
     */
    public int deleteContractAapMng(AapMngVO saveVO) throws Exception;

}
