package chn.bhmc.dms.sal.lom.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.lom.vo.DistributorAbnormalInventorySearchVO;
import chn.bhmc.dms.sal.lom.vo.DistributorAbnormalInventoryVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionSearchVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleMonitoringDlrDetailPopupVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TpVehicleMonitoringDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

@Mapper("tpVehicleMonitoringDAO")
public interface TpVehicleMonitoringDAO {

   /**
    * Searching Order Grade Condition.
    */
   public List<TpVehicleConditionVO> selectTpVehicleMonitoringCondition(TpVehicleConditionSearchVO searchVO);

   public List<TpVehicleConditionVO> selectDistributorAbnormalInventory(DistributorAbnormalInventorySearchVO searchVO);
   /**
    *  Counting of Order Grade Condition.
    */
   public int selectTpVehicleMonitoringConditionCnt(TpVehicleConditionSearchVO searchVO);
   
   public int selectDistributorAbnormalInventoryCnt(DistributorAbnormalInventorySearchVO searchVO);

   /**
    *  Counting of Order Grade Condition.
    */
   public int selectTpVehicleMonitoringConditionPopupCnt(TpVehicleConditionSearchVO searchVO);

   /**
    * Searching Order Grade Condition.
    */
   public List<TpVehicleConditionVO> selectTpVehicleMonitoringConditionPopup(TpVehicleConditionSearchVO searchVO);


   /**
    * 운송내역 상세조회 팝업(TP차량모니터링 상세) 조회 갯수
    * @param sVinNo
    * @return
    * @throws Exception
    */
   public int selectTpMonitoringDlrDetailSearchsByConditionCnt(TpVehicleConditionSearchVO searchVO)throws Exception;

   /**
    * 운송내역 상세조회 팝업(TP차량모니터링 상세) 조회
    * @param sVinNo
    * @return
    * @throws Exception
    */
   public List<TpVehicleMonitoringDlrDetailPopupVO> selectTpMonitoringDlrDetailSearchsByCondition(TpVehicleConditionSearchVO searchVO)throws Exception;

   /**
    * vin 운송정보 조회
    * Statements
    *
    * @param sVinNo
    * @return
    * @throws Exception
    */
   public TpVehicleConditionVO selectVehicleStatCdSearch(@Param("sVinNo") String sVinNo) throws Exception;

   /**
    * TP차량모니터링 저장
    * @param saveVO
    * @return
    * @throws Exception
    */
   public int insertTpVehicleMonitoringUpload(TpVehicleConditionVO saveVO) throws Exception;
   public int insertTpVehicleMonitoringUploads(List<TpVehicleConditionVO> list) throws Exception;

   /**
    * TP차량모니터링 DMS 인터페이스 테이블 저장
    * @return
    * @throws Exception
    */
   public int insertTpVehicleMonitoringUploadIf(TpVehicleConditionVO saveVO) throws Exception;
   public int insertTpVehicleMonitoringUploadIfs(List<TpVehicleConditionVO> list) throws Exception;


}