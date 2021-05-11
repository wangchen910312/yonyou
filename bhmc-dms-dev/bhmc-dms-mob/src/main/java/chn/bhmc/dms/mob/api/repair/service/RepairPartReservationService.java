package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.PartReservationSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.PartReservationVO;




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

public interface RepairPartReservationService {

    public int selectPartReservationByConditionCnt(PartReservationSearchVO searchVO) throws Exception;

    public List<PartReservationVO> selectPartReservationByCondition(PartReservationSearchVO searchVO) throws Exception;
}