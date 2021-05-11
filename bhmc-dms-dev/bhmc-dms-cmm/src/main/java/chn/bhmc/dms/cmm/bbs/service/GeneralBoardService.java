package chn.bhmc.dms.cmm.bbs.service;

import java.util.List;

import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSaveVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GeneralBoardService.java
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

public interface GeneralBoardService {
    int insertGeneralBoard(GeneralBoardVO generalBoardVO) throws Exception;

    int updateGeneralBoard(GeneralBoardVO generalBoardVO) throws Exception;

    int updateGeneralBoardSort(GeneralBoardVO generalBoardVO) throws Exception;

    int deleteGeneralBoard(GeneralBoardVO generalBoardVO) throws Exception;

    GeneralBoardVO selectGeneralBoardByKey(GeneralBoardSearchVO searchVO) throws Exception;

    List<GeneralBoardVO> selectGeneralBoardByCondition(GeneralBoardSearchVO searchVO) throws Exception;

    int selectGeneralBoardByConditionCnt(GeneralBoardSearchVO searchVO) throws Exception;

    GeneralBoardVO selectGeneralBoardByMax(String sBbsId) throws Exception;

    /**
     * 게시판 정보를 등록/수정/삭제 처리한다.
     * @param boardMasterSaveVO
     */
    void multiGeneralBoard(GeneralBoardSaveVO generalBoardSaveVO) throws Exception;
}