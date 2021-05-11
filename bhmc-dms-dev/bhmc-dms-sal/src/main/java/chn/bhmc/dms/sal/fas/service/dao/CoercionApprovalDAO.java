package chn.bhmc.dms.sal.fas.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.fas.vo.CoercionApprovalSearchVO;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalDAO
 * @Description : 강제판매승인 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("coercionApprovalDAO")
public interface CoercionApprovalDAO {

    /**
     * 조회 조건에 해당하는 강제판매승인 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CoercionApprovalSearchVO
     * @return 조회 목록
     */
    public List<CoercionApprovalVO> selectCoercionApprovalsByCondition(CoercionApprovalSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 강제판매승인 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CoercionApprovalSearchVO
     * @return
     */
    public int selectCoercionApprovalsByConditionCnt(CoercionApprovalSearchVO searchVO) throws Exception;

    /**
     * 신청한 RFID번호가 차량마스터의 RFID 번호와 동일여부 체크
     */
    public int selectIsRfidnoCnt(CoercionApprovalSearchVO searchVO) throws Exception;

    /**
     * 승인/불승인 처리
     */
    public boolean updateCoercionAppr(CoercionApprovalVO saveVO) throws Exception;

    //프로시저 추가 : 강제판매처리결과송신
    public boolean procCoercionAppr(CoercionApprovalVO saveVO) throws Exception;

}