package chn.bhmc.dms.sal.orm.service;

import java.util.Date;
import java.util.List;

import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsSearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsVO;

/**
 * 오더유지 결과조회 서비스
 *
 * @author Bong
 * @since 2016. 4. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.22         Bong            최초 생성
 * </pre>
 */

public interface MaintainOrderQueryResultsService {

    /**
     * 년월의 초기값을 조회한다.
     */
    public Date selectSysDt() throws Exception;

    /**
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MaintainOrderQueryResultsSearchVO
     * @return 조회 목록
     */
	public List<MaintainOrderQueryResultsVO> selectMaintainOrderQueryResultsByCondition(MaintainOrderQueryResultsSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 정산순위 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MaintainOrderQueryResultsSearchVO
     * @return
     */
	public int selectMaintainOrderQueryResultsByConditionCnt(MaintainOrderQueryResultsSearchVO searchVO) throws Exception;

	/**
     * 상세정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MaintainOrderQueryResultsVO
     * @return 조회 목록
     */
    public List<MaintainOrderQueryResultsVO> selectMaintainOrderQueryResultsDetByCondition(MaintainOrderQueryResultsVO searchVO) throws Exception;



}
