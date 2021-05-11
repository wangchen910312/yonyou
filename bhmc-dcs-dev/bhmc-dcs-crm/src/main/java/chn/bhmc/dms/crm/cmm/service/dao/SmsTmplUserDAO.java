package chn.bhmc.dms.crm.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserSearchVO;
import chn.bhmc.dms.crm.cmm.vo.SmsTmplUserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsTmplUserDAO.java
 * @Description : 클래스 설명을 기술합니다.
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

@Mapper("smsTmplUserDAO")
public interface SmsTmplUserDAO {

    /**
     * SMS 대상자 목록을 등록한다.
     *
     * @param List<SmsTmplUserVO>
     * @return Inserte SEQ
     */
    public void insertSmsTmplUsers(SmsTmplUserVO obj) throws Exception ;

    /**
     * SMS 대상자 목록 수량을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SmsTmplUserSearchVO
     * @return
     */
    public int selectSmsTmplUsersByConditionCnt(SmsTmplUserSearchVO searchVO) throws Exception ;

    /**
     * SMS 대상자 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SmsTmplUserSearchVO
     * @return
     */
    public List<SmsTmplUserVO> selectSmsTmplUsersByCondition(SmsTmplUserSearchVO searchVO) throws Exception ;

    /**
     * SMS 대상자 목록 시퀀스 생성
     * @return
     */
    public int selectSmsTmplSeq() throws Exception ;

    /**
     * SMS 대상자 목록을 삭제한다.
     *
     * @param searchVO
     */
    public int deleteSmsTmplUsers(SmsTmplUserSearchVO searchVO) throws Exception ;

}
