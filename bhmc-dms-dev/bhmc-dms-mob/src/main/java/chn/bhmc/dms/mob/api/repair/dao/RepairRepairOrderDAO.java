package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.RepairOrderVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderDAO.java
 * @Description : RO DAO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("RepairRepairOrderDAO")
public interface RepairRepairOrderDAO {
	
	public int selectRepairOrderInfoListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;
	
	public int selectRepairOrderListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    public int selectRepairOrderByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectRepairOrderByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectRepairOrderListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectRepairOrderInfoListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectRepairOrderHistoryByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public int selectCarWashListByConditionCnt(RepairOrderSearchVO searchVO) throws Exception;
    
    public List<RepairOrderVO> selectCarWashListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectLbrHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectCustDmndHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;

    public List<RepairOrderVO> selectEtcHistListByCondition(RepairOrderSearchVO searchVO) throws Exception;


}