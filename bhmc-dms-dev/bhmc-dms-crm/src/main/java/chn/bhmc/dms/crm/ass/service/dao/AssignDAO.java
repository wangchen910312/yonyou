package chn.bhmc.dms.crm.ass.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignDao.java
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

@Mapper("assignDAO")
public interface AssignDAO {

    /**
     * VOC 배정
     *
     * @param saveVO
     * @return
     */
    int updateVocStaffAssign(VocMgmtVO saveVO) throws Exception ;

    /**
     * 고객 담당 영업사원 배정
     *
     * @param saveVO
     * @return
     */
    int updateCustomerInfoAssign(CustomerInfoVO saveVO) throws Exception ;

    /**
     * 리드 배분
     *
     * @param obj
     */
    void updateLeadAssign(LeadInfoVO saveVO);

    /**
     * OB배정(콜센터 배정).
     * @param CallCenterAssignSaveVO - 배정목록
     * @return
     */
    void updateCallCenterAssign(CallCenterActionVO obj);

}
