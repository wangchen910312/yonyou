package chn.bhmc.dms.sal.ctm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSaveVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskSearchVO;
import chn.bhmc.dms.sal.ctm.vo.DeliveryAskVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliveryFixDAO
 * @Description : 출고확정 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     Kim Jin Suk        최초 생성
 * </pre>
 */

@Mapper("deliveryFixDAO")
public interface DeliveryFixDAO {

    public int selectDeliveryFixsByConditionCnt(DeliveryAskSearchVO searchVO) throws Exception;
    public List<DeliveryAskVO> selectDeliveryFixsByCondition(DeliveryAskSearchVO searchVO) throws Exception;

    public int inertFixDelivery(DeliveryAskSaveVO saveVO) throws Exception;
    public int updateFixDeliveryState(DeliveryAskSaveVO saveVO) throws Exception;

}