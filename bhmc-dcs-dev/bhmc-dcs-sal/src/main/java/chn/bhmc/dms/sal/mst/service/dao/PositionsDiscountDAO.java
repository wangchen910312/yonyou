package chn.bhmc.dms.sal.mst.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.mst.vo.PositionsDiscountAmtVO;
import chn.bhmc.dms.sal.mst.vo.PositionsDiscountSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PositionsDiscountDAO.java
 * @Description : 평가정보 다운로드 DAO
 * @author 유승봉
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.       Bong                최초 생성
 * </pre>
 */

@Mapper("positionsDiscountDAO")
public interface PositionsDiscountDAO {

   /**
    * Searching Order Grade Condition.
    */
   public List<PositionsDiscountAmtVO> selectPositionsDiscountAmtCondition(PositionsDiscountSearchVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectPositionsDiscountAmtConditionCnt(PositionsDiscountSearchVO searchVO);

   /**
    * 할인금액을 수정한다.
    * @param PositionsDiscountAmtVO
    * @return
    */
   public int updatePositionsDiscountAmt(PositionsDiscountAmtVO LocalVO);

   /**
    * 할인금액을 등록한다.
    * @param PositionsDiscountAmtVO
    * @return
    */
   public int insertPositionsDiscountAmt(PositionsDiscountAmtVO LocalVO);

}
