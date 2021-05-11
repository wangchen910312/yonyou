package chn.bhmc.dms.cmm.mail.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailDAO.java
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

@Mapper("internalMailDAO")
public interface InternalMailDAO {
    public int insertInternalMail(InternalMailVO internalMailVO);

    public int insertInternalMailReceiver(InternalMailReceiverVO internalMailReceiverVO);

    public int insertInternalMailSummary(InternalMailVO internalMailVO);

    public int deleteInternalMail(InternalMailVO internalMailVO);

    public int deleteInternalMailReceiver(InternalMailVO internalMailVO);

    public int deleteInternalMailSummary(InternalMailVO internalMailVO);

    public List<InternalMailReceiverVO> selectInternalMailAreaByCondition(InternalMailReceiverSearchVO searchVO);

    public List<InternalMailReceiverVO> selectInternalMailDealerByCondition(InternalMailReceiverSearchVO searchVO);

    public List<InternalMailReceiverVO> selectInternalMailRoleByCondition(InternalMailReceiverSearchVO searchVO);

    public List<InternalMailReceiverVO> selectInternalMailUsrByCondition(InternalMailReceiverSearchVO searchVO);

    public int selectInternalMailRoleByConditionCnt(InternalMailReceiverSearchVO searchVO);

    public int selectInternalMailUsrByConditionCnt(InternalMailReceiverSearchVO searchVO);

    public List<InternalMailReceiverVO> selectInternalMailReceiverRoleByCondition(InternalMailReceiverSearchVO searchVO);

    public List<InternalMailReceiverVO> selectInternalMailReceiverUsrByCondition(InternalMailReceiverSearchVO searchVO);

    public int selectInternalMailReceiverRoleByConditionCnt(InternalMailReceiverSearchVO searchVO);

    public int selectInternalMailReceiverUsrByConditionCnt(InternalMailReceiverSearchVO searchVO);

    public InternalMailVO selectInternalMailByKey(InternalMailSearchVO searchVO);

    public List<InternalMailVO> selectInternalMailByCondition(InternalMailSearchVO searchVO);

    public int selectInternalMailByConditionCnt(InternalMailSearchVO searchVO);
}