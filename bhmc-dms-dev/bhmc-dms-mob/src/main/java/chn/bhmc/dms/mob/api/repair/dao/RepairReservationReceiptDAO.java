package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.ReservationReceiptSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.ReservationReceiptVO;



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

@Mapper("RepairReservationReceiptDAO")
public interface RepairReservationReceiptDAO {

    public int selectReservationReceiptListByConditionCnt(ReservationReceiptSearchVO searchVO)throws Exception;

    public List<ReservationReceiptVO> selectReservationReceiptListByCondition(ReservationReceiptSearchVO searchVO)throws Exception;

}