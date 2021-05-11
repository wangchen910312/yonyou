package chn.bhmc.dms.ser.rev.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReservationReceiptDAO.java
 * @Description : 예약접수 DAO
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("reservationReceiptDAO")
public interface ReservationReceiptDAO {

    /**
     * 조회 조건에 해당하는 예약접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public int selectReservationReceiptByConditionCnt(ReservationReceiptSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 예약접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public List<ReservationReceiptVO> selectReservationReceiptByCondition(ReservationReceiptSearchVO searchVO)throws Exception;
    
    
    /**
     * 조회 조건에 해당하는 칸반보드 예약접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public List<ReservationReceiptVO> selectKanbanReservationByCondition(ReservationReceiptSearchVO searchVO)throws Exception;
    
    

    /**
     * 조회 조건에 해당하는 예약접수현황  갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public int selectReservationReceiptListByConditionCnt(ReservationReceiptSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 예약접수현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public List<ReservationReceiptVO> selectReservationReceiptListByCondition(ReservationReceiptSearchVO searchVO)throws Exception;

    /**
     * 예약접수 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 ReservationReceiptVO
     * @return 등록된 목록수
     */
    public void insertReservationReceipt(ReservationReceiptVO obj);

    /**
     * 예약접수 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 ReservationReceiptVO
     * @return 수정된 목록수
     */
    public void updateReservationReceipt(ReservationReceiptVO obj);

    /**
     * 예약접수 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 ReservationReceiptVO
     * @return 삭제된 목록수
     */
    public void deleteReservationReceipt(ReservationReceiptVO obj);

    /**
     * 조회 조건에 해당하는 예약 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public ReservationReceiptVO selectReservationReceiptByKey(ReservationReceiptSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 예약 준수 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public ReservationReceiptVO selectReservationReceiptByStats(ReservationReceiptSearchVO searchVO) throws Exception;

    /**
     * 예약접수 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 ReservationReceiptVO
     * @return 등록된 목록수
     */
    public void updateReservationReceiptByVinNo(ReservationReceiptVO obj) throws Exception;
    /**
     * @author liuxueying 
     * @param resvDocNo
     * @return
     */
    public ReservationReceiptVO selectReservationReceiptByNo(String resvDocNo);
    /**
     * 插入给dcs上报的fms下预约单状态变化的接口表
     * @param obj
     * @author liuxueying
     */
    public void insertReservationReceiptIS(ReservationReceiptVO obj);
    /**
     * 根据单号维护第一次确认预约时间
     * @param obj
     * @author liuxueying
     */
    public void updateReservationResvDtByNo(ReservationReceiptVO obj);
}