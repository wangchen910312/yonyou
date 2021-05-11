package chn.bhmc.dms.sal.inv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceSearchVO;
import chn.bhmc.dms.sal.inv.vo.InventoryDueDiligenceVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InventoryDueDiligenceDAO
 * @Description : 재고실사 DAO
 * @author Bong
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.14         Bong                 최초 생성
 * </pre>
 */

@Mapper("inventoryDueDiligenceDAO")
public interface InventoryDueDiligenceDAO {

    /**
     * 조회 조건에 해당하는 재고상태관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InventoryDueDiligenceSearchVO
     * @return
     */
    public int selectInventoryDueDiligenceByConditionCnt(InventoryDueDiligenceSearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 재고실사 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InventoryDueDiligenceSearchVO
     * @return 조회 목록
     */
    public List<InventoryDueDiligenceVO> selectInventoryDueDiligenceByCondition(InventoryDueDiligenceSearchVO searchVO) throws Exception;

    /**
     * 재고실사 확인여부/사진파일 저장
     * @param saveVO
     * @return
     */
    public int updateInventoryDueDiligence(InventoryDueDiligenceVO saveVO) throws Exception;


    /**
     * 재고실사 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     */
    public List<InventoryDueDiligenceVO> retVehicleInfo(InventoryDueDiligenceSearchVO searchVO);

}