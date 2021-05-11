package chn.bhmc.dms.ser.rcv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

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
}
