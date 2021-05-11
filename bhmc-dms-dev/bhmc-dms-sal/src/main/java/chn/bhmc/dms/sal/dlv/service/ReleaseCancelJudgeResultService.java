package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelJudgeResultListVO;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelJudgeResultVO;

/**
*
* @ClassName   : ReleaseCancelJudgeResultService.java
* @Description : 출고취소 심사결과를 조회한다.
* @author
* @since 2016. 10. 20.
* @version 1.0
* @see
* @Modification Information
* <pre>
*       수정일                            수정자                              수정내용
*  ----------------    ------------    ---------------------------
*   2016.10.20         Choi KyungYong          최초 생성
* </pre>
*/

public interface ReleaseCancelJudgeResultService {

	/**
     * 조회 조건에 해당하는 출고취소 심사결과를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReleaseCancelJudgeResultVO
     * @return 조회 목록
     */
	public List<ReleaseCancelJudgeResultListVO> selectReleaseCancelJudgeResulByCondition(ReleaseCancelJudgeResultVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 출고취소 심사결과 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReleaseCancelJudgeResultVO
     * @return
     */
	public int selectReleaseCancelJudgeResulByConditionCnt(ReleaseCancelJudgeResultVO searchVO) throws Exception;
}
