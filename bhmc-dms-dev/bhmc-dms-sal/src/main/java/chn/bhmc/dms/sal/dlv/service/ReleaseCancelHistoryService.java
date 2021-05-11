package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelHistoryListVO;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelHistoryVO;

/**
*
* @ClassName   : ReleaseCancelHistoryService.java
* @Description : 출고취소이력을 조회한다.
* @author
* @since 2016. 10. 22.
* @version 1.0
* @see
* @Modification Information
* <pre>
*       수정일                            수정자                              수정내용
*  ----------------    ------------    ---------------------------
*   2016.10.22         Yoon Se Ran          최초 생성
* </pre>
*/

public interface ReleaseCancelHistoryService {

	/**
     * 조회 조건에 해당하는 출고취소 이력을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReleaseCancelHistoryVO
     * @return 조회 목록
     */
	public List<ReleaseCancelHistoryListVO> selectReleaseCancelHistoryByCondition(ReleaseCancelHistoryVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 출고취소 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReleaseCancelHistoryVO
     * @return
     */
	public int selectReleaseCancelHistoryByConditionCnt(ReleaseCancelHistoryVO searchVO) throws Exception;
}
