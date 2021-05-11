package chn.bhmc.dms.ser.cal.service;

import java.util.List;

import chn.bhmc.dms.ser.cal.vo.CalculateDetailVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateDetailService.java
 * @Description : 정산 디테일 Service
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

public interface CalculateDetailService {

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
     * 정산 디테일을 등록/수정한다.
     * @param calculateDetailSaveVO - 디테일정보를 포함하는 CalculateDetailVO
     * @return
     */
    public void multiCalculateDetail(List<CalculateDetailVO> calculateDetailSaveVO, CalculateVO calVO) throws Exception;

    /**
     * 정산 디테일을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteCalculateDetail(CalculateDetailVO calculateDetailVO) throws Exception;

    /**
     * 정산 디테일을 추가한다.
     * @param resvDocNo
     * @return
     */
    public void insertCalculateDetail(CalculateDetailVO calculateDetailVO) throws Exception;

    /**
     * 수납 디테일을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteServiceReceiveDetailByCalc(CalculateDetailVO calculateDetailVO) throws Exception;
    
    /**
     * 수납 디테일이력을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteServiceReceiveHistDetailByCalc(CalculateDetailVO calculateDetailVO) throws Exception;

}