package chn.bhmc.dms.sal.acc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.acc.vo.AccessoryConditionSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryConditionVO;

/**
 * @ClassName   : AccessoryConditionDAO
 * @Description : 경품판매현황 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("accessoryConditionDAO")
public interface AccessoryConditionDAO {

    /**
     * 경품판매현황 내역을 조회한다.
     */
    public int selectAccessoryConditionsByConditionCnt(AccessoryConditionSearchVO searchVO) throws Exception;
    public List<AccessoryConditionVO> selectAccessoryConditionsByCondition(AccessoryConditionSearchVO searchVO) throws Exception;
}