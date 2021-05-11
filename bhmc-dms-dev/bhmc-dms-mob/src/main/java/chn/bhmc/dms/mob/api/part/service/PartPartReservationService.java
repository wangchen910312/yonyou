package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.PartReservationSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PartReservationVO;



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

public interface PartPartReservationService {

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

    
}