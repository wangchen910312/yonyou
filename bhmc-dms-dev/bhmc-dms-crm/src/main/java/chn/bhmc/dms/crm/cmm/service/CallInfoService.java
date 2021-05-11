package chn.bhmc.dms.crm.cmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallInfoService.java
 * @Description : 관심차종 Service
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public interface CallInfoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCallInfoByConditionCnt(CallInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CallInfoVO> selectCallInfoByCondition(CallInfoSearchVO searchVO) throws Exception;

    /**
     * 콜정보를 정보를 등록/수정/삭제 처리한다.
     * @param CallInfoVO
     */
    public void multiCallInfo(BaseSaveVO<CallInfoVO> callInfoVO) throws Exception;

    /**
     * 콜정보를 입력 한다.
     *
     * @param CallInfoVO
     * @return 등록된 목록수
     */
    public int insertCallInfo(CallInfoVO callInfoVO) throws Exception;

    /**
     * 콜정보를 수정한다.
     *
     * @param CallInfoVO
     * @return 등록된 목록수
     */
    public int updateCallInfo(CallInfoVO callInfoVO) throws Exception;

    /**
     * 콜정보를 삭제한다.
     *
     * @param CallInfoVO
     * @return 등록된 목록수
     */
    public int deleteCallInfo(CallInfoVO callInfoVO) throws Exception;

    /**
     * Key에 해당하는 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param callListNo -
     * @return 조회한 정보
     */
    public CallInfoVO selectCallInfoByKey(String dlrCd, String pltCd, String callListNo) throws Exception;

    /**
     * 콜번호를 채번한다.
     *
     * @param null
     * @return Call List No
     */
    public String selectNextCallListNo() throws Exception;

}
