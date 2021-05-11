package chn.bhmc.dms.sal.orm.service;

import java.util.List;

import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoSearchOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoSearchOrderVO;

/**
 * BTO 주문생성 서비스
 *
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16         Bong            최초 생성
 * </pre>
 */

public interface BtoSearchOrderService {

    /**
     * 주차 및 메모 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return 조회 목록
     */
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoSearchOrderSearchVO
     * @return 조회 목록
     */
    public int selectBtoSearchOrderByConditionCnt(BtoSearchOrderSearchVO searchVO) throws Exception;
	public List<BtoSearchOrderVO> selectBtoSearchOrderByCondition(BtoSearchOrderSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoSearchOrderSearchVO
     * @return 조회 목록
     */
    public List<BtoSearchOrderVO> selectBtoSearchOrderDetailByCondition(BtoSearchOrderSearchVO searchVO) throws Exception;


}
