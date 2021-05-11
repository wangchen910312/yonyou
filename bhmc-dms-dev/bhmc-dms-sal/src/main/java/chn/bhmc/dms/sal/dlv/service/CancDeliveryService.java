package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.CancDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.CancDeliveryVO;

/**
 * 이월판매취소결과조회 서비스
 *
 * @author Kim yewon
 * @since 2016. 5. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.05.20         Kim yewon            최초 생성
 * </pre>
 */

public interface CancDeliveryService {


	/**
     * 조회 조건에 해당하는 이월판매취소결과조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CancDeliverySearchVO
     * @return 조회 목록
     */
	public List<CancDeliveryVO> selectCancDeliveryByCondition(CancDeliverySearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 이월판매취소결과조회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CancDeliveryVO
     * @return
     */
	public int selectCancDeliveryByConditionCnt(CancDeliverySearchVO searchVO) throws Exception;


	//이월판매취소 승인
	public boolean updateApproveCancDelivery(CancDeliveryVO cancDeliveryVO) throws Exception;
}
