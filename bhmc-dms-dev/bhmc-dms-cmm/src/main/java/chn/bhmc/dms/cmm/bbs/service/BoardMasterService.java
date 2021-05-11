package chn.bhmc.dms.cmm.bbs.service;

import java.util.List;

import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSaveVO;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BoarddMasterService.java
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

public interface BoardMasterService {
    int insertBoardMaster(BoardMasterVO boardMasterVO) throws Exception;

    int updateBoardMaster(BoardMasterVO boardMasterVO) throws Exception;

    int deleteBoardMaster(BoardMasterVO boardMasterVO) throws Exception;

    BoardMasterVO selectBoardMasterByKey(BoardMasterSearchVO searchVO) throws Exception;

    List<BoardMasterVO> selectBoardMasterByCondition(BoardMasterSearchVO searchVO) throws Exception;

    int selectBoardMasterByConditionCnt(BoardMasterSearchVO searchVO) throws Exception;

    /**
     * 게시판 Master 정보를 등록/수정/삭제 처리한다.
     * @param boardMasterSaveVO
     */
    void multiBoardMaster(BoardMasterSaveVO boardMasterSaveVO) throws Exception;
}