package chn.bhmc.dms.sal.dlr.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlr.vo.DistDealerSearchVO;
import chn.bhmc.dms.sal.dlr.vo.DistDealerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DistDealerMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 25
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25     Kim yewon              최초 생성
 * </pre>
 */

@Mapper("distDealerMngDAO")
public interface DistDealerMngDAO {

    /**
      * 조회 조건에 해당하는 지역딜러(사무소) - 사무소 정보를 조회한다.
      */
    public List<DistDealerVO> selectDistDealerMngByCondition(DistDealerSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 지역딜러(사무소) - 사무소 목록 총 갯수를 조회한다.
     */
    public int selectDistDealerMngByConditionCnt(DistDealerSearchVO searchVO);


    /**
     * 조회 조건에 해당하는 지역딜러(사무소) - 딜러 정보를 조회한다.
     */
   public List<DistDealerVO> selectDealerByCondition(DistDealerSearchVO searchVO);

   /**
    *  조회 조건에 해당하는 지역딜러(사무소) - 딜러 목록 총 갯수를 조회한다.
    */
   public int selectDealerByConditionCnt(DistDealerSearchVO searchVO);


   //지역딜러 DELETE
   public void deleteDealer(DistDealerVO vo);

   //지역딜러 INSERT
   public void insertDealer(DistDealerVO vo);

}
