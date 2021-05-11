package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.SupplyRuleSearchVO;
import chn.bhmc.dms.par.pmm.vo.SupplyRuleVO;

/**
 * SupplyRuleDAO
 *
 * @author In Bo Shim
 * @since 2016. 5. 09.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 09.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("supplyRuleDAO")
public interface SupplyRuleDAO {

    /**
     * 공급률 정보를 등록한다.
     * @param supplyRuleVO - 등록할 정보가 담긴 SupplyRuleVO
     * @return 등록된 목록수
     */
    public int insertSupplyRule(SupplyRuleVO supplyRuleVO) throws Exception;

    /**
     * 공급률 정보를 수정한다.
     * @param supplyRuleVO - 수정할 정보가 담긴 SupplyRuleVO
     * @return 수정된 목록수
     */
    public int updateSupplyRule(SupplyRuleVO supplyRuleVO) throws Exception;

    /**
     * 공급률 정보를 삭제한다.
     * @param supplyRuleVO - 삭제할 정보가 담긴 SupplyRuleVO
     * @return 삭제된 목록수
     */
    public int deleteSupplyRule(SupplyRuleVO supplyRuleVO) throws Exception;

    /**
     * Key에 해당하는 공급률 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @return 조회한 공급률 정보
     */
    public SupplyRuleVO selectSupplyRuleByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd) throws Exception;

    /**
     * 조회 조건에 해당하는 피벗형 공급률 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SupplyRuleSearchVO
     * @return 조회 목록
     */
    public List<SupplyRuleVO> selectSupplyRulesPivotByCondition(SupplyRuleSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공급률 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SupplyRuleSearchVO
     * @return 조회 목록
     */
    public List<SupplyRuleVO> selectSupplyRulesByCondition(SupplyRuleSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는공급률 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SupplyRuleSearchVO
     * @return 조회 목록 수
     */
    public int selectSupplyRulesByConditionCnt(SupplyRuleSearchVO searchVO) throws Exception;
}
