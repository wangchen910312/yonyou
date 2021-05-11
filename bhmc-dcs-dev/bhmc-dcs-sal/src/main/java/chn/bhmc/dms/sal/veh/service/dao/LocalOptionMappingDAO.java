package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LocalOptionPriceDAO
 * @Description : 로컬옵션 가격정보 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("localOptionMappingDAO")
public interface LocalOptionMappingDAO {
    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
   public List<LocalOptionMappingVO> selectLocalOptionMappingsByCondition(LocalOptionMappingSearchVO searchVO);

   /**
    *  조회 조건에 해당하는  총 갯수를 조회한다.
    */
   public int selectLocalOptionMappingsByConditionCnt(LocalOptionMappingSearchVO searchVO);

   /**
    * 로컬옵션 가격을 저장한다.
    * @param LocalOptionMappingVO
    * @return
    */
   public int insertLocalOptionMappings(LocalOptionMappingVO LocalVO);

   /**
    * 로컬옵션 가격을 수정한다.
    * @param LocalOptionMappingVO
    * @return
    */
   public int updateLocalOptionMappings(LocalOptionMappingVO LocalVO);

   /**
    * 로컬옵션 가격을 삭제한다.
    * @param LocalOptionMappingVO
    * @return
    */
   public int deleteLocalOptionMappings(LocalOptionMappingVO LocalVO);

}
