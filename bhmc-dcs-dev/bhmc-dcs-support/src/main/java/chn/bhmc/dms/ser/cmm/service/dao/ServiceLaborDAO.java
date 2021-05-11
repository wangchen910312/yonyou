package chn.bhmc.dms.ser.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceLaborDAO.java
 * @Description : 공통 공임 DAO
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("serviceLaborDAO")
public interface ServiceLaborDAO {

    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServiceLaborsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectServiceLaborsByCondition(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 공임 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 ServiceLaborVO
     * @return 등록된 목록수
     */
    public void insertServiceLabor(ServiceLaborVO obj);

    /**
     * 공임 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 ServiceLaborVO
     * @return 수정된 목록수
     */
    public void updateServiceLabor(ServiceLaborVO obj);

    /**
     * 공임 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 ServiceLaborVO
     * @return 삭제된 목록수
     */
    public void deleteServiceLabor(ServiceLaborVO obj);

}