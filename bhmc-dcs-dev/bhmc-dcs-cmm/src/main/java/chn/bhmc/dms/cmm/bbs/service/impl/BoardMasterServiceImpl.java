package chn.bhmc.dms.cmm.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.bbs.service.BoardMasterService;
import chn.bhmc.dms.cmm.bbs.service.dao.BoardMasterDAO;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSaveVO;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterVO;
import chn.bhmc.dms.core.util.LoginUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BoarddMasterServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("boardMasterService")
public class BoardMasterServiceImpl extends HService implements BoardMasterService {
    /**
     * 게시판 관리 DAO
     */
    @Resource(name = "boardMasterDAO")
    BoardMasterDAO boardMasterDAO;

    @Resource(name="bbsIdgenService")
    EgovIdGnrService bbsIdgenService;

    @Override
    public int insertBoardMaster(BoardMasterVO boardMasterVO) throws Exception {
        return boardMasterDAO.insertBoardMaster(boardMasterVO);
    }

    @Override
    public int updateBoardMaster(BoardMasterVO boardMasterVO) throws Exception {
        return boardMasterDAO.updateBoardMaster(boardMasterVO);
    }

    @Override
    public int deleteBoardMaster(BoardMasterVO boardMasterVO) throws Exception {
        return boardMasterDAO.deleteBoardMaster(boardMasterVO);
    }

    @Override
    public BoardMasterVO selectBoardMasterByKey(BoardMasterSearchVO searchVO) throws Exception {
        return boardMasterDAO.selectBoardMasterByKey(searchVO);
    }

    @Override
    public List<BoardMasterVO> selectBoardMasterByCondition(BoardMasterSearchVO searchVO) throws Exception {
        return boardMasterDAO.selectBoardMasterByCondition(searchVO);
    }

    @Override
    public int selectBoardMasterByConditionCnt(BoardMasterSearchVO searchVO) throws Exception {
        return boardMasterDAO.selectBoardMasterByConditionCnt(searchVO);
    }

    /**
     * 게시판 Master 정보를 등록/수정/삭제 처리한다.
     * @param boardMasterSaveVO
     */
    public void multiBoardMaster(BoardMasterSaveVO obj) throws Exception {
        String userId = LoginUtil.getUserId();

        for(BoardMasterVO boardMasterVO : obj.getInsertList()){
            boardMasterVO.setRegUsrId(userId);
            boardMasterVO.setUpdtUsrId(userId);

            boardMasterVO.setBbsId(bbsIdgenService.getNextStringId());

            this.insertBoardMaster(boardMasterVO);
        }

        for(BoardMasterVO boardMasterVO : obj.getUpdateList()){
            boardMasterVO.setUpdtUsrId(userId);

            this.updateBoardMaster(boardMasterVO);
        }

        for(BoardMasterVO boardMasterVO : obj.getDeleteList()){
            this.deleteBoardMaster(boardMasterVO);
        }
    }
}