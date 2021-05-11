package chn.bhmc.dms.crm.cmm.service;

import java.util.List;

import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserSearchVO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsTmplUserService.java
 * @Description : 관심차종 Service
 * @author In Moon Lee
 * @since 2016.06.27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.27.     In Moon Lee     최초 생성
 * </pre>
 */

public interface SmsTmplUserService {

    /**
     * SMS 발송 대상자 임시 저장
     *
     * @param List<SmsTmplUserVO>
     * @return Inserte SEQ
     */
    public int insertSmsTmplUsers(List<SmsTmplUserVO> saveVO) throws Exception;

    /**
     * SMS 발송 대상자 임시 목록 데이터 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SmsTmplUserSearchVO
     * @return
     */
    public int selectSmsTmplUsersByConditionCnt(SmsTmplUserSearchVO searchVO) throws Exception;

    /**
     * SMS 발송 대상자 임시 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SmsTmplUserSearchVO
     * @return
     */
    public List<SmsTmplUserVO> selectSmsTmplUsersByCondition(SmsTmplUserSearchVO searchVO) throws Exception;

    /**
     * SMS 발송
     *
     * @param searchVO
     * @return
     */
    public int deleteSmsTmplUsers(SmsTmplUserSearchVO searchVO) throws Exception;

    /**
     * SMS 발송 대상자 삭제
     *
     * @param List<SmsTmplUserVO> - seq, custNo, hpNo
     * @return
     */
    public int deleteSmsTmplUsers(List<SmsTmplUserVO> saveVO) throws Exception;

}
