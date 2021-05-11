package chn.bhmc.dms.sal.orc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderDAO.java
 * @Description : 미배정 주문조회 DAO
 * @author Bong
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.     Bong               최초 생성
 * </pre>
 */

@Mapper("notAssignedOrderDAO")
public interface NotAssignedOrderDAO {

    /**
     *  Counting of Order Grade Condition.
     */
    public int selectNotAssignedOrderCnt(NotAssignedOrderSearchVO searchVO) throws Exception;

    /**
      * 조회 조건에 해당하는 정보를 조회한다.
      */
    public List<NotAssignedOrderVO> selectNotAssignedOrder(NotAssignedOrderSearchVO searchVO) throws Exception;

    /**
     * 미배정 주문조회 합계 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public NotAssignedOrderVO selectNotAssignedOrderSumSearch(NotAssignedOrderSearchVO searchVO) throws Exception;


    public int updateNotAssignedOrder(NotAssignedOrderVO saveVO) throws Exception;

    /**
     * 미배정취소 계획 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int orderCancelPlanSerchCnt(NotAssignedOrderVO searchVO) throws Exception;

    /**
     * 미배정취소 요청
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int insertOrderCancelAsk(NotAssignedOrderVO saveVO) throws Exception;

    /**
     * 미배정취소 요청 I/F
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int orderCancelAskIF(NotAssignedOrderVO saveVO) throws Exception;

    /**
     * 미배정 오더 취소 내역 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectNotAssignedOrderCancelSearchCnt(NotAssignedOrderSearchVO searchVO) throws Exception;

    /**
     * 미배정 오더 취소 내역 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<NotAssignedOrderVO> selectNotAssignedOrderCancelSearch(NotAssignedOrderSearchVO searchVO) throws Exception;

}