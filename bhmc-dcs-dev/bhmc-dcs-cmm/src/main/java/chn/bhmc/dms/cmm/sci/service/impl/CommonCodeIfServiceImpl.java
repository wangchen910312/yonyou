package chn.bhmc.dms.cmm.sci.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeIfService;
import chn.bhmc.dms.cmm.sci.service.dao.CommonCodeIfDAO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeGroupVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtSaveVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeTxtVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeIfServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 13.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("commonCodeIfService")
public class CommonCodeIfServiceImpl extends HService implements CommonCodeIfService {

    @Resource(name="commonCodeIfDAO")
    CommonCodeIfDAO commonCodeIfDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCommonCodeGroups(CommonCodeGroupSaveVO saveVO) throws Exception {
        for(CommonCodeGroupVO vo : saveVO.getInsertList()){
            commonCodeIfDAO.mergeCommonCodeGroup(vo);
        }

        for(CommonCodeGroupVO vo : saveVO.getUpdateList()){
            commonCodeIfDAO.mergeCommonCodeGroup(vo);
        }

        for(CommonCodeGroupVO vo : saveVO.getDeleteList()){
            commonCodeIfDAO.deleteCommonCodeGroup(vo);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCommonCodeGroupTxts(CommonCodeGroupTxtSaveVO saveVO) throws Exception {
        for(CommonCodeGroupTxtVO vo : saveVO.getInsertList()){
            commonCodeIfDAO.mergeCommonCodeGroupTxt(vo);
        }

        for(CommonCodeGroupTxtVO vo : saveVO.getUpdateList()){
            commonCodeIfDAO.mergeCommonCodeGroupTxt(vo);
        }

        for(CommonCodeGroupTxtVO vo : saveVO.getDeleteList()){
            commonCodeIfDAO.deleteCommonCodeGroupTxt(vo);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCommonCodes(CommonCodeSaveVO saveVO) throws Exception {
        for(CommonCodeVO vo : saveVO.getInsertList()){
            commonCodeIfDAO.mergeCommonCode(vo);
        }

        for(CommonCodeVO vo : saveVO.getUpdateList()){
            commonCodeIfDAO.mergeCommonCode(vo);
        }

        for(CommonCodeVO vo : saveVO.getDeleteList()){
            commonCodeIfDAO.deleteCommonCode(vo);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCommonCodeTxts(CommonCodeTxtSaveVO saveVO) throws Exception {
        for(CommonCodeTxtVO vo : saveVO.getInsertList()){
            commonCodeIfDAO.mergeCommonCodeTxt(vo);
        }

        for(CommonCodeTxtVO vo : saveVO.getUpdateList()){
            commonCodeIfDAO.mergeCommonCodeTxt(vo);
        }

        for(CommonCodeTxtVO vo : saveVO.getDeleteList()){
            commonCodeIfDAO.deleteCommonCodeTxt(vo);
        }
    }
}
