package chn.bhmc.dms.sal.uva.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementSearchVO;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarPriceManagementDAO.java
 * @Description : 중고차 가격관리 DAO
 * @author 유승봉
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.       Bong                최초 생성
 * </pre>
 */

@Mapper("usedCarPriceManagementDAO")
public interface UsedCarPriceManagementDAO {

   /**
    * Searching Order Grade Condition.
    */
   public List<UsedCarPriceManagementVO> selectUsedCarPriceManagementCondition(UsedCarPriceManagementSearchVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectUsedCarPriceManagementConditionCnt(UsedCarPriceManagementSearchVO searchVO);

   /**
    * 중고차 가격정보를 수정한다.
    * @param UsedCarPriceManagementVO
    * @return
    */
   public int updateUsedCarPriceManagement(UsedCarPriceManagementVO LocalVO);

   /**
    * 중고차 가격정보를 등록한다.
    * @param UsedCarPriceManagementVO
    * @return
    */
   public int insertUsedCarPriceManagement(UsedCarPriceManagementVO LocalVO);

}
