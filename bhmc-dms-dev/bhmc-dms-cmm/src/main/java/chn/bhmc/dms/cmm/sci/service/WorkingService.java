package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.WorkingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkingService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public interface WorkingService {
    void insertWorking(WorkingVO workingVO) throws Exception;

    int deleteWorking(WorkingVO workingVO) throws Exception;

    List<WorkingVO> selectWorkingByCondition(WorkingVO workingVO) throws Exception;
}