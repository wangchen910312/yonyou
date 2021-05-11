package chn.bhmc.dms.sal.ond.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ond.vo.GradeInfoVO;
import chn.bhmc.dms.sal.ond.vo.GradeSearchVO;

import chn.bhmc.dms.sal.ond.vo.CallCarMasterVO;

import chn.bhmc.dms.sal.ond.vo.CallCarMasterSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallCarMasterDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 6.     Choi Kyung Yong     최초 생성
 * </pre>
 */
@Mapper("callCarMasterDAO")
public interface CallCarMasterDAO {

    /**
     * 조회조건에 해당하는 대교차 총 갯수를 조회한다.
     * @param searchVO
     * @return
     */
    public int selectCallCarMasterByConditionCnt(CallCarMasterSearchVO searchVO);

    /**
     * 조회조건에 해당하는 대교차 정보를 조회한다.
     *
     * @param searchVO
     * @return
     */
    public List<CallCarMasterVO> selectCallCarMasterByCondition(CallCarMasterSearchVO searchVO);

    /**
     * 대교차 정보를 등록한다.
     * @param calCarMasterVO
     * @return
     */
    public int insertCallCarMaster(CallCarMasterVO calCarMasterVO);

    /**
     * 대교차 정보를 수정한다.
     * @param calCarMasterVO
     * @return
     */
    public int updateCallCarMaster(CallCarMasterVO calCarMasterVO);

    /**
     * 대교차 정보를 삭제한다.
     * @param calCarMasterVO
     * @return
     */
    public int deleteCallCarMaster(CallCarMasterVO calCarMasterVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<GradeInfoVO> selectGradeByCondition(GradeSearchVO searchVO);

}
