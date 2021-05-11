package chn.bhmc.dms.sal.ctm.service;

import java.util.List;

import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSaveVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSearchVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskVO;





/**
 *  출고요청 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface DeliveryFixService {

    /**
     * 출고확정관리 목록 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectDeliveryFixsByConditionCnt(DeliveryAskSearchVO searchVO) throws Exception;
    public List<DeliveryAskVO> selectDeliveryFixsByCondition(DeliveryAskSearchVO searchVO) throws Exception;

    /**
     * 출고확정
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int confirmFixDelivery(DeliveryAskSaveVO saveVO) throws Exception;
    public int inertFixDelivery(DeliveryAskSaveVO saveVO) throws Exception;
    public int updateFixDeliveryState(DeliveryAskSaveVO saveVO) throws Exception;


    /**
     * 출고확정취소
     */
    public int confirmFixDeliveryCancel(DeliveryAskSaveVO saveVO) throws Exception;

}
