package chn.bhmc.dms.ser.rev.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.rev.vo.PartReservationSearchVO;
import chn.bhmc.dms.ser.rev.vo.PartReservationVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationDAO.java
 * @Description : 부품예약 DAO
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

@Mapper("partReservationDAO")
public interface PartReservationDAO {

    /**
     * 조회 조건에 해당하는 예약접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public int selectPartReservationByConditionCnt(PartReservationSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 예약접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public List<PartReservationVO> selectPartReservationByCondition(PartReservationSearchVO searchVO);

    /**
     * 예약접수 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 PartReservationVO
     * @return 등록된 목록수
     */
    public void insertPartReservation(PartReservationVO obj);

    /**
     * 예약접수 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 PartReservationVO
     * @return 수정된 목록수
     */
    public void updatePartReservation(PartReservationVO obj);

    /**
     * 예약접수 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 PartReservationVO
     * @return 삭제된 목록수
     */
    public void deletePartReservation(PartReservationVO obj);

    /**
     * 조회 조건에 해당하는 예약 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartReservationSearchVO
     * @return 조회 목록
     */
    public PartReservationVO selectPartReservationByKey(PartReservationSearchVO searchVO) throws Exception;

}