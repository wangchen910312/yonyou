package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.ChangeHistorySearchVO;
import chn.bhmc.dms.cmm.sci.vo.ChangeHistoryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeHistoryDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Mapper("changeHistoryDAO")
public interface ChangeHistoryDAO {
    public int insertChangeHistory(ChangeHistoryVO changeHistoryVO);

    public List<ChangeHistoryVO> selectChangeHistoryByCondition(ChangeHistorySearchVO searchVO);

    public int selectChangeHistoryByConditionCnt(ChangeHistorySearchVO searchVO);

    public ChangeHistoryVO selectChangeHistoryByKey(ChangeHistorySearchVO searchVO);
}