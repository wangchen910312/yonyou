package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;

import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.ServiceReceiveVO;



/**
 * <pre>
 * 수납관리 관리 Service
 * </pre>
 *
 * @ClassName   : ServiceReceiveService.java
 * @Description : .수납 관리 Service
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

public interface RepairServiceReceiveService {

    public List<ServiceReceiveVO> selectServiceReceiveStatusByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    public List<ServiceReceiveVO> selectServiceReceiveByCondition(ServiceReceiveSearchVO searchVO) throws Exception;
    
    public int selectServiceReceiveStatusByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;
    
    public String selectServiceReceiveAmouts(ServiceReceiveSearchVO searchVO) throws Exception;

}
