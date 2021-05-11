package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.IncJoinInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncJoinInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("CrmincJoinInfoDAO")
public interface CrmIncJoinInfoDAO {

    /**
      * 조회 조건에 해당하는 보험가입정보를 조회한다.
      */
    public List<IncJoinInfoVO> selectIncJoinInfoByCondition(IncJoinInfoSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 마감시간통제 총 갯수를 조회한다.
     */
    public int selectIncJoinInfoByConditionCnt(IncJoinInfoSearchVO searchVO);
    
    //도시코드
    public List<IncJoinInfoVO> selectCityCd(IncJoinInfoVO vo) throws Exception;
    

    //지역코드
    public List<IncJoinInfoVO> selectDistCd(IncJoinInfoVO vo) throws Exception;
}
