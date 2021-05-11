package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ro.vo.PreRepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.PreRepairOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreRepairOrderDAO.java
 * @Description : RO DAO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("preRepairOrderDAO")
public interface PreRepairOrderDAO {

    /**
     * 조회 조건에 해당하는 RO접수 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectPreRepairOrderByConditionCnt(PreRepairOrderSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public List<PreRepairOrderVO> selectPreRepairOrderByCondition(PreRepairOrderSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수 현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public int selectPreRepairOrderListByConditionCnt(PreRepairOrderSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 RO접수 현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public List<PreRepairOrderVO> selectPreRepairOrderListByCondition(PreRepairOrderSearchVO searchVO)throws Exception;


    /**
     * RO접수 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 PreRepairOrderVO
     * @return 등록된 목록수
     */
    public void insertPreRepairOrder(PreRepairOrderVO obj)throws Exception;

    /**
     * RO접수 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 PreRepairOrderVO
     * @return 수정된 목록수
     */
    public void updatePreRepairOrder(PreRepairOrderVO obj)throws Exception;

    /**
     * RO접수 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 PreRepairOrderVO
     * @return 삭제된 목록수
     */
    public void deletePreRepairOrder(PreRepairOrderVO obj)throws Exception;

    /**
     * 조회 조건에 해당하는 RO,사전점검 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public PreRepairOrderVO selectPreRepairOrderByKey(PreRepairOrderSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 RO KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreRepairOrderSearchVO
     * @return 조회 목록
     */
    public PreRepairOrderVO selectPreRepairOrderInfoByKey(PreRepairOrderSearchVO searchVO) throws Exception;

    /**
     * RO접수 여부를 조회한다.
     * @param prePreRepairOrderVO -
     * @return RO 접수 여부
     */
    public String selectPreRepairOrderCheckByKey(PreRepairOrderSearchVO repairOrderVO)throws Exception;


}