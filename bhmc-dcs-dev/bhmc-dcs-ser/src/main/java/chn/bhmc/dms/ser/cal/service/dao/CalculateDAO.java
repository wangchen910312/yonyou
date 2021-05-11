package chn.bhmc.dms.ser.cal.service.dao;
import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateDAO.java
 * @Description : 정산 DAO
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("calculateDAO")
public interface CalculateDAO {

    /**
     * 조회 조건에 해당하는 RO KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public CalculateVO selectCalculateByKey(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 정산 현황  갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateListByConditionCnt(CalculateSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 정산 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateListByCondition(CalculateSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 정산토탈금액을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateVO> selectCalculateAmtByCondition(CalculateSearchVO searchVO)throws Exception;

}