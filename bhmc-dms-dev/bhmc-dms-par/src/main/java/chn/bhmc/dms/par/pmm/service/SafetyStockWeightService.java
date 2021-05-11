package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockWeightVO;

/**
 * SafetyStockWeightService
 *
 * @author In Bo Shim
 * @since 2016. 5. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 03.     In Bo Shim      최초 생성
 * </pre>
 */
public interface SafetyStockWeightService {

    /**
     * 적정재고 가중치 정보를 등록한다.
     * @param saftyStockWeightVO - 등록할 정보가 담긴 SaftyStockWeightVO
     * @return 등록된 목록수
     */
    public int insertSafetyStockWeight(SaftyStockWeightVO saftyStockWeightVO) throws Exception;

    /**
     * 적정재고 가중치 정보를 수정한다.
     * @param saftyStockWeightVO - 수정할 정보가 담긴 SaftyStockWeightVO
     * @return 수정된 목록수
     */
    public int updateSafetyStockWeight(SaftyStockWeightVO saftyStockWeightVO) throws Exception;

    /**
     * 적정재고 가중치 정보를 삭제한다.
     * @param saftyStockWeightVO - 삭제할 정보가 담긴 SaftyStockWeightVO
     * @return 삭제된 목록수
     */
    public int deleteSafetyStockWeight(SaftyStockWeightVO saftyStockWeightVO) throws Exception;

    /**
     * Key에 해당하는 적정재고 가중치 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @return 조회한 적정재고 가중치 정보
     */
    public SaftyStockWeightVO selectSafetyStockWeightByKey(String dlrCd, String pltCd) throws Exception;

    /**
     * 조회 조건에 해당하는 적정재고 가중치 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaftyStockSearchVO
     * @return 조회 목록
     */
    public List<SaftyStockWeightVO> selectSafetyStockWeightsByCondition(SaftyStockSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는적정재고 가중치 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaftyStockSearchVO
     * @return 조회 목록 수
     */
    public int selectSafetyStockWeightsByConditionCnt(SaftyStockSearchVO searchVO) throws Exception;
}
