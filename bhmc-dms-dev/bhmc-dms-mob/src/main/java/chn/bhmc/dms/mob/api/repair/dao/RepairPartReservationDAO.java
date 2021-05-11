package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.PartReservationSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.PartReservationVO;


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

@Mapper("RepairPartReservationDAO")
public interface RepairPartReservationDAO {

    public int selectPartReservationByConditionCnt(PartReservationSearchVO searchVO);

    public List<PartReservationVO> selectPartReservationByCondition(PartReservationSearchVO searchVO);

}