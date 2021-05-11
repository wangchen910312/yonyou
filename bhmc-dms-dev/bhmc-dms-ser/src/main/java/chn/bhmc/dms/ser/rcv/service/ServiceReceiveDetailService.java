package chn.bhmc.dms.ser.rcv.service;

import java.util.List;

import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSaveVO;
import chn.bhmc.dms.ser.cal.service.model.ResponseData;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDetailService.java
 * @Description : 수납디테일 Service
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface ServiceReceiveDetailService {

    /**
     * 조회 조건에 해당하는 디테일 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public int selectServiceReceiveDetailsByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public int selectServiceReceiveDetailsHistByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일이력 을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsHistByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 수납 디테일을 등록/수정한다.
     * @param serviceReceiveDetailSaveVO - 디테일정보를 포함하는 ServiceReceiveDetailVO
     * @return
     */
    public void multiServiceReceiveDetail(ServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception;

    /**
     *
     * 수납 일괄 환불
     *
     * @param serviceReceiveSaveVO
     * @throws Exception
     */
    public ResponseData updateRefundReceiveDetail(ServiceReceiveSaveVO serviceReceiveSaveVO) throws Exception;


    /**
     * 수납 디테일을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteServiceReceiveDetail(ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception;

    /**
     * 수납 디테일을 추가한다.
     * @param resvDocNo
     * @return
     */
    public void insertServiceReceiveDetail(ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception;

    /**
     * 수납 디테일을 수정한다.
     * @param resvDocNo
     * @return
     */
    public void updateServiceReceiveDetail(ServiceReceiveDetailVO serviceReceiveDetailVO) throws Exception;

    /**
     * 수납 수납완료 여부를 조회 한다.
     * @param resvDocNo
     * @return
     */
    public ServiceReceiveDetailVO selectServiceReceiveConfimByKey(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 수납통계를 조회한다
     * @param resvDocNo
     * @return
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveStats(ServiceReceiveSearchVO searchVO) throws Exception;
    
    //聚合查询订单id
    public List<ServiceReceiveDetailVO> selectTradeId(ServiceReceiveSearchVO searchVO) throws Exception;
    
    //聚合修改tradeid
    public void updateTrade(ServiceReceiveDetailVO serviceReceiveSaveVO) throws Exception;
}