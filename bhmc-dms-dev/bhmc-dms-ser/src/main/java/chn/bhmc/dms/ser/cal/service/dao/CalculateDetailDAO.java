package chn.bhmc.dms.ser.cal.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.cal.vo.CalculateDetailVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateDetailDAO.java
 * @Description : 정산 디테일 DAO
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

@Mapper("calculateDetailDAO")
public interface CalculateDetailDAO {

    /**
     * 조회 조건에 해당하는 디테일 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateDetailsByConditionCnt(CalculateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateDetailVO> selectCalculateDetailsByCondition(CalculateSearchVO searchVO) throws Exception;

    /**
     * 정산 디테일 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 CalculateDetailVO
     * @return 등록된 목록수
     */
    public void insertCalculateDetail(CalculateDetailVO obj);

    /**
     * 정산 디테일 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 CalculateDetailVO
     * @return 수정된 목록수
     */
    public void updateCalculateDetail(CalculateDetailVO obj);

    /**
     * 정산 디테일 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 CalculateDetailVO
     * @return 삭제된 목록수
     */
    public void deleteCalculateDetail(CalculateDetailVO obj);

    /**
     * 수납 디테일을 추가한다.
     * @param resvDocNo
     * @return
     */
    public void insertServiceReceiveDetailByCalc(CalculateDetailVO obj);

    /**
     * 수납 디테일을 수정한다.
     * @param resvDocNo
     * @return
     */
    public void updateServiceReceiveDetailByCalc(CalculateDetailVO obj);

    /**
     * 수납 디테일을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteServiceReceiveDetailByCalc(CalculateDetailVO obj);
    
    /**
     * 수납 디테일 이력 을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteServiceReceiveHistDetailByCalc(CalculateDetailVO obj);

}