package chn.bhmc.dms.crm.crq.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetSearchVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareExtrTargetVO;
import chn.bhmc.dms.crm.crq.vo.CustomerCareSearchVO;

/**
 * 대상자 목록 관리에 관한 데이터처리 매퍼 클래스
 *
 * @author in moon lee
 * @since 2016.05.26.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.26         in moon lee            최초 생성
 * </pre>
 */

@Mapper("customerCareExtrTargetDAO")
public interface CustomerCareExtrTargetDAO {

    /**
     * 조회 조건에 해당하는 대상자 목록 관리 총 갯수를 조회한다.
     * @param CustomerCareExtrTargetSearchVO -
     * @return
     */
    public int selectCustomerCareExtrTargetsByConditionCnt(CustomerCareExtrTargetSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 대상자 목록 관리 정보를 조회한다.
     * @param CustomerCareExtrTargetSearchVO -
     * @return 조회 목록
     */
    public List<CustomerCareExtrTargetVO> selectCustomerCareExtrTargetsByCondition(CustomerCareExtrTargetSearchVO searchVO) throws Exception;

    /**
     * 대상자에게 SMS 전송후 SMS 전송일을 수정한다.
     * @param CustomerCareExtrTargetVO - 대상자 정보
     * @return 등록된 목록수
     */
    public int updateCustomerCareExtrTargetSmsSendDt(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception;

    /**
     * [그룹전송] 대상자에게 SMS 전송후 SMS 전송일을 수정한다. ( SMS 전송 대상자 임시 테이블에서 select insert )
     * @param CustomerCareExtrTargetVO - 대상자 정보
     * @return 등록된 목록수
     */
    public int updateGroupCustomerCareExtrTargetSmsSendDt(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception;

    /**
     * 콜센터 전송일 업데이트 /   콜센터 전송 완료후 콜센터 전송일 업데이트 ( 프로시저에서 처리해줌. )
     * @param saveVO
     */
    //public int updateCallCenSendDt(CustomerCareExtrTargetVO saveVO) throws Exception;

    /**
     * 추출 대상자 고객케어 대상자 테이블 인서트
     *
     * @param customerCareSearchVO
     */
    public int insertTargExtract(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception;

    /**
     * 콜센터 콜처리완료여부(CALL_PROC_END_YN)가 Y 이면 콜내용(CALL_CONT)을 각 업무 콜센터결과내용(CALL_CEN_RSLT_CONT) 에 업데이트 해준다.
     *
     * @param customerCareSearchVO
     */
    public int updateCallCenRsltCont(CustomerCareExtrTargetVO customerCareExtrTargetVO) throws Exception;

    /**
     * 고객케어 대상자 삭제
     * @param CustomerExtrTargetSearchVO -
     * @return
     */
    public int deleteExtrTarget(CustomerCareExtrTargetVO saveVO) throws Exception;

    /**
     * 고객케어 대상자 삭제 ( 전체 삭제 )
     * @param CustomerCareSearchVO - dlrCd, custCareSeq
     * @return
     */
    public int deleteExtrTargetAll(CustomerCareSearchVO searchVO);


}
