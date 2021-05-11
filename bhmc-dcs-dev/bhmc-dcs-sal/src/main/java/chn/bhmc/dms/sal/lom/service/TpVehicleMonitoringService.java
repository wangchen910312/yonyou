package chn.bhmc.dms.sal.lom.service;

import java.util.List;

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
 * @ClassName   : TpVehicleMonitoringService
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

public interface TpVehicleMonitoringService {

    public int selectTpVehicleMonitoringConditionCnt(TpVehicleConditionSearchVO searchVO) throws Exception;
    /**
     * 
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectDistributorAbnormalInventoryCnt(DistributorAbnormalInventorySearchVO searchVO) throws Exception;
    public List<TpVehicleConditionVO> selectTpVehicleMonitoringCondition(TpVehicleConditionSearchVO searchVO) throws Exception;
    
    public List<TpVehicleConditionVO> selectDistributorAbnormalInventory(DistributorAbnormalInventorySearchVO searchVO) throws Exception;

    /**
     * 운송내역 상세조회 팝업(TP차량모니터링 상세) 갯수조회
     * @return
     * @throws Exception
     */
    public int selectTpMonitoringDlrDetailSearchsByConditionCnt(TpVehicleConditionSearchVO searchVO)throws Exception;


    /**
     * 운송내역 상세조회 팝업(TP차량모니터링 팝업 상세) 갯수조회
     * @return
     * @throws Exception
     */
    public int selectTpVehicleMonitoringConditionPopupCnt(TpVehicleConditionSearchVO searchVO)throws Exception;

    public List<TpVehicleConditionVO> selectTpVehicleMonitoringConditionPopup(TpVehicleConditionSearchVO searchVO) throws Exception;

    /**
     * 운송내역 상세조회 팝업(TP차량모니터링 상세) 조회
     * @return
     * @throws Exception
     */
    public List<TpVehicleMonitoringDlrDetailPopupVO> selectTpMonitoringDlrDetailSearchsByCondition(TpVehicleConditionSearchVO searchVO)throws Exception;

    /**
     * 일괄등록 데이터를 저장 한다.
     * @param list
     * @throws Exception
     */
    public int insertTpVehicleMonitoringUpload(List<TpVehicleConditionVO> list) throws Exception;

    /**
     * vin 운송정보 조회
     * @param sVinNo
     * @return
     * @throws Exception
     */
    public TpVehicleConditionVO selectVehicleStatCdSearch(String sVinNo) throws Exception;
}
