package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManVO;

/**
 * SA 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 10. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 10. 19.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("issueReqTechManDAO")
public interface IssueReqTechManDAO {

    /**
     * 조회 조건에 해당하는 SA 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqTechManVO> selectTechManFnMasterByCondition(IssueReqTechManSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 정비수령인정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqTechManVO> selectTechManFnMasterUseresByCondition(IssueReqTechManSearchVO searchVO);

}
