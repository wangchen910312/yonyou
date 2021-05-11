package chn.bhmc.dms.ser.rev.service;

import java.util.List;

import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSaveVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.ser.rev.vo.ReservationReceiptVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReservationReceiptService.java
 * @Description : 예약접수 Service
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

public interface ReservationReceiptService {

    /**
     * 조회 조건에 해당하는 예약접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public int selectReservationReceiptByConditionCnt(ReservationReceiptSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 예약접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReservationReceiptSearchVO
     * @return 조회 목록
     */
    public List<ReservationReceiptVO> selectReservationReceiptByCondition(ReservationReceiptSearchVO searchVO) throws Exception;
    
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
     * 예약접수, 부품, 공임을 등록/수정한다.
     * @param reservationReceiptSaveVO - 예약/부품/공임을 포함하는 ReservationReceiptSaveVO
     * @return
     */
    public String multiReservationReceipt(ReservationReceiptSaveVO reservationReceiptSaveVO) throws Exception;

    /**
     * 예약접수를 등록/수정한다.
     * @param reservationReceiptVO - 예약/부품/공임을 포함하는 ReservationReceiptSaveVO
     * @return
     */
    public void updateReservationReceipt(ReservationReceiptVO reservationReceiptVO) throws Exception;

    /**
     *
     * 예약접수를 등록한다.
     *
     * @param reservationReceiptVO
     * @throws Exception
     */
    public String insertReservationReceipt(ReservationReceiptVO reservationReceiptVO) throws Exception;


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
     * 예약등록시 알람,SMS
     * @param obj - 수정할 정보가 담긴 ReservationReceiptVO
     * @return 등록된 목록수
     */
    public void resvRegAlramCall(List<ReservationReceiptVO> resvList) throws Exception;

}