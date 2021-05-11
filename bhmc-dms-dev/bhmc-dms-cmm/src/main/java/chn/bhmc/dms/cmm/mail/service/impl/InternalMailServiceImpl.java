package chn.bhmc.dms.cmm.mail.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.mail.service.InternalMailService;
import chn.bhmc.dms.cmm.mail.service.dao.InternalMailDAO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverSaveVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailReceiverVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailSaveVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailSearchVO;
import chn.bhmc.dms.cmm.mail.vo.InternalMailVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InternalMailServiceImpl.java
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

@Service("internalMailService")
public class InternalMailServiceImpl extends HService implements InternalMailService {
    /**
     * 내부 메일 현황 DAO
     */
    @Resource(name = "internalMailDAO")
    InternalMailDAO internalMailDAO;

    @Resource(name="intMailIdgenService")
    EgovIdGnrService intMailIdgenService;

    @Override
    public void insertInternalMail(InternalMailVO internalMailVO, InternalMailReceiverSaveVO internalMailReceiverSaveVO) throws Exception {
        int loop = 1;

        internalMailDAO.insertInternalMail(internalMailVO);

        for(InternalMailReceiverVO internalMailReceiverVO : internalMailReceiverSaveVO.getInternalMailRoleVO().getInsertList()){
            internalMailReceiverVO.setIntMailId(internalMailVO.getIntMailId());
            internalMailReceiverVO.setReceiveSummId(Integer.toString(loop));

            internalMailReceiverVO.setRegUsrId(internalMailVO.getRegUsrId());
            internalMailReceiverVO.setUpdtUsrId(internalMailVO.getUpdtUsrId());

            internalMailDAO.insertInternalMailReceiver(internalMailReceiverVO);

            loop++;
        }

        for(InternalMailReceiverVO internalMailReceiverVO : internalMailReceiverSaveVO.getInternalMailUserVO().getInsertList()){
            internalMailReceiverVO.setIntMailId(internalMailVO.getIntMailId());
            internalMailReceiverVO.setReceiveSummId(Integer.toString(loop));

            internalMailReceiverVO.setRegUsrId(internalMailVO.getRegUsrId());
            internalMailReceiverVO.setUpdtUsrId(internalMailVO.getUpdtUsrId());

            internalMailDAO.insertInternalMailReceiver(internalMailReceiverVO);

            loop++;
        }
    }

    @Override
    public int insertInternalMailSummary(InternalMailVO internalMailVO) throws Exception {
        return internalMailDAO.insertInternalMailSummary(internalMailVO);
    }

    @Override
    public void deleteInternalMail(InternalMailVO internalMailVO) throws Exception {
        InternalMailVO deleteVO = new InternalMailVO();

        deleteVO.setIntMailId(internalMailVO.getIntMailId());

        internalMailDAO.deleteInternalMail(internalMailVO);
        internalMailDAO.deleteInternalMailReceiver(deleteVO);
        internalMailDAO.deleteInternalMailSummary(deleteVO);
    }

    @Override
    public void multiDeleteInternalMail(InternalMailSaveVO saveVO) throws Exception {
        InternalMailVO internalMailVO = new InternalMailVO();

        for(InternalMailVO deleteVO : saveVO.getDeleteList()) {
            internalMailVO.setIntMailId(deleteVO.getIntMailId());

            internalMailDAO.deleteInternalMail(deleteVO);
            internalMailDAO.deleteInternalMailReceiver(internalMailVO);
            internalMailDAO.deleteInternalMailSummary(internalMailVO);
        }
    }

    @Override
    public List<InternalMailReceiverVO> selectInternalMailAreaByCondition(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailAreaByCondition(searchVO);
    }

    @Override
    public List<InternalMailReceiverVO> selectInternalMailDealerByCondition(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailDealerByCondition(searchVO);
    }

    @Override
    public List<InternalMailReceiverVO> selectInternalMailRoleByCondition(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailRoleByCondition(searchVO);
    }

    @Override
    public List<InternalMailReceiverVO> selectInternalMailUsrByCondition(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailUsrByCondition(searchVO);
    }

    @Override
    public int selectInternalMailRoleByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailRoleByConditionCnt(searchVO);
    }

    @Override
    public int selectInternalMailUsrByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailUsrByConditionCnt(searchVO);
    }

    @Override
    public List<InternalMailReceiverVO> selectInternalMailReceiverRoleByCondition(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailReceiverRoleByCondition(searchVO);
    }

    @Override
    public List<InternalMailReceiverVO> selectInternalMailReceiverUsrByCondition(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailReceiverUsrByCondition(searchVO);
    }

    @Override
    public int selectInternalMailReceiverRoleByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailReceiverRoleByConditionCnt(searchVO);
    }

    @Override
    public int selectInternalMailReceiverUsrByConditionCnt(InternalMailReceiverSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailReceiverUsrByConditionCnt(searchVO);
    }

    @Override
    public InternalMailVO selectInternalMailByKey(InternalMailSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailByKey(searchVO);
    }

    @Override
    public List<InternalMailVO> selectInternalMailByCondition(InternalMailSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailByCondition(searchVO);
    }

    @Override
    public int selectInternalMailByConditionCnt(InternalMailSearchVO searchVO) throws Exception {
        return internalMailDAO.selectInternalMailByConditionCnt(searchVO);
    }
}