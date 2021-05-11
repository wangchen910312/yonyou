package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.SignLineSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SignLineVO;

/**
 * 보호자원정보에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Insignation) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("CrmsignDAO")
public interface CrmSignDAO {

    /**
     * 조회 조건에 해당하는 결재상신 결재선 목록을 조회한다.
     *
     * @param searchVO
     * @return
     */
    public List<SignLineVO> selectSignLinesByCondition(SignLineSearchVO searchVO);
}
