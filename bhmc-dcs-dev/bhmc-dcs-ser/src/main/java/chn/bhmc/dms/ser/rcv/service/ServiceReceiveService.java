package chn.bhmc.dms.ser.rcv.service;

import java.util.List;

import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveVO;

/**
 * <pre>
 * 수납관리 관리 Service
 * </pre>
 *
 * @ClassName   : ServiceReceiveService.java
 * @Description : .수납 관리 Service
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

public interface ServiceReceiveService {

    /**
     * 조회 조건에 해당하는 수납관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return 조회 목록
     */
    public List<ServiceReceiveVO> selectServiceReceiveByCondition(ServiceReceiveSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 수납관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
     * @return
     */
    public int selectServiceReceiveByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception;

}
