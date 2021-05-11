package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceVO;

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

@Mapper("localOptionPriceDAO")
public interface LocalOptionPriceDAO {
    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
   public List<LocalOptionPriceVO> selectLocalOptionPricesByCondition(LocalOptionPriceSearchVO searchVO);

   /**
    *  조회 조건에 해당하는  총 갯수를 조회한다.
    */
   public int selectLocalOptionPricesByConditionCnt(LocalOptionPriceSearchVO searchVO);

   /**
    * 로컬옵션 가격을 저장한다.
    * @param LocalOptionPriceVO
    * @return
    */
   public int insertLocalOptionPrices(LocalOptionPriceVO LocalVO);

   /**
    * 로컬옵션 가격을 수정한다.
    * @param LocalOptionPriceVO
    * @return
    */
   public int updateLocalOptionPrices(LocalOptionPriceVO LocalVO);

   /**
    * 로컬옵션 가격을 삭제한다.
    * @param LocalOptionPriceVO
    * @return
    */
   public int deleteLocalOptionPrices(LocalOptionPriceVO LocalVO);

   /**
    * 로컬옵션의 상품리스트 조회 [계약품의 화면]
    * @param LocalOptionPriceVO
    * @return
    */
   public int selectLocalOptionPriceListsByConditionCnt(LocalOptionPriceSearchVO searchVO);
   public List<LocalOptionPriceVO> selectLocalOptionPriceListsByCondition(LocalOptionPriceSearchVO searchVO);

}
