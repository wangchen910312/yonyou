package chn.bhmc.dms.crm.ass.service;

import chn.bhmc.dms.crm.ass.vo.CallCenterAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.CustomerInfoAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.LeadAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.VocStaffAssignSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In moon Lee
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     In moon Lee     최초 생성
 * </pre>
 */

public interface AssignService {

    /**
     * Statements
     *
     * @param saveVO
     */
    void updateVocStaffAssign(VocStaffAssignSaveVO saveVO) throws Exception ;

    /**
     * Statements
     *
     * @param saveVO
     */
    void updateCustomerInfoAssign(CustomerInfoAssignSaveVO saveVO) throws Exception ;

    /**
     * Statements
     *
     * @param saveVO
     */
    void updateLeadAssign(LeadAssignSaveVO saveVO) throws Exception ;

    /**
     * OB배정(콜센터 배정).
     * @param CallCenterAssignSaveVO - 배정목록
     * @return
     */
    void updateCallCenterAssign(CallCenterAssignSaveVO saveVO) throws Exception ;

}
