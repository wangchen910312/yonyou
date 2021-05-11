package chn.bhmc.dms.crm.crq.service;

import java.util.List;

import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;

/**
 * 대상자 목록 서비스
 *
 * @author in moon lee
 * @since 2016.05.25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.25         in moon lee            최초 생성
 * </pre>
 */

public interface CustomerCareExtrTargetService {

    /**
     * 조회 조건에 해당하는 대상자 목록 총 갯수를 조회한다.
     * @param CustomerCareExtrTargetSearchVO -
     * @return
     */
    public int selectCustomerCareExtrTargetsByConditionCnt(CustomerCareExtrTargetSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 대상자 목록 정보를 조회한다.
     * @param CustomerCareExtrTargetSearchVO -
     * @return 조회 목록
     */
    public List<CustomerCareExtrTargetVO> selectCustomerCareExtrTargetsByCondition(CustomerCareExtrTargetSearchVO searchVO) throws Exception;

    /**
     * 대상자에게 SMS 전송후 SMS 전송일을 수정한다.
     * @param CustomerCareExtrTargetVO - 대상자 정보
     * @return 등록된 목록수
     */
    public int updateCustomerCareExtrTargetSmsSendDt(CustomerCareExtrTargetVO CustomerCareExtrTargetVO) throws Exception;

    /**
     * [그룹전송] 대상자에게 SMS 전송후 SMS 전송일을 수정한다. ( SMS 전송 대상자 임시 테이블에서 select insert )
     * @param CustomerCareExtrTargetVO - 대상자 정보
     * @return 등록된 목록수
     */
    public int updateGroupCustomerCareExtrTargetSmsSendDt(CustomerCareExtrTargetVO CustomerCareExtrTargetVO) throws Exception;

    /**
     * 고객케어 대상자 목록 - 콜센터 전송.
     * @param CustomerExtrTargetSearchVO -
     * @return
     */
    public boolean insertExtrTargetTrsfCallCenter(CustomerCareExtrTargetVO saveVO) throws Exception;

    /**
     * 고객케어 대상자 삭제
     * @param CustomerExtrTargetSearchVO -
     * @return
     */
    public boolean deleteExtrTarget(CustomerCareExtrTargetVO saveVO) throws Exception;

    /**
     * 추출대상자 -> 고객테어 대상자 테이블 인서트
     *
     * @param customerCareExtrTargetVO
     * @return
     */
    public int insertTargExtract(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception;


}
