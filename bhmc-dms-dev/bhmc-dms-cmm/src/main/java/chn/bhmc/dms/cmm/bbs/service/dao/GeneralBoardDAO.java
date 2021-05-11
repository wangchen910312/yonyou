package chn.bhmc.dms.cmm.bbs.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.GeneralBoardVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GeneralBoardDAO.java
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

@Mapper("generalBoardDAO")
public interface GeneralBoardDAO {
    public int insertGeneralBoard(GeneralBoardVO generalBoardVO);

    public int updateGeneralBoard(GeneralBoardVO generalBoardVO);

    public int updateGeneralBoardSort(GeneralBoardVO generalBoardVO);

    public int deleteGeneralBoard(GeneralBoardVO generalBoardVO);

    public GeneralBoardVO selectGeneralBoardByKey(GeneralBoardSearchVO searchVO);

    public List<GeneralBoardVO> selectGeneralBoardByCondition(GeneralBoardSearchVO searchVO);

    public int selectGeneralBoardByConditionCnt(GeneralBoardSearchVO searchVO);

    public GeneralBoardVO selectGeneralBoardByMax(GeneralBoardSearchVO searchVO);

    public GeneralBoardVO selectGeneralBoardByMax(@Param("sBbsId") String sBbsId);
}