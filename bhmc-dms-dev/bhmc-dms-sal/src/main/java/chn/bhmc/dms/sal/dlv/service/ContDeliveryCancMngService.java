package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySaveVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;

/**
 * 출고취소 서비스
 *
 * @author yewon.kim
 * @since 2016. 10. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일              수정자                수정내용
 *  ----------------   ------------    ---------------------------
 *   2016. 10. 24.       yewon.kim            최초 생성
 * </pre>
 */

public interface ContDeliveryCancMngService {


	/**
     * 조회 조건에 해당하는 출고취소 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContDeliverySearchVO
     * @return 조회 목록
     */
	public List<ContDeliveryVO> selectContDeliveryCancByCondition(ContDeliverySearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 출고취소관리 목록의  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContDeliverySearchVO
     * @return
     */
	public int selectContDeliveryCancByConditionCnt(ContDeliverySearchVO searchVO) throws Exception;
	public int selectOneShotCheck(DeadlineCtrlMngSearchVO searchVO) throws Exception;

	//출고취소
    public void contDeliveryCanc(ContDeliverySaveVO saveVO) throws Exception;
}
