package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveVO;


/**
 * <pre>
 * 수납관리 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : ServiceReceiveDAO.java
 * @Description : 수납관리 DAO
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("RepairServiceReceiveDAO")
public interface RepairServiceReceiveDAO {

	public List<ServiceReceiveVO> selectServiceReceiveByCondition(ServiceReceiveSearchVO searchVO);
	
    public List<ServiceReceiveVO> selectServiceReceiveStatusByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    public int selectServiceReceiveStatusByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;
    
    public String selectServiceReceiveAmouts(ServiceReceiveSearchVO searchVO) throws Exception;

}
