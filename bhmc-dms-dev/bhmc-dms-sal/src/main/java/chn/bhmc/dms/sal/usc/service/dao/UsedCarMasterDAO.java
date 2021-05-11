package chn.bhmc.dms.sal.usc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSearchVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarMasterDAO
 * @Description : 중고차량마스터관리 DAO
 * @author Kim yewon
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.     Kim yewon              최초 생성
 * </pre>
 */

@Mapper("usedCarMasterDAO")
public interface UsedCarMasterDAO {
    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
   public List<UsedCarMasterVO> selectUsedCarMasterByCondition(UsedCarMasterSearchVO searchVO);

   /**
    *  조회 조건에 해당하는  총 갯수를 조회한다.
    */
   public int selectUsedCarMasterByConditionCnt(UsedCarMasterSearchVO searchVO);

   //중고차량정보(단건) 조회
   public UsedCarMasterVO selectUsedCar(UsedCarMasterSearchVO searchVO);


   //수선차량정보(단건) 조회
   public TopSelectionUsedCarVO selectTopSelectionCar(@Param("sVinNo") String sVinNo);

   //중고차량정보 수정
   public int updateUsedCar(UsedCarMasterVO saveVO);


   /**
    *
    *  수선 중고차 여부
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public int selectUsedCarRepairOrderByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
    */
   public int selectUsedCarOwnerByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;
   public List<UsedCarMasterVO> selectUsedCarOwnerByCondition(UsedCarMasterSearchVO searchVO) throws Exception;


   /**
    * 차량소유자 사용여부를 N으로 변경
    */
   public int updateUsedCarOwnerNonUsed(UsedCarMasterVO saveVO) throws Exception;


   /**
    * 차량 소유자 등록
    */
   public int insertUsedCarOwner(UsedCarMasterVO vo) throws Exception;
   /**
    * 차량 소유자 수정
    */
   public int updateUsedCarOwner(UsedCarMasterVO vo) throws Exception;

   /**
    * 조회 조건에 해당하는 차량운전자 정보를 조회한다.
    */
   public int selectUsedCarDriverByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;
   public List<UsedCarMasterVO> selectUsedCarDriverByCondition(UsedCarMasterSearchVO searchVO);


   /**
    * 차량 운전자 등록
    */
   public int insertUsedCarDriver(UsedCarMasterVO vo) throws Exception;
   /**
    * 차량 운전자 수정
    */
   public int updateUsedCarDriver(UsedCarMasterVO vo) throws Exception;

   /**
    * 중고차 - 계약 차량목록 조회
    */
   public int selectUsedCarContsByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception;
   public List<UsedCarMasterVO> selectUsedCarContsByCondition(UsedCarMasterSearchVO searchVO) throws Exception;

}
