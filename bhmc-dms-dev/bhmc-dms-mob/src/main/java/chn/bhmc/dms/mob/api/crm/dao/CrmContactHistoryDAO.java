package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.crm.vo.ContactHistorySearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContactHistoryVO;

/**
 * 컨택히스토리 등록에 관한 데이터처리 매퍼 클래스
 *
 * @author in moon lee
 * @since 2016.04.06.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.06         in moon lee            최초 생성
 * </pre>
 */

@Mapper("CrmcontactHistoryDAO")
public interface CrmContactHistoryDAO {

    /**
     * 컨택히스토리 목록 수량
     *
     * @param searchVO
     * @return
     */
    public int selectMsgHistorysByConditionCnt(ContactHistorySearchVO searchVO) throws Exception;

    /**
     * 컨택히스토리 목록
     *
     * @param searchVO
     * @return
     */
    public List<ContactHistoryVO> selectMsgHistorysByCondition(ContactHistorySearchVO searchVO) throws Exception;

}
