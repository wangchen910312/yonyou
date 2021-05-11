package chn.bhmc.dms.cmm.tmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.tmp.service.MessageTemplateService;
import chn.bhmc.dms.cmm.tmp.service.dao.MessageTemplateDAO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSaveVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSaveVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 메세지소스 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 6. 22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.06.22         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("messageTemplateService")
public class MessageTemplateServiceImpl extends HService implements MessageTemplateService {

    /**
     * 메세지소스 관리 DAO
     */
    @Resource(name = "messageTemplateDAO")
    MessageTemplateDAO messageTemplateDAO;


    /**
     * {@inheritDoc}
     */
    @Override
    public int insertMessageTemplateGroup(MessageTemplateGroupVO messageTemplateVO) throws Exception {

        MessageTemplateGroupVO obj = selectMessageTemplateGroupByKey(messageTemplateVO.getMesgTmplGrpId());

        if (obj != null) {
            throw processException("global.err.duplicate");
        }

        return messageTemplateDAO.insertMessageTemplateGroup(messageTemplateVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateMessageTemplateGroup(MessageTemplateGroupVO messageTemplateVO) throws Exception {
        return messageTemplateDAO.updateMessageTemplateGroup(messageTemplateVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteMessageTemplateGroup(MessageTemplateGroupVO messageTemplateVO) throws Exception {
        deleteMessageTemplateByGrpId(messageTemplateVO.getMesgTmplGrpId());
        return messageTemplateDAO.deleteMessageTemplateGroup(messageTemplateVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiMessageTemplateGroups(MessageTemplateGroupSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();

        for (MessageTemplateGroupVO obj : saveVO.getInsertList()) {
            obj.setRegUsrId(userId);
            insertMessageTemplateGroup(obj);
        }

        for (MessageTemplateGroupVO obj : saveVO.getUpdateList()) {
            obj.setUpdtUsrId(userId);
            updateMessageTemplateGroup(obj);
        }

        for (MessageTemplateGroupVO obj : saveVO.getDeleteList()) {
            deleteMessageTemplateGroup(obj);
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public MessageTemplateGroupVO selectMessageTemplateGroupByKey(String tmplGrpId) throws Exception {
        return messageTemplateDAO.selectMessageTemplateGroupByKey(tmplGrpId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MessageTemplateGroupVO> selectMessageTemplateGroupsByCondition(MessageTemplateGroupSearchVO searchVO)
            throws Exception {
        return messageTemplateDAO.selectMessageTemplateGroupsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */

    @Override
    public int selectMessageTemplateGroupsByConditionCnt(MessageTemplateGroupSearchVO searchVO) throws Exception {
        return messageTemplateDAO.selectMessageTemplateGroupsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertMessageTemplate(MessageTemplateVO messageTemplateVO) throws Exception {

        String userId = LoginUtil.getUserId();
        messageTemplateVO.setRegUsrId(userId);

        /**
         * 신규 등록하는 메세지템플릿의 기본여부가 'Y'인 경우 기존에 등록된 메세지템플릿의 기본여부를 'N'로 변경한다.
         * 단 신규 등록하는 메세지템플릿의 메세지템플릿 그룹ID 와 메세지템플릿 유형이 같은 경우에 한정한다.
         */
        if("Y".equals(messageTemplateVO.getDefaultYn())){

            //기본여부가 'Y' 인 경우 사용여부는 항상 'Y' 여야 한다.
            messageTemplateVO.setUseYn("Y");

            //기본여부가 'Y' 인 경우  메세지템플릿 그룹ID 와 메세지템플릿 유형이 같은 메세지 템플릿의 기본여부를 'N'로 변경한다.
            messageTemplateDAO.updateMessageTemplateDefaultYn(messageTemplateVO.getMesgTmplGrpId(), messageTemplateVO.getMesgTmplTp(), "N");
        }

        return messageTemplateDAO.insertMessageTemplate(messageTemplateVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateMessageTemplate(MessageTemplateVO messageTemplateVO) throws Exception {

        if("Y".equals(messageTemplateVO.getDefaultYn())){

            //기본여부가 'Y' 인 경우 사용여부는 항상 'Y' 여야 한다.
            messageTemplateVO.setUseYn("Y");

            //기본여부가 'Y' 인 경우  메세지템플릿 그룹ID 와 메세지템플릿 유형이 같은 메세지 템플릿의 기본여부를 'N'로 변경한다.
            messageTemplateDAO.updateMessageTemplateDefaultYn(messageTemplateVO.getMesgTmplGrpId(), messageTemplateVO.getMesgTmplTp(), "N");
        }

        String userId = LoginUtil.getUserId();
        messageTemplateVO.setUpdtUsrId(userId);

        return messageTemplateDAO.updateMessageTemplate(messageTemplateVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteMessageTemplate(int mesgTmplNo) throws Exception {

        MessageTemplateVO messageTemplateVO = selectMessageTemplateByKey(mesgTmplNo);

        if("Y".equals(messageTemplateVO.getDefaultYn())){
            throw processException("cmm.err.delete.defaultMessageTemplate");
        }

        return messageTemplateDAO.deleteMessageTemplate(mesgTmplNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteMessageTemplateByGrpId(String mesgTmplGrpId) throws Exception {
        return messageTemplateDAO.deleteMessageTemplateByGrpId(mesgTmplGrpId);
    }

    /**
     * {@inheritDoc}
     *
     * @throws Exception
     */
    @Override
    public void multiMessageTemplates(MessageTemplateSaveVO saveVO) throws Exception {

        for (MessageTemplateVO obj : saveVO.getInsertList()) {
            insertMessageTemplate(obj);
        }

        for (MessageTemplateVO obj : saveVO.getUpdateList()) {
            updateMessageTemplate(obj);
        }

        for (MessageTemplateVO obj : saveVO.getDeleteList()) {
            deleteMessageTemplate(obj.getMesgTmplNo());
        }

    }

    /*
     * @see chn.bhmc.dms.cmm.tmp.service.MessageTemplateService#selectMessageTemplateByKey(java.lang.String)
     */
    @Override
    public MessageTemplateVO selectMessageTemplateByKey(int mesgTmplNo) throws Exception {
        return messageTemplateDAO.selectMessageTemplateByKey(mesgTmplNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.tmp.service.MessageTemplateService#selectDefaultMessageTemplateByGrpIdAndTmplTp(java.lang.String, java.lang.String)
     */
    @Override
    public MessageTemplateVO selectDefaultMessageTemplateByGrpIdAndTmplTp(String mesgTmplGrpId, String mesgTmplTp)
            throws Exception {
        return messageTemplateDAO.selectDefaultMessageTemplateByGrpIdAndTmplTp(mesgTmplGrpId, mesgTmplTp);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectMessageTemplatesByConditionCnt(MessageTemplateSearchVO searchVO) throws Exception {
        return messageTemplateDAO.selectMessageTemplatesByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MessageTemplateVO> selectMessageTemplatesByCondition(MessageTemplateSearchVO searchVO) throws Exception {
        return messageTemplateDAO.selectMessageTemplatesByCondition(searchVO);
    }

}
