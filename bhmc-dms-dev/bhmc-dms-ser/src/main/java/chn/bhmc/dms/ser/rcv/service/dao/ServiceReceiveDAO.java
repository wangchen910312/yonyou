package chn.bhmc.dms.ser.rcv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.rcv.vo.ServicePackageReceiveVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveVO;

/**
 * <pre>
 * 수납관리 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : ServiceReceiveDAO.java
 * @Description : 수납관리 DAO
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("serviceReceiveDAO")
public interface ServiceReceiveDAO {

    /**
     * 수납관리 정보를 등록한다.
     * @param serviceReceiveVO - 등록할 정보가 담긴 ServiceReceiveVO
     * @return 등록된 목록수
     */
    public int insertServiceReceive(ServiceReceiveVO serviceReceiveVO);

    /**
     * 수납관리 정보를 수정한다.
     * @param serviceReceiveVO - 수정할 정보가 담긴 ServiceReceiveVO
     * @return 수정된 목록수
     */
    public int updateServiceReceive(ServiceReceiveVO serviceReceiveVO);

    /**
     * 수납관리 정보를 삭제한다.
     * @param serviceReceiveVO - 삭제할 정보가 담긴 ServiceReceiveVO
     * @return 삭제된 목록수
     */
    public int deleteServiceReceive(ServiceReceiveVO serviceReceiveVO);

    /**
     * 조회 조건에 해당하는 수납관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveVO> selectServiceReceiveByCondition(ServiceReceiveSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 수납관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    public int selectServiceReceiveByConditionCnt(ServiceReceiveSearchVO searchVO);

     /**
     * 조회 조건에 해당하는 수납관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public ServiceReceiveVO selectServiceReceiveByKey(ServiceReceiveSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 수납관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveVO> selectServiceReceiveStatusByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 수납관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    public int selectServiceReceiveStatusByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 일괄수납관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServicePackageReceiveVO> selectServicePackageReceiveByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 일괄수납관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    public int selectServicePackageReceiveByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;
}
