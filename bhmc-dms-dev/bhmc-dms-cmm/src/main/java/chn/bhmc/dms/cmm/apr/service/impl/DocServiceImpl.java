package chn.bhmc.dms.cmm.apr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.apr.service.DocService;
import chn.bhmc.dms.cmm.apr.service.dao.DocDAO;
import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocLineVO;
import chn.bhmc.dms.cmm.apr.vo.DocSaveVO;
import chn.bhmc.dms.cmm.apr.vo.DocSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 결재양식 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Indocation) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("docService")
public class DocServiceImpl extends HService implements DocService {

    /**
     * 결재양식 관리 DAO
     */
    @Resource(name="docDAO")
    DocDAO docDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertDoc(DocVO docVO) throws Exception {
        DocVO obj = selectDocByKey(docVO.getSignDocId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return docDAO.insertDoc(docVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDoc(DocVO docVO) throws Exception {
        return docDAO.updateDoc(docVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteDoc(DocVO docVO) throws Exception {
        docDAO.deleteDocLinesBySignDocId(null, docVO.getSignDocId());
        return docDAO.deleteDoc(docVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiDocs(DocSaveVO obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(DocVO docVO : obj.getInsertList()){
            docVO.setRegUsrId(userId);
            insertDoc(docVO);
        }

        for(DocVO docVO : obj.getUpdateList()){
            docVO.setUpdtUsrId(userId);
            updateDoc(docVO);
        }

        for(DocVO docVO : obj.getDeleteList()){
            deleteDoc(docVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public DocVO selectDocByKey(String resourceId) throws Exception {
        return docDAO.selectDocByKey(resourceId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DocVO> selectDocsByCondition(DocSearchVO searchVO) throws Exception {
        return docDAO.selectDocsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDocsByConditionCnt(DocSearchVO searchVO) throws Exception {
        return docDAO.selectDocsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertDocLine(DocLineVO docLineVO) throws Exception {
        DocLineVO obj = selectDocLineByKey(docLineVO.getDlrCd(), docLineVO.getSignDocId(), docLineVO.getSignDocLineNo());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return docDAO.insertDocLine(docLineVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteAndInsertDocLines(String dlrCd, String signDocId, List<DocLineVO> signLines) throws Exception {
        String userId = LoginUtil.getUserId();

        docDAO.deleteDocLinesBySignDocId(dlrCd, signDocId);

        int signDocLineNo = 1;
        for(DocLineVO docLineVO : signLines){
            docLineVO.setDlrCd(dlrCd);
            docLineVO.setSignDocLineNo(signDocLineNo++);
            docLineVO.setRegUsrId(userId);
            insertDocLine(docLineVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DocLineVO selectDocLineByKey(String dlrCd, String signDocId, int signDocLineNo) throws Exception {
        return docDAO.selectDocLineByKey(dlrCd, signDocId, signDocLineNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DocLineVO> selectDocLinesByCondition(DocLineSearchVO searchVO) throws Exception {
        return docDAO.selectDocLinesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDocLinesByConditionCnt(DocLineSearchVO searchVO) throws Exception {
        return docDAO.selectDocLinesByConditionCnt(searchVO);
    }
}
