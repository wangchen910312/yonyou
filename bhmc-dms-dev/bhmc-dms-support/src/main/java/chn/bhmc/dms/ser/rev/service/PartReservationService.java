package chn.bhmc.dms.ser.rev.service;

import java.util.List;

import chn.bhmc.dms.ser.rev.vo.PartReservationSaveVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationSearchVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationService.java
 * @Description : 부품예약 Service
 * @author KyungMok Kim
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

public interface PartReservationService {

    /**
     * 조회 조건에 해당하는 부품예약 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public int selectPartReservationByConditionCnt(PartReservationSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품예약을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public List<PartReservationVO> selectPartReservationByCondition(PartReservationSearchVO searchVO) throws Exception;

    /**
     * 부품예약접수, 부품을 등록/수정한다.
     * @param partReservationSaveVO - 예약/부품/공임을 포함하는 PartReservationSaveVO
     * @return
     */
    public String multiPartReservation(PartReservationSaveVO partReservationSaveVO) throws Exception;

    /**
     * 부품예약을 등록/수정한다.
     * @param partReservationVO - 예약/부품을 포함하는 PartReservationSaveVO
     * @return
     */
    public void updatePartReservation(PartReservationVO partReservationVO) throws Exception;


    /**
     * 조회 조건에 해당하는 예약 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public PartReservationVO selectPartReservationByKey(PartReservationSearchVO searchVO) throws Exception;

    /**
     * 부품예약 도착시 알람(SMS)
     * @param partReservationVO - 수정할 정보가 담긴 PartReservationVO
     * @return 등록된 목록수
     */
    public void partArrivalAlramCall(PartReservationVO partReservationVO) throws Exception;

    /**
     * 부품예약완료한다.
     * @param PartReservationVO - 수정할 정보가 담긴 PartReservationVO
     * @return
     */
    public String completePartReservation(PartReservationVO partReservationVO) throws Exception;

}