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
 * @ClassName   : DeliveryAskDAO
 * @Description : 출고요청 DAO
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

@Mapper("deliveryAskDAO")
public interface DeliveryAskDAO {

    public int selectDeliveryAsksByConditionCnt(DeliveryAskSearchVO searchVO) throws Exception;
    public List<DeliveryAskVO> selectDeliveryAsksByCondition(DeliveryAskSearchVO searchVO) throws Exception;

    public int inertAskDelivery(DeliveryAskSaveVO saveVO) throws Exception;
    public int updateDeliveryState(DeliveryAskSaveVO saveVO) throws Exception;

}