package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.ChangeHistorySearchVO;
import chn.bhmc.dms.cmm.sci.vo.ChangeHistoryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeHistoryService.java
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

public interface ChangeHistoryService {
    int insertChangeHistory(ChangeHistoryVO changeHistoryVO) throws Exception;

    List<ChangeHistoryVO> selectChangeHistoryByCondition(ChangeHistorySearchVO searchVO) throws Exception;

    int selectChangeHistoryByConditionCnt(ChangeHistorySearchVO searchVO) throws Exception;

    ChangeHistoryVO selectChangeHistoryByKey(ChangeHistorySearchVO searchVO) throws Exception;
}