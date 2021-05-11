package chn.bhmc.dms.ser.rcv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveDetailDAO.java
 * @Description : 수납 디테일 DAO
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

@Mapper("serviceReceiveDetailDAO")
public interface ServiceReceiveDetailDAO {

    /**
     * 조회 조건에 해당하는 디테일 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public int selectServiceReceiveDetailsByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일이력 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public int selectServiceReceiveDetailsHistByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 디테일이력 을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveDetailVO> selectServiceReceiveDetailsHistByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 수납 디테일 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 ServiceReceiveDetailVO
     * @return 등록된 목록수
     */
    public void insertServiceReceiveDetail(ServiceReceiveDetailVO obj) throws Exception;

    /**
     * 수납 디테일 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 ServiceReceiveDetailVO
     * @return 수정된 목록수
     */
    public void updateServiceReceiveDetail(ServiceReceiveDetailVO obj) throws Exception;

    /**
     * 수납 디테일 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 ServiceReceiveDetailVO
     * @return 삭제된 목록수
     */
    public void deleteServiceReceiveDetail(ServiceReceiveDetailVO obj) throws Exception;

    /**
     * 수납 디테일 이력 정보 를 등록한다.
     * @param obj - 등록할 정보가 담긴 ServiceReceiveDetailVO
     * @return 등록된 목록수
     */
    public void insertServiceReceiveHistory(ServiceReceiveDetailVO obj) throws Exception;

    /**
     * 수납 디테일 이력 정보 를 수정한다.
     * @param obj - 수정할 정보가 담긴 ServiceReceiveDetailVO
     * @return 수정된 목록수
     */
    public void updateServiceReceiveHistory(ServiceReceiveDetailVO obj) throws Exception;


    /**
     * 수납 디테일 이력 정보 를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 ServiceReceiveDetailVO
     * @return 삭제된 목록수
     */
    public void deleteServiceReceiveHistory(ServiceReceiveDetailVO obj) throws Exception;

    /**
     *
     * 수납완료 여부 체크
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public ServiceReceiveDetailVO selectServiceReceiveConfimByKey(ServiceReceiveSearchVO searchVO) throws Exception;

    public int modifyPartsSaleOrdStat(ServiceReceiveDetailVO obj) throws Exception;

    public List<ServiceReceiveDetailVO> selectServiceReceiveStats(ServiceReceiveSearchVO searchVO) throws Exception;

	public List<ServiceReceiveDetailVO> selectTradeId(ServiceReceiveSearchVO searchVO);
	
	public void updateTradeId(ServiceReceiveDetailVO obj) throws Exception;

}