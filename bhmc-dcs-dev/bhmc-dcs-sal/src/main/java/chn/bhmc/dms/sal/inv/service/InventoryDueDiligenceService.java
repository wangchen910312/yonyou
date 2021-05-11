package chn.bhmc.dms.sal.inv.service;

import java.util.List;

import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceSaveVO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceSearchVO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InventoryDueDiligenceService.java
 * @Description : 재고실사 서비스
 * @author Bong
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.       Bong                최초 생성
 * </pre>
 */

public interface InventoryDueDiligenceService {

    /**
     * 재고실사 조회
     */
    public int selectInventoryDueDiligenceByConditionCnt(InventoryDueDiligenceSearchVO searchVO) throws Exception;
    public List<InventoryDueDiligenceVO> selectInventoryDueDiligenceByCondition(InventoryDueDiligenceSearchVO searchVO) throws Exception;

    /**
     * 재무실사 확인여부/사진파일 저장
     */
    public int updateInventoryDueDiligence(InventoryDueDiligenceVO saveVO) throws Exception;


    /**
     * 재고실사 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     */
    public List<InventoryDueDiligenceVO> retVehicleInfo(InventoryDueDiligenceSaveVO saveVO) throws Exception;

}