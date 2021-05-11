package chn.bhmc.dms.sal.fas.service;

import java.util.List;

import chn.bhmc.dms.sal.fas.vo.CoercionApprovalSaveVO;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalSearchVO;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalService.java
 * @Description : 강제판매승인 서비스
 * @author Jin Suk Kim
 * @since 2016. 3. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 16.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface CoercionApprovalService {

    /**
     * 강제판매승인 조회
     */
    public int selectCoercionApprovalsByConditionCnt(CoercionApprovalSearchVO searchVO) throws Exception;
    public List<CoercionApprovalVO> selectCoercionApprovalsByCondition(CoercionApprovalSearchVO searchVO) throws Exception;

    /**
     * 승인
     */
    public boolean confirms(CoercionApprovalSaveVO saveVO)throws Exception;

    /**
     * 불승인
     */
    public boolean nonConfirms(CoercionApprovalSaveVO saveVO)throws Exception;
}

