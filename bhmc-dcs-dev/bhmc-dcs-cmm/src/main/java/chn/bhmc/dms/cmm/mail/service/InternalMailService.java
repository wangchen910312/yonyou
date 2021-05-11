package chn.bhmc.dms.cmm.mail.service;

import java.util.List;

import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverSaveVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailSaveVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public interface InternalMailService {
    void insertInternalMail(InternalMailVO internalMailVO, InternalMailReceiverSaveVO internalMailReceiverSaveVO) throws Exception;

    int insertInternalMailSummary(InternalMailVO internalMailVO) throws Exception;

    void deleteInternalMail(InternalMailVO internalMailVO) throws Exception;

    void multiDeleteInternalMail(InternalMailSaveVO saveVO) throws Exception;

    List<InternalMailReceiverVO> selectInternalMailAreaByCondition(InternalMailReceiverSearchVO searchVO) throws Exception;

    List<InternalMailReceiverVO> selectInternalMailDealerByCondition(InternalMailReceiverSearchVO searchVO) throws Exception;

    List<InternalMailReceiverVO> selectInternalMailRoleByCondition(InternalMailReceiverSearchVO searchVO) throws Exception;

    List<InternalMailReceiverVO> selectInternalMailUsrByCondition(InternalMailReceiverSearchVO searchVO) throws Exception;

    int selectInternalMailRoleByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception;

    int selectInternalMailUsrByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception;

    List<InternalMailReceiverVO> selectInternalMailReceiverRoleByCondition(InternalMailReceiverSearchVO searchVO) throws Exception;

    List<InternalMailReceiverVO> selectInternalMailReceiverUsrByCondition(InternalMailReceiverSearchVO searchVO) throws Exception;

    int selectInternalMailReceiverRoleByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception;

    int selectInternalMailReceiverUsrByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception;

    InternalMailVO selectInternalMailByKey(InternalMailSearchVO searchVO) throws Exception;

    List<InternalMailVO> selectInternalMailByCondition(InternalMailSearchVO searchVO) throws Exception;

    int selectInternalMailByConditionCnt(InternalMailSearchVO searchVO) throws Exception;
}