package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.WorkingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkingDAO.java
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

@Mapper("workingDAO")
public interface WorkingDAO {
    public int insertWorking(WorkingVO workingVO);

    public int deleteWorking(WorkingVO workingVO);

    public List<WorkingVO> selectWorkingByCondition(WorkingVO workingVO);
}