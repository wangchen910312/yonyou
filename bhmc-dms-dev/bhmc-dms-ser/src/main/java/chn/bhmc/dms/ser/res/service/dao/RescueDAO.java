package chn.bhmc.dms.ser.res.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.res.vo.RescueSearchVO;
import chn.bhmc.dms.ser.res.vo.RescueVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RescueDAO.java
 * @Description : 구원서비스 DAO
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.   YIN XUEYUAN     최초 생성
 * </pre>
 */

@Mapper("rescueDAO")
public interface RescueDAO {

    /**
     * 조회 조건에 해당하는 구원서비스 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public int selectRescueByConditionCnt(RescueSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 구원서비스를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public List<RescueVO> selectRescueByCondition(RescueSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 구원서비스현황 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public int selectRescueListByConditionCnt(RescueSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는 구원서비스현황 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public List<RescueVO> selectRescueListByCondition(RescueSearchVO searchVO)throws Exception;

    /**
     * 구원서비스 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 RescueVO
     * @return 등록된 목록수
     */
    public void insertRescue(RescueVO obj)throws Exception;

    /**
     * 구원서비스 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 RescueVO
     * @return 수정된 목록수
     */
    public void updateRescue(RescueVO obj)throws Exception;

    /**
     * 구원서비스 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 RescueVO
     * @return 삭제된 목록수
     */
    public void deleteRescue(RescueVO obj)throws Exception;

    /**
     * 조회 조건에 해당하는 구원 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RescueSearchVO
     * @return 조회 목록
     */
    public RescueVO selectRescueByKey(RescueSearchVO searchVO) throws Exception;

}