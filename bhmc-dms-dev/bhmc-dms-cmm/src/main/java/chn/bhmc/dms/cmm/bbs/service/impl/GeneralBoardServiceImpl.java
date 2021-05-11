package chn.bhmc.dms.cmm.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.bbs.service.GeneralBoardService;
import chn.bhmc.dms.cmm.bbs.service.dao.GeneralBoardDAO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSaveVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardVO;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GeneralBoardServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("generalBoardService")
public class GeneralBoardServiceImpl extends HService implements GeneralBoardService {
    /**
     * 게시판 DAO
     */
    @Resource(name = "generalBoardDAO")
    GeneralBoardDAO generalBoardDAO;

    @Resource(name="nttIdgenService")
    EgovIdGnrService nttIdgenService;

    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    @Override
    public int insertGeneralBoard(GeneralBoardVO generalBoardVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String nextString = nttIdgenService.getNextStringId();

        generalBoardVO.setNttId(nextString);
        generalBoardVO.setRegUsrId(userId);
        generalBoardVO.setUpdtUsrId(userId);

        if ("I".equals(generalBoardVO.getFlag())) {
            // 글 추가
            generalBoardVO.setNttRootId(nextString);
            generalBoardVO.setNttRefId(nextString);

        }
        else if ("R".equals(generalBoardVO.getFlag())) {
            // 답변
            generalBoardVO.setNttRefId(generalBoardVO.getNttId());
        }

        FileDocVO fileDocVO = new FileDocVO();
        fileDocVO.setFileDocNo(generalBoardVO.getFileDocNo());
        fileMgrService.updateFileDocEnabled(fileDocVO);

        return generalBoardDAO.insertGeneralBoard(generalBoardVO);
    }

    @Override
    public int updateGeneralBoard(GeneralBoardVO generalBoardVO) throws Exception {
        generalBoardVO.setUpdtUsrId(LoginUtil.getUserId());

        FileDocVO fileDocVO = new FileDocVO();
        fileDocVO.setFileDocNo(generalBoardVO.getFileDocNo());
        fileMgrService.updateFileDocEnabled(fileDocVO);

        return generalBoardDAO.updateGeneralBoard(generalBoardVO);
    }

    @Override
    public int updateGeneralBoardSort(GeneralBoardVO generalBoardVO) throws Exception {
        return generalBoardDAO.updateGeneralBoardSort(generalBoardVO);
    }

    @Override
    public int deleteGeneralBoard(GeneralBoardVO generalBoardVO) throws Exception {
        fileMgrService.deleteFileDoc(generalBoardVO.getFileDocNo());

        return generalBoardDAO.deleteGeneralBoard(generalBoardVO);
    }

    @Override
    public GeneralBoardVO selectGeneralBoardByKey(GeneralBoardSearchVO searchVO) throws Exception {
        return generalBoardDAO.selectGeneralBoardByKey(searchVO);
    }

    @Override
    public List<GeneralBoardVO> selectGeneralBoardByCondition(GeneralBoardSearchVO searchVO) throws Exception {
        return generalBoardDAO.selectGeneralBoardByCondition(searchVO);
    }

    @Override
    public int selectGeneralBoardByConditionCnt(GeneralBoardSearchVO searchVO) throws Exception {
        return generalBoardDAO.selectGeneralBoardByConditionCnt(searchVO);
    }

    @Override
    public GeneralBoardVO selectGeneralBoardByMax(String sBbsId)  throws Exception {
        return generalBoardDAO.selectGeneralBoardByMax(sBbsId);
    }

    @Override
    public void multiGeneralBoard(GeneralBoardSaveVO obj) throws Exception {
        for(GeneralBoardVO generalBoardVO : obj.getDeleteList()){
            this.deleteGeneralBoard(generalBoardVO);
        }
    }
}