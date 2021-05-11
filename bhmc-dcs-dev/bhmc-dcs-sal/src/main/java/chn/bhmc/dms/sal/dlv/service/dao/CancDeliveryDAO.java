package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlv.vo.CancDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.CancDeliveryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 20
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("cancDeliveryDAO")
public interface CancDeliveryDAO {

    /**
      * 조회 조건에 해당하는 고객인도 정보를 조회한다.
      */
    public List<CancDeliveryVO> selectCancDeliveryByCondition(CancDeliverySearchVO searchVO);

    /**
     *  조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    public int selectCancDeliveryByConditionCnt(CancDeliverySearchVO searchVO);

    //이월판매취소 승인
    //public boolean updateApproveCancDelivery(CancDeliveryVO cancDeliveryVO);
    public int updateApproveCancDelivery(CancDeliveryVO cancDeliveryVO);

    //프로시저 추가 : 이월판매취소 승인
    public boolean procApproveCancDelivery(CancDeliveryVO saveVO) throws Exception;

}
