package chn.bhmc.dms.cmm.bbs.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.bbs.vo.BoardMasterSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.BoardMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BoardMasterDAO.java
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

@Mapper("boardMasterDAO")
public interface BoardMasterDAO {
    public int insertBoardMaster(BoardMasterVO boardMasterVO);

    public int updateBoardMaster(BoardMasterVO boardMasterVO);

    public int deleteBoardMaster(BoardMasterVO boardMasterVO);

    public BoardMasterVO selectBoardMasterByKey(BoardMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 메시지템플릿 그룹 정보를 조회한다.
     *
     * @param 조회 조건을 포함하는 MessageTemplateGroupSearchVO
     * @return 조회목록
     */
    public List<BoardMasterVO> selectBoardMasterByCondition(BoardMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 메시지템플릿 그룹 카운트를 조회한다.
     *
     * @param 조회 조건을 포함하는 MessageTemplateGroupSearchVO
     * @return 조회 카운트
     */
    public int selectBoardMasterByConditionCnt(BoardMasterSearchVO searchVO);


}