package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmIncJoinInfoDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmIncJoinInfoService;
import chn.bhmc.dms.mob.api.crm.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.IncJoinInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncJoinInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03.      Kim yewon              최초 생성
 * </pre>
 */

@Service("CrmincJoinInfoService")
public class CrmIncJoinInfoServiceImpl extends HService implements CrmIncJoinInfoService{

    /**
     * 마감시간통제 DAO 선언
     */
    @Resource(name="CrmincJoinInfoDAO")
    CrmIncJoinInfoDAO CrmincJoinInfoDAO;


    /**
     * 조회 조건에 해당하는 보험가입정보를 조회한다.
     */
    @Override
    public List<IncJoinInfoVO> selectIncJoinInfoByCondition(IncJoinInfoSearchVO searchVO) throws Exception {
        return CrmincJoinInfoDAO.selectIncJoinInfoByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 보험가입정보 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectIncJoinInfoByConditionCnt(IncJoinInfoSearchVO searchVO) throws Exception {
        return CrmincJoinInfoDAO.selectIncJoinInfoByConditionCnt(searchVO);
    }
    

    //도시코드
    @Override
    public List<IncJoinInfoVO> selectCityCd(IncJoinInfoVO vo) throws Exception{
        return CrmincJoinInfoDAO.selectCityCd(vo);
    }
    

    //성코드
    @Override
    public List<IncJoinInfoVO> selectDistCd(IncJoinInfoVO vo) throws Exception{
        return CrmincJoinInfoDAO.selectDistCd(vo);

    }
}
