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
     * 조회 조건에 해당하는 공임 히스토리 (DCS )을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectServiceLaborsHistByCondition(TabInfoSearchVO searchVO) throws Exception ;

    /**
     * 조회 조건에 해당하는 작업 진도 공임 상태를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectRoChkWorkStatByCondition(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 공임을 등록/수정/삭제한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void multiServiceLabor(List<ServiceLaborVO> serviceLaborSaveVO, ServiceCmmVO serviceCmmVO) throws Exception;

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
     * 공임을 삭제한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void deleteServiceLabor(ServiceLaborVO serviceLaborVO) throws Exception;

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
     * @param searchVO - 공임정보를 포함하는 TabInfoSearchVO
     * @return
     */
    public void selectCampaignUseConfirm(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 공임을 수정한다
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateServiceLabor(List<ServiceLaborVO> serviceLaborSaveVO, ServiceCmmVO serviceCmmVO) throws Exception;

    /**
     * 배분공임을 수정한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateDstbHm(ServiceLaborVO serviceLaborVO) throws Exception;

    /**
     * 배분공임을 재수정한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateDstbHmBack(ServiceLaborVO serviceLaborVO) throws Exception;

}