package chn.bhmc.dms.ser.cmm.service;

import java.util.List;

import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;




/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceLaborService.java
 * @Description : 공통 공임 Service
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

public interface ServiceLaborService {

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
     * 공임을 등록/수정/삭제한다.
     * @param serviceLaborSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void multiServiceLabor(List<ServiceLaborVO> serviceLaborSaveVO, ServiceCmmVO serviceCmmVO) throws Exception;

    /**
     * 공임을 삭제한다.
     * @param servicePartSaveVO - 공임정보를 포함하는 ServicePartVO
     * @return
     */
    public void deleteServiceLabor(ServiceLaborVO serviceLaborVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공임 히스토리를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectServiceLaborsHistByCondition(TabInfoSearchVO searchVO) throws Exception ;

}