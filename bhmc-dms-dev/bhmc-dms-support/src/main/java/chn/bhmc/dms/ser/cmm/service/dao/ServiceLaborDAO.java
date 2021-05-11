
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
     * 조회 조건에 해당하는 작업 진도 공임 상태를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectRoChkWorkStatByCondition(TabInfoSearchVO searchVO) throws Exception;

    /**
     *
     * RO화면에서 공임 삭제시 작업배분 공임 데이터 삭제
     *
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public int deleteLaborWorkAssign(ServiceLaborVO serviceLaborVO)throws Exception;

    /**
     *
     * RO화면에서 공임 삭제시 정비진도 공임 데이터 삭제
     *
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public int deleteLaborWorkProcess(ServiceLaborVO serviceLaborVO)throws Exception;



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
     * 배분공임을 수정한다.
     * @param obj - 수정할 정보가 담긴 ServiceLaborVO
     * @return 수정된 목록수
     */
    public void updateDstbHm(ServiceLaborVO obj);

    /**
     * 배분공임을 재수정한다.
     * @param obj - 수정할 정보가 담긴 ServiceLaborVO
     * @return 수정된 목록수
     */
    public void updateDstbHmBack(ServiceLaborVO obj);

    /**
     * 공임 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 ServiceLaborVO
     * @return 삭제된 목록수
     */
    public void deleteServiceLabor(ServiceLaborVO obj);

    /**
     * 캠페인 사용이력을 등록한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void insertCampaignUseConfirm(ServiceLaborVO serviceLaborVO) throws Exception;

    /**
     * 캠페인 사용이력을 수정한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateCampaignUseConfirm(ServiceLaborVO serviceLaborVO) throws Exception;

    /**
     * 캠페인 사용이력을 조회한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void selectCampaignUseConfirm(TabInfoSearchVO searchVO) throws Exception;

    /**
     *
     * 작업배분 목록수를 조회한다.
     * @param serviceLaborVO
     * @return
     */
    public int selectDstbHmCnt(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 작업배분 배정공임을 조회한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public List<ServiceLaborVO> selectWrkAllocHmByCondition(TabInfoSearchVO searchVO) throws Exception;

    /**
    *
    * 캠페인사용 목록수 조회한다.
    * @param serviceLaborVO
    * @return
    */
    public int selectCampaignCnt(ServiceLaborVO serviceLaborVO) throws Exception;

}